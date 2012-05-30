--苏州NPC
--颜查散
--一般

--**********************************
--事件交互入口
--**********************************
function x001033_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  此次恩科，各地才子齐聚苏州，我这心里还真没谱。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
