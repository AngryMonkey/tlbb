-- 珍兽技能升级

-- 脚本号
x311112_g_ScriptId = 311112;
x311112_g_NumText_Main = 1					-- 接任务的选项

--**********************************
-- 任务入口函数
--**********************************
function x311112_OnDefaultEvent(sceneId, selfId, targetId)
	local numText = GetNumText()
	
	if numText == x311112_g_NumText_Main then
		--x311112_NotifyFailTips(sceneId, selfId, "good...")
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19823 )	--调用珍兽技能升级界面
	end
	
end

--**********************************
-- 列举事件
--**********************************
function x311112_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x311112_g_ScriptId, "珍兽技能升级" , 6, x311112_g_NumText_Main);
end

--**********************************
--珍兽升超级技能
--**********************************
function x311112_PetSkillLevelup( sceneId, selfId, petHid, petLid, skillindex, ItemIndexInBag )
	local checkAvailable = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petHid, petLid);
	if checkAvailable and checkAvailable == 1 then
		local SkillID,SkillLevelUpID,ConsumeGoodsID,ConsumeMoney,IsBroadCast = GetPetSkillLevelupTbl(sceneId, selfId, petHid, petLid, skillindex)
		if not SkillID or not SkillLevelUpID or not ConsumeGoodsID or not ConsumeMoney or not IsBroadCast or SkillID == -1 then
			x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_03}")
			return
		end
		
		local itemid = LuaFnGetItemTableIndexByIndex(sceneId, selfId, ItemIndexInBag) --获取物品ID
		local ItemInfo = GetBagItemTransfer(sceneId, selfId, ItemIndexInBag)
		if itemid ~= ConsumeGoodsID then --如果ConsumeGoodsID为0说明可能是策划忘记配消耗物品ID了，也不能通过
			x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_04}")
			return
		end
		
		local havemoney = GetMoney(sceneId, selfId)
		local haveJiaoZi = GetMoneyJZ(sceneId, selfId)
		if havemoney+haveJiaoZi < ConsumeMoney then
			x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_08}")
			return
		end
		
		--扣除金钱
		if ConsumeMoney > 0 then
			local jz, jb = LuaFnCostMoneyWithPriority(sceneId, selfId, ConsumeMoney)
			if jz == -1 then
				x311112_NotifyFailTips(sceneId, selfId, "扣除金钱失败！")
				return
			end
		end
		
		--消耗物品
		if EraseItem(sceneId, selfId, ItemIndexInBag) ~= 1 then
			x311112_NotifyFailTips(sceneId, selfId, "扣除物品失败！")
			return
		end
		
		LuaFnPetSkillUp(sceneId, selfId, petHid, petLid, skillindex, SkillLevelUpID)
		x311112_NotifyFailTips(sceneId, selfId, "升级成功！")
		AuditPetSkillLevelUpAndCompound(sceneId, selfId, 1, ConsumeGoodsID)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		
		if IsBroadCast == 1 then
			local szPetTrans = GetPetTransString(sceneId, selfId, petHid, petLid)
			local message = format("#H#{_INFOUSR%s}#{J_09}#{_INFOMSG%s}#{J_10}#{_INFOMSG%s}#{J_11}#G%s#P！",LuaFnGetName(sceneId, selfId),szPetTrans,ItemInfo,GetSkillName(SkillLevelUpID))--[tx43999]
			BroadMsgByChatPipe(sceneId, selfId, message, 4);
		end
		
	else
		x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_05}")
	end
end

--**********************************
--灵兽丹合成功能
--**********************************
function x311112_PetMedicineHC( sceneId, selfId, ItemIndex1, ItemIndex2, ItemIndex3, ItemIndex4, ItemIndex5)
	if not ItemIndex1 or not ItemIndex2 or not ItemIndex3 or not ItemIndex4 or not ItemIndex5 then
		return
	end
	
	-- 不允许有重复的ItemIndex1出现 added by dun.liu 2009.2.5
	if ScriptGlobal_IsUniqueNumberTable({ItemIndex1, ItemIndex2, ItemIndex3, ItemIndex4, ItemIndex5}) == 0 then
		return
	end
	
	local itemindex = {}
	local itemid = LuaFnGetItemTableIndexByIndex(sceneId, selfId, ItemIndex1) --获取物品ID
	local afteritemID,money = GetPetMedicineHCTbl(sceneId, itemid)
	itemindex[1] = ItemIndex1
	itemindex[2] = ItemIndex2
	itemindex[3] = ItemIndex3
	itemindex[4] = ItemIndex4
	itemindex[5] = ItemIndex5
	--PrintStr(" itemid "..itemid.." afteritemID "..afteritemID.." money "..money)
	
	--表里面没有的就不是灵兽丹
	if not afteritemID or not money or afteritemID == -100 then
		x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_13}")
		return
	end
	
	--表里面有但是合成后ID是-1的表示暂不开放的，目前合成最高开放到2级合3级
	if afteritemID == -1 then
		x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_14}")
		return
	end
	
	--是否同种类型并且等级相同的灵兽丹
	for i = 2, 5 do
		if LuaFnGetItemTableIndexByIndex(sceneId, selfId, itemindex[i]) ~= itemid then
			x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_15}")
			return
		end
	end
	
	--是否金钱足够，为0说明是没有金钱要求
	local havemoney = GetMoney(sceneId, selfId)
	local haveJiaoZi = GetMoneyJZ(sceneId, selfId)
	if money > 0 and havemoney+haveJiaoZi < money then
		x311112_NotifyFailTips(sceneId, selfId, "#{JNHC_81015_18}#{_EXCHG"..money.."}。")
		return
	end
	
	--扣除金钱，为0说明是没有金钱要求
	if money > 0 then
		local jz, jb = LuaFnCostMoneyWithPriority(sceneId, selfId, money)
		if jz == -1 then
			x311112_NotifyFailTips(sceneId, selfId, "扣除金钱失败！")
			return
		end
	end
	
	local needBind = 0
	--扣除物品
	for i = 1, 5 do
		if LuaFnGetItemBindStatus( sceneId, selfId, itemindex[i] ) == 1 then
			needBind = 1
		end
		--LuaFnItemBind( sceneId, selfId, itemindex[i] )
		if LuaFnEraseItem(sceneId, selfId, itemindex[i]) ~= 1 then
			x311112_NotifyFailTips(sceneId, selfId, "扣除物品失败！")
			return
		end
	end
	
	--给物品
	local BagIndex = TryRecieveItem( sceneId, selfId, afteritemID, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, BagIndex )
		end
		x311112_NotifyFailTips(sceneId, selfId, "合成成功！")
		AuditPetSkillLevelUpAndCompound(sceneId, selfId, 2, afteritemID)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
		LuaFnSendAbilitySuccessMsg( sceneId, selfId, -1, -1, afteritemID )		-- 提示生成物
	end
	
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x311112_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
