--洛阳NPC
--白萌升
--普通

--药店
x000155_g_shoptableindex=14

--**********************************
--事件交互入口
--**********************************
function x000155_OnDefaultEvent( sceneId, selfId,targetId )
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, selfId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId,  0910281)
end
