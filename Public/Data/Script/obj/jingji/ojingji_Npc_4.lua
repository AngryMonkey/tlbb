-- 125014
-- 修理装备

--脚本号
x125014_g_scriptId = 125014

--所拥有的事件ID列表
x125014_g_eventList={}

--**********************************
--事件列表
--**********************************
function x125014_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我可以修理所有的40级以上的装备、不管是武器、防具还是饰品。不过也正是因为我当年学艺的时候对什么都感兴趣，所以造成我对哪一方面都不算精通。所以我修理的时候成功率不是100％哦。如果你没有什么异议的话，就找我帮你修理吧。")
		AddNumText(sceneId,x125014_g_scriptId,"我要修理装备",6,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x125014_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		UICommand_AddInt( sceneId, -1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19810313 )	
	end
end

