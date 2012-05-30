--����NPC
--����
--����ָ��

--�ű���
x002069_g_ScriptId = 002069

--��ӵ�е��¼�ID�б�
x002069_g_eventList={808097, 808098, 808099, 808093}

--**********************************
--�¼��������
--**********************************
function x002069_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "����"
	else
		PlayerSex = "����"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."��Ҫ�úöԴ��Լ�������Ŷ����������ʲô�����׵ĵط����ҿ��԰�����Ŷ��")
		
		for i, eventId in x002069_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x002069_g_ScriptId,"��������ֵ������ô��",11,0)
		AddNumText(sceneId,x002069_g_ScriptId,"���޿��ֶȲ�����ô��",11,1)
		AddNumText(sceneId,x002069_g_ScriptId,"������������ȼ�",11,2)
		AddNumText(sceneId,x002069_g_ScriptId,"������׽����",11,3)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x002069_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x002069_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

	if	GetNumText() == 0	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0041}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif	GetNumText() == 1	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0042}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	elseif	GetNumText() == 2	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0043}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif	GetNumText() == 3	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0044}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end

end

--**********************************
--���ܴ�NPC������
--**********************************
function x002069_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x002069_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			x002069_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x002069_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x002069_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x002069_OnDie( sceneId, selfId, killerId )
end
