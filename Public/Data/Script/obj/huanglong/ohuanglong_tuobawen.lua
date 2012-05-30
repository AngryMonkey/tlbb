--黄龙NPC
--拓跋文
--普通

--**********************************
--事件交互入口
--**********************************
function x023001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  夕颜那天去北边的树林了，她做的事情，我都看到了……可是，如果把这件事情告诉慕容长老，他一定会处死夕颜的……我该怎么办……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
