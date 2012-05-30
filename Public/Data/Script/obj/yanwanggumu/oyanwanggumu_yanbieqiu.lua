--NPC
--
--普通

--**********************************
--事件交互入口
--**********************************
function x040001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  就算生前为帝王，死后也不过一杯黄土而已。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
