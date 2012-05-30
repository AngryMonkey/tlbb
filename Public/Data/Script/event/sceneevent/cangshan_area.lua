--苍山 狼穴大营 探索类任务
--212127

--脚本号
x212127_g_scriptId = 212127

--任务号
x212127_g_MissionId = 932

--**********************************
--事件列表
--**********************************
function x212127_OnEnterArea(sceneId, selfId)
	--检测玩家是不是有这个任务，
	if( IsHaveMission(sceneId,selfId,x212127_g_MissionId) > 0)  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212127_g_MissionId)
		if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
			SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
			SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
			-- 通知客户端
     	BeginEvent(sceneId)
				local strText = format("已探索狼穴大营:1/1")
				AddText(sceneId, strText)
		  EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--事件列表
--**********************************
function x212127_OnLeaveArea(sceneId, selfId)
	
end
