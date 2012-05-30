-- 进入夜间的聚贤庄

--200023
-- 在丐帮长老的帮组下，进入聚贤庄副本

--************************************************************************
--MisDescBegin
--脚本号
x200023_g_ScriptId = 200023

--MisDescEnd
--************************************************************************

--副本名称
x200023_g_CopySceneName = "聚贤庄"

x200023_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200023_g_CopySceneMap = "juxian.nav"
x200023_g_Exit = "juxian.ini"
x200023_g_LimitMembers = 1				--可以进副本的最小队伍人数
x200023_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x200023_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200023_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200023_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x200023_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x200023_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200023_g_Fuben_X = 61					--进入副本的位置X
x200023_g_Fuben_Z = 110					--进入副本的位置Z
x200023_g_Back_X = 66					--源场景位置X
x200023_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200023_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200023_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x200023_OnEnumerate( sceneId, selfId, targetId )
	-- 如果玩家已经完成了20任务，就可以进入
	if IsMissionHaveDone(sceneId, selfId, 23) > 0   then
		return 0
	end

	-- 1，已经完成22
	if IsMissionHaveDone( sceneId, selfId, 22 ) > 0 then
		AddNumText( sceneId, x200023_g_ScriptId, "送我去聚贤庄（白天）", 10 ,-1  )
		return 0
	end
	
	-- 2，拥有任务号为23的任务，
	if IsHaveMission( sceneId, selfId, 23 ) > 0 then
		AddNumText( sceneId, x200023_g_ScriptId, "送我去聚贤庄（白天）", 10 ,-1  )
		return 0
	end
end


