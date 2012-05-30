--大理NPC
--王颖
--普通

x002025_g_scriptId=002025

--**********************************
--事件交互入口
--**********************************
function x002025_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_dali_0009}")
		AddNumText(sceneId,x002025_g_scriptId,"银行介绍",11,100)
		AddNumText(sceneId,x002025_g_scriptId,"#{JZBZ_081031_02}",11,101)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x002025_OnEventRequest( sceneId, selfId, targetId, eventId )
		if GetNumText() == 100 then
			BeginEvent(sceneId)
				AddText(sceneId,"#{function_help_049}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		elseif GetNumText() == 101 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{JZBZ_081031_01}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	  end
end
