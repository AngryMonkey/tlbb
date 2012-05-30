-- 200036 金戈荡寇鏖兵
-- 苍茫山的重要剧情

-- 再在副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200036_g_ScriptId = 200036

--副本名称
x200036_g_CopySceneName="苍茫山"

--任务号
x200036_g_MissionId = 31

--前续任务
x200036_g_PreMissionId = 30

--目标NPC
x200036_g_Name = "萧峰"

--是否是精英任务
x200036_g_IfMissionElite = 1

--任务等级
x200036_g_MissionLevel = 50

--任务归类
x200036_g_MissionKind = 52

--任务文本描述
x200036_g_MissionName="金戈荡寇鏖兵"
x200036_g_MissionInfo="#{Mis_juqing_0031}"
x200036_g_MissionTarget="#{Mis_juqing_Tar_0031}"	--任务目标
x200036_g_MissionComplete="    $N，这一下叛军军心已经涣散了，不要着急，我们步步为营，把叛乱彻底平息。"	--完成任务npc说话的话
x200036_g_MissionContinue="  楚王已经被杀，皇太叔也已经在我们手中了。"

x200036_g_MoneyBonus=36000
x200036_g_exp=40800

x200036_g_RadioItemBonus={{id=10423012 ,num=1},{id=10423013,num=1},{id=10423014,num=1}}

x200036_g_Custom	= { {id="已杀死楚王",num=1},{id="已进入皇太叔御帐",num=1} }
--x200036_g_Custom	= { {id="已进入皇太叔御帐",num=1} }
x200036_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200036_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200036_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200036_g_MissionName)
			AddText(sceneId,x200036_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200036_g_MoneyBonus )
		EndEvent( )
		bDone = x200036_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200036_g_ScriptId,x200036_g_MissionId,bDone)
    --满足任务接收条件
  elseif x200036_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200036_g_MissionName)
			AddText(sceneId,x200036_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200036_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			for i, item in x200036_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			AddMoneyBonus( sceneId, x200036_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200036_g_ScriptId,x200036_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200036_OnEnumerate( sceneId, selfId, targetId )
  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200036_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200036_g_MissionId) > 0 then
		AddNumText(sceneId,x200036_g_ScriptId,x200036_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x200036_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200036_g_ScriptId,x200036_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200036_CheckAccept( sceneId, selfId )

	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200036_g_MissionId) > 0 ) then
		return 0
	end
	
	--需要4级才能接
		if GetLevel( sceneId, selfId ) < x200036_g_MissionLevel then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200036_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200036_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200036_g_MissionId, x200036_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200036_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：金戈荡寇鏖兵",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200036_g_SignPost.x, x200036_g_SignPost.z, x200036_g_SignPost.tip )

	SetMissionEvent(sceneId, selfId, x200036_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200036_g_MissionId, 1)

	-- 开始第二段剧情
	if LuaFnGetCopySceneData_Param(sceneId, 8) < 3  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 3)
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	end
	
--	--检测场景中是不是有楚王，如果没有，放一个出来
--	local nMonsterNum = GetMonsterCount(sceneId)
--	
--	local ii = 0
--	local bHaveMonster = 0
--	for ii=0, nMonsterNum-1 do
--		local nMonsterId = GetMonsterObjID(sceneId,ii)
--		
--		if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
--			return
--		end
--	end
--	-- 创建怪物
--	--PrintStr("创建楚王")
--	local nNpcId = LuaFnCreateMonster(sceneId, 406, 77, 44, 1, 0, -1)
--	SetCharacterName(sceneId, nNpcId, "耶律涅鲁古")
--	SetCharacterTitle(sceneId, nNpcId, "楚王")
--	
--	local nNpcId1 = LuaFnCreateMonster(sceneId, 422, 45, 105, 1, 0, -1)
--	SetCharacterName(sceneId, nNpcId1, "耶律重元")
--	SetCharacterTitle(sceneId, nNpcId1, "黄太叔")
	
end

--**********************************
--放弃
--**********************************
function x200036_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200036_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200036_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200036_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200036_g_MissionName)
		AddText(sceneId,x200036_g_MissionComplete)
		AddMoneyBonus( sceneId, x200036_g_MoneyBonus )
		for i, item in x200036_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200036_g_ScriptId,x200036_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200036_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200036_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200036_g_MissionId)
	if GetMissionParam(sceneId,selfId, misIndex, 0) < 1  then
		return 0
	end

	if LuaFnGetCopySceneData_Param(sceneId, 8) > 7  then
		return 1
	end
	
	return 0

end

--**********************************
--提交
--**********************************
function x200036_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x200036_CheckSubmit(sceneId, selfId) == 1  then
		--添加任务奖励
  	BeginAddItem(sceneId)
		for i, item in x200036_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId, x200036_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200036_g_exp)

		DelMission( sceneId, selfId, x200036_g_MissionId )
		MissionCom( sceneId, selfId, x200036_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：金戈荡寇鏖兵",MSG2PLAYER_PARA )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x200036_OnKillObject( sceneId, selfId, objdataId ,objId)
	
end

--**********************************
--进入区域事件
--**********************************
function x200036_OnEnterArea( sceneId, selfId, zoneId )
	if 1==1  then
		return
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200036_g_MissionId)
	
	if GetMissionParam(sceneId,selfId,misIndex,4) == 0  then
	
		if zoneId == 1 or zoneId == 2  then
			
			-- 检测场景中是不是有楚王，如果没有，放一个出来
			local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				
				if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
					bHave = 1
				end
			end
			
			if bHave == 1    then
				-- 设置各个角色的势力声望
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					
					if GetName(sceneId, nMonsterId)  == "耶律涅鲁古"  then
						SetUnitReputationID(sceneId, selfId, nMonsterId, 18)
						SetMonsterFightWithNpcFlag(sceneId, nMonsterId, 1)
	
						-- 楚王在改变阵营可以攻击后，按照2号路线往回跑，
						SetPatrolId(sceneId, nMonsterId, 2)
						--PrintStr("楚王跑")
					end
					
					if GetName(sceneId, nMonsterId)  == "萧峰"  then
						-- 同时萧峰按照3号路线跑，
						SetPatrolId(sceneId, nMonsterId, 1)
						--PrintStr("萧峰追")
	
					end
				end
				
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)
				SetMissionByIndex(sceneId,selfId,misIndex,4,1)
			end
		end	
	end
	
	-- 玩家进入事件区1，任务完成
	if zoneId == 3  then
		if GetMissionParam(sceneId,selfId,misIndex,3) == 0  then
			if GetMissionParam(sceneId,selfId,misIndex,1) == 1  then
				-- 玩家进入了区域3，这时候，检测萧峰，删除，然后在位置创建萧峰抓住
				-- 所有的士兵不再战斗，
				SetMissionByIndex(sceneId,selfId,misIndex,3,1)
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
					
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)
					
					-- 剧情喊话
					LuaFnSetCopySceneData_Param(sceneId, 8, 4)
					LuaFnSetCopySceneData_Param(sceneId, 13, 0)
					LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
					
					
				end
			end
		end
	end
end

--**********************************
--道具改变
--**********************************
function x200036_OnItemChanged( sceneId, selfId, itemdataId )
end

