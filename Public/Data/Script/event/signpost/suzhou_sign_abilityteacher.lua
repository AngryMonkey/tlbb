-- 苏州
--生活技能
--问路脚本
x500023_g_scriptId = 500023

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500023_g_Signpost = {
		{ type=2, name="种植大师", x=64, y=200, tip="林和靖", desc="走出苏州西门向南走，过了一座小桥就看到种植大师林和靖（64，200）。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="采矿大师", x=259, y=132, tip="张小河", desc="采矿大师张小河（259，132）在城东的兵器铺中。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="采药大师", x=106, y=109, tip="王审芝", desc="采药大师王审芝（106，109）在西市。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="钓鱼大师", x=238, y=77, tip="蒋平", desc="钓鱼大师蒋平（238，77）在城东北角码头那里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="工艺大师", x=109, y=130, tip="曾三省", desc="工艺大师曾三省（109，130）在西市。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="缝纫大师", x=211, y=90, tip="余化龙", desc="缝纫大师余化龙（211，90）在北市靠近码头附近。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="铸造大师", x=251, y=151, tip="薛烛", desc="铸造大师薛烛（251，151）在城东的兵器铺中。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="烹饪大师", x=189, y=173, tip="智化", desc="烹饪大师智化（189，173）在状元场南边的酒店门口。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
		{ type=2, name="重购配方", x=96, y=127, tip="小高", desc="#G重购配方：#W因某种不可控原因造成玩家已学会的#G加工材料类配方、馒头配方、初/中/高级食材类配方、咫尺天涯配方#W丢失，可以到#G苏州#W的#G小高（96，127）#W购买重#G购配方#W，其出售价格#G统一为1银#W。", eventId=-1 },
		{ type=2, name="材料加工介绍", x=-1, y=-1, tip="", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--列举事件
--**********************************
function x500023_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500023_g_Signpost do
		AddNumText(sceneId, x500023_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500023_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500023_g_Signpost[GetNumText()]

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
