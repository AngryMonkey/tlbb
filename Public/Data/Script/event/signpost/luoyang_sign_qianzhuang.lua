-- 洛阳
--钱庄
--问路脚本
x500003_g_scriptId = 500003

-- 问路类型 type: 1 为二级菜单, 2 为直接问路
x500003_g_Signpost = {
	{ type=2, name="当铺", x=95, y=152, tip="何生财", desc="当铺老板何生财（95，152）在西门内的当铺里。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="钱庄", x=80, y=152, tip="杨熙平", desc="钱庄老板杨熙平（80，152）在西门内的钱庄内，他的伙计可以帮你存储物品和金钱。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
	{ type=2, name="元宝商", x=206, y=172, tip="金六爷", desc="元宝商人金六爷（206，172）在东市。按下TAB键，地图上会有闪烁的标识的。", eventId=-1 },
}

--**********************************
--列举事件
--**********************************
function x500003_OnEnumerate( sceneId, selfId, targetId )
	for i, signpost in x500003_g_Signpost do
		AddNumText(sceneId, x500003_g_scriptId, signpost.name, -1, i)
	end
end

--**********************************
--任务入口函数
--**********************************
function x500003_OnDefaultEvent( sceneId, selfId, targetId )
	signpost = x500003_g_Signpost[GetNumText()]

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
