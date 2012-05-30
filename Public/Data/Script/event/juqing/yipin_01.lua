-- 在 赫连铁树 帮组下，进入一品堂，
-- 200050

--************************************************************************
--MisDescBegin
--脚本号
x200050_g_ScriptId = 200050

--MisDescEnd
--************************************************************************

--副本名称
x200050_g_CopySceneName = "一品堂"

x200050_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200050_g_CopySceneMap = "yipin_1.nav"
x200050_g_Exit = "yipin_1.ini"
x200050_g_LimitMembers = 1					--可以进副本的最小队伍人数
x200050_g_TickTime = 5							--回调脚本的时钟时间（单位：秒/次）
x200050_g_LimitTotalHoldTime = 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200050_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200050_g_CloseTick = 3							--副本关闭前倒计时（单位：次数）
x200050_g_NoUserTime = 300					--副本中没有人后可以继续保存的时间（单位：秒）
x200050_g_DeadTrans = 0							--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200050_g_Fuben_X = 32							--进入副本的位置X
x200050_g_Fuben_Z = 113							--进入副本的位置Z
x200050_g_Back_X = 66								--源场景位置X
x200050_g_Back_Z = 56								--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200050_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200050_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x200050_OnEnumerate( sceneId, selfId, targetId )
	--AddNumText( sceneId, x200050_g_ScriptId, "送我去一品堂(夜间)", 10 ,-1  )
	-- 0,如果玩家已经有44任务，就不能在进入这个副本
	if IsHaveMission( sceneId, selfId, 44 ) > 0 then
		return 0
	end
	
	-- 如果玩家已经完成了43，就不能再进入了
	if IsMissionHaveDone(sceneId, selfId, 43) > 0   then
		return 0
	end
	
	-- 如果玩家已经完成了42，就不能再进入了
	if IsMissionHaveDone(sceneId, selfId, 42) > 0   then
		return 0
	end
	
	-- 如果玩家已经有了42任务，不能 进去
	if IsHaveMission( sceneId, selfId, 42 ) > 0 then
		return 0
	end

	-- 1，拥有任务号为40的任务，
	if IsHaveMission( sceneId, selfId, 40 ) > 0 then
		AddNumText( sceneId, x200050_g_ScriptId, "送我去一品堂(夜间)", 10 ,-1  )
		return 0
	end

	-- 2,只要玩家有41任务，就能进入
	if IsHaveMission( sceneId, selfId, 41 ) > 0 then
		AddNumText( sceneId, x200050_g_ScriptId, "送我去一品堂(夜间)", 10 ,-1  )
		return 0
	end
	
	-- 3,如果玩家完成了40，没有41，也能进入
	if IsMissionHaveDone(sceneId, selfId, 40) > 0   then
		if IsHaveMission( sceneId, selfId, 41 ) < 1 then
			AddNumText( sceneId, x200050_g_ScriptId, "送我去一品堂(夜间)", 10 ,-1  )
			return 0
		end
	end
	
	-- 4,如果玩家完成了40，但是没有42，也是可以进入
	if IsMissionHaveDone(sceneId, selfId, 40) > 0   then
		if IsHaveMission( sceneId, selfId, 42 ) < 1 then
			AddNumText( sceneId, x200050_g_ScriptId, "送我去一品堂(夜间)", 10 ,-1  )
			return 0
		end
	end
end

