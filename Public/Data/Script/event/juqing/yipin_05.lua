-- 在 赫连铁树 帮组下，进入一品堂，
-- 200054

--************************************************************************
--MisDescBegin
--脚本号
x200054_g_ScriptId = 200054

--MisDescEnd
--************************************************************************

--副本名称
x200054_g_CopySceneName = "一品堂"

x200054_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200054_g_CopySceneMap = "yipin.nav"
x200054_g_Exit = "yipin.ini"
x200054_g_LimitMembers = 1				--可以进副本的最小队伍人数
x200054_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x200054_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200054_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200054_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x200054_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x200054_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200054_g_Fuben_X = 32					--进入副本的位置X
x200054_g_Fuben_Z = 113					--进入副本的位置Z
x200054_g_Back_X = 66					--源场景位置X
x200054_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200054_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200054_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x200054_OnEnumerate( sceneId, selfId, targetId )
--	-- 0,如果玩家已经有4任务，就不能在进入这个副本
--	if IsHaveMission( sceneId, selfId, 4 ) > 0 then
--		return 0
--	end
	if IsMissionHaveDone(sceneId, selfId, 45) > 0   then
		return 0
	end

	-- 1，拥有任务号为43的任务，
	if IsHaveMission( sceneId, selfId, 43 ) > 0 then
		AddNumText( sceneId, x200054_g_ScriptId, "送我去一品堂(白天)", 10 ,-1  )
		return 0
	end

	-- 2,只要玩家有44任务，就能进入
	if IsHaveMission( sceneId, selfId, 44 ) > 0 then
		AddNumText( sceneId, x200054_g_ScriptId, "送我去一品堂(白天)", 10 ,-1  )
		return 0
	end
	
	-- 3,只要玩家有45任务，就能进入
	if IsHaveMission( sceneId, selfId, 45 ) > 0 then
		AddNumText( sceneId, x200054_g_ScriptId, "送我去一品堂(白天)", 10 ,-1  )
		return 0
	end
	
	-- 4,如果玩家完成了43，没有44，也能进入
	if IsMissionHaveDone(sceneId, selfId, 43) > 0   then
		if IsHaveMission( sceneId, selfId, 34 ) < 1 then
			AddNumText( sceneId, x200054_g_ScriptId, "送我去一品堂(白天)", 10 ,-1  )
			return 0
		end
	end
	
	-- 5,如果玩家完成了43，但是没有45，也是可以进入
	if IsMissionHaveDone(sceneId, selfId, 43) > 0   then
		if IsHaveMission( sceneId, selfId, 45 ) < 1 then
			AddNumText( sceneId, x200054_g_ScriptId, "送我去一品堂(白天)", 10 ,-1  )
			return 0
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200054_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200054_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200054_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200054_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200054_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yipin.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200054_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200054_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200054_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200054_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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
	LuaFnSetSceneLoad_Area( sceneId, "yipin_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yipin_monster.ini" )

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
function x200054_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200054_g_Fuben_X, x200054_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200054_g_Fuben_X, x200054_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--misIndex = GetMissionIndexByID(sceneId,mems[i],x200054_g_MissionId)
				
				--将任务的第2号数据设置为副本的场景号
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200054_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200054_g_Fuben_X, x200054_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200054_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200054_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200054_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200054_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200054_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200054_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200054_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200054_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200054_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200054_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200054_OnCopySceneTimer( sceneId, nowTime )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) --控制说话
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9)	--时间
	
	local nStepHusong = LuaFnGetCopySceneData_Param(sceneId, 11)

	local targetId = LuaFnGetCopySceneData_Param(sceneId, 15)

	-- paopao 
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) --控制说过话
	local nZhenying = 24
	
	-- 护送
	if nStep1==3 then
