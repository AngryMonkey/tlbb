x044601_g_ScriptId = 044601

--**********************************
--�¼��������
--**********************************
function x044601_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msg = "#{DG_8724_15}"
		AddText(sceneId,msg);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
