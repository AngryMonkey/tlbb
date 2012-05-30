-- 大理
--循环任务发布人
--问路脚本
x500047_g_scriptId = 500047

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500047_g_Signpost = {
	{ type=2, name="大理漕运使", x=54, y=192, tip="大理漕运使", desc="大理漕运使王若禹在西门内，向南走就看到了。可以按TAB打开地图，写着漕的地方就是。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500047_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500047_g_Signpost do
		AddNumText(sceneId, x500047_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500047_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500047_g_Signpost[GetNumText()]

	if signpost.type == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "：")
			CallScriptFunction( signpost.eventId, "OnEnumerate", sceneId, selfId, targetId )
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	elseif signpost.type == 2 then
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, signpost.x, signpost.y, signpost.tip )

		BeginEvent(sceneId)
			AddText(sceneId, signpost.desc)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
	end

end
