-- 聚贤庄之 洛阳场景护送，重点部分哦
-- 触发条件，完成任务21，然后进入洛阳的事件区域

--MisDescBegin
--脚本号
x200022_g_ScriptId = 200022

--任务号
x200022_g_MissionId = 22

--前续任务号
x200022_g_PreMissionId = 47

--目标NPC
x200022_g_Name	="乔峰"
x200022_g_Name1 ="徐惊雷"

--任务归类
x200022_g_MissionKind = 47

--任务等级
x200022_g_MissionLevel = 40

--是否是精英任务
x200022_g_IfMissionElite = 0

--任务名
x200022_g_MissionName="虽万千人吾往矣"
--任务描述
x200022_g_MissionInfo="#{Mis_juqing_0022}"
--任务目标
x200022_g_MissionTarget="#{Mis_juqing_Tar_0022}"		
--提交时npc的话
x200022_g_MissionComplete="  乔峰真是……难道他真的为了一个小姑娘，连自己的性命都不要了吗？聚贤庄内现在也许已经大乱了吧……"		

x200022_g_MoneyBonus=9000
x200022_g_exp=9600

x200022_g_RadioItemBonus={{id=10423008 ,num=1},{id=10423009,num=1},{id=10423010,num=1},{id=10423011,num=1}}

x200022_g_Custom	= {{id="虽万千人吾往矣",num=1}}

--MisDescEnd

-- 队伍Id
x200022_g_GroupId = 0

-- 护送路线Id
x200022_g_PatrolPathIndex = 4

-- 场景计时器Index
x200022_g_SceneTimerIndex = -1
x200022_g_Step = 0
x200022_g_StartTime = 0
x200022_g_PlayerNum = 0
x200022_g_PlayerId= {-1,-1,-1,-1,-1,-1}

function x200022_DisplayBonus(sceneId, missionIndex)
	
end

--**********************************
--任务入口函数
--**********************************
function x200022_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	--点击该任务后执行此脚本

	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200022_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200022_g_MissionId) > 0)  then
		if GetName(sceneId, targetId) == x200022_g_Name1   then
			x200022_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x200022_CheckAccept(sceneId,selfId) > 0 then
		-- 判断是在副本，
		if GetName(sceneId, targetId) == x200022_g_Name   then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x200022_g_MissionName)
				AddText(sceneId,x200022_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200022_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				for i, item in x200022_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x200022_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200022_g_ScriptId,x200022_g_MissionId)
		end
	end

end

function x200022_OnMissionRefuse()
end

--**********************************
--事件列表选中一项
--**********************************
function x200022_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetName(sceneId, targetId) == x200022_g_Name   then
		if GetNumText() == 0    then
			BeginEvent(sceneId)
				AddText(sceneId,x200022_g_MissionName)
				AddText(sceneId,x200022_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200022_g_MissionTarget)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200022_g_ScriptId,x200022_g_MissionId)
		end
	end
	
end

--**********************************
--列举事件
--**********************************
function x200022_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200022_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200022_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x200022_g_Name1   then
			AddNumText(sceneId, x200022_g_ScriptId,x200022_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x200022_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId, targetId) == x200022_g_Name    then
			AddNumText(sceneId,x200022_g_ScriptId,x200022_g_MissionName,1,-1);
		end
	end

end

--**********************************
-- 
--**********************************
function x200022_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

end

