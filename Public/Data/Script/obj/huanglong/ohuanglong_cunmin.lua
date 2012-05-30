--黄龙NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x023006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  最近黄龙镇不太平啊，据说圣物都被莽盖毁掉了，那我们马上就要面临灭顶之灾了吧……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
