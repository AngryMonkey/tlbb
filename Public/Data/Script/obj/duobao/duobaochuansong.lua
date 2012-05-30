-- 891003
-- ��̫�� ��կ������

--�ű���
x891003_g_scriptId = 891003

--��ӵ�е��¼�ID�б�
x891003_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x891003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  �ұ�����ɱ���ˣ�Ҫ�뿪�����ţ�����������")
	
	AddNumText( sceneId, x891003_g_scriptId, "��������",0 ,1  )
	AddNumText( sceneId, x891002_g_scriptId, "�����ᱦ����",0 ,2  )
	
	for i, eventId in x891003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x891003_OnDefaultEvent( sceneId, selfId,targetId )
	x891003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x891003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1  then
		local nStoneId = 39910008
		local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
		if nStoneCount >= 1  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B�����ᱦ");
				AddText(sceneId,"  Я���������е���Ҳ����뿪�����š�");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)		
			return 0
		end
		LuaFnCancelSpecificImpact(sceneId,selfId,200)
              LuaFnCancelSpecificImpact(sceneId,selfId,16115)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 161, 105, 10 )

		return
	end

	if GetNumText() == 2  then
		BeginEvent( sceneId )
			AddText(sceneId,"�ᱦʱ��Ϊ#Y20��00-21��00��#W����ʱ��Ϊ#Y19��45-21��00��#cFF0000����ʱ�佫���ý��룬#Y21��00#G�ᱦʱ�������#W��ҽ�������ͼ��")
			AddText(sceneId,"�ᱦ��ͼ#Y20��00#W��׼ʱˢ��һ�����ɱ������ڵ�ͼ#Y����λ��#Gˢ��һ��#cFF0000���������еİ���#W���ֿ���#Y����ô˰���")
			AddText(sceneId,"#Y20:00-21:00#WΪս��ʱ�䣬ɱ��#G�õ�����#W����ң�#cFF0000���л���䣬#W��#Y��ͼ����λ�û�#W����ˢ�³�һ������#W���ֿ���#Y����ô˰���")
			AddText(sceneId,"������ͼ#Y���ܶ�λ��#G����ʹ�ô��ͼ��ܣ�#W��ñ���#Y��;���ߣ�#W�������ߺ󽫻�#cFF0000ɾ�����У������л�#Y����ˢ����#W������ҿ��Ի�ã�#G��;����ս��#W����#Y���͵�������")
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end

	for i, findId in x891003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x891003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891003_g_eventList do
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
function x891003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x891003_g_eventList do
		if missionScriptId == findId then
			x891003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x891003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x891003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x891003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x891003_OnDie( sceneId, selfId, killerId )
end

