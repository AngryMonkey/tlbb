--�Ի��¼� npc��ӱ��

--�ű���
x713606_g_ScriptId = 713606

--**********************************
--������ں���
--**********************************
function x713606_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0006}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713606_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713606_g_ScriptId,"�����˽⹤��",11,-1)
end

--**********************************
--����������
--**********************************
function x713606_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713606_OnAccept( sceneId, selfId, AbilityId )
end
