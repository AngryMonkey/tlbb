--�Ի��¼� 

--�ű���
x713604_g_ScriptId = 713604

--**********************************
--������ں���
--**********************************
function x713604_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0004}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713604_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713604_g_ScriptId,"�����˽�����",11,-1)
end

--**********************************
--����������
--**********************************
function x713604_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713604_OnAccept( sceneId, selfId, AbilityId )
end
