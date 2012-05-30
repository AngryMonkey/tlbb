--宝藏洞一至五层NPC
--姚夫　姚公　姚伯　姚仲　姚叔
--药店

--**********************************
--事件交互入口
--**********************************
function x039001_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  宝藏洞里宝藏无数，可是也凶险万分，大侠你一定要准备周全啊！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
