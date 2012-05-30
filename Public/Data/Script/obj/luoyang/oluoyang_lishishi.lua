--洛阳NPC
--李师师
--普通

--**********************************
--事件交互入口
--**********************************
function x000027_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  无可奈何花落去，似曾相识燕归来。小园香径独徘徊。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
