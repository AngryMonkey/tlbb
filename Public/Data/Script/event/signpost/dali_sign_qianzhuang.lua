-- 大理
--钱庄
--问路脚本
x500044_g_scriptId = 500044

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500044_g_Signpost = {
	{ type=2, name="钱庄", x=211, y=172, tip="王颖", desc="王老板的钱庄在距离五华坛不远的东大街路南，按下TAB键，地图上会有闪烁的标识的。钱庄的伙计可以帮你存储物品和金钱。", eventId=-1 },
	{ type=2, name="当铺", x=81, y=162, tip="韩永安", desc="当铺老板韩永安在西大街路南。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500044_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500044_g_Signpost do
		AddNumText(sceneId, x500044_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500044_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500044_g_Signpost[GetNumText()]

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
