-- 000131
-- 
--脚本号
x000131_g_scriptId = 000131

--所拥有的事件ID列表
x000131_g_eventList = { 805029, 805030 }

--**********************************
--事件交互入口
--**********************************
function x000131_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  俗话说，相由心生，客官对自己的容貌可否满意呢，要不要稍稍做些改变？")
		AddNumText( sceneId, x000131_g_scriptId, "修整容貌介绍", 11, 10 )
		AddNumText(sceneId,x000131_g_scriptId,"修整容貌",6,1)
		AddNumText( sceneId, x000131_g_scriptId, "修改头像介绍", 11, 14 )
		AddNumText(sceneId,x000131_g_scriptId,"修改头像",6,4)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000131_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{function_help_088}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	if GetNumText() == 14 then
		BeginEvent(sceneId)	
			AddText( sceneId, "#{INTERHEAD_XML_008}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText() == 1 then
		-- 修改脸型
		CallScriptFunction( 805029, "OnEnumerate",sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 4 then
		-- 修改头像
		CallScriptFunction( 805030, "OnEnumerate",sceneId, selfId, targetId )
		return
	end
	
end
