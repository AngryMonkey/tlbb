--洛阳NPC
--宗喀班
--普通

--**********************************
--事件交互入口
--**********************************
function x000042_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  不知道今年的蹴鞠大会，哪方会赢，真是期待啊！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
