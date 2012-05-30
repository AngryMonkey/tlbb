-- 擂鼓山  200040

-- 	在范百龄的指引下前往擂鼓山

--************************************************************************
--MisDescBegin
--脚本号
x200040_g_ScriptId = 200040

--MisDescEnd
--************************************************************************

--副本名称
x200040_g_CopySceneName = "擂鼓山"

x200040_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200040_g_CopySceneMap = "leigu_1.nav"
x200040_g_Exit = "leigu_1.ini"
x200040_g_LimitMembers = 1					--可以进副本的最小队伍人数
x200040_g_TickTime = 5							--回调脚本的时钟时间（单位：秒/次）
x200040_g_LimitTotalHoldTime = 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200040_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200040_g_CloseTick = 3							--副本关闭前倒计时（单位：次数）
x200040_g_NoUserTime = 300					--副本中没有人后可以继续保存的时间（单位：秒）
x200040_g_DeadTrans = 0							--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200040_g_Fuben_X = 56							--进入副本的位置X
x200040_g_Fuben_Z = 104							--进入副本的位置Z
x200040_g_Back_X = 66								--源场景位置X
x200040_g_Back_Z = 56								--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200040_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200040_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x200040_OnEnumerate( sceneId, selfId, targetId )
	-- 0,如果玩家已经有4任务，就不能在进入这个副本
	if IsHaveMission( sceneId, selfId, 36 ) > 0 then
		return 0
	end
	if IsMissionHaveDone(sceneId, selfId, 36) > 0   then
		return 0
	end

	-- 1，拥有任务号为34的任务，
	if IsHaveMission( sceneId, selfId, 34 ) > 0 then
		AddNumText( sceneId, x200040_g_ScriptId, "送我去擂鼓山(夜间)", 10 ,-1  )
		return 0
	end

	-- 2,只要玩家有35任务，就能进入
	if IsHaveMission( sceneId, selfId, 35 ) > 0 then
		AddNumText( sceneId, x200040_g_ScriptId, "送我去擂鼓山(夜间)", 10 ,-1  )
		return 0
	end
	
	-- 3,如果玩家完成了34，没有35，也能进入
	if IsMissionHaveDone(sceneId, selfId, 34) > 0   then
		if IsHaveMission( sceneId, selfId, 35 ) < 1 then
			AddNumText( sceneId, x200040_g_ScriptId, "送我去擂鼓山(夜间)", 10 ,-1  )
			return 0
		end
		if IsHaveMission( sceneId, selfId, 36 ) < 1 then
			AddNumText( sceneId, x200040_g_ScriptId, "送我去擂鼓山(夜间)", 10 ,-1  )
			return 0
		end
	end
	
end

