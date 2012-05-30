--大理公告牌

--任务号
x714014_g_MissionId = 704

x714014_g_SignPost = {x = 160, z = 156, tip = "赵天师"}

function x714014_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if	IsHaveMission(sceneId,selfId,x714014_g_MissionId)>0	 then
		misIndex = GetMissionIndexByID(sceneId,selfId,x714014_g_MissionId)
	    SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	    SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGDH_81009_01}")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"  大理城居民注意！晚上城里出现神秘人杀害无辜，专门挑单身女子、小孩下手，请大家注意安全。")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId,sceneId, x714014_g_SignPost.x, x714014_g_SignPost.z, x714014_g_SignPost.tip )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"距离武林大会开幕还有 7 天。")
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
	end
end
