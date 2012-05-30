--城市NPC
--厢房

x805019_g_scriptId=805019
x805019_g_BuildingID14 = 1
x805019_g_SavvyToExp={0 ,6000,12730,18898,31156,46811,82992,172059,236185,827077,837599}	--跟骨to exp
x805019_g_GrowRateToExp={0,7791,14744,70492,251189}	--成长to exp
x805019_g_hugeExp = 1500000	--公告exp
x805019_g_safeNum = 600000000	--安全运算数值上限
x805019_g_maxExp = 30000000	--舍利子最大保存的经验
--**********************************
--事件交互入口
--**********************************
function x805019_OnDefaultEvent( sceneId, selfId,targetId )

	--是否是本帮成员
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid	= GetCityGuildID(sceneId, selfId, sceneId)
	local strText

	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "    这个帮所有兄弟我都记得名字，一看就知道阁下不是我们帮的。"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	BeginEvent(sceneId)
		strText = "#{ZSKSSJ_081113_01}"
		AddText(sceneId,strText);
		AddNumText( sceneId, x805019_g_scriptId, "厢房介绍", 8, 1 )
--关闭珍兽舍利子及帮助，添加寄练珍兽， by zhangqiang 2009.6.19
--		AddNumText( sceneId, x805019_g_scriptId, "炼制珍兽舍利子", 6, 2 )
--		AddNumText( sceneId, x805019_g_scriptId, "关于珍兽快速升级", 11, 3 )
		AddNumText( sceneId, x805019_g_scriptId, "寄练珍兽", 6, 4 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x805019_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 3 then
--		BeginEvent(sceneId)
--			AddText( sceneId, "#{ZSKSSJ_081113_27}" )	
--		EndEvent(sceneId)
--		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_XiangFang}" )	
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif (GetNumText() == 2) then
--		BeginUICommand(sceneId);
--			UICommand_AddInt(sceneId, targetId);
--		EndUICommand(sceneId);
--		DispatchUICommand(sceneId, selfId, 8050191);
	elseif GetNumText() == 4 then 
		BeginEvent(sceneId)
			AddText( sceneId, "这个功能即将开放" )	
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end
--计算舍利子转化的经验
function x805019_PetShelizi(sceneId, selfId, PetGuidH, PetGuidL)

	local ret = LuaFnCheckPetShelizi(sceneId, selfId ,PetGuidH, PetGuidL)

	if ret == 1 then
		if LuaFnIsPetGrowRateByGUID(sceneId, selfId, PetGuidH, PetGuidL) == 0 then
			x805019_Notify(sceneId, selfId,"#{ZSKSSJ_081113_09}")
			return
		end

		local nAllExp = x805019_CalcExp(sceneId, selfId, PetGuidH, PetGuidL)

		BeginUICommand(sceneId);
			UICommand_AddInt(sceneId, nAllExp);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 8050192);
	end
