--�Ի��¼� npc����ʵ

--�ű���
x713610_g_ScriptId = 713610

--**********************************
--������ں���
--**********************************
function x713610_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0010}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713610_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713610_g_ScriptId,"�����˽���ֲ",11,-1)
end

--**********************************
--����������
--**********************************
function x713610_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713610_OnAccept( sceneId, selfId, AbilityId )
end
