-- 212221
-- 兑换物品
x212221_g_scriptId = 212221

x212221_g_Stone = {
									{level=75, id=20310004, id2=20310005, num=60}, --20310004秦皇珠 20310005绑定秦皇珠
									{level=85, id=20310004, id2=20310005, num=90},

									}
										


x212221_g_Item = {
									{level=750,id=10412080},{level=750,id=10413083},{level=750,id=10422121},{level=750,id=10423046}, --75内功套装
									{level=751,id=10412082},{level=751,id=10413085},{level=751,id=10422123},{level=751,id=10423048}, --75外功套装
									{level=850,id=10412081},{level=850,id=10413084},{level=850,id=10422122},{level=850,id=10423047}, --85内功套装				
									{level=851,id=10412083},{level=851,id=10413086},{level=851,id=10422124},{level=851,id=10423049}, --85外功套装		
								 }


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212221_OnDefaultEvent( sceneId, selfId, targetId )
	local nNum = GetNumText()
	if nNum == 750 or nNum == 850  or nNum == 751 or nNum == 851   then		
		local str		
		if nNum == 750 or nNum == 751 then
			str = "#{DG_8724_5}"
		elseif nNum == 850 or nNum == 851  then
			str = "#{DG_8724_6}"
		end
		BeginEvent(sceneId)
			AddText(sceneId,str);
			for i, temp in x212221_g_Item do
				if temp.level == nNum  then
					AddRadioItemBonus( sceneId, temp.id, 1 )
				end
			end
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x212221_g_scriptId,0)
	end
end

--**********************************
--列举事件
--**********************************
function x212221_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x212221_g_scriptId, "兑换75级内功套装", 6, 750 )
	AddNumText( sceneId, x212221_g_scriptId, "兑换75级外功套装", 6, 751 )
	AddNumText( sceneId, x212221_g_scriptId, "兑换85级内功套装", 6, 850 )	
	AddNumText( sceneId, x212221_g_scriptId, "兑换85级外功套装", 6, 851 )
end

--**********************************
--检测接受条件
--**********************************
function x212221_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x212221_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x212221_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x212221_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x212221_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x212221_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- 检测传过来的这个值是不是有效的
	local logNum1 = 0
	local item
	local stone

	local bHaveItem = 0
	local bHaveStone = 0
	local temp
	local temp1
	for i, temp in x212221_g_Item do
		if temp.id == selectRadioId  then
			item = temp
			bHaveItem = 1
		end
	end
	
	-- 提交的物品不对应，直接返回，不做处理
	if bHaveItem == 0  then
		return
	end
	
	for i, temp1 in x212221_g_Stone do
		if (10*temp1.level == item.level) or ((10*temp1.level+1 == item.level)) then --有点怪，只有这样了，因为lua不能整除。
			stone = temp1
			bHaveStone = 1
		end
	end
	
	-- 找不到对应的石头，直接返回
	if bHaveStone == 0    then
		return
	end
	
	-- 1，检测玩家身上是不是有位置能够放下物品
	BeginAddItem(sceneId)
		AddItem( sceneId, item.id, 1 )
	local ret = EndAddItem(sceneId,selfId)

	if ret < 1 then
		return
	end
	
	-- 2，计算石头数量
	local selfStoneCount = GetItemCount(sceneId,selfId, stone.id) + GetItemCount(sceneId, selfId, stone.id2);
	if stone.num > selfStoneCount   then
		BeginEvent(sceneId)
			strText = format("对不起，秦皇珠数量必须达到%s个", tostring(stone.num))
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return		
	end
	
	-- 3，检测背包中，如果有石头上锁，就不让执行下去
	local availableStone = LuaFnGetAvailableItemCount( sceneId, selfId, stone.id ) + LuaFnGetAvailableItemCount( sceneId, selfId, stone.id2 );
	if availableStone < stone.num  then
		BeginEvent(sceneId)
			strText = "#{DG_8724_8}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- 4，删除物品 优先删除绑定的
	local bindNum = LuaFnGetAvailableItemCount(sceneId, selfId, stone.id2);
	if (bindNum >= stone.num) then --绑定的石头足够
		if LuaFnDelAvailableItem(sceneId, selfId, stone.id2, stone.num) == 0 then
			BeginEvent(sceneId)
				strText = "删除物品失败！";
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	else --不够
		if (LuaFnDelAvailableItem(sceneId, selfId, stone.id2, bindNum) == 0) or (LuaFnDelAvailableItem(sceneId, selfId, stone.id, stone.num-bindNum) == 0) then
			BeginEvent(sceneId)
				strText = "删除物品失败！";
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end
	logNum1 = stone.num;
	-- 给奖励
	AddItemListToHuman(sceneId,selfId)
	-- 记录Log
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone.id, logNum1, item.id)
	
	--兑换成功，播放特效
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	
	-- 发世界公告
	local szItem = GetItemTransfer(sceneId,selfId,0)

  message = format("#W#{_INFOUSR%s}#P成功帮#Y嬴无名#P从#G秦皇地宫#P中抢救出%s颗#Y秦皇珠#P，嬴无名为表示感激，将祖传的#Y#{_INFOMSG%s}#P一个相赠。", 
   										GetName(sceneId, selfId), tostring(stone.num),  szItem);
	AddGlobalCountNews( sceneId, message )	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212221_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x212221_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212221_OnItemChanged( sceneId, selfId, itemdataId )
end



