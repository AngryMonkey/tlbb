--����NPC
--����ʯ
--һ��

--�ű���
x001000_g_scriptId = 001000

--��ӵ�е��¼�ID�б�
x001000_g_eventList={212130, 212133}

--**********************************
--�¼��б�
--**********************************
function x001000_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��䲻��η�����ڲ��㷨������֮�Բ�������")
		for i, eventId in x001000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		-- ��ȡ�ƺ�
		if (IsMissionHaveDone(sceneId,selfId, 255) > 0 ) then
			AddNumText(sceneId, x001000_g_scriptId, "��ȡ�ƺ�", 6, 999);
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001000_OnDefaultEvent( sceneId, selfId,targetId )
	x001000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001000_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==999  then
		LuaFnAwardTitle( sceneId, selfId,  11, 235)
		SetCurTitle(sceneId, selfId,  11, 235)
		LuaFnDispatchAllTitle(sceneId, selfId)
		return
	end

	for i, findId in x001000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001000_g_eventList do
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
function x001000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001000_g_eventList do
		if missionScriptId == findId then
			x001000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001000_OnDie( sceneId, selfId, killerId )
end
