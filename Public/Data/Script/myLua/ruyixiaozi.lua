--����ɽNPC
--������
--����С�Ӳ߻�

--�ű���
x002954_g_ScriptId = 002954

--��ӵ�е��¼�ID�б�
x002954_g_eventList={250507}
--**********************************
--�¼��б�
--**********************************
function x002954_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  #72"..PlayerName..PlayerSex.."������ÿ�춼Ҫ�����С�ӣ�С�����⣡����������û�У���С�ӵ�����������������")
		for i, eventId in x002954_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002954_OnDefaultEvent( sceneId, selfId,targetId )
	x002954_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002954_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002954_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002954_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002954_g_eventList do
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
function x002954_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002954_g_eventList do
		if missionScriptId == findId then
			x002954_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002954_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002954_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002954_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002954_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002954_OnDie( sceneId, selfId, killerId )
end
