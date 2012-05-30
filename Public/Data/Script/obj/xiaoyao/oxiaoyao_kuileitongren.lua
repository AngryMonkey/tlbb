--NPC
--傀儡
--普通

--**********************************
--事件交互入口
--**********************************
function x014011_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  逍遥傀儡人F-17173型目前工作正常……良好……优秀……杰出……完美……哦耶……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
