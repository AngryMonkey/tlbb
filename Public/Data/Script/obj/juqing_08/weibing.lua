--120004

-- ��ãɽ������

--�ű���
x120004_g_scriptId = 120004

--��ӵ�е��¼�ID�б�
x120004_g_eventList={}

--**********************************
--�¼��б�
--**********************************
function x120004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--
		local nRand = random( 3 )
		if nRand == 1  then
			AddText(sceneId,"  ���ǵĸ�ĸ�޶������Ѿ����У��������Ǻð���")
		elseif nRand == 2  then
			AddText(sceneId,"  �ʵ۱���Ӣ�����䣬�����������޵У�����һ����սʤ�Ѿ���")
		elseif nRand == 3  then
			AddText(sceneId,"  ������Ȼ����Σ�����������ҵȾ�������֮ʱ��")
		end
		
		for i, eventId in x120004_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x120004_OnDefaultEvent( sceneId, selfId, targetId )
	x120004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x120004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x120004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x120004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120004_g_eventList do
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
function x120004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x120004_g_eventList do
		if missionScriptId == findId then
			x120004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x120004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x120004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x120004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x120004_OnDie( sceneId, selfId, killerId )
end
