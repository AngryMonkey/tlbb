--脚本号
x000088_g_scriptId = 000088

--所拥有的事件ID列表
x000088_g_eventList = { 801010 }

--**********************************
--事件交互入口
--**********************************
function x000088_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  花自飘零水自流，淡淡青丝自言愁，春暖秋霜怜人袖，满月半弦月如钩。既然无处言愁，何不换个发型呢？")
		
		AddNumText( sceneId, x000088_g_scriptId, "修改发型介绍", 11, 10 )
		
		AddNumText(sceneId,x000088_g_scriptId,"修改发型",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000088_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)
				AddText( sceneId, "#{function_help_061}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 1 then
		-- 修改发型
		CallScriptFunction( 801010, "OnEnumerate",sceneId, selfId, targetId )
		return
	end

end
