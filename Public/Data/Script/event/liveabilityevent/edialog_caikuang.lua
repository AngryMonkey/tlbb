--�Ի��¼� �ɿ�npcѦͭ��

--�ű���
x713607_g_ScriptId = 713607

--**********************************
--������ں���
--**********************************
function x713607_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0007}"
	BeginEvent(sceneId)
		AddText(sceneId, dialog)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713607_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713607_g_ScriptId,"�����˽�ɿ�",11,-1)
end

--**********************************
--����������
--**********************************
function x713607_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713607_OnAccept( sceneId, selfId, AbilityId )
end
