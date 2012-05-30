--黄龙NPC
--刘傲天
--普通

--**********************************
--事件交互入口
--**********************************
function x023005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  你好，中原的英雄！我叫刘傲天。我是匈奴人的后裔，本姓栾提的，你也可以叫我栾提傲天。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
