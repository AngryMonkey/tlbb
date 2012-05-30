--200034
--在雁南 耶律莫哥的帮组下，进入白天的苍茫山

--************************************************************************
--MisDescBegin
--脚本号
x200034_g_ScriptId = 200034

--MisDescEnd
--************************************************************************

--副本名称
x200034_g_CopySceneName = "苍茫山"

x200034_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200034_g_CopySceneMap = "cangmang.nav"
x200034_g_Exit = "cangmang.ini"
x200034_g_LimitMembers = 1				--可以进副本的最小队伍人数
x200034_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x200034_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200034_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200034_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x200034_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x200034_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200034_g_Fuben_X = 102					--进入副本的位置X
x200034_g_Fuben_Z = 19					--进入副本的位置Z
x200034_g_Back_X = 66					--源场景位置X
x200034_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200034_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200034_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x200034_OnEnumerate( sceneId, selfId, targetId )
	
	--完家能够进入夜间的副本的前提条件
--	-- 0,如果玩家已经有32任务，就不能在进入这个副本
	if IsMissionHaveDone(sceneId, selfId, 32) > 0   then
		return 0
	end

	-- 1，拥有任务号为29的任务，
	if IsHaveMission( sceneId, selfId, 29 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "送我去苍茫山（白天）", 10 ,-1  )
		return 0
	end

	-- 2,只要玩家有30任务，就能进入
	if IsHaveMission( sceneId, selfId, 30 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "送我去苍茫山（白天）", 10 ,-1  )
		return 0
	end
	-- 3,只要玩家有31任务，就能进入
	if IsHaveMission( sceneId, selfId, 31 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "送我去苍茫山（白天）", 10 ,-1  )
		return 0
	end
	
	-- 3,如果玩家完成了29，没有30，也能进入
	if IsMissionHaveDone(sceneId, selfId, 29) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 30) < 1   then
			if IsHaveMission( sceneId, selfId, 30 ) < 1 then
				AddNumText( sceneId, x200034_g_ScriptId, "送我去苍茫山(白天)", 10 ,-1  )
				return 0
			end
		end
	end

	-- 3,如果玩家完成了29，没有30，也能进入
	if IsMissionHaveDone(sceneId, selfId, 29) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 31) < 1   then
			if IsHaveMission( sceneId, selfId, 31 ) < 1 then
				AddNumText( sceneId, x200034_g_ScriptId, "送我去苍茫山(白天)", 10 ,-1  )
				return 0
			end
		end
	end
	
	-- 3,如果玩家完成了29，没有30，也能进入
	if IsMissionHaveDone(sceneId, selfId, 29) > 0   then
		if IsMissionHaveDone(sceneId, selfId, 32) < 1   then
			if IsHaveMission( sceneId, selfId, 32 ) < 1 then
				AddNumText( sceneId, x200034_g_ScriptId, "送我去苍茫山(白天)", 10 ,-1  )
				return 0
			end
		end
	end
	
	-- 有32，可以进入
	if IsHaveMission( sceneId, selfId, 32 ) > 0 then
		AddNumText( sceneId, x200034_g_ScriptId, "送我去苍茫山(白天)", 10 ,-1  )
		return 0
	end
	
end

