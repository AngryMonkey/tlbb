-- 889069 套装兑换NPC

-- 梁师成

--脚本号
x889069_g_ScriptId = 889069

--所拥有的事件ID列表
x889069_g_eventList={}

x889069_g_EquipList={	

-- 【明月套装——76级】
{n=1100,id=39901049},{n=1200,id=10511090},{n=1300,id=10515099},{n=1400,id=10520090},


-- 【碧天套装——76级】
{n=2100,id=39901049},{n=2200,id=10511091},{n=2300,id=10515100},{n=2400,id=10520091},


-- 【渡泸套装——76级】
{n=3100,id=39901049},{n=3200,id=10521101},{n=3300,id=10511092},{n=3400,id=10514099},


-- 【倚楼套装——76级】
{n=4100,id=39901049},{n=4200,id=10521102},{n=4300,id=10511093},{n=4400,id=10514100},


-- 【玉骨套装——86级】
{n=5100,id=39901049},{n=5200,id=10511094},{n=5300,id=10514101},{n=5400,id=10522099},


-- 【尘拂套装——86级】
{n=6100,id=39901049},{n=6200,id=10511095},{n=6300,id=10514102},{n=6400,id=10522100},


-- 【香焚套装——86级】
{n=7100,id=39901049},{n=7200,id=10512090},{n=7300,id=10514103},{n=7400,id=10523099},


-- 【琴横套装——86级】
{n=8100,id=10510095},{n=8200,id=10512091},{n=8300,id=10514104},{n=8400,id=10523100},


-- 【雕阑套装——96级】
{n=9100,id=10511096},{n=9200,id=10512092},{n=9300,id=10520092},{n=9400,id=10522101},{n=9500,id=10523101},


-- 【太阴套装——96级】
{n=10100,id=10511097},{n=10200,id=10512093},{n=10300,id=10520093},{n=10400,id=10522102},{n=10500,id=10523102},


-- 【银筝套装——96级】
{n=11100,id=10511098},{n=11200,id=10512094},{n=11300,id=10520094},{n=11400,id=10522103},{n=11500,id=10523103},


-- 【恨天套装——96级】
{n=12100,id=10511099},{n=12200,id=10512095},{n=12300,id=10520095},{n=12400,id=10522104},{n=12500,id=10523104},

}

x889069_g_StoneList={
-- 【明月套装——76级】
{n=1,id=39901042,num=50,str="#GQQ会员碎片#W"},
-- 【碧天套装——76级】
{n=2,id=39901043,num=50,str="#GQQ红钻碎片#W"},
-- 【渡泸套装——76级】
{n=3,id=39901044,num=50,str="#GQQ蓝钻碎片#W"},
-- 【倚楼套装——76级】
{n=4,id=39901045,num=50,str="#GQQ黄钻碎片#W"},
-- 【玉骨套装——86级】
{n=5,id=39901046,num=50,str="#GQQ绿钻碎片#W"},
-- 【尘拂套装——86级】
{n=6,id=39901047,num=50,str="#GQQ粉钻碎片#W"},
--【香焚套装——86级】
{n=7,id=39901048,num=50,str="#GQQ黑钻碎片#W"},
--【琴横套装——86级】
{n=8,id=20310110,num=20,str="#G玄天寒玉#W"},
--【雕阑套装——96级】
{n=9,id=20310110,num=30,str="#G玄天寒玉#W"},
--【太阴套装——96级】
{n=10,id=20310110,num=30,str="#G玄天寒玉#W"},
--【银筝套装——96级】
{n=11,id=20310110,num=30,str="#G玄天寒玉#W"},
--【恨天套装——96级】
{n=12,id=20310110,num=30,str="#G玄天寒玉#W"},
}

