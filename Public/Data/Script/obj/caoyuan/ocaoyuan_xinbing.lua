--�±�

--�ű���
x020007_g_scriptId = 020007

--**********************************
--�¼��б�
--**********************************
function x020007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.."#{OBJ_caoyuan_0008}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
