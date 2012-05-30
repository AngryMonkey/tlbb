--黄龙NPC
--慕容天狼
--普通

--**********************************
--事件交互入口
--**********************************
function x023004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  这个夕颜来路不明，非我族类，其心必异！我让阿文注意一下她的行动，阿文却每次都告诉我她的行为没有什么异常……我觉得我没有看错人，一定有什么别的问题发生了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
