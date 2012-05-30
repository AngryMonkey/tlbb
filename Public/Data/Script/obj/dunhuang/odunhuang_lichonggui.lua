--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x008008_OnDefaultEvent( sceneId, selfId,targetId )
  BeginEvent(sceneId)
	  AddText(sceneId,"  我们已经打败了回鹘和龟兹，攻进玉门关，攻占宋朝是早晚的事情。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

