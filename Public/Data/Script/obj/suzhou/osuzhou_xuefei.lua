--苏州NPC		高级装备修理
--薛菲
--脚本号

x001056_g_ScriptId = 001056

--**********************************
--事件交互入口
--**********************************
function x001056_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{SQXL_20071011}")
		AddNumText(sceneId,x001056_g_ScriptId,"我要修理装备",6,1)
		AddNumText(sceneId, x001056_g_ScriptId,"装备修理介绍",11,12);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x001056_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		--PrintNum(sceneId )
		--PrintNum(targetId )

		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )
	end
	
	if GetNumText() == 12 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{function_help_043}#r")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
end
