--�ϱ�

--�ű���
x020006_g_scriptId = 020006

--**********************************
--�¼��б�
--**********************************
function x020006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.."#{OBJ_caoyuan_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
