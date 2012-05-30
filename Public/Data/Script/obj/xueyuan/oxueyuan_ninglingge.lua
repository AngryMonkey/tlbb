--NPC
--宁令哥
--普通

--**********************************
--事件交互入口
--**********************************
function x021200_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"你听说过得企鹅者得幸福这个传说吗？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
