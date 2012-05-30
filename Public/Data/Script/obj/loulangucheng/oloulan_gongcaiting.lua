--楼兰NPC....
--奖励....

--脚本号
x001155_g_scriptId = 001155


--**********************************
--事件交互入口
--**********************************
function x001155_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{LLGC_20080324_15}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
