-- 889080 ��װ�һ�NPC
-- ��ʦ��
--�ű���
x889080_g_ScriptId = 889080

--��ӵ�е��¼�ID�б�
x889080_g_eventList={889070}

x889080_g_EquipList={	
{n=1100,id=10470060},
{n=1200,id=10470061},
{n=1300,id=10470062},
{n=1400,id=10470063},
{n=1500,id=10470064},
{n=1600,id=10470065},
{n=1700,id=10470066},
{n=1800,id=10470067},
{n=1900,id=10470068},
{n=1901,id=10470069},
{n=1902,id=10470094},
{n=1903,id=10470095},
{n=1904,id=10470096},
{n=1905,id=10470097}
}

--��Ҫ����Ʒ������
x889080_g_StoneList={
{n=1,id=10470050,num=2,str="#G�ƽ𡤑���#W"},
{n=2,id=10470051,num=2,str="#G�ƽ𡤑���#W"},
{n=3,id=10470052,num=2,str="#G�ƽ𡤑��#W"},
{n=4,id=10470053,num=2,str="#G�ƽ𡤑��#W"},
{n=5,id=10470054,num=2,str="#G�ƽ𡤑���#W"},
{n=6,id=10470055,num=2,str="#G�ƽ𡤑���#W"},
{n=7,id=10470056,num=2,str="#G�ƽ𡤑��#W"},
{n=8,id=10470057,num=2,str="#G�ƽ𡤑�ѥ#W"},
{n=9,id=10470058,num=2,str="#G�ƽ𡤑��#W"},
{n=10,id=10470059,num=2,str="#G�ƽ𡤑��#W"},
{n=11,id=10470090,num=2,str="#cFF0000�ƽ𡤑�#W"},
{n=12,id=10470091,num=2,str="#cFF0000�ƽ𡤑�#W"},
{n=13,id=10470092,num=2,str="#cFF0000�ƽ𡤑���#W"},
{n=14,id=10470093,num=2,str="#cFF0000�ƽ𡤑�#W"},
}

--**********************************
--�¼��б�
--**********************************
function x889080_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId,"  #cffffcc������ˣ��ʵ�گԻ��#r  ��������̫ƽ�����հ�����ҵ��ֻ��С�����ֵ��ˣ���ħ���ޣ�Ϊ���ķ���������ӷ���ֻ��ͷĿ������Ӣ�ۺ��ܣ��ܽ������ͷĿ����������ʯ�׽���͢��ʹ��ʦ�ɣ��Ϳɸ�������ʯ��Ʒ�������������װ���մˣ�")
		--for i, eventId in x889080_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end
		AddNumText( sceneId, x889080_g_ScriptId, "#cFF0000�һ�߱���ס��ռ���װ��", 6, 1000 )
		--AddNumText( sceneId, x889080_g_ScriptId, "#c00ffff���ñ���Ƭ#W�һ�#cFF0000�����ñҡ�", 4, 10000 )
		AddNumText( sceneId, x889080_g_ScriptId, "�뿪����", 0, 0 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x889080_OnDefaultEvent( sceneId, selfId,targetId )
	x889080_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889080_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- �رմ���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	--ֻ��ѡ��1000
	if nNumText == 1000 
	or nNumText == 2000 
	or nNumText == 3000 
	or nNumText == 4000 
	or nNumText == 5000 
	or nNumText == 6000 
	or nNumText == 7000 
	or nNumText == 8000  
	or nNumText == 9000 
	or nNumText == 10000
	then
		BeginEvent(sceneId)
			AddText(sceneId, "  ��ѡ��һ����Ҫ�ҵľ��岿λ")
			if nNumText < 10000  then
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻���", 6, nNumText+100) --����ֵ����������
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻���", 6, nNumText+200)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻ƿ�", 6, nNumText+300)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻Ƽ�", 6, nNumText+400)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻���", 6, nNumText+500)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻���", 6, nNumText+600)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻ƴ�", 6, nNumText+700)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻�ѥ", 6, nNumText+800)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻ƽ�", 6, nNumText+900)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���׻Ʒ�", 6, nNumText+901)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱��������", 6, nNumText+902)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱������ն", 6, nNumText+903)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱���޼���", 6, nNumText+904)
			AddNumText(sceneId, x889080_g_ScriptId, "#cFF0000߱�񡤾��Ļ�", 6, nNumText+905)
			end
