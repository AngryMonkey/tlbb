-- 在得到 慕容复 的请求后，进入白天的燕子坞

--************************************************************************
--MisDescBegin
--脚本号
x200014_g_ScriptId = 200014

--副本名称
x200014_g_CopySceneName="燕子坞"
--任务文本描述
--MisDescEnd
--************************************************************************

--副本名称
x200014_g_CopySceneName = "燕子坞"

x200014_g_CopySceneType = FUBEN_JUQING	--副本类型，定义在ScriptGlobal.lua里面

x200014_g_CopySceneMap = "yanzi.nav"
x200014_g_Exit = "yanzi.ini"
x200014_g_LimitMembers = 1				--可以进副本的最小队伍人数
x200014_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x200014_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x200014_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x200014_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x200014_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x200014_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x200014_g_Fuben_X = 105					--进入副本的位置X
x200014_g_Fuben_Z = 99					--进入副本的位置Z
x200014_g_Back_X = 66					--源场景位置X
x200014_g_Back_Z = 56					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x200014_OnDefaultEvent( sceneId, selfId, targetId )
	-- 根据玩家的情况，将玩家送到不同的副本
	x200014_MakeCopyScene(sceneId, selfId)
end


--**********************************
--列举事件
--**********************************
function x200014_OnEnumerate( sceneId, selfId, targetId )

	-- 玩家完成了15，直接返回
	if IsMissionHaveDone(sceneId, selfId, 15) > 0   then
		return 0
	end

	--检查玩家身上是不是有这个任务
	-- 有任务13可以进入
	if IsHaveMission( sceneId, selfId, 13 ) > 0 then
		AddNumText( sceneId, x200014_g_ScriptId, "送我去燕子坞（白天）", 10 ,-1  )
		return 0
	end
	
	-- 有任务14可以进入
	if IsHaveMission( sceneId, selfId, 14 ) > 0 then
		AddNumText( sceneId, x200014_g_ScriptId, "送我去燕子坞（白天）", 10 ,-1  )
		return 0
	end

	-- 有任务15可以进入
	if IsHaveMission( sceneId, selfId, 15 ) > 0 then
		AddNumText( sceneId, x200014_g_ScriptId, "送我去燕子坞（白天）", 10 ,-1  )
		return 0
	end
	
	-- 如果完成了13，没有14，15，都可以进入
	if IsMissionHaveDone(sceneId, selfId, 13) > 0   then
		if IsHaveMission(sceneId, selfId, 14) < 1   then
			AddNumText( sceneId, x200014_g_ScriptId, "送我去燕子坞（白天）", 10 ,-1  )
			return 0
		end
		if IsHaveMission(sceneId, selfId, 15) < 1   then
			AddNumText( sceneId, x200014_g_ScriptId, "送我去燕子坞（白天）", 10 ,-1  )
			return 0
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200014_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x200014_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200014_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x200014_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x200014_MakeCopyScene( sceneId, selfId )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "yanzi.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
		
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x200014_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x200014_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x200014_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x200014_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Boss的数量
	LuaFnSetCopySceneData_Param(sceneId, 8, 0) ;--时间
	
	-- 剧情用到的变量清空
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetSceneLoad_Area( sceneId, "yanzi_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yanzi_monster.ini" )

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
function x200014_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个文件没有组队，就传送这个文件自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个晚间是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	-- 检测玩家是不是有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		NewWorld( sceneId, leaderObjId, destsceneId, x200014_g_Fuben_X, x200014_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x200014_g_Fuben_X, x200014_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x200014_g_Fuben_X, x200014_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x200014_OnPlayerEnter( sceneId, selfId )
	-- 每个进入副本的人，都会被刷一次任务数据
	-- 本副本需要刷新数据的任务是，14，指点群豪戏
	local nMissionId = 14
	if IsHaveMission( sceneId, selfId, nMissionId ) > 0 then  --完家如果有这个任务
		local misIndex = GetMissionIndexByID(sceneId,selfId,nMissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,0)
		SetMissionByIndex(sceneId,selfId,misIndex,1,0)
		SetMissionByIndex(sceneId,selfId,misIndex,2,0)
		SetMissionByIndex(sceneId,selfId,misIndex,3,0)
		SetMissionByIndex(sceneId,selfId,misIndex,4,0)
		SetMissionByIndex(sceneId,selfId,misIndex,5,0)
	end
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x200014_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x200014_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x200014_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x200014_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200014_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200014_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200014_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200014_OnEnterZone( sceneId, selfId, zoneId )

end

--**********************************
--道具改变
--**********************************
function x200014_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x200014_OnCopySceneTimer( sceneId, nowTime )
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	local selfId = LuaFnGetCopyScene_HumanObjId(sceneId,0)
	
	local nStep1 = LuaFnGetCopySceneData_Param(sceneId, 10) --控制说话
	local nStartTime  = LuaFnGetCopySceneData_Param(sceneId, 11)	--时间
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 12)	--时间
	local nNowTime = LuaFnGetCurrentTime()

	local nStep2 = LuaFnGetCopySceneData_Param(sceneId, 13) --控制说话

	if nStep1 == 1  then
	
		if nNowTime - nPreTime >= 10 then
			-- 获得还活着的怪
			LuaFnSetCopySceneData_Param(sceneId, 12, nNowTime)
			local nMonsterNum = GetMonsterCount(sceneId)
			local nMonster = {}
			local ii = 0
			local jj = 0
			local bHaveMonster = 0
			local nWangId = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "黄胡子"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "灰袍客"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "虎爪门弟子"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "虬髯武士"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
				elseif GetName(sceneId, nMonsterId)  == "摔角高手"  then
					nMonster[jj] = nMonsterId
					jj = jj+1
					
				elseif GetName(sceneId, nMonsterId)  == "王语嫣"  then
					nWangId = nMonsterId
				end
				
			end
			
			--如果还有活着的怪，随机给一个怪相应的DEBUFF
			if jj > 0  then
				local nRand = random( 1, jj ) - 1
				local nSelMonster = nMonster[nRand]
				local nName = GetName(sceneId, nSelMonster)
				
				LuaFnSendSpecificImpactToUnit(sceneId, nWangId, nWangId, nSelMonster, 39, 0 )
				
				-- 同时王姑娘需要喊话
				if GetName(sceneId, nSelMonster ) == "黄胡子"    then
					x200014_DispatchMissionTipsToAll(sceneId, "王语嫣“黄胡子的命门在玉枕穴”")
	
				elseif GetName(sceneId, nSelMonster ) == "灰袍客"    then
					x200014_DispatchMissionTipsToAll(sceneId, "王语嫣“灰袍客的命门在廉泉穴”")
					
				elseif GetName(sceneId, nSelMonster ) == "虎爪门弟子"    then
					x200014_DispatchMissionTipsToAll(sceneId, "王语嫣“虎爪门弟子的命门在至阳穴”")
					
				elseif GetName(sceneId, nSelMonster ) == "虬髯武士"    then
					x200014_DispatchMissionTipsToAll(sceneId, "王语嫣“虬髯武士的命门在膻中穴”")
					
				elseif GetName(sceneId, nSelMonster ) == "摔角高手"    then
					x200014_DispatchMissionTipsToAll(sceneId, "王语嫣“摔角高手的命门在百会穴”")
					
				end
				
			else --如果怪都死光了，就创建李出来
				-- 消失 秦家寨弟子	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				local bLi = 0
				local bDuan = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "西夏武士"  then
						-- 删除 秦家寨弟子
						LuaFnDeleteMonster(sceneId, nMonsterId)
						
						-- 段誉的泡泡 "王姑娘，王姑娘，敌人都打死了！"
						local nMonsterNum = GetMonsterCount(sceneId)
						local ii = 0
						local bHaveMonster = 0
						for ii=0, nMonsterNum-1 do
							local nMonsterId = GetMonsterObjID(sceneId,ii)
							
							if GetName(sceneId, nMonsterId)  == "段誉"  then
								bDuan = 1
								--CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "#{JQ_PaoPao_68}")
							end
							
							if GetName(sceneId, nMonsterId)  == "李延宗"  then
								bLi = 1
							end
							
						end
					end
				end				

				if bLi == 0   then
					-- 创建怪物
					local nNpcId = LuaFnCreateMonster(sceneId, 419, 62, 76, 3, 0, 200017)
					SetCharacterName(sceneId, nNpcId, "李延宗")
				end
				
				-- 李延宗 paopao
				CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "#{JQ_PaoPao_68}")
				CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_69}")
				
				LuaFnSetCopySceneData_Param(sceneId, 10, 2)
			end			
		end
	end

	-- 悲酥清风 的对话掉物品的剧情
	if nStep1 == 3    then  -- 当有任何一个人接了这个任务后，开始这段剧情，保证只发生一次
		if nStep2 == 1	then
			CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "#{JQ_PaoPao_70}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 2)
		elseif nStep2 == 2	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 3)
			end
		elseif  nStep2 == 3	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_71}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 4)
			
		elseif nStep2 == 4	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 5)
			end
			
		elseif nStep2 == 5	then
			CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "#{JQ_PaoPao_72}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 6)
			
		elseif nStep2 == 6	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 7)
			end
			
		elseif nStep2 == 7	then
			CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "#{JQ_PaoPao_73}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 8)
			
		elseif nStep2 == 8	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 9)
			end
			
		elseif nStep2 == 9	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_74}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 10)
			
		elseif nStep2 == 10	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 11)
			end
			
		elseif nStep2 == 11	then
			CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "#{JQ_PaoPao_75}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 12)
		elseif nStep2 == 12	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 13)
			end
			
		elseif nStep2 == 13	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_76}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 14)
		elseif nStep2 == 14	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 15)
			end
			
		elseif nStep2 == 15	then
			CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "#{JQ_PaoPao_77}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 16)
		elseif nStep2 == 16	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 17)
			end
			
		elseif nStep2 == 17	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_78}")
			LuaFnSetCopySceneData_Param(sceneId, 13, 18)
		elseif nStep2 == 18	then
			if nNowTime - nPreTime > 3 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 19)
			end
		
		elseif nStep2 == 19	then  -- 李消失，同时给场景内的所有完家一个道具
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "好吧，既然王姑娘不懊悔，我就放你们一条生路。我这里就有悲酥清风的解药，快快拿去，免得我又变了主意。")
			LuaFnSetCopySceneData_Param(sceneId, 15, 1)
			LuaFnSetCopySceneData_Param(sceneId, 13, 20)
			
		elseif nStep2 == 20	then
			if nNowTime - nPreTime > 5 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 21)
			end
			
		elseif nStep2 == 21	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "好吧，既然王姑娘不懊悔，我就放你们一条生路。我这里就有悲酥清风的解药，快快拿去，免得我又变了主意。")
			LuaFnSetCopySceneData_Param(sceneId, 13, 22)
			
		elseif nStep2 == 22	then
			if nNowTime - nPreTime > 5 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 23)
			end
			
		elseif nStep2 == 23	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "好吧，既然王姑娘不懊悔，我就放你们一条生路。我这里就有悲酥清风的解药，快快拿去，免得我又变了主意。")
			LuaFnSetCopySceneData_Param(sceneId, 13, 24)

		elseif nStep2 == 24	then
			if nNowTime - nPreTime > 40 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 25)
			end
			
		elseif nStep2 == 25	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "好吧，既然王姑娘不懊悔，我就放你们一条生路。我这里就有悲酥清风的解药，快快拿去，免得我又变了主意。")
			LuaFnSetCopySceneData_Param(sceneId, 13, 26)

		elseif nStep2 == 26	then
			if nNowTime - nPreTime > 40 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 27)
			end
			
		elseif nStep2 == 27	then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "好吧，既然王姑娘不懊悔，我就放你们一条生路。我这里就有悲酥清风的解药，快快拿去，免得我又变了主意。")
			LuaFnSetCopySceneData_Param(sceneId, 13, 28)

		elseif nStep2 == 28	then
			if nNowTime - nPreTime > 40 then
				LuaFnSetCopySceneData_Param(sceneId, 13, 29)
			end

		elseif nStep2 == 29	then
			-- 李 消失 查找这个人，删除
			local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "李延宗"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
					--ItemBoxEnterScene(62,74,-1,sceneId,1,1,40001005)
				end
			end
			LuaFnSetCopySceneData_Param(sceneId, 10, 4)
		end
	end
end

function x200014_DispatchMissionTipsToAll(sceneId, szStr)
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, szStr)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,nHumanId)
	end
	
end
