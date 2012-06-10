-- 889080 套装兑换NPC

--脚本号
x889080_g_ScriptId = 889080

--所拥有的事件ID列表
x889080_g_eventList={889070}

x889080_g_EquipList={	
-- 少林寂灭套装（战神套装）
-- 神武套
	{n=1001,id=10470000},
	{n=1002,id=10470001},
	{n=1003,id=10470002},
	{n=1004,id=10470003},
	{n=1005,id=10470004},
	{n=1006,id=10470005},
	{n=1007,id=10470006},
	{n=1008,id=10470007},
	{n=1009,id=10470008},
	{n=1010,id=10470009},
	{n=1011,id=10470010},
	{n=1012,id=10470011},
	{n=1013,id=10470012},
	{n=1014,id=10470013},
	{n=1015,id=10470014},
	{n=1016,id=10470015},
}

 x889080_g_StoneList={
 {n=1,id=10470021,num=2,str="#e000000#gFFFFE0昊天魔罩"},
 {n=2,id=10470022,num=2,str="#e000000#gFFFFE0昊天跑靴"},
 {n=3,id=10470023,num=2,str="#e000000#gFFFFE0昊天护手"},
 {n=4,id=10470024,num=2,str="#e000000#gFFFFE0昊天逐浪铠"},
 {n=5,id=10470025,num=2,str="#e000000#gFFFFE0昊天战镯"},
 {n=6,id=10470026,num=2,str="#e000000#gFFFFE0昊天披肩"},
 {n=7,id=10470027,num=2,str="#e000000#gFFFFE0昊天邪链"},
 {n=8,id=10470028,num=2,str="#e000000#gFFFFE0昊天蟒带"},
 {n=9,id=10470029,num=2,str="#e000000#gFFFFE0昊天绝戒"},
 {n=10,id=10470030,num=2,str="#e000000#gFFFFE0昊天神符"},
 {n=11,id=10470031,num=2,str="#e0000ff#gFF00FF昊天斩将刀"},
 {n=12,id=10470032,num=2,str="#e0000ff#gFF00FF昊天索魂枪"},
 {n=13,id=10470033,num=2,str="#e0000ff#gFF00FF昊天烈火剑"},
 {n=14,id=10470034,num=2,str="#e0000ff#gFF00FF昊天姻缘配"},
 {n=15,id=10470035,num=2,str="#e0000ff#gFF00FF昊天轻羽扇"},
 {n=16,id=10470036,num=2,str="#e0000ff#gFF00FF昊天明月环"},
}
--**********************************
--事件列表
--**********************************
function x889080_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId,"  #cffffcc奉天承运，皇帝诏曰：#r  当今天下太平，百姓安居乐业。只有小股绿林盗匪，妖魔猛兽，为害四方。朕特赦从犯，只诛头目，若有英雄豪杰，能剿灭怪物头目，将其万灵石献交朝廷特使梁师成，就可根据万灵石的品级，获得御赐套装。钦此！")
		--for i, eventId in x889080_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end
		--AddNumText( sceneId, x889080_g_ScriptId, "#c00ffff永久币碎片#W兑换#gf3ffff【永久币】", 4, 10000 )
		AddNumText( sceneId, x889080_g_ScriptId, "#g3f3fff合成『神武套』", 6, 1000)
		AddNumText( sceneId, x889080_g_ScriptId, "#g3f3fff合成『超级大杀器』", 6, 2000)
		AddNumText( sceneId, x889080_g_ScriptId, "离开……", 0, 0 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x889080_OnDefaultEvent( sceneId, selfId,targetId )
	x889080_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x889080_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 2000 then 
		BeginEvent(sceneId)
			AddText(sceneId, "  请选择一下你要合成的装备")
			if nNumText < 1020  then
			AddNumText(sceneId, x889080_g_ScriptId, "神武头盔", 6, nNumText+7)
			AddNumText(sceneId, x889080_g_ScriptId, "神武战靴", 6, nNumText+8)
			AddNumText(sceneId, x889080_g_ScriptId, "神武护手", 6, nNumText+9)
			AddNumText(sceneId, x889080_g_ScriptId, "神武天战甲", 6, nNumText+10)
			AddNumText(sceneId, x889080_g_ScriptId, "神武手镯", 6, nNumText+11)
			AddNumText(sceneId, x889080_g_ScriptId, "神武护肩", 6, nNumText+12)
			AddNumText(sceneId, x889080_g_ScriptId, "神武项链", 6, nNumText+13)
			AddNumText(sceneId, x889080_g_ScriptId, "神武腰带", 6, nNumText+14)
			AddNumText(sceneId, x889080_g_ScriptId, "神武战戒", 6, nNumText+15)
			AddNumText(sceneId, x889080_g_ScriptId, "神武破符", 6, nNumText+16)
			AddNumText(sceneId, x889080_g_ScriptId, "神武☆屠龙刀", 6, nNumText+1)
			AddNumText(sceneId, x889080_g_ScriptId, "神武☆八荒戟", 6, nNumText+2)
			AddNumText(sceneId, x889080_g_ScriptId, "神武☆倚天剑", 6, nNumText+3)
			AddNumText(sceneId, x889080_g_ScriptId, "神武☆离别钩", 6, nNumText+4)
			AddNumText(sceneId, x889080_g_ScriptId, "神武☆逍遥扇", 6, nNumText+5)
			AddNumText(sceneId, x889080_g_ScriptId, "神武☆宝相轮", 6, nNumText+6)
			end                                      
			--if nNumText >= 10000  then             
			--AddNumText(sceneId, x889080_g_ScriptId, "兑换#gf3ffff永久币", 6, nNumText+100)
			--end
			AddNumText( sceneId, x889080_g_ScriptId, "离开……", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 1020  then
		BeginEvent(sceneId)
			--AddText(sceneId, "  不是白给的，用这个东西来换的哦！！")
			
			local nLevel = 0
			if nNumText == 1001 then
				nLevel = 1
			end
			if nNumText == 1002 then
				nLevel = 2
			end
			if nNumText == 1003 then
				nLevel = 3
			end
			if nNumText == 1400 then
				nLevel = 4
			end
			if nNumText == 1500 then
				nLevel = 5
			end
			if nNumText == 1600 then
				nLevel = 6
			end
			if nNumText == 1700 then
				nLevel = 7
			end
			if nNumText == 1800 then
				nLevel = 8
			end
			if nNumText == 1900 then
				nLevel = 9
			end
			if nNumText == 1901 then
				nLevel = 10
			end
			if nNumText == 1902 then
				nLevel = 11
			end
			if nNumText == 1903 then
				nLevel = 12
			end
			if nNumText == 1904 then
				nLevel = 13
			end
			if nNumText == 1905 then
				nLevel = 14
			end
			
			local szStr = "  要获得这些装备，你需要给我“" .. x889080_g_StoneList[nLevel].str 
										.. "”“".. tostring(x889080_g_StoneList[nLevel].num) .. "”个  该物品可在#GBOSS或者怪物#W中爆出....#r  #G注意看装备适合什么门派，不要换错了哦#W"
			AddText(sceneId, szStr)
			
			for i, item in x889080_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x889080_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x889080_g_ScriptId, 0)
		
	end
	
	for i, findId in x889080_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x889080_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x889080_g_eventList do
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
function x889080_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x889080_g_eventList do
		if missionScriptId == findId then
			x889080_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x889080_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x889080_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x889080_g_eventList do
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
function x889080_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--处理提交后的显示情况
	--为了安全，这里要仔细，不能出错
	local nItemIndex = -1
	
	for i, item in x889080_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家是不是够材料提交
	local nLevel = 0
	if x889080_g_EquipList[nItemIndex].n == 1100 then
		nLevel = 1
	end
	if x889080_g_EquipList[nItemIndex].n == 1200 then
		nLevel = 2
	end
	if x889080_g_EquipList[nItemIndex].n == 1300 then
		nLevel = 3
	end
	if x889080_g_EquipList[nItemIndex].n == 1400 then
		nLevel = 4
	end
	if x889080_g_EquipList[nItemIndex].n == 1500 then
		nLevel = 5
	end
	if x889080_g_EquipList[nItemIndex].n == 1600 then
		nLevel = 6
	end
	if x889080_g_EquipList[nItemIndex].n == 1700 then
		nLevel = 7
	end
	if x889080_g_EquipList[nItemIndex].n == 1800 then
		nLevel = 8
	end
	if x889080_g_EquipList[nItemIndex].n == 1900 then
		nLevel = 9
	end
	if x889080_g_EquipList[nItemIndex].n == 1901 then
		nLevel = 10
	end
	if x889080_g_EquipList[nItemIndex].n == 1902 then
		nLevel = 11
	end
	if x889080_g_EquipList[nItemIndex].n == 1903 then
		nLevel = 12
	end
	if x889080_g_EquipList[nItemIndex].n == 1904 then
		nLevel = 13
	end
	if x889080_g_EquipList[nItemIndex].n == 1905 then
		nLevel = 14
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x889080_g_StoneList[nLevel].id) >= x889080_g_StoneList[nLevel].num  then
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
	if LuaFnGetAvailableItemCount(sceneId, selfId, x889080_g_StoneList[nLevel].id) < x889080_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "你没有足够的兑换物品可以被扣除，请检查物品是否上锁。"
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
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x889080_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- 删除相关的石头
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x889080_g_StoneList[nLevel].id, x889080_g_StoneList[nLevel].num)
	
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
		local nBagIndex = TryRecieveItem( sceneId, selfId, x889080_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "兑换成功。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x889080_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#I毕恭毕敬送到#G洛阳#R兑换NPC#I哈哈大笑：“甚好，这个#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x889080_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}	#I送到#G洛阳#R兑换NPC#I拱了拱手：“有劳有劳，#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x889080_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#G洛阳#R兑换NPC#I捧着#Y%d#cffffcc颗#W#{_INFOMSG%s}#cffffcc由衷的赞道：“#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x889080_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x889080_g_eventList do
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
function x889080_OnDie( sceneId, selfId, killerId )
end
