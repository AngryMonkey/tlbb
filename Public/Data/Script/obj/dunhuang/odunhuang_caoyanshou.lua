--大理NPC
--曹延寿
--普通

--**********************************
--事件交互入口
--**********************************
function x008005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  这#G玉门关#W一向是兵家必争之地，我哥哥这#G敦煌#W太守做的也很不容易啊！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

