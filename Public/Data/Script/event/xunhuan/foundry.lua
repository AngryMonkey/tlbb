--铸造台

function x801012_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddInt(sceneId,1)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 41)
end
