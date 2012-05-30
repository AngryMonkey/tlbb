--玉溪NPC
--村民
--普通

--**********************************
--事件交互入口
--**********************************
function x027007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  古鲁拉婆婆是个神医啊，吃了她做的药，什么怪病都能好……虽然经常有些奇怪的副作用……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
