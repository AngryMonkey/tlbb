--天山
--问路脚本
x500068_g_scriptId = 500068

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500068_g_Signpost = {
	{ type=2, name="拜见掌门", x=91, y=44, tip="掌门", desc="掌门人不在，暂由梅剑代理日常事务。她在灵鹫宫。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="加入天山派", x=91, y=44, tip="梅剑", desc="#{JRMP_090113_05}", eventId=-1 },
	{ type=2, name="学习天山派战斗技能", x=88, y=44, tip="学习天山派战斗技能", desc="灵鹫宫的兰剑可以教给你本派武功。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天山派生活技能", x=119, y=67, tip="学习天山派生活技能", desc="在碎冰戽北边的余婆会教给本派弟子玄冰术。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天山派辅助技能", x=123, y=67, tip="学习天山派辅助技能", desc="在碎冰戽北边的石嫂会教给本派弟子采冰术。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天山派骑乘技能", x=45, y=69, tip="学习骑乘技能", desc="灵泉北面的芦雨亭可以教你骑乘雕的本领。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="购买坐骑", x=39, y=71, tip="购买坐骑", desc="灵泉北面的任飞虹可以卖给你本派的坐骑：雕。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="天山派任务", x=95, y=60, tip="天山派任务", desc="符敏仪正在找本派弟子帮忙，他就在灵鹫宫南边的玄女雕像下。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="天山派传送人", x=90, y=120, tip="天山派传送人", desc="天山派传送人乌老大可以带你去洛阳、大理、苏州或者其他门派。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="折梅峰", x=101, y=44, tip="折梅峰", desc="菊剑是折梅峰的守护人，她在灵鹫宫。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天山派轻功", x=98, y=44, tip="天山派轻功传授人", desc="学习天山派轻功要找竹剑，她在灵鹫宫。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500068_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500068_g_Signpost do
		AddNumText(sceneId, x500068_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500068_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500068_g_Signpost[GetNumText()]

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
