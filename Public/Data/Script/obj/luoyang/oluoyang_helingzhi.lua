--脚本号
x000087_g_scriptId = 000087

--所拥有的事件ID列表
x000087_g_eventList = { 801011 }

--**********************************
--事件交互入口
--**********************************
function x000087_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  只要你有染发剂就可以改变头发的颜色了。")
		
		AddNumText( sceneId, x000087_g_scriptId, "修改发色介绍", 11, 10 )
		AddNumText( sceneId,x000087_g_scriptId,"修改发色",6,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000087_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_060}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	if GetNumText() == 2 then
		-- 修改发色
		CallScriptFunction( 801011, "OnEnumerate",sceneId, selfId, targetId )
		return
	end

end
