--琼州NPC
--帮众
--普通

--**********************************
--事件交互入口
--**********************************
function x035005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我们帮主武功盖世，天下无敌，文成武德，鸟生鱼汤！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
