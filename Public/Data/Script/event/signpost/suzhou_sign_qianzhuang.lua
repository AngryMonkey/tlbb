-- 苏州
--循环任务
--问路脚本
x500027_g_scriptId = 500027

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500027_g_Signpost = {
	{ type=2, name="王氏钱庄老板", x=93, y=177, tip="王夫人", desc="钱庄老板王夫人（93，177）在苏州西门内向南的钱庄内，她的活计可以帮你保存物品和金钱。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500027_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500027_g_Signpost do
		AddNumText(sceneId, x500027_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500027_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500027_g_Signpost[GetNumText()]

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
