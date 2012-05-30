-- 洛阳
--商会
--问路脚本
x500009_g_scriptId = 500009

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500009_g_Signpost = {
	{ type=2, name="商会", x=230, y=156, tip="乔复盛", desc="商会总管乔复盛（230，156）在东大街路南的商会里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500009_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500009_g_Signpost do
		AddNumText(sceneId, x500009_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500009_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500009_g_Signpost[GetNumText()]

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
