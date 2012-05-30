--洛阳NPC

--北条司

--普通

x000047_g_ScriptId=000047

--**********************************
--事件交互入口
--**********************************
function x000047_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  听说高丽国进贡的国礼丢了，真的吗？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
