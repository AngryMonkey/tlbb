--�ػ� ������

--�ű���
--g_scriptId = 008003

--��ӵ�е��¼�ID�б�
x008003_g_eventList={}--210804,210805,210806}--//210801,210802,210803,210804}--212603,212606}	

--**********************************
--�¼��б�
--**********************************
function x008003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	AddText(sceneId, "  �þò����ˣ���Ϊһ�����ˣ���֪���Լ����ڵĴ����ж�ô���Ρ�������ô��ĺ��˵��֣���Ҫ�������ǰ����ǷǶԴ���˭����˵�������أ���")

	for i, eventId in x008003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x008003_OnDefaultEvent( sceneId, selfId,targetId )
	x008003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x008003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x008003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x008003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x008003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x008003_g_eventList do
		if missionScriptId == findId then
			x008003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x008003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x008003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x008003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x008003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x008003_OnDie( sceneId, selfId, killerId )
end
