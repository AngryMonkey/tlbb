x044604_g_ScriptId = 044604


--**********************************
--事件交互入口
--**********************************
function x044604_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msg = "#{DG_8724_21}"
		AddText(sceneId,msg);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
