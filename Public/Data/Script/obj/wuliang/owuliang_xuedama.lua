--薛大妈

--脚本号
x006009_g_scriptId = 006009


--**********************************
--事件交互入口
--**********************************
function x006009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_wuliang_0006}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


