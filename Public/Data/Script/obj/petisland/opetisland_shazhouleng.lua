--ɳ����
--�ű���
x112002_g_scriptId = 112002

--��ӵ�е��¼�ID�б�
x112002_g_eventList={ 250000 }	

--**********************************
--�¼��б�
--**********************************
function x112002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"����߿����չ����ָ��������ޣ�������Ҫ���۵�������")
	for i, eventId in x112002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	
	AddNumText( sceneId, x112002_g_scriptId, "���޵������޽���", 11, 10 )
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x112002_OnDefaultEvent( sceneId, selfId,targetId )
	x112002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x112002_OnEventRequest( sceneId, selfId, targetId, eventId )


	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_076}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	for i, findId in x112002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x112002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
 
end

--**********************************
--�ܾ���NPC������
--**********************************
function x112002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
 
end

--**********************************
--�������Ѿ���������
--**********************************
function x112002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
 
end

--**********************************
--�ύ�����������
--**********************************
function x112002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
 
end

--**********************************
--�����¼�
--**********************************
function x112002_OnDie( sceneId, selfId, killerId )
end

--**********************************
--��������������
--**********************************
function x112002_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end
