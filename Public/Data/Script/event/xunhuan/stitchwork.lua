--����̨

function x801013_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddInt(sceneId,2)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 41)
end
