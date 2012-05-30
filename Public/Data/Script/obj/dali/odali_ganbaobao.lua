--大理NPC
--甘宝宝
--普通

--**********************************
--事件交互入口
--**********************************
function x002085_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  哼，谁干卑鄙无耻之事，谁就卑鄙无耻，用不着我来骂！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
