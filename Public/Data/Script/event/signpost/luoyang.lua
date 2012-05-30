-- 洛阳问路脚本
x500000_g_scriptId = 500000

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500000_g_Signpost = {
		{ type=1, name="如何领取双倍经验", eventId=500049, x=0, y=0, tip=" ", desc=" " },		--无单独脚本
		{ type=1, name="如何加入门派", eventId=500049, x=0, y=0, tip=" ", desc=" " },			--无单独脚本
		{ type=1, name="购买各种物品", eventId=500001, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="驿站", eventId=500002, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="钱庄、当铺、元宝商人", eventId=500003, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="我想出城门去练习本领", eventId=500004, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="学习一些生活技能", eventId=500005, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="任务与副本", eventId=500006, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="我要结婚", eventId=500007, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="帮派", eventId=500008, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="商会", eventId=500009, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="骑乘", eventId=500010, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="擂台", eventId=500011, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="宝石合成", eventId=500012, x=0, y=0, tip=" ", desc=" " },
		{ type=1, name="结拜", eventId=500013, x=0, y=0, tip=" ", desc=" " },
}
--{ type=2, name="东升客栈", x=100.7, y=124.2, tip="洛阳东升客栈", desc="洛阳最大的客栈之一，三教九流聚集之地。" },

--**********************************
--列举事件
--**********************************
function x500000_OnEnumerate( sceneId, selfId, targetId )
--	AddNumText(sceneId, x500000_g_scriptId, "账号安全", -1, 1009)   --帐号  to  账号
	for i, signpost in x500000_g_Signpost do
		AddNumText(sceneId, x500000_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500000_OnDefaultEvent( sceneId, selfId, targetId )

--	if GetNumText() == 1009 then
--		OpenWorldReference(sceneId, selfId, "AccountSafe")
--		return
--	end
	signpost = x500000_g_Signpost[GetNumText()]
	if GetNumText()==1 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "：")
			AddText(sceneId, "请到洛阳的广场（150，91）刘健明处领取双倍经验。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 150, 91, "刘健明" )
		return
	end
	
	if GetNumText()==2 then
		BeginEvent(sceneId)
			AddText(sceneId, signpost.name .. "：")
			AddText(sceneId, "请到各城市的驿站处（按Tab可以打开地图查看#G驿#W字样）传送到您想拜师的门派。到了门派之后点击#G门派指路人#W就可以询问拜师的位置了。或者按tab键打开地图找#G师#W字样。")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, 139, 182, "吴德昌" )
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