--**********************************
--事件列表
--**********************************
function x889069_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  本服特别推出免费兑换QQ会员服务！只要在游戏中QQ空间地图获得碎片后，可以联系兑换相应的QQ会员服务，本服务真实有效！")
		for i, eventId in x889069_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x889069_g_ScriptId, "#G【碎片兑换—QQ会员】", 6, 1000 )
		AddNumText( sceneId, x889069_g_ScriptId, "#G【碎片兑换—QQ红钻】", 6, 2000 )
		AddNumText( sceneId, x889069_g_ScriptId, "#G【碎片兑换—QQ蓝钻】", 6, 3000 )
		AddNumText( sceneId, x889069_g_ScriptId, "#G【碎片兑换—QQ黄钻】", 6, 4000 )
		AddNumText( sceneId, x889069_g_ScriptId, "#Y【碎片兑换—QQ绿钻】", 6, 5000 )
		AddNumText( sceneId, x889069_g_ScriptId, "#Y【碎片兑换—QQ粉钻】", 6, 6000 )
		AddNumText( sceneId, x889069_g_ScriptId, "#Y【碎片兑换—QQ黑钻】", 6, 7000 )
		--AddNumText( sceneId, x889069_g_ScriptId, "#Y【琴横套装——86级】", 6, 8000 )
		--AddNumText( sceneId, x889069_g_ScriptId, "#cFF0000【雕阑套装——96级】", 6, 9000 )
		--AddNumText( sceneId, x889069_g_ScriptId, "#cFF0000【太阴套装——96级】", 6, 10000 )
		--AddNumText( sceneId, x889069_g_ScriptId, "#cFF0000【银筝套装——96级】", 6, 11000 )
		--AddNumText( sceneId, x889069_g_ScriptId, "#cFF0000【恨天套装——96级】", 6, 12000 )

		AddNumText( sceneId, x889069_g_ScriptId, "离开……", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x889069_OnDefaultEvent( sceneId, selfId,targetId )
	x889069_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x889069_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- 关闭窗口
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 1000 or nNumText == 2000 or nNumText == 3000 or nNumText == 4000 or nNumText == 5000 or nNumText == 6000 or nNumText == 7000 or nNumText == 8000  or nNumText == 9000 or nNumText == 10000 or nNumText == 11000 or nNumText == 12000 then
		BeginEvent(sceneId)
			AddText(sceneId, "  请选择一下你要兑的具体部位")
			AddNumText(sceneId, x889069_g_ScriptId, "#G50个#Y碎片兑换", 6, nNumText+100)
			--AddNumText(sceneId, x889069_g_ScriptId, "#G兑换套装#Y②", 6, nNumText+200)
			--AddNumText(sceneId, x889069_g_ScriptId, "#G兑换套装#Y③", 6, nNumText+300)
			--AddNumText(sceneId, x889069_g_ScriptId, "#G兑换套装#Y④", 6, nNumText+400)
			--if nNumText > 8000  then
				--AddNumText(sceneId, x889069_g_ScriptId, "#G兑换套装#Y⑤", 6, nNumText+500)
				--if nNumText > 14000  then
				--AddNumText(sceneId, x889069_g_ScriptId, "#G兑换套装#Y⑥", 6, nNumText+600)
				--end
			--end
			AddNumText( sceneId, x889069_g_ScriptId, "离开……", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 13000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  不是白给的，用这个东西来换的哦！！")
			
			local nLevel = 0
			if nNumText > 1000 then
				nLevel = 1
			end
			if nNumText > 2000 then
				nLevel = 2
			end
			if nNumText > 3000 then
				nLevel = 3
			end
			if nNumText > 4000 then
				nLevel = 4
			end
			if nNumText > 5000 then
				nLevel = 5
			end
			if nNumText > 6000 then
				nLevel = 6
			end
			if nNumText > 7000 then
				nLevel = 7
			end
			if nNumText > 8000 then
				nLevel = 8
			end
			if nNumText > 9000 then
				nLevel = 9
			end
			if nNumText > 10000 then
				nLevel = 10
			end
			if nNumText > 11000 then
				nLevel = 11
			end
			if nNumText > 12000 then
				nLevel = 12
			end
			
			local szStr = "  要获得这些装备，你需要给我“" .. x889069_g_StoneList[nLevel].str 
										.. "”“".. tostring(x889069_g_StoneList[nLevel].num) .. "”个  #r  #G注意看装备适合什么门派，不要换错了哦#W"
			AddText(sceneId, szStr)
			
			for i, item in x889069_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    EndEvent(sceneId)
    --DispatchMissionDemandInfo(sceneId,selfId,targetId, x889069_g_ScriptId, x210200_g_MissionId)
    DispatchMissionContinueInfo(sceneId,selfId,targetId, x889069_g_ScriptId, 0)
		
	end
	
	for i, findId in x889069_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x889069_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x889069_g_eventList do
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
function x889069_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x889069_g_eventList do
		if missionScriptId == findId then
			x889069_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x889069_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x889069_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x889069_g_eventList do
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
function x889069_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--处理提交后的显示情况
	--为了安全，这里要仔细，不能出错
	local nItemIndex = -1
	
	for i, item in x889069_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- 看完家是不是够材料提交
	local nLevel = 0
	if x889069_g_EquipList[nItemIndex].n > 1000 then
		nLevel = 1
	end
	if x889069_g_EquipList[nItemIndex].n > 2000 then
		nLevel = 2
	end
	if x889069_g_EquipList[nItemIndex].n > 3000 then
		nLevel = 3
	end
	if x889069_g_EquipList[nItemIndex].n > 4000 then
		nLevel = 4
	end
	if x889069_g_EquipList[nItemIndex].n > 5000 then
		nLevel = 5
	end
	if x889069_g_EquipList[nItemIndex].n > 6000 then
		nLevel = 6
	end
	if x889069_g_EquipList[nItemIndex].n > 7000 then
		nLevel = 7
	end
	if x889069_g_EquipList[nItemIndex].n > 8000 then
		nLevel = 8
	end
	if x889069_g_EquipList[nItemIndex].n > 9000 then
		nLevel = 9
	end
	if x889069_g_EquipList[nItemIndex].n > 10000 then
		nLevel = 10
	end
	if x889069_g_EquipList[nItemIndex].n > 11000 then
		nLevel = 11
	end
	if x889069_g_EquipList[nItemIndex].n > 12000 then
		nLevel = 12
	end
	
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x889069_g_StoneList[nLevel].id) >= x889069_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "你没有足够的#Y玄天寒玉#W，不能换取装备。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检查是不是有足够的石头可以扣除
	if LuaFnGetAvailableItemCount(sceneId, selfId, x889069_g_StoneList[nLevel].id) < x889069_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "你没有足够的石头可以被扣除，请检查物品是否上锁。"
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
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x889069_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- 删除相关的石头
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x889069_g_StoneList[nLevel].id, x889069_g_StoneList[nLevel].num)
	
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
		local nBagIndex = TryRecieveItem( sceneId, selfId, x889069_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "兑换成功。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x889069_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		--if randMessage == 1 then
		--   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#{WLS_10}#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x889069_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		--elseif randMessage == 2 then
		--	message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}#{WLS_05}#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x889069_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		--else
		--	message = format("#W#{WLS_00}#Y%d#cffffcc颗#W#{_INFOMSG%s}#cffffcc由衷的赞道：“#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x889069_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
		--end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	end

	for i, findId in x889069_g_eventList do
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
function x889069_OnDie( sceneId, selfId, killerId )
end
