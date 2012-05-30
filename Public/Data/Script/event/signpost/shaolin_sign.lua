--少林
--问路脚本
x500061_g_scriptId = 500061

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500061_g_Signpost = {
	{ type=2, name="拜见方丈", x=38, y=98, tip="方丈", desc="你想拜见玄慈大师，他就在达摩院。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="加入少林派", x=89, y=72, tip="少林监寺玄寂", desc="#{JRMP_090113_04}", eventId=-1 },
	{ type=2, name="学习少林战斗技能", x=91, y=71, tip="学习门派战斗技能", desc="少林绝技名扬天下，玄难大师可以教给你，他在大雄宝殿门口。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习少林生活技能", x=128, y=86, tip="学习门派生活技能", desc="玄渡大师可以教给你少林独有的开光技能，他在龙树院。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习少林辅助技能", x=135, y=90, tip="学习门派辅助技能", desc="玄鸣大师可以教给你佛法技能，他在龙树院。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习少林骑乘技能", x=57, y=88, tip="学习骑乘技能", desc="玄灭大师可以教你骑乘老虎的本领，他在钟楼的南边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="购买坐骑", x=60, y=82, tip="购买坐骑", desc="你可以向玄生大师购买老虎，他在钟楼的南边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="少林派任务", x=96, y=89, tip="门派任务", desc="如果你想找些事做就找慧方师兄吧，他在大雄宝殿南边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="少林派传送人", x=932, y=131, tip="门派传送人", desc="山门内的慧轮师兄可以带你去洛阳、大理、苏州和其他门派。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="塔林", x=61, y=62, tip="塔林守护人", desc="想挑战塔林就钟楼找玄澄大师。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习少林轻功", x=38, y=102, tip="少林轻功传授人", desc="学习轻功去达摩院找彩云妹妹。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500061_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500061_g_Signpost do
		AddNumText(sceneId, x500061_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500061_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500061_g_Signpost[GetNumText()]

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
