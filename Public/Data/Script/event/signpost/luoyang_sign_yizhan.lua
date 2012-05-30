-- 洛阳
--驿站
--问路脚本
x500002_g_scriptId = 500002

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500002_g_Signpost = {
	{ type=2, name="驿站", x=139, y=182, tip="吴德昌", desc="驿站老板吴德昌（139，182）在南大街和西市之间的驿站里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="商会传送人", x=230, y=129, tip="汪旱", desc="商会传送人汪旱（230，129）在东大街。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500002_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500002_g_Signpost do
		AddNumText(sceneId, x500002_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500002_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500002_g_Signpost[GetNumText()]

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
