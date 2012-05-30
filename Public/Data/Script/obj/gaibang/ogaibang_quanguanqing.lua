--丐帮NPC
--全冠清
--普通

--**********************************
--事件交互入口
--**********************************
function x010004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"马副帮主的大仇一定要报，谁反对谁就是杀害马副帮主的帮凶。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
