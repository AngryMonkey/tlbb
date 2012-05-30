-- 洛阳
--月下老人
--问路脚本
x500007_g_scriptId = 500007

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500007_g_Signpost = {
	{ type=2, name="月下老人", x=46, y=62, tip="月老", desc="月下老人在洛阳城内的西北角。想举行婚礼的新人就去找他。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500007_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500007_g_Signpost do
		AddNumText(sceneId, x500007_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500007_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500007_g_Signpost[GetNumText()]

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
