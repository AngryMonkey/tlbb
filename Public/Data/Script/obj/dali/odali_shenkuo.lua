--����NPC
--����
--��ͨ

--�ű���
x002001_g_scriptId = 002001

--��ӵ�е��¼�ID�б�
x002001_g_eventList={212128,212131}

--**********************************
--�¼��б�
--**********************************
function x002001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������кܶ�ֲ��Ϳ�ؼ�Ϊ������Ҳ�����Ҵ��꾩ǧ���������������ǲ�����а���")
		for i, eventId in x002001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		-- ��ȡ�ƺ�
		if (IsMissionHaveDone(sceneId,selfId, 253) > 0 ) then
			AddNumText(sceneId, x002001_g_scriptId, "��ȡ�ƺ�", 6, 999);
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002001_OnDefaultEvent( sceneId, selfId,targetId )
	x002001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002001_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText()==999  then
		LuaFnAwardTitle( sceneId, selfId,  9, 233)
		SetCurTitle(sceneId, selfId,  9, 233)
		LuaFnDispatchAllTitle(sceneId, selfId)
		return
	end
	
	for i, findId in x002001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002001_g_eventList do
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
function x002001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002001_g_eventList do
		if missionScriptId == findId then
			x002001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002001_OnDie( sceneId, selfId, killerId )
end
