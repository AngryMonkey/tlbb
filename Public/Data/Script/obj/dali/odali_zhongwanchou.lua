--大理NPC
--钟万仇
--普通

--**********************************
--事件交互入口
--**********************************
function x002086_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我夫人骂得好。段正淳这恶徒自逞风流，多造冤孽，到头来自己的亲生儿女相恋成奸，当真是卑鄙无耻之极了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
