--星宿
--问路脚本
x500067_g_scriptId = 500067

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500067_g_Signpost = {
	{ type=2, name="拜见掌门", x=142, y=55, tip="掌门", desc="星宿老仙，德配天地，威震寰宇，古今无比。老仙在神木鼎，去拜见他要小心，小心他把你制成药篓子。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="加入星宿派", x=95, y=75, tip="韩世忠", desc="#{JRMP_090113_02}", eventId=-1 },
	{ type=2, name="学习星宿派战斗技能", x=87, y=70, tip="学习星宿派战斗技能", desc="找万仙宫的施全学习星宿派武功。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习星宿派生活技能", x=101, y=87, tip="学习星宿派生活技能", desc="加入星宿哪能不会制毒，快到瀛洲殿找摘星子。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习星宿派辅助技能", x=101, y=89, tip="学习星宿派辅助技能", desc="瀛洲殿的狮吼子可以教给你引虫术。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习星宿派骑乘技能", x=94, y=46, tip="学习骑乘技能", desc="日月宫的破军子可以教你骑牦牛。放心吧，牦牛身上没有毒。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="购买坐骑", x=97, y=46, tip="购买坐骑", desc="如果想拥有一只牦牛坐骑就到日月宫找天鹰子，少给钱他可不答应，小心他给你一只带毒的牛。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="星宿派任务", x=96, y=92, tip="星宿派任务", desc="任务发布人在方丈殿和瀛洲殿中间，他正需要人帮忙呢。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="星宿派传送人", x=99, y=150, tip="星宿派传送人", desc="最南边门口的天狼子可以带你去洛阳、大理、苏州或者其他门派。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="五神洞", x=128, y=78, tip="五神洞", desc="蓬莱殿的红玉师妹，蓬莱殿的红玉师妹。。。红玉师妹。。。呵呵，呵呵 。。。哦，对，去五神洞就找她好了。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="学习星宿派轻功", x=90, y=88, tip="星宿派轻功传授人", desc="方丈店门口的出尘子可以教给你本派轻功。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500067_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500067_g_Signpost do
		AddNumText(sceneId, x500067_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500067_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500067_g_Signpost[GetNumText()]

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