--PrintNum(nStepHusong)
		if nStepHusong == 1   then
			-- 先通知所有在副本内的人，是不是一起参与护送
			for i=0, 	nHumanNum-1  do
				local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				
				-- 调用接任务的语句
				CallScriptFunction((200056), "OnDefaultEvent",sceneId, nHumanId, targetId )
			end
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
			LuaFnSetCopySceneData_Param(sceneId, 11, 2)
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{juqing_start_016}")
			
		elseif nStepHusong == 2   then
			-- 等待5秒
			if nowTime - nTime >= 5  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 3)
				CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{juqing_start_017}")
			end
			
		elseif nStepHusong == 3   then
			-- 启动护送了，
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{juqing_start_018}")
			SetPatrolId(sceneId, targetId, 0)
			
			LuaFnSetCopySceneData_Param(sceneId, 11, 4)
		
		elseif nStepHusong == 4   then
			-- 护送过程中的检测
			local x, z = GetLastPatrolPoint(sceneId, 0)
			local targetX, targetZ = GetWorldPos(sceneId, targetId)
			
			local distance2 = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
			if distance2 <= 1 then
				-- 目标到达终点，给每个有任务的玩家添加一个
				for i=0, 	nHumanNum-1  do
					local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				  BeginEvent(sceneId)
				  	AddText(sceneId, "完成剧情“一生有你”")
				  EndEvent()
				  DispatchMissionTips(sceneId, nHumanId)
				  
				  -- 给有这个任务的人加上完成标志
				  if IsHaveMission(sceneId, nHumanId, 45) > 0 then
						local misIndex = GetMissionIndexByID(sceneId,nHumanId,45)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 0, 1)
						SetMissionByIndex( sceneId, nHumanId, misIndex, 1, 1)
				  end
				  
				  LuaFnSetCopySceneData_Param(sceneId, 11, 5)
				  LuaFnSetCopySceneData_Param(sceneId, 8, 4)
				end
			end

		end
	end

	if nStep1==1 then
		if nStep2==0 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_119}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

			-- 设置火炬为29，
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				-- 虚竹需要调AI
				if GetName(sceneId, nMonsterId)  == "虚竹"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 10)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
				end
				
				if GetName(sceneId, nMonsterId)  == "一品点燃火炬"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 30)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 7)
					
					-- 给这个火炬+一个BUFF,免疫恐惧。
					LuaFnSendSpecificImpactToUnit(sceneId, nMonsterId, nMonsterId, nMonsterId, 52, 0 )
				end
				
				if GetName(sceneId, nMonsterId)  == "江湖英豪"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, nZhenying)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
					SetNPCAIType(sceneId, nMonsterId, 16)
					if nZhenying == 24  then
						nZhenying =25
					else
						nZhenying =24
					end
				end
	
				if GetName(sceneId, nMonsterId)  == "慕容复"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 10)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					SetNPCAIType(sceneId, nMonsterId, 3)
				end
			end
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			
		elseif nStep2==1 then
			-- 检测是不是 一品点燃火炬 死光
			local bOk = 1
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				-- 虚竹需要调AI
				if GetName(sceneId, nMonsterId)  == "一品点燃火炬"  then
					bOk = 0
				end
			end
			
			if bOk == 1 then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end
		
		elseif nStep2==2 then
			--PrintStr("zhanshou wancheng")
			
			LuaFnSetCopySceneData_Param(sceneId, 8, 2)
			LuaFnSetCopySceneData_Param(sceneId, 10,0)
			
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				-- 虚竹需要调AI
				if GetName(sceneId, nMonsterId)  == "江湖英豪"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					SetNPCAIType(sceneId, nMonsterId, 3)
					
				end
				if GetName(sceneId, nMonsterId)  == "虚竹"  then
					SetUnitReputationID(sceneId,selfId, nMonsterId, 0)
					SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 0)
					SetNPCAIType(sceneId, nMonsterId, 3)
					
				end
			end

		end 
		
	end
	
	-- 对白 一笑人间万事 接任务的时候触发
	if nStep1==2 then
		if nStep2==0 then
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		elseif nStep2==1 	then
			if nowTime - nTime > 0  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end

		elseif nStep2==2 	then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_120}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==3 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			end

		elseif nStep2==4 	then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_121}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==5 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 6)
			end

		elseif nStep2==6 	then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_122}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==7 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 8)
			end

		elseif nStep2==8 	then
			CallScriptFunction((200060), "Paopao",sceneId, "段誉", "一品堂", "#{JQ_PaoPao_123}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==9 	then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 10)
			end

		elseif nStep2==10 then
			CallScriptFunction((200060), "Paopao",sceneId, "", "一品堂", "#{JQ_PaoPao_124}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 11)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==11 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 12)
			end

		elseif nStep2==12 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_125}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 13)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==13 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 14)
			end

		elseif nStep2==14 then
			CallScriptFunction((200060), "Paopao",sceneId, "段誉", "一品堂", "#{JQ_PaoPao_126}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 15)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==15 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 16)
			end

		elseif nStep2==16 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_127}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 17)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==17 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 18)
			end

		elseif nStep2==18 then
			CallScriptFunction((200060), "Paopao",sceneId, "段誉", "一品堂", "#{JQ_PaoPao_128}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 19)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==19 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 20)
			end

		elseif nStep2==20 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_129}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 21)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==21 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 22)
			end

		elseif nStep2==22 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_130}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 23)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==23 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 24)
			end

		elseif nStep2==24 then
			CallScriptFunction((200060), "Paopao",sceneId, "慕容复", "一品堂", "#{JQ_PaoPao_131}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 25)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==25 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 26)
			end

		elseif nStep2==26 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_132}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 27)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==27 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 28)
			end

		elseif nStep2==28 then
			CallScriptFunction((200060), "Paopao",sceneId, "慕容复", "一品堂", "#{JQ_PaoPao_133}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 29)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==29 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 30)
			end

		elseif nStep2==30 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_134}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 31)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==31 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 32)
			end

		elseif nStep2==32 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_135}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 33)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==33 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 34)
			end

		elseif nStep2==34 then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{JQ_PaoPao_136}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 35)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==35 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 36)
			end

		elseif nStep2==36 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_137}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 37)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==37 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 38)
			end

		elseif nStep2==38 then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{JQ_PaoPao_138}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 39)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==39 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 40)
			end

		elseif nStep2==40 then
			CallScriptFunction((200060), "Paopao",sceneId, "晓蕾", "一品堂", "#{JQ_PaoPao_139}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 41)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep2==41 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 42)
			end

		elseif nStep2==42 then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{JQ_PaoPao_140}")
			LuaFnSetCopySceneData_Param(sceneId, 10, 43)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

			LuaFnSetCopySceneData_Param(sceneId, 15, 1)
		end
	end

end

