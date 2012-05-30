--洛阳NPC
--藤原佐为
--普通

--脚本号
x000029_g_scriptId = 000029

--**********************************
--事件交互入口
--**********************************
function x000029_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  非常高兴见到你，大宋朝真是个美丽的国家。我很喜欢这里，希望以后还有机会再来。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
