-- 苏州
--购买物品
--问路脚本
x500021_g_scriptId = 500021

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500021_g_Signpost = {
	{ type=2, name="服饰店", x=217, y=88, tip="左季高", desc="服饰店老板左季高（217,88）在北市靠近码头附近。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="饰品店", x=217, y=81, tip="左无双", desc="饰品店老板左无双（217,81）在北市靠近码头附近。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="珍兽店", x=87, y=142, tip="云霏霏", desc="虫鸟坊坊主云霏霏（87,142）在西门内向北的虫鸟坊内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="药店", x=99, y=155, tip="胡繁", desc="药店老板胡繁（99,155）在西市南口。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="酒店", x=190, y=168, tip="包世荣", desc="酒店老板包世荣（190,168）在状元场南边的酒店门口。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="杂货店", x=128, y=173, tip="孙子羽", desc="杂货店老板孙子羽（128,173）在枫桥街向南。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="宝石商人", x=110, y=133, tip="范大成", desc="宝石商人范大成（110,133）在西市路东。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500021_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500021_g_Signpost do
		AddNumText(sceneId, x500021_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500021_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500021_g_Signpost[GetNumText()]

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
