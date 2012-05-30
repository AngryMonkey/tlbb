-- 洛阳
--帮派
--问路脚本
x500008_g_scriptId = 500008

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500008_g_Signpost = {
	{ type=2, name="帮派", x=140, y=95, tip="范纯仁", desc="兵部尚书范纯仁管理帮派的创建等事务。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500008_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500008_g_Signpost do
		AddNumText(sceneId, x500008_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500008_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500008_g_Signpost[GetNumText()]

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