--**********************************
--检测接受条件
--**********************************
function x200034_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200034_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200034_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200034_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200034_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "cangmang.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200034_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200034_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200034_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200034_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Boss的数量
	
	-- 剧情用到的变量清空
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	--设置场景中的各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "cangmang_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangmang_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--副本事件
--**********************************
function x200034_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个文件没有组队，就传送这个文件自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个晚间是队长，就传送自己和附近队友一起进去
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end
	
	-- 检测玩家是不是有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		NewWorld( sceneId, leaderObjId, destsceneId, x200034_g_Fuben_X, x200034_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200034_g_Fuben_X, x200034_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x200034_g_Fuben_X, x200034_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200034_OnPlayerEnter( sceneId, selfId )
	-- 玩家进入场景后，需要更新场景中的所有数据
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200034_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200034_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200034_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200034_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200034_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200034_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200034_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x200034_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200034_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200034_OnCopySceneTimer( sceneId, nowTime )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1    then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId, 0)
	
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--控制说话
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9);--时间
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) ;--控制说过话

	-- paopao 
	local nStep3 = LuaFnGetCopySceneData_Param(sceneId, 11) ;--控制说过话
	
	-- 对白
	local nStep4 = LuaFnGetCopySceneData_Param(sceneId, 12) ;--控制说过话
	local nStep5 = LuaFnGetCopySceneData_Param(sceneId, 13) ;--控制说过话
	local nStep6 = LuaFnGetCopySceneData_Param(sceneId, 14) ;--控制说过话
	local nStep7 = LuaFnGetCopySceneData_Param(sceneId, 15) ;--控制说过话

	--
	local nStep8 = LuaFnGetCopySceneData_Param(sceneId, 20) ;--控制说过话
	
	-- 第一段剧情，创建楚王，按照路线行走
	if nStep1 == 1  then
		
		-- 在75，115 创建 楚王 406 配给巡逻路线
		-- 先看场景中是不是已经有楚王了
		local nMonsterNum = GetMonsterCount(sceneId)
		local nMonster = {}
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
				bHaveMonster = 1
			end
		end
		
		if bHaveMonster ~= 1  then
			local nNpcId = LuaFnCreateMonster(sceneId, 406, 75, 115, 1, 0, -1)
			SetCharacterName(sceneId, nNpcId, "耶律涅鲁古")
			SetCharacterTitle(sceneId, nNpcId, "楚王")
			SetPatrolId(sceneId, nNpcId, 0)
			
			SetUnitReputationID(sceneId, selfId, nNpcId, 18)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		end
		
		CallScriptFunction((200060), "Duibai",sceneId, "耶律涅鲁古", "苍茫山", "#{JQ_DB_0015}" )
		CallScriptFunction((200060), "Duibai",sceneId, "耶律涅鲁古", "苍茫山", "#{JQ_DB_0016}" )
		
		LuaFnSetCopySceneData_Param(sceneId, 8, 2)
	end
	
	if nStep1 == 3  then
		-- 检测场景中是不是有楚王，如果没有，需要放一个出来完成剧情
		local nMonsterNum = GetMonsterCount(sceneId)
		local nMonster = {}
		local ii = 0
		local bHaveMonster1 = 0
		local bHaveMonster2 = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
				bHaveMonster1 = 1
			end
			if GetName(sceneId, nMonsterId)  == "耶律重元"  then
				bHaveMonster2 = 1
			end
		end
		
		if bHaveMonster1 ~= 1  then
			local nNpcId = LuaFnCreateMonster(sceneId, 406, 77, 44, 1, 0, -1)
			SetCharacterName(sceneId, nNpcId, "耶律涅鲁古")
			SetCharacterTitle(sceneId, nNpcId, "楚王")
			SetUnitReputationID(sceneId, selfId, nNpcId, 18)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		end

		if bHaveMonster2 ~= 1  then
			local nNpcId1 = LuaFnCreateMonster(sceneId, 422, 45, 105, 1, 0, -1)
			SetCharacterName(sceneId, nNpcId1, "耶律重元")
			SetCharacterTitle(sceneId, nNpcId1, "皇太叔")
		end
		
		LuaFnSetCopySceneData_Param(sceneId, 8, 4)
	end
	
	-- 玩家进入第一个区域，需要让楚王跑，萧峰追
	if nStep1 == 5  then
		local nMonsterNum = GetMonsterCount(sceneId)
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
				SetUnitReputationID(sceneId, selfId, nMonsterId, 18)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)

				-- 楚王在改变阵营可以攻击后，按照2号路线往回跑，
				SetPatrolId(sceneId, nMonsterId, 2)
			end
			
			if GetName(sceneId, nMonsterId)  == "萧峰"  then
				-- 同时萧峰按照3号路线跑，
				SetPatrolId(sceneId, nMonsterId, 1)
				-- 给乔峰设置阵营为0
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
				SetNPCAIType(sceneId, nMonsterId, 0)
			end
		end
		
		LuaFnSetCopySceneData_Param(sceneId, 8, 6)
	end
	
	if nStep1 == 6  then
		if nStep8 == 0  then
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{juqing_start_010}" )
			LuaFnSetCopySceneData_Param(sceneId, 20, 1)
			
		elseif nStep8 == 1  then
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{juqing_start_011}" )
			LuaFnSetCopySceneData_Param(sceneId, 20, 2)
			
		elseif nStep8 == 2  then
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{juqing_start_012}" )
			LuaFnSetCopySceneData_Param(sceneId, 20, 3)
			
		end
		
		-- 检测楚王是不是被杀死，如果杀死，给所有的人检测变量
		local nMonsterNum = GetMonsterCount(sceneId)
		local bHaveChuwang = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
				bHaveChuwang = 1
				break
			end
		end
		
		if bHaveChuwang == 0    then
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			  
			  -- 给有这个任务的人加上完成标志
			  if IsHaveMission(sceneId, nHumanId, 31) > 0 then
			  	
					local misIndex = GetMissionIndexByID(sceneId,nHumanId,31)
			  	if GetMissionParam(sceneId,nHumanId, misIndex, 1) < 1  then
			  
						SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
					  BeginEvent(sceneId)
					  	AddText(sceneId, "已杀死楚王：1/1")
					  EndEvent()
					  DispatchMissionTips(sceneId, nHumanId)
						--SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
					end
			  end
			end
			LuaFnSetCopySceneData_Param(sceneId, 8, 7)
		end
	end		
	
	if nStep1 == 7  then
		-- 检测是不是有人进入了事件区域
		local left=39
		local right=52
		local top=101
		local bottom=111
		for i=0, 	nHumanNum-1  do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			local nHumanX, nHumanZ = GetWorldPos(sceneId, nHumanId)
			if nHumanX >= left and nHumanX <= right  and  nHumanZ >= top and nHumanZ <= bottom    then
				LuaFnSetCopySceneData_Param(sceneId, 8, 8)
				
				break
			end
		end
		
	end

	-- 玩家进入第二个区域，萧峰出现，
	if nStep1 == 8  then
		local nMonsterNum = GetMonsterCount(sceneId)
		local bHave = 0
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			
			if GetName(sceneId, nMonsterId)  == "萧峰"  then
				-- 删除萧峰
				LuaFnDeleteMonster(sceneId, nMonsterId)
				--在新的位置创建模型
				local nNpcId = LuaFnCreateMonster(sceneId, 423, 50,106, 0, 0, 120007)
				SetUnitReputationID(sceneId, selfId, nNpcId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
				SetCharacterName(sceneId, nNpcId, "萧峰")
				SetNPCAIType(sceneId, nNpcId, 7)
			end
			
			if GetName(sceneId, nMonsterId)  == "耶律重元"  then
				-- 耶律重元
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
			
			if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
				-- 耶律重元
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
			
			-- 所有的士兵现在变成不可战斗
			if GetName(sceneId, nMonsterId)  == "西山口守卫"  then
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
			end
			if GetName(sceneId, nMonsterId)  == "楚王精英卫士"  then
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
			end
			if GetName(sceneId, nMonsterId)  == "东山口守卫"  then
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
			end
			if GetName(sceneId, nMonsterId)  == "皇太叔御帐守卫"  then
				SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
				SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
			end
			
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			  
			  -- 给有这个任务的人加上完成标志
			  if IsHaveMission(sceneId, nHumanId, 31) > 0 then
					local misIndex = GetMissionIndexByID(sceneId,nHumanId,31)
					if GetMissionParam(sceneId,nHumanId, misIndex, 2) < 1  then
						BeginEvent(sceneId)
				  		AddText(sceneId, "已进入皇太叔御帐：1/1")
				 		EndEvent()
				 	  DispatchMissionTips(sceneId, nHumanId)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 2, 1)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
					end
			  end
			  
			end
			--SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			
			-- 剧情喊话
			--LuaFnSetCopySceneData_Param(sceneId, 8, 4)
			--LuaFnSetCopySceneData_Param(sceneId, 13, 0)
			--LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
		end

		LuaFnSetCopySceneData_Param(sceneId, 8, 9)
	end
	
	-- 六军辟易 护送的启动
	if nStep1 == 10  then
		local nMonsterNum = GetMonsterCount(sceneId)
		if nStep2 == 1  then
			--PrintNum(10)
			-- 通知别的玩家接这个任务
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				-- 调用接任务的语句
				
				-- 获得乔峰的Id
				local targetId=0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "萧峰"  then
						targetId = nMonsterId
					end
				end
				
				CallScriptFunction((200038), "OnDefaultEvent",sceneId, nHumanId, targetId )
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{juqing_start_013}" )
		
		elseif nStep2 == 2  then
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{juqing_start_014}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			
		elseif nStep2 == 3  then
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{juqing_start_015}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			
		elseif nStep2 == 4  then
			-- 开始让“萧峰”走
			local nMonsterNum = GetMonsterCount(sceneId)
			local nqiaofengId = -1
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "萧峰"  then
					nqiaofengId = nMonsterId
				end
			end
			
			if nqiaofengId ~= -1  then
				SetPatrolId(sceneId, nqiaofengId, 3)
			end
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			
		elseif nStep2 == 5  then
			-- 检测乔峰是不是到达
			--LuaFnSetCopySceneData_Param(sceneId, 10, 6)
			local nMonsterNum = GetMonsterCount(sceneId)
			local nqiaofengId = -1
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "萧峰"  then
					nqiaofengId = nMonsterId
				end
			end
			
			if nqiaofengId ~= -1  then
				local targetX, targetZ = GetWorldPos(sceneId, nqiaofengId)
				local x, z = GetLastPatrolPoint(sceneId, 3)
				local distance3 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
				if distance3 <= 1 then
					-- 通知每个人，护送完成
					LuaFnSetCopySceneData_Param(sceneId, 10, 6)
					-- 更换模型
					LuaFnDeleteMonster(sceneId, nqiaofengId)
					-- 创建一个新的萧峰的模型
					local nNpcId = LuaFnCreateMonster(sceneId, 424, 75,26, 0, 0, 120008)
					SetUnitReputationID(sceneId, selfId, nNpcId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
					SetCharacterName(sceneId, nNpcId, "萧峰")
					SetNPCAIType(sceneId, nNpcId, 7)
					
					for i=0, 	nHumanNum-1  do
						local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
					  					  
					  -- 给有这个任务的人加上完成标志
					  if IsHaveMission(sceneId, nHumanId, 32) > 0 then
							local misIndex = GetMissionIndexByID(sceneId,nHumanId,32)
							if GetMissionParam(sceneId,nHumanId, misIndex, 1) < 1  then
								BeginEvent(sceneId)
						  		AddText(sceneId, "完成剧情“六军辟易”")
						  	EndEvent()
						  	DispatchMissionTips(sceneId, nHumanId)
								SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
								SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
							end
					  end
					end
				
				end
			end
		end
		
	end
	
	
	if  1==1 then
		return
	end

	-- 玩家进入指定区域后，触发的剧情
	if nStep1 == 5  then
		if nStep2==1  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0017}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{JQ_DB_0017}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==2  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			end
		
		elseif nStep2==3  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0018}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{JQ_DB_0017}" )
			CallScriptFunction((200060), "Duibai",sceneId, "耶律重元", "苍茫山", "#{JQ_DB_0018}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		end
	end
	
	-- 第二次对白 六军辟易 护送到终点的时候触发
	if nStep1==2 then
		if nStep3==0 then
			CallScriptFunction((200060), "Paopao",sceneId, "耶律重元", "苍茫山", "#{JQ_PaoPao_86}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep3==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 2)
			end
			
		elseif nStep3==2 then
			CallScriptFunction((200060), "Paopao",sceneId, "耶律洪基", "苍茫山", "#{JQ_PaoPao_87}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep3==3 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 4)
			end
			
		elseif nStep3==4 then
			CallScriptFunction((200060), "Paopao",sceneId, "萧峰", "苍茫山", "#{JQ_PaoPao_88}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep3==5 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 6)
			end
		
		elseif nStep3==6 then
			CallScriptFunction((200060), "Paopao",sceneId, "耶律洪基", "苍茫山", "#{JQ_PaoPao_89}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep3==7 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 8)
			end
			
		elseif nStep3==8 then
			CallScriptFunction((200060), "Paopao",sceneId, "耶律洪基", "苍茫山", "#{JQ_PaoPao_90}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		end
	end
	
	-- 对白 四面楚歌 完成任务的时候触发
	if nStep1==3 then
		if nStep4==0  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0015}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "耶律涅鲁古", "苍茫山", "#{JQ_DB_0015}" )
			LuaFnSetCopySceneData_Param(sceneId, 12, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep4==1  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 12, 2)
			end
		
		elseif nStep4==2  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0016}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "耶律涅鲁古", "苍茫山", "#{JQ_DB_0016}" )
			LuaFnSetCopySceneData_Param(sceneId, 12, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		end
	end

	-- 对白 金戈荡寇鏖兵  玩家进入皇太叔区域后触发
	if nStep1==4 then
		if nStep5==0  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0017}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{JQ_DB_0017}" )
			LuaFnSetCopySceneData_Param(sceneId, 13, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep5==1  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 13, 2)
			end
		
		elseif nStep5==2  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0018}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "萧峰", "苍茫山", "#{JQ_DB_0017}" )
			CallScriptFunction((200060), "Duibai",sceneId, "耶律重元", "苍茫山", "#{JQ_DB_0018}" )
			LuaFnSetCopySceneData_Param(sceneId, 13, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		end
	end
	
	-- 对白 六军辟易 接受任务的时候触发
	if nStep1==5 then
		if nStep6==0 or nStep6==6 or nStep6==12  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0019}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "中军", "苍茫山", "#{JQ_DB_0019}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep6==1 or nStep6==7 or nStep6==13  then
			if nowTime - nTime > 5  then
				LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			end

		elseif nStep6==2 or nStep6==8 or nStep6==14  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0020}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "中军", "苍茫山", "#{JQ_DB_0020}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		elseif nStep6==3 or nStep6==9 or nStep6==15  then
			if nowTime - nTime > 5  then
				LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			end

		elseif nStep6==4 or nStep6==10 or nStep6==16  then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0021}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "中军", "苍茫山", "#{JQ_DB_0021}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep6==5 or nStep6==11 or nStep6==17  then
			if nowTime - nTime > 5  then
				LuaFnSetCopySceneData_Param(sceneId, 14, nStep6+1)
			end

		end		
	end
	
	-- 对白 六军辟易 完成任务的时候触发
	if nStep1==6 then
		if nStep7==0 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0022}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "众辽兵", "苍茫山", "#{JQ_DB_0022}" )
			LuaFnSetCopySceneData_Param(sceneId, 14, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		elseif nStep7==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 14, 0)
			end
		end
	end
	

end

