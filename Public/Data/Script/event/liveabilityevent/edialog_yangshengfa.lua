--�Ի��¼� npc��ӱ��

--�ű���
x713621_g_ScriptId = 713621

--**********************************
--������ں���
--**********************************
function x713621_OnDefaultEvent( sceneId, selfId, targetId)
	dialog = "#{event_liveabilityevent_0030}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713621_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713621_g_ScriptId,"�����˽�������",11,-1)
end

--**********************************
--����������
--**********************************
function x713621_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713621_OnAccept( sceneId, selfId, AbilityId )
end
