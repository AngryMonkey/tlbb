-- 火折子，需要使用的任务道具
-- 辽西－伯颜（165，197） 驱赶黑蜂

--脚本号
x300025_g_scriptId = 300025

x300025_g_MissionId = 552

--所拥有的事件ID列表
x300025_g_eventList={212107}

--**********************************
--事件交互入口
--**********************************
function x300025_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId, "驱赶黑蜂")
		-- 检测玩家是不是得到了需要的两个道具，
		if GetItemCount( sceneId, selfId, 40002070 ) >= 1   then
			if GetItemCount( sceneId, selfId, 40002069 ) >= 1   then
				AddText(sceneId, "你驱赶了黑蜂，成功了")
				local misIndex = GetMissionIndexByID(sceneId,selfId,x300025_g_MissionId)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)
				-- 删除任务道具
				DelItem( sceneId, selfId, 40002070, 1 )
				DelItem( sceneId, selfId, 40002069, 1 )
				
				-- 播放一个效果
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 139, 0)
				
			else
				AddText(sceneId, "你需要干狼粪")
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--刷新事件
--**********************************
function x300025_OnEventRequest( sceneId, selfId, targetId, eventId )
	--PrintStr("x300025_OnEventRequest")
end

--**********************************
--接受此NPC的任务
--**********************************
function x300025_OnMissionAccept( sceneId, selfId, targetId )

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x300025_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	--for i, findId in x300025_g_eventList do
	--	if missionScriptId == findId then
	--		UpdateEventList( sceneId, selfId, targetId )
	--		return
	--	end
	--end
end

function x300025_IsSkillLikeScript( sceneId, selfId)
	return 0
end


