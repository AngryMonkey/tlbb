--�Ի��¼� 

--�ű���
x713602_g_ScriptId = 713602

--**********************************
--������ں���
--**********************************
function x713602_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0002}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�о��¼�
--**********************************
function x713602_OnEnumerate( sceneId, selfId, targetId )
	--	AddNumText(sceneId,x713602_g_ScriptId,"�����˽���ҩ",11,-1)
end

--**********************************
--����������
--**********************************
function x713602_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x713602_OnAccept( sceneId, selfId, AbilityId )
end
