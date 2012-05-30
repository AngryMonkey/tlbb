x044602_g_ScriptId = 044602


--**********************************
--事件交互入口
--**********************************
function x044602_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msg = "#{DG_8724_16}"
		AddText(sceneId,msg);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
