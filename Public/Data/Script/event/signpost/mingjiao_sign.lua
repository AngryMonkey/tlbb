--明教
--问路脚本
x500062_g_scriptId = 500062

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500062_g_Signpost = {
	{ type=2, name="拜见教主", x=98, y=52, tip="教主", desc="请不要随便打扰他，如果你真的想见他就去明尊坛吧。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="加入明教", x=108, y=56, tip="加入明教", desc="#{JRMP_090113_08}", eventId=-1 },
	{ type=2, name="学习明教战斗技能", x=109, y=59, tip="学习明教战斗技能", desc="学习明教战斗技能请到明尊坛去找庞万春。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习明教生活技能", x=87, y=61, tip="学习明教生活技能", desc="在明尊坛的仇道人可以教给你明教独有的圣火术。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习明教辅助技能", x=87, y=58, tip="学习明教辅助技能", desc="在明尊坛的方天定可以教给你明教独有的采火术。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习明教骑乘技能", x=66, y=118, tip="学习骑乘技能", desc="在白金旗北边的厉天佑可以教会你骑乘狮子。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="购买坐骑", x=64, y=115, tip="购买坐骑", desc="你可以在白金旗北边找到邓元觉，向他购买狮子。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="明教任务", x=98, y=105, tip="明教任务", desc="圣火台的林岩正在找人帮忙做一些教内的事务。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="明教传送人", x=102, y=167, tip="明教传送人", desc="大门口的明教传送使方七佛可以带你去洛阳、大理、苏州或者其他门派。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="光明洞", x=89, y=56, tip="光明洞", desc="明尊坛的光明左使方腊可以带你去挑战光明洞。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习明教轻功", x=133, y=137, tip="明教轻功传授人", desc="想学习轻功要找青木旗北边的方百花。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500062_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500062_g_Signpost do
		AddNumText(sceneId, x500062_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500062_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500062_g_Signpost[GetNumText()]

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
