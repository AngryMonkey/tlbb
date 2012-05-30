--洛阳NPC
--陈寿庭
--跑商任务

--**********************************
--事件交互入口
--**********************************
function x000053_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  现在商会缺货，你等些日子再来吧。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
