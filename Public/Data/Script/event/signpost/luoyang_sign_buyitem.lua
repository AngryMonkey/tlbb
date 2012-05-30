-- 洛阳
--购买物品
--问路脚本
x500001_g_scriptId = 500001

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500001_g_Signpost = {
	{ type=2, name="兵器店", x=210, y=154, tip="王德贵", desc="兵器店老板王德贵（210，154）在东市的兵器铺中。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="杂货商人", x=254, y=145, tip="芮福祥", desc="杂货商人芮福祥（254，146）在东门内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="服饰店", x=182, y=183, tip="甄唯思", desc="服饰店掌柜甄唯思（182，183）在南大街的服饰店。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="饰品店", x=178, y=177, tip="贾作珍", desc="饰品店掌柜贾作珍（178，177）在南大街的服饰店。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="药店", x=135, y=164, tip="白萌生", desc="药店掌柜白萌生（135，164）在南大街的药店。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="酒店", x=138, y=140, tip="范统", desc="酒店掌柜范统（138，140）在西大街路南。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="珠宝商人", x=63, y=147, tip="郎夫人", desc="珠宝商人郎夫人（63，147）在西门内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500001_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500001_g_Signpost do
		AddNumText(sceneId, x500001_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500001_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500001_g_Signpost[GetNumText()]

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
