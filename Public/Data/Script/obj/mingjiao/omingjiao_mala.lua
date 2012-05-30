--明教NPC
--玛拉
--普通

--**********************************
--事件交互入口
--**********************************
function x011007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"百花妹妹说中土有座寒玉塔，里边有好多传说啊，真想去看看。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
