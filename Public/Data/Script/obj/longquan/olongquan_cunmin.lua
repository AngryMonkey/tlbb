--龙泉NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x031010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  龙井村的茶叶，配上虎跑村的泉水，就是闻名天下的龙井茶。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
