-- 大理
--驿站
--问路脚本
x500043_g_scriptId = 500043

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500043_g_Signpost = {
	{ type=2, name="驿站", x=241, y=136, tip="崔逢九", desc="行万里路，破万卷书，想去其他地方看看，驿站是最方便的。驿站的老崔就在东大街的路北，按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500043_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500043_g_Signpost do
		AddNumText(sceneId, x500043_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500043_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500043_g_Signpost[GetNumText()]

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
