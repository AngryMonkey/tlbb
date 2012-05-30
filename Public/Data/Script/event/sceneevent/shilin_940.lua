--石林 深情的遥望
--212124
-- 注意使用场景计时器来完成。
-- 护送任务

--MisDescBegin
--脚本号
x212124_g_ScriptId = 212124

--接受任务NPC属性
x212124_g_Position_X=183
x212124_g_Position_Z=168
x212124_g_SceneID=26
x212124_g_AccomplishNPC_Name="郑圆"

--任务号
x212124_g_MissionId = 940

--前续任务
x212124_g_MissionIdPre = 605

--目标NPC
x212124_g_Name	="郑圆"

--任务归类
x212124_g_MissionKind = 37

--任务等级
x212124_g_MissionLevel = 56

--是否是精英任务
x212124_g_IfMissionElite = 0

--任务名
x212124_g_MissionName="深情的遥望"
x212124_g_MissionInfo="#{Mis_30_60_desc_015}"
x212124_g_MissionTarget="    护送杨铁信回到圆月村，然后找到石林圆月村的郑圆#{_INFOAIM183,167,26,郑圆}。"
x212124_g_MissionContinue="  我丈夫一定会回来的，一定的，我相信！"
x212124_g_MissionComplete="  我似乎感觉到了丈夫温情的目光，他一定就在不远处看着我。铁信！你到底在哪呀！我一定等你回来！"

x212124_g_MoneyBonus=16000
x212124_g_exp=20000

x212124_g_Custom	= { {id="已经护送杨铁信",num=1} }
x212124_g_IsMissionOkFail = 0
--MisDescEnd

-- 护送路线Id
x212124_g_PatrolPathIndex = 0

-- 场景计时器Index
x212124_g_SceneTimerIndex = -1
x212124_g_Step = 0
x212124_g_StartTime = 0
x212124_g_PlayerNum = 0
x212124_g_PlayerId= {-1,-1,-1,-1,-1,-1}


