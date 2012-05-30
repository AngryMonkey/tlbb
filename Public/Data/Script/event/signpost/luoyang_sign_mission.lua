-- 洛阳
--循环任务与副本
--问路脚本
x500006_g_scriptId = 500006

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500006_g_Signpost = {
	{ type=2, name="洛阳漕运使", x=228, y=175, tip="赵明诚", desc="洛阳漕运使赵明诚在东市南口路东的大院里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="珍珑棋局", x=271, y=88, tip="王积薪", desc="找到洛阳城内东北方的王府内的棋圣王积薪（271，88）。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500006_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500006_g_Signpost do
		AddNumText(sceneId, x500006_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500006_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500006_g_Signpost[GetNumText()]

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
