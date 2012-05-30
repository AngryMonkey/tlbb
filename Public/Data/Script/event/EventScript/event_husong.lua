--护送任务(所有这一类型都使用这个LUA，修改请注意通用性)

--任务段分类列表_MissType	1.杀怪任务	2.送信任务	3.探索任务	4.寻物任务	5.护送任务
x006671_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

function x006671_DisplayBonus(sceneId, missionIndex)
	local itemCt
	local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0}}
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddRadioItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct = TGetHideItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddRandItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	local awardMoney = TGetAwardMoney(missionIndex)
	AddMoneyBonus( sceneId, awardMoney)
end
--**********************************
--任务入口函数
--**********************************
function x006671_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	--点击该任务后执行此脚本
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)--得到任务在20个任务中的序列号

	local missionTarget, missionInfo, missionContinue, missionComplete = TGetMissionDesc(missionIndex)
	
	if IsHaveMission(sceneId,selfId,missionId) > 0 then
		if GetNumText() == 3 then
			--如果选中的对象是要护送的npc
			local x, z = GetWorldPos(sceneId,targetId)--记录npc的坐标
			SetMissionByIndex(sceneId,selfId,misIndex,7,sceneId) --始终以当前场景为准
			SetMissionByIndex(sceneId,selfId,misIndex,1,0) --完成情况
			SetMissionByIndex(sceneId,selfId,misIndex,2,targetId)
			SetMissionByIndex(sceneId,selfId,misIndex,3,x)
			SetMissionByIndex(sceneId,selfId,misIndex,4,z)

      --*********************************************************************	
      -- npc有效性检查
   		local targetNpcScene, targetNpcName = TGetTargetNpcInfo(missionIndex)
			local targetName = GetName(sceneId, targetId)
			if targetNpcScene ~= sceneId 
			 or targetNpcName ~= targetName then
			 -- 该npc不是要操作的npc
			 return 0
			end
			-- 获取设置前的数据信息
			local oldAIType = GetNPCAIType(sceneId, targetId)
			local oldUnitReputationId = GetUnitReputationID(sceneId, selfId, targetId)
			-- 设置npc巡逻开始的数据
			local patrolPathIndex = TGetHusongPatrolPath(missionIndex)		-- 得到护送巡逻路线
			SetUnitReputationID(sceneId, selfId, targetId, 0) --0为新手阵营,和玩家友好
			SetMonsterFightWithNpcFlag(sceneId, targetId, 1) --打开允许怪物和怪物打架的标记
			SetNPCAIType(sceneId, targetId, TGetHusongAIType(missionIndex))
			SetPatrolId(sceneId, targetId, patrolPathIndex)
		  --设置npc巡逻结束的数据
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetPatrolID", -1) 
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetBaseAIType", 0, -1, oldAIType) 
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetReputationID_CodingRefix", oldUnitReputationId) 
      AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetMonsterFightWithNpcFlag", 0)
			--*********************************************************************
			
			--启动该任务的任务时钟器
			StartMissionTimer(sceneId, selfId, missionId)
			SetMissionEvent(sceneId, selfId, missionId, 5)
			SetMissionEvent(sceneId, selfId, missionId, 6)
		end
		BeginEvent(sceneId)
			AddText(sceneId, missionName)
			AddText(sceneId, missionContinue)
		EndEvent( )
		local bDone = x006671_CheckSubmit( sceneId, selfId, missionIndex )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,missionIndex,missionId,bDone)
	elseif x006671_CheckAccept(sceneId,selfId,missionIndex) > 0 then
		local targetscene, targetname = TGetTargetNpcInfo(missionIndex)
		local monsterId = GetMonsterIdByName(sceneId, targetname)
		local targetx, targetz = GetWorldPos(sceneId, monsterId)
		local respawnx, rewpawnz = GetMonsterRespawnPos(sceneId, monsterId)
		local distSqr = (targetx-respawnx)*(targetx-respawnx) + (targetz-rewpawnz)*(targetz-rewpawnz)
		if distSqr > 2.0 then
			BeginEvent(sceneId)
				AddText(sceneId, missionName)
				AddText(sceneId, "目标已经被其他人护送走了！")
			EndEvent( )
			DispatchEventList(sceneId, selfId, targetId)			
		else	
			BeginEvent(sceneId)
				AddText(sceneId, missionName)
				AddText(sceneId, missionInfo)
				x006671_DisplayBonus(sceneId, missionIndex)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,missionIndex,missionId)
		end
	end	
end