--�˴�û�趨�¼�	if nNumText >= 10000  then
--			AddNumText(sceneId, x889080_g_ScriptId, "�һ�#cFF0000���ñ�", 6, nNumText+100)
--			end
			AddNumText( sceneId, x889080_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 1100  then
		BeginEvent(sceneId)
			AddText(sceneId, "  ���ǰ׸��ģ����������������Ŷ����")
			local nLevel = 0	--nLevel����������Ϊ��Ҫ�һ�װ���б�����
			if nNumText == 1100 then
				nLevel = 1
			end
			if nNumText == 1200 then
				nLevel = 2
			end
			if nNumText == 1300 then
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
			
			local szStr = "  Ҫ�����Щװ��������Ҫ���ҡ�" .. x889080_g_StoneList[nLevel].str .. "����".. tostring(x889080_g_StoneList[nLevel].num) .. "����  ����Ʒ����#GBOSS���߹���#W�б���....#r  #Gע�⿴װ���ʺ�ʲô���ɣ���Ҫ������Ŷ#W"
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
--���ܴ�NPC������
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
--�ܾ���NPC������
--**********************************
function x889080_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
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
--�������Ѿ���������
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
--�ύ�����������
--**********************************
function x889080_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	for i, item in x889080_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
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
	
	--�����������Ƿ���ѡ���һ�����Ҫ����Ʒ������
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x889080_g_StoneList[nLevel].id) >= x889080_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "��û���㹻�Ķһ���Ʒ�����ܻ�ȡװ����"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����ǲ������㹻��ʯͷ���Կ۳�
	if LuaFnGetAvailableItemCount(sceneId, selfId, x889080_g_StoneList[nLevel].id) < x889080_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "��û���㹻�Ķһ���Ʒ���Ա��۳���������Ʒ�Ƿ�������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- ��鱳���ռ�
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	
	if bBagOk < 1 then
		BeginEvent(sceneId)
			strText = "��ı���û�пռ��ˡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x889080_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x889080_g_StoneList[nLevel].id, x889080_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "�۳�ʯͷʧ�ܡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--����Ҷ��������
		-- AddItemListToHuman(sceneId,selfId)
		--
		local nBagIndex = TryRecieveItem( sceneId, selfId, x889080_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "�һ��ɹ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local message;	
		local randMessage = random(3);
		local sItemName = GetItemName(sceneId, x889080_g_EquipList[nItemIndex].id)
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
		   	message = format("#W#{_INFOUSR%s}#W#{WLS_08}#Y%d#W#{WLS_09}#{_INFOMSG%s}#I�Ϲ��Ͼ��͵�#G����#R�һ�NPC#I������Ц�������ã����#{_INFOMSG%s}#{WLS_11}", LuaFnGetName(sceneId, selfId), x889080_g_StoneList[nLevel].num, szTransferStone, szTransferEquip);
		elseif randMessage == 2 then
			message = format("#W#{_INFOUSR%s}#W#{WLS_03}#Y%d#W#{WLS_04}#{_INFOMSG%s}	#I�͵�#G����#R�һ�NPC#I���˹��֣����������ͣ�#{_INFOMSG%s}#{WLS_06}#{_INFOMSG%s}#{WLS_07}", LuaFnGetName(sceneId, selfId), x889080_g_StoneList[nLevel].num, szTransferStone, szTransferStone, szTransferEquip);
		else
			message = format("#W#G����#R�һ�NPC#I����#Y%d#cffffcc��#W#{_INFOMSG%s}#cffffcc���Ե��޵�����#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x889080_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
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
--�����¼�
--**********************************
function x889080_OnDie( sceneId, selfId, killerId )
end