--**********************************
--检测接受条件
--**********************************
function x200023_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200023_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200023_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200023_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200023_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "juxian.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200023_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200023_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200023_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200023_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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
	LuaFnSetSceneLoad_Area( sceneId, "juxian_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "juxian_monster.ini" )

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
function x200023_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200023_g_Fuben_X, x200023_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200023_g_Fuben_X, x200023_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--local misIndex = GetMissionIndexByID(sceneId,mems[i],x200023_g_MissionId)
				
				--将任务的第2号数据设置为副本的场景号
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200023_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200023_g_Fuben_X, x200023_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200023_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200023_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200023_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200023_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200023_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200023_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200023_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200023_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x200023_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200023_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200023_OnCopySceneTimer( sceneId, nowTime )


	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 10) --
	local nStartTime  = LuaFnGetCopySceneData_Param(sceneId, 11)	--时间
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 12)	--时间
	local nNowTime = LuaFnGetCurrentTime()
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 13) --
	local nStep5 = LuaFnGetCopySceneData_Param(sceneId, 20)
	
	if nStep1 == 1  then
	
		if nStep2 == 1 then
			-- 设置开战
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				if GetName(sceneId, nMonsterId)  == "乔峰"  then
					SetUnitReputationID(sceneId, selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 5)
					
					--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0011}",0)
					CallScriptFunction((200060), "Duibai",sceneId, "乔峰", "聚贤庄", "#{JQ_DB_0011}" )
				end
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 13, 2)
			LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
		
		elseif nStep2 == 2 then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 3)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			end

		elseif nStep2 == 3 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0012}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "乔峰", "聚贤庄", "#{JQ_DB_0012}" )
			LuaFnSetCopySceneData_Param(sceneId, 13, 4)
			
			LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime-55)
			
		else
			-- 给玩家提示还有多少波怪
			
			if nStep2 < 16 and nStep2 > 4 then
					
				if nNowTime - nPreTime >= 30 and nStep5 == 0  then
					local str = "聚贤庄的侠士们还会发动" .. 16 - nStep2   .. "次进攻"
					x200023_TipToAllPlayerOnScene(sceneId, str)

					LuaFnSetCopySceneData_Param(sceneId, 20, 1)
				end
				if nNowTime - nPreTime >= 40 and nStep5 == 1  then
					local str = "聚贤庄的侠士们还会发动" .. 16 - nStep2   .. "次进攻"
					x200023_TipToAllPlayerOnScene(sceneId, str)
					
					LuaFnSetCopySceneData_Param(sceneId, 20, 2)
				end
				if nNowTime - nPreTime >= 50 and nStep5 == 2  then
					local str = "聚贤庄的侠士们还会发动" .. 16 - nStep2   .. "次进攻"
					x200023_TipToAllPlayerOnScene(sceneId, str)
					
					LuaFnSetCopySceneData_Param(sceneId, 20, 0)
				end
			end
			
			if nNowTime - nPreTime >= 60 and nStep2 < 16   then
				local nNpcId
				if nStep2 == 8 then
					nNpcId = LuaFnCreateMonster(sceneId, 416, 57, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "单伯山")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 58, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "单仲山")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 59, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "单叔山")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 60, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "单季山")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
		
					nNpcId = LuaFnCreateMonster(sceneId, 416, 61, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "单小山")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
				
				elseif nStep2 == 11 then
					nNpcId = LuaFnCreateMonster(sceneId, 429, 58, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "游驹")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
					
					nNpcId = LuaFnCreateMonster(sceneId, 429, 60, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "游骥")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
				
				elseif nStep2 == 15 then
					nNpcId = LuaFnCreateMonster(sceneId, 427, 58, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "玄难")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
					
					nNpcId = LuaFnCreateMonster(sceneId, 427, 60, 33, 1, 0, -1)
					SetCharacterName(sceneId, nNpcId, "玄寂")
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 16)
					
				else
					for j=0, 9  do
						--415,417,418,425,426,428,431,432,433
						local nNpcModelList={415,417,418,425,426,428,431,432,433}
						local nNpcMode = random( getn(nNpcModelList) )
						local nNpc1 = LuaFnCreateMonster(sceneId, nNpcModelList[nNpcMode], 55+j, 31, 1, 0, -1)
						SetCharacterName(sceneId, nNpc1, "江湖侠士")
						SetUnitReputationID(sceneId,selfId, nNpc1, 29)
						SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
						SetNPCAIType(sceneId, nNpc1, 16)
					end
				end
				
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				
			end
			if nStep2 == 16 then
				--看两个和尚死了没有
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)=="玄难" or GetName(sceneId, nMonsterId)=="玄寂"  then
						bOk = 0	
					end
				end
				
				if bOk == 1  then
					-- 删除所有的小怪
					local nMonsterNum = GetMonsterCount(sceneId)
					local ii = 0
					local bHaveMonster = 0
					local bOk =1
					for ii=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,ii)
						if GetName(sceneId, nMonsterId)== "游驹" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "游骥" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "单伯山" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "单仲山" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "单叔山" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "单季山" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "单小山" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
						if GetName(sceneId, nMonsterId)== "江湖侠士" then
							LuaFnDeleteMonster(sceneId, nMonsterId)
						end
					end
					
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				end
			end	
					
			if nStep2 == 17 then
				-- 乔峰开始巡逻
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "乔峰" then
						SetPatrolId(sceneId, nMonsterId, 0)
						LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					end
				end	
			end
			
			if nStep2 == 18 then
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "乔峰" then
						--看乔峰是不是走到终点了
						--PrintStr("到终点了")
						local targetX, targetZ = GetWorldPos(sceneId, nMonsterId)
						local x, z = GetLastPatrolPoint(sceneId, 0)
						local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
						if distance2 <= 1 then
							--BroadMsgByChatPipe(sceneId,selfId,"阿朱：我不行了",0)
							CallScriptFunction((200060), "Duibai",sceneId, "阿朱", "聚贤庄", "我不行了" )
							LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
							LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
						end
					end
				end	
			end
			
			if nStep2 == 19 then
				--BroadMsgByChatPipe(sceneId,selfId,"薛神医：乔峰，你怎么办啊，还救这个丫头不？",0)
				CallScriptFunction((200060), "Duibai",sceneId, "薛慕华", "聚贤庄", "乔峰，你怎么办啊，还救这个丫头不？" )
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			end

			if nStep2 == 20 then	
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
					
					--乔峰眩晕的特效
					local nMonsterNum = GetMonsterCount(sceneId)
					local ii = 0
					local bHaveMonster = 0
					for ii=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,ii)
						if GetName(sceneId, nMonsterId)== "乔峰" then
							LuaFnSendSpecificImpactToUnit(sceneId,selfId,nMonsterId,nMonsterId,45,10)
						end
					end
				end
			end
			
			if nStep2 == 21 then
				--创建10个怪来围攻乔峰
				local nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 62, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 59, 62, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 58, 63, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 58, 65, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 58, 66, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 59, 66, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 60, 66, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 65, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 64, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)
				nNpc1 = LuaFnCreateMonster(sceneId, 415, 61, 63, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "江湖侠士")
				SetUnitReputationID(sceneId,selfId, nNpc1, 29)
				SetMonsterFightWithNpcFlag(sceneId, nNpc1, 1)
				SetNPCAIType(sceneId, nNpc1, 0)

				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				
			end
			
			-- 打5秒钟
			if nStep2 == 22 then
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				end
			end
			
			if nStep2 == 23 then
				--BroadMsgByChatPipe(sceneId,selfId,"乔峰:乔某自行了断",0)
				CallScriptFunction((200060), "Duibai",sceneId, "乔峰", "聚贤庄", "乔某自行了断" )
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			end
			
			-- 来黑衣人
			if nStep2 == 24 then
				local nNpc1 = LuaFnCreateMonster(sceneId, 24, 61, 67, 1, 0, -1)
				SetCharacterName(sceneId, nNpc1, "黑衣大汉")
				
				-- 播放一个特效
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,nNpc1,nNpc1,43,5)
				
				CallScriptFunction((200060), "Duibai",sceneId, "黑衣大汉", "聚贤庄", "蠢材，跟我走" )
				
				--杀掉所有的怪
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "江湖侠士" then
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end
				
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)

			end
			
			if nStep2 == 25 then
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
					CallScriptFunction((200060), "Duibai",sceneId, "乔峰", "聚贤庄", "$N，阿朱就交给你了！去找薛神医救她的性命，快去！" )
				end
			end
			
			if nStep2 == 26 then
				if nNowTime - nPreTime > 3  then
					LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
					LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				end
			end
			
			if nStep2 == 27 then
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bOk =1
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)== "黑衣大汉" then
						LuaFnDeleteMonster(sceneId, nMonsterId)
						LuaFnSendSpecificImpactToUnit(sceneId,selfId,nMonsterId,nMonsterId,44,5)
					end
					if GetName(sceneId, nMonsterId)== "乔峰" then
						LuaFnDeleteMonster(sceneId, nMonsterId)
						LuaFnSendSpecificImpactToUnit(sceneId,selfId,nMonsterId,nMonsterId,44,5)
					end
				end
				LuaFnSetCopySceneData_Param(sceneId, 13, nStep2+1)
				LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
				
				-- 设置任务完成
				LuaFnSetCopySceneData_Param(sceneId, 15, 1)
				
				-- 获得有这个任务的副本内的所有人，给设置完成标志和屏幕提示
				--PrintNum(nHumanNum)
				for i=0, nHumanNum-1  do
					local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
					-- 提示玩家剧情完成
					BeginEvent(sceneId)
						AddText(sceneId, "已保护乔峰脱险：1/1")
					EndEvent(sceneId)
					DispatchMissionTips(sceneId, nPlayerId)
										
					-- 测试这个Player是不是有这个任务
					if IsHaveMission(sceneId,nPlayerId,23) > 0 then
						local misIndex = GetMissionIndexByID(sceneId,nPlayerId,23)
						SetMissionByIndex( sceneId, nPlayerId, misIndex, 0, 1)
						SetMissionByIndex( sceneId, nPlayerId, misIndex, 1, 1)
					end
				end
			end
		end
	end
end

function x200023_TipToAllPlayerOnScene(sceneId, str)
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		
		BeginEvent(sceneId)
				AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
	
end
