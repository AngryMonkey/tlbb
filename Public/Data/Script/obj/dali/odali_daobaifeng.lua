--大理NPC
--刀白凤
--普通

--**********************************
--事件交互入口
--**********************************
function x002006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  唉，誉儿走了这么久了还没回来，我是又担心又生气，江湖里的尔虞我诈哪是他这样的毛头小子可以应付的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
