-- 洛阳
--生活技能导师
--问路脚本
x500005_g_scriptId = 500005

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500005_g_Signpost = {
	{ type=2, name="种植大师", x=219, y=262, tip="刘亦农", desc="走出洛阳南门，在过桥之前向东走，就会在农田中找到种植大师刘亦农（219，262）。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="采矿大师", x=212, y=151, tip="薛铜锤", desc="采矿大师薛铜锤（212，151）在东市的兵器铺中。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="采药大师", x=120, y=169, tip="严百草", desc="采药大师严百草（120，169）在西市路东，按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="渔夫", x=207, y=184, tip="姜渔", desc="渔夫姜渔（207，184）在东市南口，按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="工艺大师", x=60, y=146, tip="龙三少", desc="工艺大师龙三少（60，146）在西门内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="缝纫大师", x=193, y=172, tip="符敏之", desc="缝纫大师符敏之（193，172）在东市。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="铸造大师", x=213, y=160, tip="王德富", desc="铸造大师王德富（213，160）在东市的兵器铺内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="烹饪大师", x=134, y=152, tip="李大嘴", desc="烹饪大师李大嘴（134，152）在西市与西大街交汇处的酒店内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="制药大师", x=138, y=164, tip="张明景", desc="制药大师张明景（138，164）在西市与南大街之间的药店内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="养生法大师", x=132, y=156, tip="蔷薇", desc="养生法大师蔷薇（132，156）在西市与西大街交汇处的酒店内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="药理学大师", x=136, y=169, tip="白颖明", desc="药理学大师白颖明（136，169）在西市与南大街之间的药店内。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="重购配方", x=141, y=133, tip="小高", desc="#G重购配方：#W因某种不可控原因造成玩家已学会的#G加工材料类配方、馒头配方、初/中/高级食材类配方、咫尺天涯配方#W丢失，可以到#G苏州#W的#G小高（96，127）#W购买重#G购配方#W，其出售价格#G统一为1银#W。", eventId=-1 },
	{ type=2, name="材料加工介绍", x=153, y=171, tip="冯铸铁", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--列举事件
--**********************************
function x500005_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500005_g_Signpost do
		AddNumText(sceneId, x500005_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500005_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500005_g_Signpost[GetNumText()]

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
