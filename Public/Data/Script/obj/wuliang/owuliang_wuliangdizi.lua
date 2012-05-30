--无量弟子

--脚本号
x006007_g_scriptId = 006007


--**********************************
--事件交互入口
--**********************************
function x006007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  无量派正在#G剑湖宫#W举行五年一度的比武斗剑。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