--**********************************
--列举事件
--**********************************
function x006671_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	--如果玩家完成过这个任务
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
	-- 判定玩家的条件是不是够接受这个任务，如果够就显示，不够就不显示
	local nLevel,nMis1,nMis2,nMis3 = TGetCheckInfo(missionIndex)
	
	
	if nLevel > GetLevel(sceneId, selfId)  then
		return
	end
	
	if nMis1 > 0   then
		-- 如果前续任务1没有完成，就返回
		if IsMissionHaveDone(sceneId, selfId, nMis1) <= 0   then
			return
		end
	end
	
	if nMis2 > 0   then
		-- 如果前续任务2没有完成，就返回
		if IsMissionHaveDone(sceneId, selfId, nMis2) <= 0   then
			return
		end
	end
	
	if nMis3 > 0   then
		-- 如果前续任务3没有完成，就返回
		if IsMissionHaveDone(sceneId, selfId, nMis3) <= 0   then
			return
		end
	end

	-- 如果本任务已经完成，就返回
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0 then
   	return
	--满足任务接收条件
	elseif IsHaveMission(sceneId, selfId, missionId) > 0 then
		local completeNpcScene, completeNpcName = TGetCompleteNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == completeNpcName then
			--TBeginEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,1,-1);
			--TEndEvent()	
			TDispatchEventList(sceneId, selfId, targetId)
		end
	--满足任务接收条件
  elseif x006671_CheckAccept(sceneId, selfId, missionIndex) > 0 then
  	local acceptNpcScene, acceptNpcName = TGetAcceptNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == acceptNpcName then
			--TBeginEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,1,-1);
			--TEndEvent()
			TDispatchEventList(sceneId, selfId, targetId)	
		end
  end
  
end

--**********************************
-- 
--**********************************
function x006671_OnLockedTarget( sceneId, selfId, targetId, missionIndex )
 	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)--得到任务在20个任务中的序列号
	local missionName = TGetMissionName(missionIndex)
	
	local nscene1, name1 = TGetCompleteNpcInfo(missionIndex)
	local nscene2, name2 = TGetTargetNpcInfo(missionIndex)
	local targetName = GetName(sceneId, targetId)
	if targetName == name1 then
		--如果选中的对象是交任务的npc
		TAddNumText(sceneId, missionIndex, missionName,1,-1);
	elseif targetName == name2 then
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 then --如果任务已经完成则直接返回
			return
		end
		if GetPatrolId(sceneId, targetId) ~= -1 then
			return
		end

		--如果选中的对象是要护送的npc
		TAddNumText(sceneId, missionIndex, missionName,1,3);
	end
end

--**********************************
--检测接受条件
--**********************************
function x006671_CheckAccept( sceneId, selfId, missionIndex )
	local nLevel = LuaFnGetLevel(sceneId, selfId)
	local limitLevel, PreMisId1, PreMisId2, PreMisId3 = TGetCheckInfo(missionIndex)

	if nLevel < limitLevel then
		--TBeginEvent(sceneId)
			TAddText(sceneId, "你的江湖阅历太低，恐怕不能胜任，待".. tostring(limitLevel) .."级之后再来找我吧")
		--TEndEvent()
		TDispatchEventList(sceneId, selfId)
		return 0
	else
		local a = {}
		local index = 1
		if PreMisId1 > 0 then
			a[index] = PreMisId1
			index = index + 1
		end
		if PreMisId2 > 0 then
			a[index] = PreMisId2
			index = index + 1
		end
		if PreMisId3 > 0 then
			a[index] = PreMisId3
			index = index + 1
		end
		
		for i, v in a do
			if IsMissionHaveDone(sceneId, selfId, v) <= 0 then
				return 0
			end	
		end
		return 1
		
	end

end

