--����̨

function x801014_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddInt(sceneId,3)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 41)
end
