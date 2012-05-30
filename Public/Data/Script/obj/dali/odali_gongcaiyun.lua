--������

--�ű���
x002089_g_scriptId = 002089

--��ӵ�е��¼�ID�б�
x002089_g_eventList={ 808036, 
					  808035, 
					  808058, 
					  808059, 
					  808060, 
					  210242, 
--					  808062, 
					  808063, 
					  210243, 
					  050022, 
					  808074, 
					  808075,
					  808077,
--					 808078,
					  808079,
					  808038,    -- zchw signature
					  889052,
					  889053,
					  808129,    -- ���������
					}

--**********************************
--�¼��б�
--**********************************
function x002089_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	local  strNpcDefault = "#{OBJ_DALI_GONGCAIYUN_DEFAULT}"
	AddText(sceneId, strNpcDefault );
	for i, eventId in x002089_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x002089_OnDefaultEvent( sceneId, selfId,targetId )
	x002089_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002089_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002089_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x002089_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--�ܾ���NPC������
--**********************************
function x002089_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--�������Ѿ���������
--**********************************
function x002089_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--�ύ�����������
--**********************************
function x002089_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

end

--**********************************
--�����¼�
--**********************************
function x002089_OnDie( sceneId, selfId, killerId )
end