--**********************************
--检测接受条件
--**********************************
function x200022_CheckAccept( sceneId, selfId )
	-- 接任务的条件是，人物达到20级以上，并且完成了前续任务
	if GetLevel(sceneId, selfId) < 40   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200022_g_PreMissionId ) < 1   then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200022_OnAccept( sceneId, selfId, targetId )

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x200022_g_MissionId) > 0   then
		return
	end
	
	if x200022_CheckAccept(sceneId, selfId)  < 1   then
		return
	end

	if x200022_g_Step ~= 0  and x200022_g_Step ~= 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "目标正忙，请稍后。")
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		return
	end
	
	-- 这里的护送需要启动场景的计时器，不能使用任务计时器
	if x200022_g_Step == 0   then
		local ret = AddMission( sceneId,selfId, x200022_g_MissionId, x200022_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end
		
		-- 这个场景计时器，应该是一直被这个活动占用的，所以，只要这个值不等于-1，就不要再申请
		if x200022_g_SceneTimerIndex == -1  then
			x200022_g_SceneTimerIndex = SetTimer(sceneId, selfId, x200022_g_ScriptId, "OnSceneTimer", 1)
		end
		
		x200022_g_StartTime = LuaFnGetCurrentTime()
		x200022_g_Step = 1
		
		x200022_g_PlayerId[1] = selfId
		x200022_g_PlayerNum = 1
		
		Msg2Player(  sceneId, selfId,"#Y接受任务：虽万千人吾往矣",MSG2PLAYER_PARA )
	end
	
	if x200022_g_Step == 2   then
		-- 把这个玩家加到护送列表中去
		if x200022_g_PlayerNum >= 6   then
			-- 本次参加护送的人数满了，不能再＋你
			Msg2Player(  sceneId, selfId,"#Y参加这次护送的人已经满了，请等下次" , MSG2PLAYER_PARA )
			return
		end
		
		local ret = AddMission( sceneId,selfId, x200022_g_MissionId, x200022_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end
		
		x200022_g_PlayerNum = x200022_g_PlayerNum + 1
		x200022_g_PlayerId[x200022_g_PlayerNum] = selfId
		Msg2Player(  sceneId, selfId,"#Y接受任务：虽万千人吾往矣",MSG2PLAYER_PARA )
	end
	
end

--**********************************
--场景Timer
--**********************************
function x200022_OnSceneTimer( sceneId, selfId )
	--PrintNum(x200022_g_Step)

	if x200022_g_Step < 3  then
		local nSelfId = -1
		local bHavePlayer = 0
	--	if LuaFnIsObjValid(sceneId, nSelfId)==1  and
	--		 LuaFnIsCanDoScriptLogic(sceneId, nSelfId) == 0   then
			for i=1, x200022_g_PlayerNum  do	
				if x200022_g_PlayerId[i] ~= -1  then
					if LuaFnIsObjValid(sceneId, x200022_g_PlayerId[i])==1  and
						 LuaFnIsCanDoScriptLogic(sceneId, x200022_g_PlayerId[i]) == 1   then
						bHavePlayer = 1
						nSelfId = x200022_g_PlayerId[i]
						
						break
					end
				end
			end
	--	else
	--		bHavePlayer = 1
	--	end
		
		if bHavePlayer == 0   then
			-- 计时器停止，清除所有的全局变量
			x200022_g_Step = 0
			x200022_g_StartTime = 0
			x200022_g_PlayerId[1] = -1
			x200022_g_PlayerId[2] = -1
			x200022_g_PlayerId[3] = -1
			x200022_g_PlayerId[4] = -1
			x200022_g_PlayerId[5] = -1
			x200022_g_PlayerId[6] = -1
			x200022_g_PlayerNum = 0
			x200022_g_StartTime = 0
			
			return
		end
		--end
	end
	
	-- 检测只要乔峰和阿珠中的任何一个人不在场景中了，就清空所有的全局变量
	local nNpcNum = GetMonsterCount(sceneId)
	local kk = 0
	local bHaveQiao = 0
	for kk = 0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,kk)
		if GetName(sceneId, nNpcId)  == "乔峰"  then
			bHaveQiao = 1+bHaveQiao
		end
		
		if GetName(sceneId, nNpcId)  == "阿朱"  then
			bHaveQiao = 1+bHaveQiao
		end
	end
	
	if 	bHaveQiao ~= 2   then
		--StopTimer(sceneId, x200022_g_SceneTimerIndex)
		--x200022_g_SceneTimerIndex = -1
		x200022_g_Step = 0
		x200022_g_StartTime = 0
		x200022_g_PlayerId[1] = -1
		x200022_g_PlayerId[2] = -1
		x200022_g_PlayerId[3] = -1
		x200022_g_PlayerId[4] = -1
		x200022_g_PlayerId[5] = -1
		x200022_g_PlayerId[6] = -1
		x200022_g_PlayerNum = 0
		x200022_g_StartTime = 0
		
		return
	end
	
	
	if x200022_g_Step == 1   then
		-- 给小队的所有玩家发送一起护送的邀请
		--local groupId = AllocateMonsterGroup(sceneId)
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nQiaofenId = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "乔峰"  then
				nQiaofenId = nMonsterId
				bHaveMonster = 1
			end
		end
		
		for i=1, x200022_g_PlayerNum  do	
			if x200022_g_PlayerId[i] ~= -1  then
				if LuaFnIsObjValid(sceneId, x200022_g_PlayerId[i])==1  and
					 LuaFnIsCanDoScriptLogic(sceneId, x200022_g_PlayerId[i]) == 1   then
					bHavePlayer = 1
					nSelfId = x200022_g_PlayerId[i]
					
					break
				end
			end
		end
--		PrintNum(nSelfId)
--		PrintNum(x200022_g_PlayerNum)
		local nTeamCount = GetNearTeamCount(sceneId, nSelfId)
		for i=0, nTeamCount-1 do
			local PlayerId = GetNearTeamMember(sceneId, nSelfId, i)
			if PlayerId ~= nSelfId    then
				CallScriptFunction((200022), "OnDefaultEvent", sceneId, PlayerId, nQiaofenId )
			end
		end
		
		-- 记下这个接了任务的玩家
		--x200022_g_PlayerNum = 1
		--x200022_g_PlayerId[1]= nSelfId
		x200022_g_StartTime = LuaFnGetCurrentTime()
		
		x200022_g_Step = 2

		CallScriptFunction((200060), "Paopao",sceneId, "乔峰", "洛阳", "#{juqing_start_007}")
		
	elseif x200022_g_Step == 2   then
		-- 等待5秒，这个时间是等待别的玩家一起进行这个护送的时间
		if LuaFnGetCurrentTime() - x200022_g_StartTime > 5   then
			CallScriptFunction((200060), "Paopao",sceneId, "乔峰", "洛阳", "#{juqing_start_008}")
			x200022_g_Step = 3
			return
		end
		
	elseif x200022_g_Step == 3   then
		CallScriptFunction((200060), "Paopao",sceneId, "乔峰", "洛阳", "#{juqing_start_009}")
		
		-- 申请一个巡逻组，开始走
		--local groupId = AllocateMonsterGroup(sceneId)

		-- 原来是用的是申请一个新的巡逻组，现在使用一个固定的巡逻组来完成
		-- 在开始这个群体护送前，现清空一下这个组
		ReleaseMonsterGroup(sceneId, x200022_g_GroupId)
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local nHaveMonster = 0
		local nQiaofenId = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "阿朱"  then
				AddGroupMember(sceneId, x200022_g_GroupId, nMonsterId, 2, 1)
				SetConvoyNPC(sceneId, nMonsterId, 1)
				nHaveMonster = nHaveMonster + 1
			end
			if GetName(sceneId, nMonsterId)  == "乔峰"  then
				AddGroupLeader(sceneId, x200022_g_GroupId, nMonsterId)
				nQiaofenId = nMonsterId
				nHaveMonster = nHaveMonster + 1
			end
		end
		SetIntervalDistOfGroupMember(sceneId, x200022_g_GroupId, 1)
		
		RefixPosOfGroupMember(sceneId,x200022_g_GroupId,nQiaofenId)
		--得到护送巡逻路线
		SetPatrolId(sceneId, nQiaofenId, x200022_g_PatrolPathIndex)
		
		x200022_g_Step = 4
		
	elseif x200022_g_Step == 4   then
	
		-- 计时器每次检测玩家是不是有任务失败的情况出现，
		for i=1, x200022_g_PlayerNum  do
			-- 如果玩家离开了场景，就任务失败
			if x200022_g_PlayerId[i] ~= -1   then
				if LuaFnIsObjValid(sceneId, x200022_g_PlayerId[i])==0  or
					 LuaFnIsCanDoScriptLogic(sceneId, x200022_g_PlayerId[i]) == 0  then
					x200022_g_PlayerId[i] = -1
				end	
			end
		end
		
		-- 在这里添加洛阳居民的泡泡，增加气氛
		
		
		-- 检测护送的完成条件，乔峰 走到了目标点
		local nMonsterNum = GetMonsterCount(sceneId)
		local jj = 0
		local bHaveMonster = 0
		for jj=0, nMonsterNum-1 do
			local nMonsterId = GetMonsterObjID(sceneId,jj)
			if GetName(sceneId, nMonsterId)  == "乔峰"  then
				-- 判断乔峰是不是走到了
				local targetX, targetZ = GetWorldPos(sceneId, nMonsterId)
				local x, z = GetLastPatrolPoint(sceneId, x200022_g_PatrolPathIndex)
				local distance = floor(sqrt((targetX-x)*(targetX-x)+(targetZ-z)*(targetZ-z)))
				
				if distance<=2   then
					x200022_g_Step = 5
					-- 通知所有人，护送成功
					for i=1, x200022_g_PlayerNum   do
						if x200022_g_PlayerId[i]~=-1   then
							local misIndex = GetMissionIndexByID(sceneId, x200022_g_PlayerId[i], x200022_g_MissionId)--得到任务在20个任务中的序列号
							SetMissionByIndex(sceneId, x200022_g_PlayerId[i], misIndex, 0, 1)
							BeginEvent(sceneId)
								AddText(sceneId, "护送乔峰成功。")
							EndEvent()
							DispatchMissionTips(sceneId, x200022_g_PlayerId[i])
						end
					end
				end
			end
		end
		
	elseif x200022_g_Step == 5  then
		--喊话剧情
		CallScriptFunction((200060), "Paopao",sceneId, "徐惊雷", "洛阳", "#{JQ_PaoPao_79}") 
		x200022_g_Step = 6
		x200022_g_StartTime = LuaFnGetCurrentTime()
		
	elseif x200022_g_Step == 6  then
		if LuaFnGetCurrentTime()-x200022_g_StartTime > 3   then
			CallScriptFunction((200060), "Paopao",sceneId, "乔峰", "洛阳", "#{JQ_PaoPao_80}")
			x200022_g_Step = 7
			x200022_g_StartTime = LuaFnGetCurrentTime()
		end
		
	elseif x200022_g_Step == 7  then
		if LuaFnGetCurrentTime()-x200022_g_StartTime > 3   then
			CallScriptFunction((200060), "Paopao",sceneId, "徐惊雷", "洛阳", "#{JQ_PaoPao_81}")
			x200022_g_Step = 8
			x200022_g_StartTime = LuaFnGetCurrentTime()
		end
		
	elseif x200022_g_Step == 8  then
		if LuaFnGetCurrentTime()-x200022_g_StartTime > 5   then
		
			-- 计时器停止，清除所有的全局变量
			--StopTimer(sceneId, x200022_g_SceneTimerIndex)
			
			--x200022_g_SceneTimerIndex = -1
			x200022_g_Step = 0
			x200022_g_StartTime = 0
			x200022_g_PlayerId[1] = -1
			x200022_g_PlayerId[2] = -1
			x200022_g_PlayerId[3] = -1
			x200022_g_PlayerId[4] = -1
			x200022_g_PlayerId[5] = -1
			x200022_g_PlayerId[6] = -1
			x200022_g_PlayerNum = 0
			x200022_g_StartTime = 0
			
			--删除乔峰和阿朱
		  local nMonsterNum = GetMonsterCount(sceneId)
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "乔峰"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
				end
				
				if GetName(sceneId, nMonsterId)  == "阿朱"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
				end
			end
		end	
	end
	
end

--**********************************
--放弃
--**********************************
function x200022_OnAbandon( sceneId, selfId )
  --将护送npc瞬移回原来位置
  DelMission(sceneId, selfId, x200022_g_MissionId)
  
end

--**********************************
--继续
--**********************************
function x200022_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200022_g_Name)
		AddText(sceneId,x200022_g_MissionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200022_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200022_g_MoneyBonus )
		for i, item in x200022_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200022_g_ScriptId, x200022_g_MissionId)

end

--**********************************
--检测是否可以提交
--**********************************
function x200022_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200022_g_MissionId)--得到任务在20个任务中的序列号
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete == 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x200022_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	-- 检测是不是满足完成任务的条件
	if x200022_CheckSubmit(sceneId, selfId) ~= 1 then 
		return
	end
	BeginAddItem(sceneId)
	for i, item in x200022_g_RadioItemBonus do
		if item.id == selectRadioId then
			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--添加任务奖励
	if ret < 1 then
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "背包已满,无法完成任务"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	AddItemListToHuman(sceneId,selfId)

	AddMoney(sceneId,selfId,x200022_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200022_g_exp)
	
	DelMission( sceneId,selfId, x200022_g_MissionId )
	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x200022_g_MissionId )
	Msg2Player(  sceneId, selfId,"#Y完成任务：虽万千人吾往矣",MSG2PLAYER_PARA )

end

function x200022_OnHumanDie(sceneId, selfId)

end

--**********************************
--定时事件
--**********************************
function x200022_OnTimer(sceneId,selfId)--,missionIndex)
	
end


