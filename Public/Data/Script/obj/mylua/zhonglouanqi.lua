-- 889067 ��װ�һ�NPC

-- ��ʦ��

--�ű���
x889067_g_ScriptId = 889067

--��ӵ�е��¼�ID�б�
x889067_g_eventList={889068}

x889067_g_EquipList={	

-- ����¥��װ��
{n=1100,id=10422149},{n=1200,id=10423025},{n=1300,id=10420089},

}

x889067_g_StoneList={
-- ���桤��¥�䡿
{n=1,id=20310101,num=20,str="��¥֮��"},
-- ���桤��¥��
{n=2,id=20310102,num=20,str="��¥֮â"},
{n=3,id=20310100,num=20,str="��¥֮��"},

}

--**********************************
--�¼��б�
--**********************************
function x889067_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

		--AddText(sceneId,"  #cffffcc������ˣ��ʵ�گԻ��#r  ��������̫ƽ�����հ�����ҵ��ֻ��С�����ֵ��ˣ���ħ���ޣ�Ϊ���ķ���������ӷ���ֻ��ͷĿ������Ӣ�ۺ��ܣ��ܽ������ͷĿ����������ʯ�׽���͢��ʹ��ʦ�ɣ��Ϳɸ�������ʯ��Ʒ�������������װ���մˣ�")
		--for i, eventId in x889067_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end

		AddNumText( sceneId, x889067_g_ScriptId, "#G������¥��װ��", 6, 1000 )

		AddNumText( sceneId, x889067_g_ScriptId, "�뿪����", 0, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x889067_OnDefaultEvent( sceneId, selfId,targetId )
	x889067_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889067_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- �رմ���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if nNumText == 1000 then
		BeginEvent(sceneId)
			AddText(sceneId, "  ��ѡ��һ����Ҫ�ҵ���¥����")
			AddNumText(sceneId, x889067_g_ScriptId, "�һ�#G���桤��¥�䡿", 6, nNumText+100)
			AddNumText(sceneId, x889067_g_ScriptId, "�һ�#G���桤��¥��", 6, nNumText+200)
			AddNumText(sceneId, x889067_g_ScriptId, "�һ�#G���桤��¥����", 6, nNumText+300)
			AddNumText( sceneId, x889067_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if nNumText > 1000 and nNumText < 2000  then
		BeginEvent(sceneId)
			AddText(sceneId, "  ���ǰ׸��ģ����������������Ŷ����")
			
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

			local szStr = "  Ҫ�����Щװ��������Ҫ���ҡ�#G" .. x889067_g_StoneList[nLevel].str 
										.. "#W����#Y".. tostring(x889067_g_StoneList[nLevel].num) .. "#W����  #r  #G�һ���Ʒ�������ӹ����BOSS����!#W"
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
--���ܴ�NPC������
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
--�ܾ���NPC������
--**********************************
function x889067_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
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
--�������Ѿ���������
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
--�ύ�����������
--**********************************
function x889067_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	for i, item in x889067_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
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
			strText = "��û���㹻�Ķһ���Ʒ�����ܻ�ȡװ����"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����ǲ������㹻��ʯͷ���Կ۳�
	if LuaFnGetAvailableItemCount(sceneId, selfId, x889067_g_StoneList[nLevel].id) < x889067_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "��û���㹻�ġ�" .. x889067_g_StoneList[nLevel].str 
										.. "�����Ա��۳���������Ʒ�Ƿ�������"
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
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x889067_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x889067_g_StoneList[nLevel].id, x889067_g_StoneList[nLevel].num)
	
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
		local nBagIndex = TryRecieveItem( sceneId, selfId, x889067_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "�һ��ɹ���"
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
		--	message = format("#W#{WLS_00}#Y%d#cffffcc��#W#{_INFOMSG%s}#cffffcc���Ե��޵�����#W#{_INFOUSR%s}#{WLS_01}#{_INFOMSG%s}#{WLS_02}", x889067_g_StoneList[nLevel].num, szTransferStone, LuaFnGetName(sceneId, selfId), szTransferEquip);
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
--�����¼�
--**********************************
function x889067_OnDie( sceneId, selfId, killerId )
end
