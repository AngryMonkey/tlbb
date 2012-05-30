-- 大理
--城门
--问路脚本
x500045_g_scriptId = 500045

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500045_g_Signpost = {
	{ type=2, name="南门", x=160, y=257, tip="南门", desc="南门通往洱海，如果没到25级，还是先不要去那里为好。", eventId=-1 },
	{ type=2, name="东门", x=288, y=152, tip="东门", desc="东门通往无量山，10级以下的玩家去这里正好。", eventId=-1 },
	{ type=2, name="西门", x=31, y=151, tip="西门", desc="西门通往剑阁，10级以下的玩家去这里正好。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500045_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500045_g_Signpost do
		AddNumText(sceneId, x500045_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500045_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500045_g_Signpost[GetNumText()]

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
