--明教NPC
--士兵
--普通

--**********************************
--事件交互入口
--**********************************
function x011010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"光明殿重地，不要乱跑！小心迷路！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
