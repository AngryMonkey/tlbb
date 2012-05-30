-- 苏州
--城门
--问路脚本
x500022_g_scriptId = 500022

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500022_g_Signpost = {
	{ type=2, name="南门", x=182, y=238, tip="南门", desc="南门通往西湖。", eventId=-1 },
	{ type=2, name="西门", x=78, y=163, tip="西门", desc="西门通往镜湖。", eventId=-1 },
	{ type=2, name="北门", x=183, y=67, tip="北门", desc="北门通往太湖。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500022_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500022_g_Signpost do
		AddNumText(sceneId, x500022_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500022_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500022_g_Signpost[GetNumText()]

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