--**********************************
--任务入口函数
--**********************************
function x212124_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212124_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212124_g_Name then
			--x212124_OnContinue( sceneId, selfId, targetId )
			local bDone = x212124_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				AddText(sceneId,x212124_g_MissionName)
				AddText(sceneId,x212124_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId,bDone)		
			
			
		end
	
	--满足任务接收条件
	elseif x212124_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212124_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212124_g_MissionName)
				AddText(sceneId,x212124_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212124_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212124_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212124_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212124_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212124_g_Name then
			AddNumText(sceneId, x212124_g_ScriptId,x212124_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212124_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212124_g_Name then
			AddNumText(sceneId,x212124_g_ScriptId,x212124_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212124_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212124_g_MissionLevel then
		return 0
	end
	
	if (IsMissionHaveDone(sceneId,selfId,x212124_g_MissionIdPre) < 1 ) then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212124_OnAccept( sceneId, selfId, targetId )
	if x212124_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于25级）
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 25 ) == 0  then -- zchw
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到25级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 使用一个场景计时器来进行。。。
	if x212124_g_Step ~= 0  and x212124_g_Step ~= 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "目标正忙，请稍后。")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end
	
	-- 这里的护送需要启动场景的计时器，同时启用人身上的计时器
	if x212124_g_Step == 0   then
		local ret = AddMission( sceneId,selfId, x212124_g_MissionId, x212124_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end
		
		-- 在人身上开一个计时器，
		StartMissionTimer(sceneId, selfId, x212124_g_MissionId)

		-- 这个场景计时器，应该是一直被这个活动占用的，所以，只要这个值不等于-1，就不要再申请
		if x212124_g_SceneTimerIndex == -1  then
			x212124_g_SceneTimerIndex = SetTimer(sceneId, selfId, x212124_g_ScriptId, "OnSceneTimer", 1)
		end
		
		x212124_g_StartTime = LuaFnGetCurrentTime()
		x212124_g_Step = 1
		
		x212124_g_PlayerId[1] = selfId
		x212124_g_PlayerNum = 1
		
		Msg2Player(  sceneId, selfId,"#Y接受任务：深情的遥望。",MSG2PLAYER_PARA )

		-- 任务变量
		local misIndex = GetMissionIndexByID(sceneId,selfId,x212124_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	end
	
	if x212124_g_Step == 2   then
		
	end
	
	
end

function x212124_OnSceneTimer(sceneId, selfId)

	if x212124_g_Step < 3  then
		local nSelfId = -1
		local bHavePlayer = 0
			for i=1, x212124_g_PlayerNum  do	
				if x212124_g_PlayerId[i] ~= -1  then
					if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])==1  and
						 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) == 1   then
						bHavePlayer = 1
						nSelfId = x212124_g_PlayerId[i]
						break
					end
				end
			end
		
		if bHavePlayer == 0   then
			-- 计时器停止，清除所有的全局变量
			x212124_g_Step = 0
			x212124_g_StartTime = 0
			x212124_g_PlayerId[1] = -1
			x212124_g_PlayerId[2] = -1
			x212124_g_PlayerId[3] = -1
			x212124_g_PlayerId[4] = -1
			x212124_g_PlayerId[5] = -1
			x212124_g_PlayerId[6] = -1
			x212124_g_PlayerNum = 0
			x212124_g_StartTime = 0
			return
		end
	end
	
	-- 只要护送目标走到终点，就恢复所有的变量
	if x212124_g_Step == 1   then
		-- 给小队的所有玩家发送一起护送的邀请
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nYangTX = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "杨铁信"  then
				nYangTX = nMonsterId
				bHaveMonster = 1
			end
		end
		
		for i=1, x212124_g_PlayerNum  do	
			if x212124_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])==1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) == 1   then
					bHavePlayer = 1
					nSelfId = x212124_g_PlayerId[i]
					
					break
				end
			end
		end
		local nTeamCount = GetNearTeamCount(sceneId, nSelfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, nSelfId, i)
			if PlayerId ~= nSelfId    then
				CallScriptFunction((212124), "OnDefaultEvent", sceneId, PlayerId, nYangTX )
			end
		end
		
		-- 记下这个接了任务的玩家
		x212124_g_StartTime = LuaFnGetCurrentTime()
		x212124_g_Step = 2
		
	elseif x212124_g_Step == 2   then
		-- 等待5秒，这个时间是等待别的玩家一起进行这个护送的时间
		if LuaFnGetCurrentTime() - x212124_g_StartTime > 5   then
			--CallScriptFunction((200060), "Paopao",sceneId, "杨铁信", "石林", "出发，出发!!!")
			x212124_g_Step = 3
			return
		end
		
	elseif x212124_g_Step == 3   then
		CallScriptFunction((200060), "Paopao",sceneId, "杨铁信", "石林", "出发，出发!!!")
		
		-- 开始护送
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nYangTX = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "杨铁信"  then
				nYangTX = nMonsterId
				nHaveMonster = 1
			end
		end
		
		if nHaveMonster == 0  then
			PrintStr("找不到 杨铁信")
			return 
		end
		--得到护送巡逻路线
		--SetNPCAIType(sceneId, nYangTX, 0)
		SetPatrolId(sceneId, nYangTX, x212124_g_PatrolPathIndex)
		x212124_g_Step = 4


	elseif x212124_g_Step == 4   then
		-- 如果护送目标到了路线终点，
		local Patrol_x
		local Patrol_z
		Patrol_x,Patrol_z = GetLastPatrolPoint(sceneId, x212124_g_PatrolPathIndex)
		
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nYangTX = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "杨铁信"  then
				nYangTX = nMonsterId
				nHaveMonster = 1
			end
		end
		
		-- 如果找不到这个人。。。。。暂时没有处理，
		
		local targetX, targetZ = GetWorldPos(sceneId, nYangTX)
		local distance = floor(sqrt((Patrol_x-targetX)*(Patrol_x-targetX)+(Patrol_z-targetZ)*(Patrol_z-targetZ)))
		
		if distance <= 2 then
			CallScriptFunction((200060), "Paopao",sceneId, "杨铁信", "石林", "到了，到了!!!")
			x212124_g_Step = 0
			
			-- 设置玩家的任务完成，给玩家提示，等等的操作都在这里执行
			for i=1, x212124_g_PlayerNum   do
				if x212124_g_PlayerId[i]~=-1   then
					local misIndex = GetMissionIndexByID(sceneId, x212124_g_PlayerId[i], x212124_g_MissionId)--得到任务在20个任务中的序列号
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 0, 1)
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 1, 1)
					BeginEvent(sceneId)
						AddText(sceneId, "护送杨铁信成功。")
					EndEvent()
					DispatchMissionTips(sceneId, x212124_g_PlayerId[i])
				end
			end
			return
		end
		
		-- 检测玩家是不是任务失败，
			-- 失败原因
				-- 1，距离Npc过远
				-- 2，离开了这个场景
				-- 3，死亡（用离开这个场景来实现）
		for i=1, x212124_g_PlayerNum  do	
			if x212124_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x212124_g_PlayerId[i])~=1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x212124_g_PlayerId[i]) ~= 1   then
					
					x212124_g_PlayerId[i] = -1
				end
			end
			
			if x212124_g_PlayerId[i] ~= -1  then
				local x, z = GetWorldPos(sceneId, x212124_g_PlayerId[i])
				local distance = floor(sqrt((x-targetX)*(x-targetX)+(z-targetZ)*(z-targetZ)))
				
				if distance>15   then
					BeginEvent(sceneId)
						AddText(sceneId, "护送杨铁信失败。")
					EndEvent()
					DispatchMissionTips(sceneId, x212124_g_PlayerId[i])
					
					local misIndex = GetMissionIndexByID(sceneId, x212124_g_PlayerId[i], x212124_g_MissionId)
					
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 0, 2)
					SetMissionByIndex(sceneId, x212124_g_PlayerId[i], misIndex, 1, 0)

					StopMissionTimer(sceneId, x212124_g_PlayerId[i],x212124_g_MissionId)
					x212124_g_PlayerId[i] = -1
				end
			end
		end
	end
	
end

--**********************************
--放弃
--**********************************
function x212124_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212124_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212124_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212124_g_MissionName)
	AddText(sceneId,x212124_g_MissionComplete)
	AddMoneyBonus( sceneId, x212124_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212124_g_ScriptId,x212124_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212124_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212124_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId, selfId, x212124_g_MissionId)--得到任务在20个任务中的序列号
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--提交
--**********************************
function x212124_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212124_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212124_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212124_g_exp)
		DelMission( sceneId, selfId, x212124_g_MissionId )
		MissionCom( sceneId, selfId, x212124_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：深情的遥望。",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212124_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212124_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212124_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--定时事件
--**********************************
function x212124_OnTimer(sceneId,selfId)
	if sceneId ~= 26   then
		BeginEvent(sceneId)
			AddText(sceneId, "护送杨铁信失败。")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		
		local misIndex = GetMissionIndexByID(sceneId, selfId, x212124_g_MissionId)
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 2)
		SetMissionByIndex(sceneId, selfId, misIndex, 1, 0)
		
		StopMissionTimer(sceneId,selfId,x212124_g_MissionId)
	end
end
