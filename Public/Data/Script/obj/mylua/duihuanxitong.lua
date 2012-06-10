-- 889080 ��װ�һ�NPC

--�ű���
x889080_g_ScriptId = 889080

--��ӵ�е��¼�ID�б�
x889080_g_eventList={889070}

x889080_g_EquipList={	
-- ���ּ�����װ��ս����װ��
-- ������
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
 {n=1,id=10470021,num=2,str="#e000000#gFFFFE0���ħ��"},
 {n=2,id=10470022,num=2,str="#e000000#gFFFFE0�����ѥ"},
 {n=3,id=10470023,num=2,str="#e000000#gFFFFE0��커��"},
 {n=4,id=10470024,num=2,str="#e000000#gFFFFE0���������"},
 {n=5,id=10470025,num=2,str="#e000000#gFFFFE0���ս��"},
 {n=6,id=10470026,num=2,str="#e000000#gFFFFE0�������"},
 {n=7,id=10470027,num=2,str="#e000000#gFFFFE0���а��"},
 {n=8,id=10470028,num=2,str="#e000000#gFFFFE0�������"},
 {n=9,id=10470029,num=2,str="#e000000#gFFFFE0������"},
 {n=10,id=10470030,num=2,str="#e000000#gFFFFE0������"},
 {n=11,id=10470031,num=2,str="#e0000ff#gFF00FF���ն����"},
 {n=12,id=10470032,num=2,str="#e0000ff#gFF00FF�������ǹ"},
 {n=13,id=10470033,num=2,str="#e0000ff#gFF00FF����һ�"},
 {n=14,id=10470034,num=2,str="#e0000ff#gFF00FF�����Ե��"},
 {n=15,id=10470035,num=2,str="#e0000ff#gFF00FF���������"},
 {n=16,id=10470036,num=2,str="#e0000ff#gFF00FF������»�"},
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
		--AddNumText( sceneId, x889080_g_ScriptId, "#c00ffff���ñ���Ƭ#W�һ�#gf3ffff�����ñҡ�", 4, 10000 )
		AddNumText( sceneId, x889080_g_ScriptId, "#g3f3fff�ϳɡ������ס�", 6, 1000)
		AddNumText( sceneId, x889080_g_ScriptId, "#g3f3fff�ϳɡ�������ɱ����", 6, 2000)
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
	
	if nNumText == 2000 then 
		BeginEvent(sceneId)
			AddText(sceneId, "  ��ѡ��һ����Ҫ�ϳɵ�װ��")
			if nNumText < 1020  then
			AddNumText(sceneId, x889080_g_ScriptId, "����ͷ��", 6, nNumText+7)
			AddNumText(sceneId, x889080_g_ScriptId, "����սѥ", 6, nNumText+8)
			AddNumText(sceneId, x889080_g_ScriptId, "���令��", 6, nNumText+9)
			AddNumText(sceneId, x889080_g_ScriptId, "������ս��", 6, nNumText+10)
			AddNumText(sceneId, x889080_g_ScriptId, "��������", 6, nNumText+11)
			AddNumText(sceneId, x889080_g_ScriptId, "���令��", 6, nNumText+12)
			AddNumText(sceneId, x889080_g_ScriptId, "��������", 6, nNumText+13)
			AddNumText(sceneId, x889080_g_ScriptId, "��������", 6, nNumText+14)
			AddNumText(sceneId, x889080_g_ScriptId, "����ս��", 6, nNumText+15)
			AddNumText(sceneId, x889080_g_ScriptId, "�����Ʒ�", 6, nNumText+16)
			AddNumText(sceneId, x889080_g_ScriptId, "�����������", 6, nNumText+1)
			AddNumText(sceneId, x889080_g_ScriptId, "�����˻��", 6, nNumText+2)
			AddNumText(sceneId, x889080_g_ScriptId, "��������콣", 6, nNumText+3)
			AddNumText(sceneId, x889080_g_ScriptId, "��������", 6, nNumText+4)
			AddNumText(sceneId, x889080_g_ScriptId, "�������ң��", 6, nNumText+5)
			AddNumText(sceneId, x889080_g_ScriptId, "��������", 6, nNumText+6)
			end                                      
			--if nNumText >= 10000  then             
			--AddNumText(sceneId, x889080_g_ScriptId, "�һ�#gf3ffff���ñ�", 6, nNumText+100)
			--end
			AddNumText( sceneId, x889080_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 1020  then
		BeginEvent(sceneId)
			--AddText(sceneId, "  ���ǰ׸��ģ����������������Ŷ����")
			
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
			
			local szStr = "  Ҫ�����Щװ��������Ҫ���ҡ�" .. x889080_g_StoneList[nLevel].str 
										.. "����".. tostring(x889080_g_StoneList[nLevel].num) .. "����  ����Ʒ����#GBOSS���߹���#W�б���....#r  #Gע�⿴װ���ʺ�ʲô���ɣ���Ҫ������Ŷ#W"
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
