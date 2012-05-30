-- 889067 套装兑换NPC

-- 梁师成

--脚本号
x889067_g_ScriptId = 889067

--所拥有的事件ID列表
x889067_g_eventList={889068}

x889067_g_EquipList={	

-- 【重楼套装】
{n=1100,id=10422149},{n=1200,id=10423025},{n=1300,id=10420089},

}

x889067_g_StoneList={
-- 【真·重楼戒】
{n=1,id=20310101,num=20,str="重楼之泪"},
-- 【真·重楼玉】
{n=2,id=20310102,num=20,str="重楼之芒"},
{n=3,id=20310100,num=20,str="重楼之阳"},

}

--**********************************
--事件列表
--**********************************
function x889067_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

		--AddText(sceneId,"  #cffffcc奉天承运，皇帝诏曰：#r  当今天下太平，百姓安居乐业。只有小股绿林盗匪，妖魔猛兽，为害四方。朕特赦从犯，只诛头目，若有英雄豪杰，能剿灭怪物头目，将其万灵石献交朝廷特使梁师成，就可根据万灵石的品级，获得御赐套装。钦此！")
		--for i, eventId in x889067_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end

		AddNumText( sceneId, x889067_g_ScriptId, "#G【真重楼套装】", 6, 1000 )

		AddNumText( sceneId, x889067_g_ScriptId, "离开……", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x889067_OnDefaultEvent( sceneId, selfId,targetId )
	x889067_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x889067_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 1000 then
		BeginEvent(sceneId)
			AddText(sceneId, "  请选择一下你要兑的重楼首饰")
			AddNumText(sceneId, x889067_g_ScriptId, "兑换#G【真·重楼戒】", 6, nNumText+100)
			AddNumText(sceneId, x889067_g_ScriptId, "兑换#G【真·重楼玉】", 6, nNumText+200)
			AddNumText(sceneId, x889067_g_ScriptId, "兑换#G【真·重楼链】", 6, nNumText+300)
			AddNumText( sceneId, x889067_g_ScriptId, "离开……", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 2000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  不是白给的，用这个东西来换的哦！！")
			
			local nLevel = 0
			if nNumText == 1100 then
				nLevel = 1
			end

			if nNumText == 1200 then
				nLevel = 2
			end

			if nNumText == 1300 then
				nLevel = 3
			end

			local szStr = "  要获得这些装备，你需要给我“#G" .. x889067_g_StoneList[nLevel].str 
										.. "#W”“#Y".. tostring(x889067_g_StoneList[nLevel].num) .. "#W”个  #r  #G兑换物品可以束河古镇打BOSS暴出!#W"
			AddText(sceneId, szStr)
			
			for i, item in x889067_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x889067_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x889067_g_ScriptId, 0)
		
	end
	
	for i, findId in x889067_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x889067_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x889067_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x889067_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x889067_g_eventList do
		if missionScriptId == findId then
			x889067_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x889067_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x889067_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x889067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x889067_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--处理提交后的显示情况
	--为了安全，这里要仔细，不能出错
	local nItemIndex = -1
	
	for i, item in x889067_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家是不是够材料提交
	local nLevel = 0
	if x889067_g_EquipList[nItemIndex].n == 1100 then
		nLevel = 1
	end

	if x889067_g_EquipList[nItemIndex].n == 1200 then
		nLevel = 2
	end

	if x889067_g_EquipList[nItemIndex].n == 1300 then
		nLevel = 3
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x889067_g_StoneList[nLevel].id) >= x889067_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "你没有足够的兑换物品，不能换取装备。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检查是不是有足够的石头可以扣除
	if LuaFnGetAvailableItemCount(sceneId, selfId, x889067_g_StoneList[nLevel].id) < x889067_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "你没有足够的“" .. x889067_g_StoneList[nLevel].str 
										.. "”可以被扣除，请检查物品是否上锁。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- 检查背包空间
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "你的背包没有空间了。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x889067_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- 删除相关的石头
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x889067_g_StoneList[nLevel].id, x889067_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "扣出石头失败。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--给完家东西，完成
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x889067_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "兑换成功。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x889067_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		--if randMessage == 1 then
		--   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x889067_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		--elseif randMessage == 2 then
		--	message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x889067_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		--else
		--	message = format("#W#{WLS_00}#Y%d#cffffcc颗#W#{_INFOMSG%s}#cffffcc由衷的赞道：“#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x889067_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		--end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x889067_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x889067_OnDie( sceneId, selfId, killerId )
end
