--火焰山NPC
--宋兵火抗
--任务

x042513_g_scriptId	= 042513

--**********************************
--事件交互入口
--**********************************
function x042513_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{HYS_20071224_25}" )
		AddNumText(sceneId, x042513_g_scriptId, "#{HYS_20071224_26}",6,0)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x042513_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==0	then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5903, 0)
	end
end
