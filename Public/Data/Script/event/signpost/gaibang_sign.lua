--丐帮
--问路脚本
x500063_g_scriptId = 500063

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500063_g_Signpost = {
	{ type=2, name="加入丐帮", x=91, y=98, tip="陈孤雁", desc="#{JRMP_090113_09}", eventId=-1 },
	{ type=2, name="学习丐帮战斗技能", x=94, y=99, tip="学习丐帮战斗技能", desc="奚三祁长老可以教给你本帮的技能，它在聚义堂门口。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习丐帮生活技能", x=114, y=91, tip="学习丐帮生活技能", desc="忠烈堂门口的吴长风长老可以教给你酿酒技能。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习丐帮辅助技能", x=131, y=83, tip="学习丐帮辅助技能", desc="到桃园去，舵主就在那里，你问问他会不会教你莲花落。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习丐帮骑乘技能", x=38, y=89, tip="学习骑乘技能", desc="西厢房的蒋光亭可以教你怎样骑乘狼。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="购买坐骑", x=54, y=86, tip="购买坐骑", desc="购买坐骑找西厢房的李日越。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="丐帮任务", x=92, y=70, tip="丐帮任务", desc="洪通在聚义堂后面，他正在找人帮忙。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="丐帮传送人", x=93, y=118, tip="丐帮传送人", desc="聚义堂外的张全祥可以带你去洛阳、大理、苏州或者其他门派。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="酒窖", x=41, y=144, tip="酒窖", desc="酒窖有人捣乱，去小桃园找佛印带你去赶跑他们。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习丐帮轻功", x=112, y=90, tip="丐帮轻功传授人", desc="忠烈堂门口的吴雪娇可以教给你本帮轻功。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500063_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500063_g_Signpost do
		AddNumText(sceneId, x500063_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500063_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500063_g_Signpost[GetNumText()]

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
