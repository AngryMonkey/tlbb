--�Ի��¼� 

--�ű���
x713609_g_ScriptId = 713609

--**********************************
--������ں���
--**********************************
function x713609_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0009}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713609_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713609_g_ScriptId,"�����˽����",11,-1)
end

--**********************************
--����������
--**********************************
function x713609_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713609_OnAccept( sceneId, selfId, AbilityId )
end
