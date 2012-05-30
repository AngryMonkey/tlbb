--洛阳NPC
--蔡丙臣
--普通

--**********************************
--事件交互入口
--**********************************
function x000092_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0024}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
