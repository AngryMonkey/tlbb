--洛阳NPC
--书僮
--普通

--**********************************
--事件交互入口
--**********************************
function x000036_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  老爷完成《资治通鉴》后，身体已经非常虚弱了，还经常为国事操劳，真让人担心啊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
