--苏州NPC
--隋豹鸣
--一般
--大逃杀报名人

--脚本号
x001063_g_ScriptId	= 1063

--所拥有的事件ID列表
x001063_g_EventList	= { 808002 }

--**********************************
--事件交互入口
--**********************************
function x001063_OnDefaultEvent( sceneId, selfId, targetId )

	x001063_UpdateEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表
--**********************************
function x001063_UpdateEventList( sceneId, selfId, targetId )

	local	i
	BeginEvent( sceneId )
		AddText( sceneId, "#{function_help_083}" );
		
		AddNumText( sceneId, x001063_g_ScriptId, "比武大会介绍", 11, 10 )
		
		for i, eventId in x001063_g_EventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x001063_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_065}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )

end

--**********************************
--死亡事件
--**********************************
function x001063_OnDie( sceneId, selfId, killerId )
end
