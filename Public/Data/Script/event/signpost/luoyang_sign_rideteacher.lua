-- 洛阳
--骑乘
--问路脚本
x500010_g_scriptId = 500010

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500010_g_Signpost = {
	{ type=2, name="骑乘", x=136, y=180, tip="田骁鸣", desc="在西市和南大街中间的驿站内找到田骁鸣，可以购买初级骑乘。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500010_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500010_g_Signpost do
		AddNumText(sceneId, x500010_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500010_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500010_g_Signpost[GetNumText()]

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
