--辽西NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x021006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我大辽集中了大量精锐，对雁门关施加压力；辽西就只剩下我们这些老弱，应付那些神龙见首不见尾的马匪。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
