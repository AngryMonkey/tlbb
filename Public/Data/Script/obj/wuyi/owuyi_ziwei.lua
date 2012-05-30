--³ƽ


--�ű���
x032002_g_scriptId = 032004

--��ӵ�е��¼�ID�б�
x032002_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x032002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  ��ӭ������ɽԽ�˵�Ѳ����Ӫ�أ�������������Ĵ�תת������ǧ��Ҫ�˺���Щ�����ݲ�Ŷ�����ǿ�������ɽԽ�˵ĺ������ء�#r  �Ǳ���ˮ�ɽ�㣬����������Ӫ������������ء�")
	for i, eventId in x032002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x032002_OnDefaultEvent( sceneId, selfId,targetId )
	x032002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x032002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x032002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x032002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032002_g_eventList do
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
function x032002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x032002_g_eventList do
		if missionScriptId == findId then
			x032002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x032002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x032002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x032002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x032002_OnDie( sceneId, selfId, killerId )
end

