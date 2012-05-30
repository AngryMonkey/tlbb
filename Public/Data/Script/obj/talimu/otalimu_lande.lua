--塔里木NPC
--兰德
--**********************************
--事件交互入口
--**********************************
function x044507_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"楼兰城可是沙漠中的一颗明珠，不过最近风沙似乎越来越大了……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