--**********************************
--检测接受条件
--**********************************
function x200040_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200040_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200040_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200040_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200040_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "leigu_1.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200040_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200040_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200040_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200040_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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
	LuaFnSetSceneLoad_Area( sceneId, "leigu_1_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "leigu_1_monster.ini" )

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
function x200040_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200040_g_Fuben_X, x200040_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200040_g_Fuben_X, x200040_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--misIndex = GetMissionIndexByID(sceneId,mems[i],x200040_g_MissionId)
				
				--将任务的第2号数据设置为副本的场景号
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200040_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200040_g_Fuben_X, x200040_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200040_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200040_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200040_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200040_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200040_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200040_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200040_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200040_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200040_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200040_OnCopySceneTimer( sceneId, nowTime )
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId, 0)

	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--控制说话
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9);--时间
	local nStartTime = LuaFnGetCopySceneData_Param(sceneId, 11)
	-- paopao 
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) ;--控制说过话
	
	nowTime = LuaFnGetCurrentTime()
	
	-- 完成保护下棋的任务后，虚竹走自己的路,走之前有对白
	if nStep1==3 then
		local nMonsterNum = GetMonsterCount(sceneId)
		local ii = 0
		local bHaveMonster = 0
		for ii=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,ii)
			-- 虚竹需要调AI
			if GetName(sceneId, nMonsterId)  == "虚竹"  then
				SetPatrolId(sceneId, nMonsterId, 1)
				
				LuaFnSetCopySceneData_Param(sceneId, 8, 4)
			end
		end
	end	
	
	if nStep1==2 then
		if nStep2 == 1  then
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				-- 虚竹需要调AI
				if GetName(sceneId, nMonsterId)  == "虚竹"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 7) -- 不主动攻击，不会随机移动，可以攻击，不会还击
					
					SetPatrolId(sceneId, nMonsterId, 0)
				end
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		end
		if nStep2 == 2  then
			if nowTime - nStartTime < 120  then
				if nowTime - nTime > 10  then
					local nNpcId = LuaFnCreateMonster(sceneId, 408, 76, 32, 1, 0, -1)
					SetUnitReputationID(sceneId,selfId, nNpcId, 29)
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
					SetNPCAIType(sceneId, nNpcId, 0)
					SetCharacterName(sceneId, nNpcId, "僵尸")

					LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
				end
			
			else
				-- 时间到，清除小怪，看虚竹是不是还活着
				local bOk = 0
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "虚竹"  then
						bOk = 1
					end
					if GetName(sceneId, nMonsterId)  == "僵尸"  then
						-- 删除所有的僵尸
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end
				
				if bOk == 1 then
					LuaFnSetCopySceneData_Param(sceneId, 15, 1)
					-- 通知玩家，完成了任务
					for i=0, 	nHumanNum-1  do
						local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
						
						--看这个玩家是不是有这个任务
						if IsHaveMission( sceneId, nHumanId, 35 ) > 0 then
							local misIndex = GetMissionIndexByID(sceneId, nHumanId, 35)
							SetMissionByIndex(sceneId, nHumanId, misIndex, 0, 1)
							SetMissionByIndex(sceneId, nHumanId, misIndex, 1, 1)
							BeginEvent(sceneId)
							AddText(sceneId,"已保护虚竹：1/1")
							EndEvent(sceneId)
							DispatchMissionTips(sceneId,nHumanId)
						end
					end
				end
				LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			end
		end
				
	end
	
	
	-- 第一次的对白 天时不如地利 完成任务的时候触发
	if nStep1==1 then
		if nStep2==0 then
			-- 萧峰 paopao
			CallScriptFunction((200060), "Paopao",sceneId, "苏星河", "擂鼓山", "#{JQ_PaoPao_91}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end
			
		elseif nStep2==2 	then
			CallScriptFunction((200060), "Paopao",sceneId, "玄难", "擂鼓山", "#{JQ_PaoPao_92}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==3 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			end
		elseif nStep2==4 	then
			CallScriptFunction((200060), "Paopao",sceneId, "段延庆", "擂鼓山", "#{JQ_PaoPao_93}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==5 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 6)
			end
		elseif nStep2==6 	then
			CallScriptFunction((200060), "Paopao",sceneId, "玄难", "擂鼓山", "#{JQ_PaoPao_94}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==7 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 8)
			end
		elseif nStep2==8 	then
			CallScriptFunction((200060), "Paopao",sceneId, "段延庆", "擂鼓山", "#{JQ_PaoPao_95}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==9 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 10)
			end
		elseif nStep2==10 then
			CallScriptFunction((200060), "Paopao",sceneId, "丁春秋", "擂鼓山", "#{JQ_PaoPao_96}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 11)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==11 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 12)
			end
		elseif nStep2==12 then
			CallScriptFunction((200060), "Paopao",sceneId, "段延庆", "擂鼓山", "#{JQ_PaoPao_97}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 13)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==13 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 14)
			end
		elseif nStep2==14 then
			CallScriptFunction((200060), "Paopao",sceneId, "段延庆", "擂鼓山", "#{JQ_PaoPao_98}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 15)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==15 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 16)
			end
		elseif nStep2==16 then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "擂鼓山", "#{JQ_PaoPao_99}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 17)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==17 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 18)
			end
		elseif nStep2==18 then
			CallScriptFunction((200060), "Paopao",sceneId, "苏星河", "擂鼓山", "#{JQ_PaoPao_100}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 19)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==19 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 20)
			end
		elseif nStep2==20 then
			CallScriptFunction((200060), "Paopao",sceneId, "苏星河", "擂鼓山", "#{JQ_PaoPao_101}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 21)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			
		end
	end
	
end


