-- 大理
--购买物品
--问路脚本
x500042_g_scriptId = 500042

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500042_g_Signpost = {
	{ type=2, name="兵器店", x=216, y=133, tip="蒲良", desc="兵器店就在东大街路北。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="服饰店", x=238, y=171, tip="黄公道", desc="服饰店就在东大街路南。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="饰品店", x=248, y=171, tip="小钗", desc="饰品店就在东大街路南。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="珍兽店", x=265, y=128, tip="云飘飘", desc="珍兽店就在东大街路北，驿站的东北方向。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="药店", x=102, y=131, tip="卢三七", desc="药店在西大街路北。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="酒店", x=110, y=159, tip="杜子腾", desc="酒店在西大街路南，那里可以买到各种用于回复的食品。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="杂货店", x=57, y=131, tip="高升祥", desc="杂货店在西门内，向北走的农田旁边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500042_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500042_g_Signpost do
		AddNumText(sceneId, x500042_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500042_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500042_g_Signpost[GetNumText()]

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
