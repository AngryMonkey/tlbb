--天龙
--问路脚本
x500066_g_scriptId = 500066

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500066_g_Signpost = {
	{ type=2, name="拜见方丈", x=96, y=66, tip="方丈", desc="你想拜见本因大师，他正在大雄宝殿。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="加入天龙派", x=96, y=66, tip="本因", desc="#{JRMP_090113_06}", eventId=-1 },
	{ type=2, name="学习天龙派战斗技能", x=97, y=67, tip="学习天龙派战斗技能", desc="大雄宝殿门口的本观会教你本派武功。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天龙派生活技能", x=35, y=86, tip="学习天龙派生活技能", desc="空山禅房的本相大师可以教你制蛊技能。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天龙派辅助技能", x=64, y=151, tip="学习天龙派辅助技能", desc="千寻台的本参可以教给你经脉百决技能。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天龙派骑乘技能", x=148, y=92, tip="学习骑乘技能", desc="想学习骑马就找杨青牛吧，他在天马厩。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="购买坐骑", x=146, y=95, tip="购买坐骑", desc="想买一匹漂亮的马？到天马厩找杨白牛。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="天龙派任务", x=95, y=88, tip="天龙派任务", desc="本凡大师正需要本派弟子帮忙，他大雄宝殿南边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="天龙派传送人", x=99, y=120, tip="天龙派传送人", desc="山门处的破嗔可以带你去洛阳、大理、苏州或者其他门派。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="塔底", x=35, y=86, tip="塔底", desc="本派弟子才允许进入的塔底，找空山禅房的本相大师。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习天龙派轻功", x=35, y=86, tip="天龙派轻功传授人", desc="妙香别院的盛如兰可以教给你本派轻功。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500066_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500066_g_Signpost do
		AddNumText(sceneId, x500066_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500066_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500066_g_Signpost[GetNumText()]

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