end
--转化舍利子
function x805019_PetShelizi_Done(sceneId, selfId, PetGuidH, PetGuidL)
	local pgH , pgL = LuaFnGetCurrentPetGUID(sceneId, selfId)
	--是否出战
	if PetGuidH==pgH and PetGuidL==pgL then
		x805019_Notify(sceneId,selfId ,"#{ZSKSSJ_081113_05}")
		return
	end
	--是否加锁
	if LuaFnIsPetLockedByGUID(sceneId, selfId, PetGuidH, PetGuidL) == 1 then
		x805019_Notify(sceneId,selfId ,"#{ZSKSSJ_081113_06}")
		return
	end
	--是否在安全时间
	if IsPilferLockFlag(sceneId, selfId)  == -1 then
		return
	end
	--是否大于等于30级，是否是宝宝，二代或变异
	if LuaFnCheckPetShelizi(sceneId, selfId ,PetGuidH, PetGuidL) ~= 1 then
		return
	end
	--计算经验
	local nAllExp = x805019_CalcExp(sceneId, selfId, PetGuidH, PetGuidL)

	--检测条件金币
	local needmoney = floor(nAllExp / 100)
	if needmoney <= 0 then
		needmoney = 1
	end
	local selfMoney = GetMoney( sceneId, selfId )  +  GetMoneyJZ(sceneId, selfId)  --交子普及 Vega
	if selfMoney < needmoney then
		x805019_Notify(sceneId, selfId,"#{no_money}")
		return
	end
	--检测背包空间
	if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
		x805019_Notify(sceneId, selfId,"#{QRJ_81009_05}")
		return
	end
	
	local t_growLevel = LuaFnGetPetGrowRateByGUID(sceneId, selfId, PetGuidH, PetGuidL);
	if t_growLevel < 1 then
		t_growLevel = 1
	end
	
	local t_savvy = GetPetSavvy(sceneId, selfId, PetGuidH, PetGuidL);
	if t_savvy < 0 then
		t_savvy = 0
	end
	
	local t_petLevel = LuaFnGetPetLevelByGUID(sceneId, selfId, PetGuidH, PetGuidL);
	
	--扣金币
	if LuaFnCostMoneyWithPriority(sceneId,selfId ,needmoney) == -1 then
		return
	end

	local PlayerName = GetName(sceneId, selfId)
	--删除珍兽
	if LuaFnDeletePetByGUID(sceneId, selfId, PetGuidH, PetGuidL) == 0 then
		return
	end

	--给物品
	local BagIndex = TryRecieveItem( sceneId, selfId, 30900058, QUALITY_MUST_BE_CHANGE )
	if BagIndex == -1 then
		x805019_Notify(sceneId, selfId,"#{QRJ_81009_05}")
		return
	end
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	--设置舍利子包含的经验
	SetBagItemParam	(sceneId, selfId,BagIndex,4 ,2 , nAllExp)
	--通知客户端刷新物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
	--醒目提示
	x805019_Notify(sceneId, selfId,"#{ZSKSSJ_081126_1}")
	--日志统计
	local guid = LuaFnObjId2Guid(sceneId, selfId)
	local log = format("PetGuidH=%X,PetGuidL=%X,PetLevel=%d,PetgrowLevel=%d,PetSavvy=%d,nAllExp=%d", PetGuidH, PetGuidL, t_petLevel, t_growLevel, t_savvy, nAllExp)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_PETSHELIZI, guid, log)
	--发公告
	if nAllExp > x805019_g_hugeExp then
		local growstr = ""

		if t_growLevel == 1 then
			growstr = "#{ZSKSSJ_PT}"
		elseif t_growLevel == 2 then
			growstr = "#{ZSKSSJ_YX}"
		elseif t_growLevel == 3 then
			growstr = "#{ZSKSSJ_JC}"
		elseif t_growLevel == 4 then
			growstr = "#{ZSKSSJ_ZY}"
		elseif t_growLevel == 5 then
			growstr = "#{ZSKSSJ_WM}"
		else 
			growstr = "#{ZSKSSJ_PT}"
		end
		
		local ProductItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
	
		local strText = format("#{_INFOUSR%s}#{ZSKSSJ_081113_12}%s#{ZSKSSJ_081113_13}%d#{ZSKSSJ_081113_14}%d#{ZSKSSJ_081113_15}%d#{ZSKSSJ_081113_16}#{_INFOMSG%s}#{ZSKSSJ_081113_17}", PlayerName,growstr,t_savvy,t_petLevel,nAllExp, ProductItemInfo )

		AddGlobalCountNews( sceneId, strText )
	end
end
--醒目提示
function x805019_Notify(sceneId,selfId ,str)
	BeginEvent(sceneId)
		AddText(sceneId,str)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

function x805019_CalcExp(sceneId, selfId, PetGuidH, PetGuidL)
		local t_growLevel = LuaFnGetPetGrowRateByGUID(sceneId, selfId, PetGuidH, PetGuidL);
		if t_growLevel < 1 then
			t_growLevel = 1
		end
		
		local t_savvy = GetPetSavvy(sceneId, selfId, PetGuidH, PetGuidL);
		if t_savvy < 0 then
			t_savvy = 0
		end
	
		local t_petLevel = LuaFnGetPetLevelByGUID(sceneId, selfId, PetGuidH, PetGuidL);

		local nAllExp = x805019_g_SavvyToExp[tonumber(t_savvy) + 1] + x805019_g_GrowRateToExp[tonumber(t_growLevel)]
		
		local levelToExp = 0
		
		for i=1 ,t_petLevel do
			levelToExp = levelToExp + LuaFnGetPetNeedExp(sceneId, selfId,i)
			if levelToExp > x805019_g_safeNum then
				return x805019_g_maxExp
			end
		end
		
		nAllExp = nAllExp + levelToExp * 0.05

		if nAllExp > x805019_g_maxExp then
			return x805019_g_maxExp
		else
			return nAllExp
		end

		return 0
end
