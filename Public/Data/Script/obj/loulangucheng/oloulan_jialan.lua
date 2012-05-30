--楼兰NPC....
--染发....

--脚本号
x001132_g_scriptId = 001132

--所拥有的事件ID列表
x001132_g_eventList = { 801011 }

--**********************************
--事件交互入口
--**********************************
function x001132_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_14}")
		AddNumText( sceneId, x001132_g_scriptId, "修改发色介绍", 11, 1 )
		AddNumText(sceneId,x001132_g_scriptId,"修改发色",6,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x001132_OnEventRequest( sceneId, selfId, targetId, eventId )

	local NumText = GetNumText()

	if NumText == 1 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_060}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 2 then

		-- 修改发色
		CallScriptFunction( 801011, "OnEnumerate",sceneId, selfId, targetId )

	end

end
