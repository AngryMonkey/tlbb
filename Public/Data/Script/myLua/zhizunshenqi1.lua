-- 002957 ������������ר�ýű� 
-- ����С��д
-- �ű���
x002957_g_ScriptId = 002957
--**********************************
--���뼤���װ��
--**********************************
x002957_g_eventList={}
x002957_g_EquipList={	
-- ������һ��
{n=110,id=10305203},
-- ���������
{n=120,id=10305204},
-- ����������
{n=130,id=10305205},
-- �������ļ�
{n=140,id=10305206},
-- ������������
{n=150,id=10305207},
-- ������������
{n=160,id=10305208},
-- ���𡿷�����
{n=170,id=10305209},
-- ������������
{n=180,id=10305210},
-- ���ƾ���һ��
{n=190,id=10305211},
-- ���ƾ�������
{n=200,id=10305212},
-- ���ƾ�������
{n=210,id=10305213},
-- ���ƾ����ļ�
{n=220,id=10305214},
-- ���������ƾ���
{n=230,id=10305215},
-- ���������ƾ���
{n=240,id=10305216},
-- �������ƾ���
{n=250,id=10305217},
-- ���������ƾ���
{n=260,id=10305218},
-- �������
{n=270,id=20310116},
}
--**********************************
--������Ҫ����
--**********************************
x002957_g_StoneList={
-- ������һ�� 
-- ���ƾ���һ��
{n=1,id=20310116,num=20,str="���޾���"},
-- ���������
{n=2,id=10305203,num=3,str="������һ��"},
-- ����������
{n=3,id=10305204,num=3,str="���������"},
-- �������ļ�
{n=4,id=10305205,num=3,str="����������"},
-- �����衾�������������𡿡�����
{n=5,id=10305206,num=3,str="�������ļ�"},
-- ���ƾ�������
{n=6,id=10305211,num=3,str="���ƾ���һ��"},
-- ���ƾ�������
{n=7,id=10305212,num=3,str="���ƾ�������"},
-- ���ƾ����ļ�
{n=8,id=10305213,num=3,str="���ƾ�������"},
-- ���ƾ������������������𡿡�����
{n=9,id=10305214,num=3,str="���ƾ����ļ�"},
}
--**********************************
--NPC�Ի�
--**********************************
function x002957_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #gFF3E96����������Ҫϡ�е����޾��������ѣ�ֻҪ���ռ������㹻�Ĳ��ϱ�������ҡ�")
		for i, eventId in x002957_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x002957_g_ScriptId, "#gFF6A6A#G���������������ƾ���", 1, 100 )
		AddNumText( sceneId, x002957_g_ScriptId, "�뿪����", 13, 0 )

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002957_OnDefaultEvent( sceneId, selfId,targetId )
	x002957_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002957_OnEventRequest( sceneId, selfId, targetId, eventId )
	local nNumText = GetNumText()
	if nNumText == 0  then
		-- �رմ���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	if nNumText == 100 then
		BeginEvent(sceneId)
			AddText(sceneId, "  ��ѡ��һ����Ҫ���ѵ���������")
			if nNumText == 100 then
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y������һ��", 1, nNumText+10)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y���������", 1, nNumText+20)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y����������", 1, nNumText+30)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y�������ļ�", 1, nNumText+40)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I������������", 1, nNumText+50)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I������������", 1, nNumText+60)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I���𡿷�����", 1, nNumText+70)
--			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I������������", 1, nNumText+80)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y���ƾ���һ��", 1, nNumText+90)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y���ƾ�������", 1, nNumText+100)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y���ƾ�������", 1, nNumText+110)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#Y���ƾ����ļ�", 1, nNumText+120)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I���������ƾ���", 1, nNumText+130)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I���������ƾ���", 1, nNumText+140)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I�������ƾ���", 1, nNumText+150)
			AddNumText(sceneId, x002957_g_ScriptId, "#gFF6A6A#G����#I���������ƾ���", 1, nNumText+160)
			end																	
			AddNumText( sceneId, x002957_g_ScriptId, "�뿪����", 0, 0 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
			
	if nNumText > 100 and nNumText < 800  then
		BeginEvent(sceneId)
			AddText(sceneId, "  ���������Ѿ���˯ǧ�꣬��������������ѣ�")
			
			local nLevel = 0
			if nNumText > 100 then    -- ���������һ��
				nLevel = 1
			end
			if nNumText > 110 then    -- ������������
				nLevel = 2
			end
			if nNumText > 120 then    -- �������������
				nLevel = 3
			end			
			if nNumText > 130 then    -- ����������ļ�
				nLevel = 4
			end			
			if nNumText > 140 then    -- ������������
				nLevel = 5
			end			
			if nNumText > 150 then    -- ������������
				nLevel = 5
			end			
			if nNumText > 160 then    -- ���𡿷�����
				nLevel = 5
			end			
			if nNumText > 170 then    -- ������������
				nLevel = 5
			end			
			if nNumText > 180 then    -- ���ƾ���һ��
				nLevel = 1
			end			
			if nNumText > 190 then    -- ���ƾ�������
				nLevel = 6
			end			
			if nNumText > 200 then    -- ���ƾ�������
				nLevel = 7
			end					
			if nNumText > 210 then    -- ���ƾ����ļ�
				nLevel = 8
			end					
			if nNumText > 220 then    -- ���������ƾ���
				nLevel = 9
			end					
			if nNumText > 230 then    -- ���������ƾ���
				nLevel = 9
			end					
			if nNumText > 240 then    -- �������ƾ���
				nLevel = 9
			end				
			if nNumText > 250 then    -- ���������ƾ���
				nLevel = 9
			end				

			local szStr = "  Ҫ�����Щװ��������Ҫ����#gfff0f0��" .. x002957_g_StoneList[nLevel].str
										.. "��#cFFCC00��".. tostring(x002957_g_StoneList[nLevel].num) .. "��#W��  #r#cFFCC00�����ߵ����£������������������������#W"
			AddText(sceneId, szStr)
			
			for i, item in x002957_g_EquipList do
				if item.n == nNumText  then
					AddRadioItemBonus( sceneId, item.id, 4 )
				end
			end
    		EndEvent(sceneId)
   		DispatchMissionContinueInfo(sceneId,selfId,targetId, x002957_g_ScriptId, 0)		
	end
			
	for i, findId in x002957_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002957_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002957_g_eventList do
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
function x002957_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002957_g_eventList do
		if missionScriptId == findId then
			x002957_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
	for i, findId in g_eventListTest do
		if missionScriptId == findId then
			x002957_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002957_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002957_g_eventList do
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
function x002957_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	--�����ύ�����ʾ���
	--Ϊ�˰�ȫ������Ҫ��ϸ�����ܳ���
	local nItemIndex = -1
	
	for i, item in x002957_g_EquipList do
		if item.id == selectRadioId  then
			nItemIndex = i
		end
	end
	
	if nItemIndex == -1  then
		return
	end
	
	-- ������ǲ��ǹ������ύ
	local nLevel = 0
	if x002957_g_EquipList[nItemIndex].n > 100 then
		nLevel = 1
	end
	if x002957_g_EquipList[nItemIndex].n > 110 then
		nLevel = 2
	end
	if x002957_g_EquipList[nItemIndex].n > 120 then
		nLevel = 3
	end	
	if x002957_g_EquipList[nItemIndex].n > 130 then
		nLevel = 4
	end	
	if x002957_g_EquipList[nItemIndex].n > 140 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 150 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 160 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 170 then
		nLevel = 5
	end	
	if x002957_g_EquipList[nItemIndex].n > 180 then
		nLevel = 1
	end	
	if x002957_g_EquipList[nItemIndex].n > 190 then
		nLevel = 6
	end	
	if x002957_g_EquipList[nItemIndex].n > 200 then
		nLevel = 7
	end	
	if x002957_g_EquipList[nItemIndex].n > 210 then
		nLevel = 8
	end	
	if x002957_g_EquipList[nItemIndex].n > 220 then
		nLevel = 9
	end	
	if x002957_g_EquipList[nItemIndex].n > 230 then
		nLevel = 9
	end	
	if x002957_g_EquipList[nItemIndex].n > 240 then
		nLevel = 9
	end	
	if x002957_g_EquipList[nItemIndex].n > 250 then
		nLevel = 9
	end	
		
	local bStoneOk = 0
	if GetItemCount(sceneId, selfId, x002957_g_StoneList[nLevel].id) >= x002957_g_StoneList[nLevel].num  then
		bStoneOk = 1
	end
	
	if  bStoneOk == 0 then
		BeginEvent(sceneId)
			strText = "��û���㹻�Ĳ��ϣ����ܼ�������������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����ǲ������㹻��ʯͷ���Կ۳�
	if LuaFnGetAvailableItemCount(sceneId, selfId, x002957_g_StoneList[nLevel].id) < x002957_g_StoneList[nLevel].num   then
		BeginEvent(sceneId)
			strText = "��û���㹻�Ĳ��Ͽ��Ա��۳���������Ʒ�Ƿ�������"
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
	local nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x002957_g_StoneList[nLevel].id)
	local szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
	
	-- ɾ����ص�ʯͷ
	local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x002957_g_StoneList[nLevel].id, x002957_g_StoneList[nLevel].num)
	
	if bDelOk < 1  then
		BeginEvent(sceneId)
			strText = "�۳�����ʧ�ܡ�"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		--����Ҷ��������
		local nBagIndex = TryRecieveItem( sceneId, selfId, x002957_g_EquipList[nItemIndex].id, 1 );
		
		BeginEvent(sceneId)
			strText = "����ɹ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	for i, findId in x002957_g_eventList do
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
function x002957_OnDie( sceneId, selfId, killerId )
end
