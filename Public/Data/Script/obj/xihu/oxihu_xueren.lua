-- 中秋NPC
-- 雪人

x050200_g_scriptId = 050200

--**********************************
--事件交互入口
--**********************************
function x050200_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    我……我是个雪人哎！" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
