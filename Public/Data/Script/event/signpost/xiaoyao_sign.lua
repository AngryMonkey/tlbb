--逍遥
--问路脚本
x500069_g_scriptId = 500069

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500069_g_Signpost = {
	{ type=2, name="拜见掌门", x=125, y=144, tip="掌门", desc="代理掌门人苏星河在听香那里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="加入逍遥派", x=125, y=144, tip="苏星河", desc="#{JRMP_090113_03}", eventId=-1 },
	{ type=2, name="学习逍遥派战斗技能", x=125, y=142, tip="学习逍遥派战斗技能", desc="康广陵可以交给你本派武功，他在听香。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习逍遥派生活技能", x=62, y=68, tip="学习逍遥派生活技能", desc="大观的冯阿三可以交给你奇门遁甲术。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习逍遥派辅助技能", x=53, y=150, tip="学习逍遥派辅助技能", desc="学习逍遥派辅助技能需要到思恩找石清露。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习逍遥派骑乘技能", x=53, y=56, tip="学习骑乘技能", desc="吴领军会教给你骑乘技能，他在书房那里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="购买坐骑", x=65, y=55, tip="购买坐骑", desc="神鹿管理员茍读出售坐骑，他在书房旁边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="逍遥派任务", x=120, y=153, tip="逍遥派任务", desc="逍遥派任务发布人秦观在听香。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="逍遥派传送人", x=48, y=124, tip="逍遥派传送人", desc="凤凰琴东边的李傀儡可以带你去洛阳、大理、苏州或者其他门派。小心他的眼神哦。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="谷底", x=62, y=68, tip="谷底", desc="大观的冯阿三可以带本派弟子到逍遥谷底。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习逍遥派轻功", x=54, y=149, tip="逍遥派轻功传授人", desc="学习逍遥派轻功要到思恩那里找石甘霖。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500069_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500069_g_Signpost do
		AddNumText(sceneId, x500069_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500069_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500069_g_Signpost[GetNumText()]

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
