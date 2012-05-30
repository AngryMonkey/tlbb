--洛阳NPC
--游酢
--普通

--**********************************
--事件交互入口
--**********************************
function x000039_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  好久未见恩师，甚为挂念啊！#r  恩师对我们教诲有方，使得我们领悟很多世间的道理，今日特来看望恩师。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
