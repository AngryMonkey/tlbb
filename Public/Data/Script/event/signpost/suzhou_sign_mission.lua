-- 苏州
--循环任务
--问路脚本
x500024_g_scriptId = 500024

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500024_g_Signpost = {
	{ type=2, name="苏州漕运使", x=234, y=78, tip="陆士铮", desc="苏州漕运使陆士铮（234，78）在苏州城东北角的码头旁边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="水牢", x=243, y=215, tip="呼延豹", desc="呼延豹（243，215）在城东南的府衙前，找到他可以接受平反水牢叛乱任务。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="惩凶任务", x=127, y=133, tip="吴玠", desc="苏州总捕头吴玠（127，133）在枫侨街，他正在找人帮他惩治凶徒，有可能得到藏宝图哦。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="棋局", x=174, y=147, tip="张弈国", desc="棋局活动使者张弈国（174，147）在状元场中。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="华山论剑", x=194, y=139, tip="苏剑岭", desc="华山论剑使者苏剑岭（194，139）在状元场中。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="连环副本", x=62, y=162, tip="钱宏宇", desc="苏州校尉钱宏宇（62，162）在苏州城西门外，可以找他领取连环副本任务。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500024_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500024_g_Signpost do
		AddNumText(sceneId, x500024_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500024_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500024_g_Signpost[GetNumText()]

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
