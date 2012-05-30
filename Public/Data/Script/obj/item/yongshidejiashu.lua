--��ʿ�ļ���

--�ű���
x300000_g_scriptId = 300000


--��ӵ�е��¼�ID�б�
x300000_g_eventList={212112}--212112

--**********************************
--�¼��������
--**********************************
function x300000_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId, "��ʿ�ļ���")
		for i, eventId in x300000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, -1 )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	
end

--**********************************
--ˢ���¼�
--**********************************
function x300000_OnEventRequest( sceneId, selfId, targetId, eventId )
end

--**********************************
--���ܴ�NPC������
--**********************************
function x300000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x300000_g_eventList do
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
function x300000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x300000_g_eventList do
		if missionScriptId == findId then
			x300000_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

function x300000_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