--**********************************
--接受
--**********************************
function x006671_OnAccept( sceneId, selfId, targetId, missionIndex )

	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, missionId, missionIndex, 0, 0, 0 )
	
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	--设置任务变量宝物的场景编号和坐标位置
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)--得到任务在20个任务中的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0) --根据序列号把任务变量的第一位置0	第一位是完成/失败情况
	SetMissionByIndex(sceneId,selfId,misIndex,1,0) --始终以当前场景为准

	local nscene1, name1 = TGetAcceptNpcInfo(missionIndex)
	local nscene2, name2 = TGetCompleteNpcInfo(missionIndex)
	local nscene3, name3 = TGetTargetNpcInfo(missionIndex)
	-- 如果交任务的人不是接任务的人或要护送的人
	if name1 ~= name2  or name1 ~= name3 then
		SetMissionEvent(sceneId, selfId, missionId, 4)
	end	

	if name1 == name3 then
		local x, z = GetWorldPos(sceneId,targetId)--记录npc的坐标
		SetMissionByIndex(sceneId,selfId,misIndex,7,sceneId) --始终以当前场景为准
		SetMissionByIndex(sceneId,selfId,misIndex,2,targetId)
		SetMissionByIndex(sceneId,selfId,misIndex,3,x)
		SetMissionByIndex(sceneId,selfId,misIndex,4,z)
		
    --*********************************************************************	
    -- npc有效性检查	
		local targetNpcScene, targetNpcName = TGetTargetNpcInfo(missionIndex)
		local targetName = GetName(sceneId, targetId)
		if targetNpcScene~= sceneId 
		 or targetNpcName ~= targetName then
		 -- 该npc不是要操作的npc
		 return 0
		end
		-- 获取设置前的数据信息
		local oldAIType = GetNPCAIType(sceneId, targetId)
		local oldUnitReputationId = GetUnitReputationID(sceneId, selfId, targetId)
		-- 设置npc巡逻开始的数据
		local patrolPathIndex = TGetHusongPatrolPath(missionIndex)		-- 得到护送巡逻路线
		SetUnitReputationID(sceneId, selfId, targetId, 0) --0为新手阵营,和玩家友好
		SetMonsterFightWithNpcFlag(sceneId, targetId, 1) --打开允许怪物和怪物打架的标记
		SetNPCAIType(sceneId, targetId, TGetHusongAIType(missionIndex))
		SetPatrolId(sceneId, targetId, patrolPathIndex)
	  --设置npc巡逻结束的数据
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetPatrolID", -1) 
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetBaseAIType", 0, -1, oldAIType) 
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetReputationID_CodingRefix", oldUnitReputationId) 
    AddNpcPatrolEndPointOperator(sceneId,targetId,"AIS_SetMonsterFightWithNpcFlag", 0)
		--*********************************************************************
	
		--启动该任务的任务时钟器
		StartMissionTimer(sceneId, selfId, missionId)
		SetMissionEvent(sceneId, selfId, missionId, 5)
		SetMissionEvent(sceneId, selfId, missionId, 6)
	end
	
	Msg2Player(  sceneId, selfId,"#Y接受任务" .. tostring(missionName), MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y接受任务 " .. tostring(missionName)
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--放弃
--**********************************
function x006671_OnAbandon( sceneId, selfId, missionIndex )
  --将护送npc瞬移回原来位置
 	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)--得到任务在20个任务中的序列号
	
	local targetScene = GetMissionParam(sceneId, selfId, misIndex, 7)
	local targetId = GetMissionParam(sceneId, selfId, misIndex, 2)
	local x = GetMissionParam(sceneId, selfId, misIndex, 3)
	local z = GetMissionParam(sceneId, selfId, misIndex, 4)
	
  --停止该任务的任务时钟器
  StopMissionTimer(sceneId, selfId, missionId)
  --ResetMissionEvent(sceneId, selfId, missionId, 4)
  --ResetMissionEvent(sceneId, selfId, missionId, 5)
  --ResetMissionEvent(sceneId, selfId, missionId, 6)

  DelMission(sceneId, selfId, missionId)
  
end

--**********************************
--继续
--**********************************
function x006671_OnContinue( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
	local missionTarget
	local missionInfo
	local missionContinue
	local missionComplete 
	missionTarget, missionInfo, missionContinue, missionComplete = TGetMissionDesc(missionIndex)
	
	BeginEvent(sceneId)
	
		AddText(sceneId,missionName)
		AddText(sceneId,missionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,missionTarget)

		x006671_DisplayBonus(sceneId, missionIndex)  
		
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, missionIndex, missionId)

end

--**********************************
--检测是否可以提交
--**********************************
function x006671_CheckSubmit( sceneId, selfId, missionIndex )
	--有这个任务并且完成标志已经被置位
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
	
end

--**********************************
--提交
--**********************************
function x006671_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	-- 检测是不是满足完成任务的条件
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
	if x006671_CheckSubmit(sceneId, selfId, missionIndex) <= 0   then
		return
	end

	if IsHaveMission(sceneId,selfId,missionId) > 0 then
		local nAddItemNum = 0;
		BeginAddItem(sceneId)
			local itemCt
			local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},} 
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 and a[i].id == selectRadioId then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
					break
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetHideItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
		local ret = EndAddItem(sceneId,selfId)
		
		if ret > 0 then
		
			if nAddItemNum > 0  then
				AddItemListToHuman(sceneId,selfId)
			end
			
			--添加任务奖励
			local awardMoney = TGetAwardMoney(missionIndex)
			AddMoney(sceneId,selfId,awardMoney )
			local awardExp = TGetAwardExp(missionIndex)
			LuaFnAddExp( sceneId, selfId, awardExp)
			
			DelMission( sceneId,selfId, missionId )
			--设置任务已经被完成过
			MissionCom( sceneId,selfId, missionId )
			
			local strText = "#Y" .. missionName .. "任务已完成。"
			BeginEvent( sceneId )
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

			-- 获得后续任务的Index
			local NextMissIndex = GetNextMissionIndex( missionIndex )

			for i, MissType in x006671_g_MissionTypeList do
				if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
					if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
						local missionId = TGetMissionIdByIndex( NextMissIndex )
						local szNpcName = GetName( sceneId, targetId )
						local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

						if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
							if MissType.ScriptId == 006671 then
								if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
									x006671_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
								end
							else
								if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
									CallScriptFunction( MissType.ScriptId, "OnDefaultEvent", sceneId, selfId, targetId, NextMissIndex )
								end
							end
						end
						
						break;
					end
				end
			end

		else
			--任务奖励没有加成功
			BeginEvent(sceneId)
				AddText(sceneId, "背包已满,无法完成任务");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		end
	end	
