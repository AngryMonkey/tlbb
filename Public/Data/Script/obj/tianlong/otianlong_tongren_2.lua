--大理NPC
--天仙妹妹
--普通

--**********************************
--事件交互入口
--**********************************
function x714007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  手阳明大肠经要穴如下：商阳、合谷、阳溪、偏历、温溜、手三里、曲池、手五里、巨骨、天鼎、迎香。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
