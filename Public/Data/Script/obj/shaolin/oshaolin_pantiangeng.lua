--潘玄耕

--任务号
x009015_g_MissionId = 1060

x009015_g_scriptId=009015

function x009015_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	misIndex = GetMissionIndexByID(sceneId,selfId,x009015_g_MissionId)
	BeginEvent(sceneId)
		AddText(sceneId,"  最近总感觉力气不足。")
		if	IsHaveMission(sceneId,selfId,x009015_g_MissionId) > 0	 then
			if	GetMissionParam( sceneId, selfId, misIndex,0) < 1  and  GetMissionParam( sceneId, selfId, misIndex,3) == 1 then
				AddNumText(sceneId,x009015_g_scriptId,"给你大力舍利",8,0)
			end
		end
	EndEvent( )
	DispatchEventList(sceneId,selfId,targetId)
end

function x009015_OnEventRequest( sceneId, selfId, targetId, eventId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x009015_g_MissionId)
	if	GetNumText()==0	then
		if	HaveItemInBag (  sceneId, selfId, 30202001)	 > 0  then
			DelItem (  sceneId, selfId, 30202001, 1)	
			SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
			BeginEvent(sceneId)
				AddText(sceneId,"谢谢你的大力舍利")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
			BeginEvent(sceneId)
				AddText(sceneId,"任务完成！")
			EndEvent( )
			DispatchMissionTips(sceneId,selfId)
		else
			BeginEvent(sceneId)
				AddText(sceneId,"大力舍利？在哪里？")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	end
end
