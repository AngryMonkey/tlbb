--薛运来

--脚本号
x006008_g_scriptId = 006008


--**********************************
--事件交互入口
--**********************************
function x006008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_wuliang_0005}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


