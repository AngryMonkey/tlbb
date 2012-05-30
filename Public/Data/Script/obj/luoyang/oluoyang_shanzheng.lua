--洛阳NPC

--单正

--普通



--**********************************

--事件交互入口

--**********************************

function x000022_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)

		AddText(sceneId,"#{OBJ_luoyang_0011}")

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end