--**********************************
--检测接受条件
--**********************************
function x200050_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200050_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200050_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200050_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200050_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yipin_1.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200050_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200050_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200050_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200050_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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
	LuaFnSetSceneLoad_Area( sceneId, "yipin_1_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yipin_1_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！")
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！")
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--副本事件
--**********************************
function x200050_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x200050_g_Fuben_X, x200050_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200050_g_Fuben_X, x200050_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				--misIndex = GetMissionIndexByID(sceneId,mems[i],x200050_g_MissionId)
				
				--将任务的第2号数据设置为副本的场景号
				--SetMissionByIndex(sceneId,mems[i],misIndex,x200050_g_Param_sceneid,destsceneId)
						
				NewWorld( sceneId, mems[i], destsceneId, x200050_g_Fuben_X, x200050_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200050_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200050_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200050_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200050_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200050_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200050_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200050_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200050_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200050_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200050_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200050_OnCopySceneTimer( sceneId, nowTime )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 8) --控制说话
	local nTime  = LuaFnGetCopySceneData_Param(sceneId, 9)	--时间

	-- 对白 
	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 10) --控制说过话
	
	-- paopao 
	local nStep3 = LuaFnGetCopySceneData_Param(sceneId, 11) --控制说过话
	
	-- 对白 一笑人间万事 接任务的时候触发
	if nStep1==1 then
		if nStep2==0 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0024}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "李秋水", "一品堂", "#{JQ_DB_0024}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==1 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end
		
		elseif nStep2==2 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0025}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "虚竹", "一品堂", "#{JQ_DB_0025}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==3 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 4)
			end
		
		elseif nStep2==4 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0026}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "天山童姥", "一品堂", "#{JQ_DB_0026}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==5 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 6)
			end

		elseif nStep2==6 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0027}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "李秋水", "一品堂", "#{JQ_DB_0027}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==7 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 8)
			end

		elseif nStep2==8 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0028}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "李秋水", "一品堂", "#{JQ_DB_0028}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==9 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 10)
			end

		elseif nStep2==10 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0029}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "李秋水", "一品堂", "#{JQ_DB_0029}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 11)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==11 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 12)
			end

		elseif nStep2==12 then
			--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0030}",0)
			CallScriptFunction((200060), "Duibai",sceneId, "天山童姥", "一品堂", "#{JQ_DB_0030}" )
			LuaFnSetCopySceneData_Param(sceneId, 10, 13)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep2==13 then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 14)
			end
		
		elseif nStep2==14 then
			-- 创建 李秋水，改变天山童老的战斗关系，玩家不参与
			local nNpcId = LuaFnCreateMonster(sceneId, 454, 22, 27, 1, 0, -1)
			SetUnitReputationID(sceneId,selfId, nNpcId, 24)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			SetNPCAIType(sceneId, nNpcId, 16)
			SetCharacterName(sceneId, nNpcId, "李秋水")
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, nNpcId, nNpcId, 44, 2)
			
			--天山童老需要换模型
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				if GetName(sceneId, nMonsterId)  == "天山童姥"  then
					-- 先获得这个位置，然后删除这个模型，之后创建一个新的
					LuaFnDeleteMonster(sceneId, nMonsterId)
					
					local newMonster = LuaFnCreateMonster(sceneId, 453, 20, 25, 1, 0, -1)

					SetUnitReputationID(sceneId,selfId, newMonster, 25)
					SetMonsterFightWithNpcFlag(sceneId, newMonster, 1)
					SetNPCAIType(sceneId, newMonster, 16)
					SetCharacterName(sceneId, newMonster, "天山童姥")
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, newMonster, newMonster, 44, 2)
					break
				end
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 10, 15)
		
		elseif nStep2==15 then
			if nowTime - nTime > 60  then
				LuaFnSetCopySceneData_Param(sceneId, 10, 16)
			end

		elseif nStep2==16 then
			-- 二人停战
			
			local newMonst1
			local newMonst2
			
			--设天山童老的阵营
			local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				-- 虚竹需要调AI
				if GetName(sceneId, nMonsterId)  == "天山童姥"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
					newMonst1 = LuaFnCreateMonster(sceneId, 491, 20, 25, 1, 0, -1)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, newMonst1, newMonst1, 44, 2)
					
				end
				if GetName(sceneId, nMonsterId)  == "李秋水"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
					newMonst2 = LuaFnCreateMonster(sceneId, 492, 22, 27, 1, 0, -1)
					LuaFnSendSpecificImpactToUnit(sceneId, selfId, newMonst2, newMonst2, 44, 2)
					
				end
			end
			
			-- 创建2个死亡模型，设置血为1
			SetUnitReputationID(sceneId,selfId, newMonst1, 0)
			SetMonsterFightWithNpcFlag(sceneId, newMonst1, 1)
			SetNPCAIType(sceneId, newMonst1, 3)
			SetCharacterName(sceneId, newMonst1, "天山童姥")
			SetHp(sceneId, newMonst1, 1)
				
			SetUnitReputationID(sceneId,selfId, newMonst2, 0)
			SetMonsterFightWithNpcFlag(sceneId, newMonst2, 1)
			SetNPCAIType(sceneId, newMonst2, 3)
			SetCharacterName(sceneId, newMonst2, "李秋水")
			SetHp(sceneId, newMonst2, 1)
			
			LuaFnSetCopySceneData_Param(sceneId, 8, 2)
			LuaFnSetCopySceneData_Param(sceneId, 10, 17)
			
		end
	end

	-- paopao 一笑人间万事 
	if nStep1==2 then
		if nStep3==0    	then
			CallScriptFunction((200060), "Paopao",sceneId, "李秋水", "一品堂", "#{JQ_PaoPao_104}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 1)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==1  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 2)
			end

		elseif nStep3==2  then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{JQ_PaoPao_105}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 3)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==3  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 4)
			end

		elseif nStep3==4  then
			CallScriptFunction((200060), "Paopao",sceneId, "天山童姥", "一品堂", "#{JQ_PaoPao_106}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 5)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==5  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 6)
			end

		elseif nStep3==6  then
			CallScriptFunction((200060), "Paopao",sceneId, "天山童姥", "一品堂", "#{JQ_PaoPao_107}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 7)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)
		
		elseif nStep3==7  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 8)
			end

		elseif nStep3==8  then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{JQ_PaoPao_108}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 9)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==9  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 10)
			end

		elseif nStep3==10  then
			CallScriptFunction((200060), "Paopao",sceneId, "天山童姥", "一品堂", "#{JQ_PaoPao_109}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 11)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==11  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 12)
			end

		elseif nStep3==12  then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{JQ_PaoPao_110}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 13)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==13  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 14)
			end

		elseif nStep3==14  then
			CallScriptFunction((200060), "Paopao",sceneId, "天山童姥", "一品堂", "#{JQ_PaoPao_111}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 15)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==15  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 16)
			end
			
		elseif nStep3==16  then
			CallScriptFunction((200060), "Paopao",sceneId, "天山童姥", "一品堂", "#{JQ_PaoPao_112}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 17)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==17  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 18)
			end

		elseif nStep3==18  then
			CallScriptFunction((200060), "Paopao",sceneId, "李秋水", "一品堂", "#{JQ_PaoPao_113}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 19)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==19  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 20)
			end

		elseif nStep3==20  then
			CallScriptFunction((200060), "Paopao",sceneId, "虚竹", "一品堂", "#{JQ_PaoPao_114}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 21)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==21  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 22)
			end

		elseif nStep3==22  then
			CallScriptFunction((200060), "Paopao",sceneId, "李秋水", "一品堂", "#{JQ_PaoPao_115}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 23)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==23  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 24)
			end

		elseif nStep3==24  then
			CallScriptFunction((200060), "Paopao",sceneId, "李秋水", "一品堂", "#{JQ_PaoPao_116}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 25)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==25  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 26)
			end

		elseif nStep3==26  then
			CallScriptFunction((200060), "Paopao",sceneId, "李秋水", "一品堂", "#{JQ_PaoPao_117}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 27)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==27  then
			if nowTime - nTime > 3  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 28)
			end

		elseif nStep3==28  then
			CallScriptFunction((200060), "Paopao",sceneId, "李秋水", "一品堂", "#{JQ_PaoPao_118}")
			LuaFnSetCopySceneData_Param(sceneId, 11, 29)
			LuaFnSetCopySceneData_Param(sceneId, 9, nowTime)

		elseif nStep3==29  then
			LuaFnSetCopySceneData_Param(sceneId, 15, 1)
			
		end
	end
	
end

