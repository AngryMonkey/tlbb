--楼兰NPC....
--整容....

--脚本号
x001133_g_scriptId = 001133

--所拥有的事件ID列表
x001133_g_eventList = { 805029, 805030 }

--**********************************
--事件交互入口
--**********************************
function x001133_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)

		AddText(sceneId,"#{loulan_zhengrong_20080329}")

		AddNumText( sceneId, x001133_g_scriptId, "修整容貌介绍", 11, 1 )
		AddNumText(sceneId,x001133_g_scriptId,"修整容貌",6,2)

		AddNumText( sceneId, x001133_g_scriptId, "修改头像介绍", 11, 3 )
		AddNumText(sceneId,x001133_g_scriptId,"修改头像",6,4)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

function x001133_OnEventRequest( sceneId, selfId, targetId, eventId )

	local NumText = GetNumText()

	if NumText == 1 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_088}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 3 then

		BeginEvent(sceneId)	
			AddText( sceneId, "#{INTERHEAD_XML_008}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 2 then
		-- 修改脸型
		CallScriptFunction( 805029, "OnEnumerate",sceneId, selfId, targetId )

	elseif NumText == 4 then
		-- 修改头像
		CallScriptFunction( 805030, "OnEnumerate",sceneId, selfId, targetId )

	end

end
