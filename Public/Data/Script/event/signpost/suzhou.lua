-- 苏州问路脚本
x500020_g_scriptId = 500020

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500020_g_Signpost = {
		{ type=1, name="如何加入门派", eventId=500049, x=0, y=0, tip=" ", desc=" " },
		{ type=2, name="如何领取双倍经验", x=164, y=80, tip="沈澄", desc="你可以向沈澄（164,80）领取双倍经验，他在苏州北门附近。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=1, name="购买各种物品", eventId=500021, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="我想出城门去练习本领", eventId=500022, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="我想学习生活技能", eventId=500023, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="任务与副本", eventId=500024, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="珍兽", eventId=500025, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="驿站", eventId=500026, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="钱庄", eventId=500027, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="装备强化与鉴定", eventId=500028, x=0, y=0, tip=" ", desc=" " },
			{ type=1, name="去除杀气", eventId=500029, x=0, y=0, tip=" ", desc=" " },
}
--{ type=2, name="东升客栈", x=100.7, y=124.2, tip="苏州东升客栈", desc="苏州最大的客栈之一，三教九流聚集之地。" },

--**********************************
--列举事件
--**********************************
function x500020_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500020_g_scriptId, "账号安全", -1, 1009)   --帐号  to  账号
	for i, signpost in x500020_g_Signpost do
		AddNumText(sceneId, x500020_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500020_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId, "AccountSafe")
--		return
--	end
	signpost = x500020_g_Signpost[GetNumText()]

	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "：")
			AddText(sceneId, "请到各城市的驿站处（按Tab可以打开地图查看#G驿#W字样）传送到您想拜师的门派。到了门派之后点击#G门派指路人#W就可以询问拜师的位置了。或者按tab键打开地图找#G师#W字样。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 111, 160, "李乘风" )
		return
	end
		
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
