-- 大理
--生活技能大师
--问路脚本
x500046_g_scriptId = 500046

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500046_g_Signpost = {
	{ type=2, name="种植大师", x=277, y=167, tip="公孙大叔", desc="想学种地就到东门内靠近农田的公孙大叔，他总在那里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="采矿大师", x=214, y=117, tip="童化铁", desc="学采矿要找童化铁，他在兵器铺的后面，按TAB地图上写着铁字的地方就是。", eventId=-1 },
	{ type=2, name="采药大师", x=99, y=133, tip="刘寄奴", desc="采药大师刘寄奴在西大街路北药店里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="渔夫", x=103, y=157, tip="穆子陵", desc="渔夫穆子陵在西大街路南，酒店旁边。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="工艺大师", x=207, y=195, tip="鲁明月", desc="工艺大师鲁明月在钱庄后面。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="缝纫大师", x=240, y=171, tip="黄绫波", desc="缝纫大师黄绫波在东大街路南。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="铸造大师", x=216, y=109, tip="过三锤", desc="铸造大师过三锤在兵器铺后面。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="烹饪大师", x=117, y=157, tip="杜子飞", desc="烹饪大师杜子飞在西大街路南。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="制药大师", x=99, y=128, tip="傅当归", desc="制药大师傅当归在西大街路北。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="重购配方", x=141, y=133, tip="小高", desc="#G重购配方：#W因某种不可控原因造成玩家已学会的#G加工材料类配方、馒头配方、初/中/高级食材类配方、咫尺天涯配方#W丢失，可以到#G苏州#W的#G小高（96，127）#W购买重#G购配方#W，其出售价格#G统一为1银#W。", eventId=-1 },
	{ type=2, name="材料加工介绍", x=-1, y=-1, tip="", desc="#{CLJG_20071204}", eventId=-1 },	
}

--**********************************
--列举事件
--**********************************
function x500046_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500046_g_Signpost do
		AddNumText(sceneId, x500046_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500046_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500046_g_Signpost[GetNumText()]

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
