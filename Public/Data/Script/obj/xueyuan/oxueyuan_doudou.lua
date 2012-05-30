--NPC
--豆豆
--普通

--**********************************
--事件交互入口
--**********************************
function x021203_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"你是来找我的吗？博拉和袁平说我不是企鹅……")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
