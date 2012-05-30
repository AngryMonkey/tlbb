--陈永仁

--脚本号
x311001_g_scriptId = 311001

--**********************************
--事件列表
--**********************************
function x311001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  大侠，去看过洛阳花会了吗？有没有见到师师姑娘？听说每次花会师师姑娘都会前往，可惜，我公务在身总是无缘得见啊！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x311001_OnDefaultEvent( sceneId, selfId,targetId )
end
