--大理NPC
--扫院老僧
--普通

--**********************************
--事件交互入口
--**********************************
function x009008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  施主在江湖上的大名，老衲早有耳闻。今日一见，果然是名不虚传。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
