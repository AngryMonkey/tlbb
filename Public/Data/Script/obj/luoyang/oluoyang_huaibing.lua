--洛阳NPC

--怀丙

--普通



--**********************************

--事件交互入口

--**********************************

function x000015_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)

		AddText(sceneId,"#{OBJ_luoyang_0008}")

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end

