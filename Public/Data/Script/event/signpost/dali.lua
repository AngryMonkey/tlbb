-- 大理问路脚本
x500040_g_scriptId = 500040

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500040_g_Signpost = {
		{ type=1, name="如何加入门派", eventId=500049, x=0, y=0, tip=" ", desc=" " },		--注意，这一条不是调用另一个脚本的方式，而是在本文件内直接判断。不建议使用此种方式
		{ type=1, name="九大门派传送人", eventId=500041, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="购买各种物品", eventId=500042, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="驿站", eventId=500043, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="钱庄、当铺", eventId=500044, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="我想出城门去练习本领", eventId=500045, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="学习一些生活技能", eventId=500046, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="任务与副本", eventId=500047, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="擂台", eventId=500048, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="拜师", eventId=500049, x=0, y=0, tip=" ", desc=" " },
}

--{ type=2, name="东升客栈", x=100.7, y=124.2, tip="大理东升客栈", desc="大理最大的客栈之一，三教九流聚集之地。" },
--{ type=2, name="毕升", x=180.0, y=120.0, tip="毕升。娶妻拜师休妻叛师的好去处！", desc="毕升～，实现你毕生的梦想～～～" },


--**********************************
--列举事件
--**********************************
function x500040_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500040_g_scriptId, "账号安全", -1, 1009)   --帐号  to  账号
	for i, signpost in x500040_g_Signpost do
		AddNumText(sceneId, x500040_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500040_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId,"AccountSafe")
--		return
--	end
	signpost = x500040_g_Signpost[GetNumText()]
	
	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "：")
			AddText(sceneId, "请到各城市的驿站处（按Tab可以打开地图查看#G驿#W字样）传送到您想拜师的门派。到了门派之后点击#G门派指路人#W就可以询问拜师的位置了。或者按tab键打开地图找#G师#W字样。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 241, 136, "崔逢九" )
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