end

function x006671_OnHumanDie(sceneId, selfId, missionIndex)
	--主角死亡时同样任务失败
	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)--得到任务在20个任务中的序列号
	local targetScene = GetMissionParam(sceneId, selfId, misIndex, 7)
	local targetId = GetMissionParam(sceneId, selfId, misIndex, 2)
	local x = GetMissionParam(sceneId, selfId, misIndex, 3)
	local z = GetMissionParam(sceneId, selfId, misIndex, 4)

  --停止该任务的任务时钟器
  StopMissionTimer(sceneId, selfId, missionId)
  SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)
  ResetMissionEvent(sceneId, selfId, missionId, 4)
  ResetMissionEvent(sceneId, selfId, missionId, 5)
  ResetMissionEvent(sceneId, selfId, missionId, 6)
  
	local targetscene, targetname = TGetTargetNpcInfo(missionIndex)
  BeginEvent(sceneId)
  	AddText(sceneId, "护送" .. targetname .. "失败")
  EndEvent()
  DispatchMissionTips(sceneId, selfId)

end

--**********************************
--定时事件
--**********************************
function x006671_OnTimer(sceneId,selfId,missionIndex)
	local playerX, playerZ = GetWorldPos(sceneId, selfId)
	local missionId = TGetMissionIdByIndex(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, missionId)--得到任务在20个任务中的序列号
	local targetScene = GetMissionParam(sceneId, selfId, misIndex, 7)
	local targetId = GetMissionParam(sceneId, selfId, misIndex, 2)
	local targetX, targetZ = GetWorldPos(sceneId, targetId)
	
	local distance = floor(sqrt((playerX-targetX)*(playerX-targetX)+(playerZ-targetZ)*(playerZ-targetZ)))
	local isTargetObjLive = LuaFnIsCharacterLiving(sceneId, targetId)

	local patrolPathIndex = TGetHusongPatrolPath(missionIndex)
	local x, z = GetLastPatrolPoint(sceneId, patrolPathIndex)
	
	-- 从护送任务表中获取正确的护送对象姓名
	local targetscene, targetname = TGetTargetNpcInfo(missionIndex)

	if sceneId ~= targetscene  then
	  --停止该任务的任务时钟器
	  StopMissionTimer(sceneId, selfId, missionId)
	  ResetMissionEvent(sceneId, selfId, missionId, 4)
	  ResetMissionEvent(sceneId, selfId, missionId, 5)
	  ResetMissionEvent(sceneId, selfId, missionId, 6)
	  SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)
 		
	  BeginEvent(sceneId)
	  	AddText(sceneId, "护送" .. targetname .. "失败")
	  EndEvent()
	  DispatchMissionTips(sceneId, selfId)
		return
	end

	
		
	local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
	if distance2 <= 2 then
		--停止该任务的任务时钟器
	  StopMissionTimer(sceneId, selfId, missionId)
	  --ResetMissionEvent(sceneId, selfId, missionId, 4)
	  ResetMissionEvent(sceneId, selfId, missionId, 5)
	  ResetMissionEvent(sceneId, selfId, missionId, 6)
	  SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
	  SetMissionByIndex(sceneId, selfId, misIndex, 1, 1)
 		
	  BeginEvent(sceneId)
	  	AddText(sceneId, "护送" .. targetname .. "成功")
	  EndEvent()
	  DispatchMissionTips(sceneId, selfId)
		return
	end

	local bfailed = 0
	if isTargetObjLive <= 0  then --如果护送的npc死亡了则任务失败
		bfailed = 1
	elseif sceneId ~= targetScene or distance > 20 then
		--任务失败，将其瞬移回原来的位置
		bfailed = 1
	end
	
	if bfailed == 1 then
	  --停止该任务的任务时钟器
	  StopMissionTimer(sceneId, selfId, missionId)
	  ResetMissionEvent(sceneId, selfId, missionId, 4)
	  ResetMissionEvent(sceneId, selfId, missionId, 5)
	  ResetMissionEvent(sceneId, selfId, missionId, 6)
	  SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)

 	  BeginEvent(sceneId)
	  	AddText(sceneId, "护送" .. targetname .. "失败")
	  EndEvent()
	  DispatchMissionTips(sceneId, selfId)
	  
	end 

end
