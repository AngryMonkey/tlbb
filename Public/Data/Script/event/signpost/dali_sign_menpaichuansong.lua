-- 大理
--门派传送人
--问路脚本
x500041_g_scriptId = 500041

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500041_g_Signpost = {
	{ type=2, name="少林", x=187, y=122, tip="慧易", desc="少林派接引僧慧易（187，122）就在大理中央五华坛的东北角，按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="天龙", x=189, y=124, tip="破贪", desc="天龙派接引僧破贪（189，124）就在大理中央五华坛的东北角，按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="逍遥", x=188, y=133, tip="澹台子羽", desc="逍遥派接引使澹台子羽（188，133）就在大理中央五华坛的东北角，按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="峨嵋", x=192, y=129, tip="路三娘", desc="峨嵋派接引姑姑路三娘（192，129）就在大理中央五华坛的东北角，按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="天山", x=131, y=124, tip="程青霜", desc="天山派接引使称青霜（131，124）就在大理中央五华坛的西北角，距离拜师介绍人聂政不远。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="星宿", x=134, y=120, tip="海风子", desc="星宿派接引弟子海风子（131，124）就在大理中央五华坛的西北角，距离拜师介绍人聂政不远。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="明教", x=130, y=121, tip="石宝", desc="明教接引使石宝（131，124）就在大理中央五华坛的西北角，距离拜师介绍人聂政不远。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="武当", x=127, y=131, tip="张获", desc="武当接引道长张获（131，124）就在大理中央五华坛的西北角，距离拜师介绍人聂政不远。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="丐帮", x=126, y=135, tip="简宁", desc="丐帮接引长老简宁（131，124）就在大理中央五华坛的西北角，距离拜师介绍人聂政不远。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500041_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500041_g_Signpost do
		AddNumText(sceneId, x500041_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500041_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500041_g_Signpost[GetNumText()]

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
