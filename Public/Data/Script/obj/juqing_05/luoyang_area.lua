-- 洛阳的Id = 4的事件区域
-- 功能，当玩家完成任务21，同时又没有完成任务22，同时洛阳场景没有别人再做这个任务的时候，

-- 前续任务
x113007_g_PreMissionId = 21
x113007_g_MissionId = 22

x113007_g_OnTimerIndex = -1

-- 队伍编号
x113007_g_GroupId = 1

--**********************************
--进入区域事件
--**********************************
function x113007_OnEnterArea( sceneId, selfId, areaId)

	-- 满足任务出现的条件	
  if IsMissionHaveDone(sceneId,selfId,x113007_g_PreMissionId) < 1 then
  	return 0
  end
  
  -- 如果玩家已经完成了这个任务，就不再刷乔峰出来了
  if IsMissionHaveDone(sceneId,selfId,x113007_g_MissionId) > 0 then
  	return 0
  end
  
  -- 检测地图中是不是已经存在这个人物，这个检测是不会检测玩家的，可以放心用
  local nMonsterNum = GetMonsterCount(sceneId)
	local ii = 0
	local bHaveMonster = 0
	for ii=1, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "乔峰"  then
			return
		end
		
		if GetName(sceneId, nMonsterId)  == "阿朱"  then
			return
		end
	end

  -- 创建人物，乔峰，阿朱
  local nNpc1 = LuaFnCreateMonster(sceneId, 442, 283, 116, 3, 0, 36008)
	local nNpc2 = LuaFnCreateMonster(sceneId, 443, 283, 113, 3, 0, 200025)

	SetCharacterName(sceneId, nNpc1, "乔峰")
	SetCharacterName(sceneId, nNpc2, "阿朱")
	
	-- 设置消失时间
	SetCharacterDieTime(sceneId, nNpc1, 600000)
	SetCharacterDieTime(sceneId, nNpc2, 600000)
	
	-- 申请一个队伍
	--local groupId = AllocateMonsterGroup(sceneId)
	
	-- 现在固定的使用一个队伍编号,在使用前现清空就可以
	ReleaseMonsterGroup(sceneId, x113007_g_GroupId)
	
	AddGroupLeader(sceneId, x113007_g_GroupId, nNpc1)
	AddGroupMember(sceneId, x113007_g_GroupId, nNpc2, 2, 1)
	RefixPosOfGroupMember(sceneId,x113007_g_GroupId,nNpc1)

	SetIntervalDistOfGroupMember(sceneId, x113007_g_GroupId, 1)
	
	SetPatrolId(sceneId, nNpc1, 5)
	
end

--**********************************
--进入区域事件
--**********************************
function x113007_OnLeaveArea( sceneId, selfId, areaId)

end

