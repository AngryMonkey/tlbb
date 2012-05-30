--楼兰NPC....
--绾发....

--脚本号
x001134_g_scriptId = 001134

--所拥有的事件ID列表
x001134_g_eventList = { 801010 }

--**********************************
--事件交互入口
--**********************************
function x001134_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{loulan_huanfa_20080329}")
		AddNumText( sceneId, x001134_g_scriptId, "修改发型介绍", 11, 1 )
		AddNumText(sceneId,x001134_g_scriptId,"修改发型", 6, 2 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x001134_OnEventRequest( sceneId, selfId, targetId, eventId )

	local NumText = GetNumText()

	if NumText == 1 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_061}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 2 then

		-- 修改发型
		CallScriptFunction( 801010, "OnEnumerate",sceneId, selfId, targetId )

	end

end
