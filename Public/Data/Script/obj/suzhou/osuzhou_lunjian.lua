-- 1062

--苏州NPC
--华山论剑报名人
--普通

--脚本号
x001064_g_scriptId = 001064

--所拥有的事件ID列表
x001064_g_eventList={001230} --{001230}


--**********************************
--事件交互入口
--**********************************
function x001064_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  俗话说得好，文无第一，武无第二，武林人士都是要在华山论剑中争一个天下第一的名号。如果你也想参加华山论剑，我可以为你报名并送你去华山。    参加华山论剑的玩家如果积分在本门派排名前三，就可以在我这里领取朝廷颁发的薄礼一份，各位努力啊！")
		
		AddNumText( sceneId, x001064_g_scriptId, "华山论剑介绍", 11, 10 )	
		
		for i, eventId in x001064_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- 选中一项
--**********************************
function x001064_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText( sceneId, "#{function_help_064}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	for i, findId in x001064_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end
