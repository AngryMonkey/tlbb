-- 805044
-- 山鬼boss

x805044_SKILL_TBL = 
{
	[1]	=	{
				IDX_TimerAlarm 	= 1,
				IDX_TimerInterval 	= 2,
				IDX_Count			= 3,
				IDX_State			= 4,						--
				BossSkill			= 1100,
				AlarmTime 			= 0,
				SkillCondition		= 1,						--0:cooldown到就释放	1:血量条件
				SkilCoolDown		= 0,
				SkillBlood			= 10,						--血量低于该值时释放
				TargetType			= 0,						--0:当前target  1:随机玩家
				TargetCord			= 1,						--0:当前target	1:自己
				MsgAlarmType		= 0,						--0:Npc说话		1:场景提示
				MsgAlarm			= "山鬼愤怒的看着周围众人",
				MsgFire				= "",
			}
}


--副本数据索引对照
x805044_g_keySD					= {}
x805044_g_keySD["typ"]			= 0		--设置副本类型
x805044_g_keySD["spt"]			= 1		--设置副本场景事件脚本号
x805044_g_keySD["tim"]			= 2		--设置定时器调用次数
x805044_g_keySD["currStage"]	= 3		--设置定时器调用次数
x805044_g_keySD["scn"]			= 4		--设置副本入口场景号, 初始化
x805044_g_keySD["cls"]			= 5		--设置副本关闭标志, 0开放，1关闭
x805044_g_keySD["dwn"]			= 6		--设置离开倒计时次数
x805044_g_keySD["tem"]			= 7		--保存队伍号
x805044_g_keySD["x"]			= 8			--人物在入口场景中的x位置
x805044_g_keySD["z"]			= 9			--人物在入口场景中的z位置
x805044_g_keySD["killMonsterNum"]	= 10		--杀死怪物数量
x805044_g_keySD["genMonsterNum"]	= 11			--生成怪物数量
x805044_g_keySD["playerLevel"]	= 12		--记录当前副本的级别

--**********************************
-- 自己死亡
--**********************************
function x805044_OnDie( sceneId, selfId, killerId )
	local killNum = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["killMonsterNum"] )	
	killNum = killNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805044_g_keySD["killMonsterNum"], killNum )	
	
	local currStage = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["currStage"] )
	
	if currStage == 1 then
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["genMonsterNum"] )	
		x805044_TipAllHuman(sceneId, "已杀死山鬼  "..killNum.." / "..genNum )
	end
end

--**********************************
-- 心跳
--**********************************
function x805044_OnHeartBeat(sceneId, selfId, nTick)

	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then

		local i = 0;
		for i = 1, getn(x805044_SKILL_TBL) do
			local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval)
			local nCount = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_Count)
			local nState = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_State)
			
			if nState == 0 then
				if x805044_SKILL_TBL[i].SkillCondition == 0 then
					if 0<TimeInterval then
						TimeInterval = TimeInterval - nTick;
						MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval, TimeInterval)
					else
						nState = 1
					end
				end
				
				if x805044_SKILL_TBL[i].SkillCondition == 1   then
					if nCount==0 then
						--x805044_TipAllHuman(sceneId, GetHp(sceneId, selfId) .. "/" .. GetMaxHp(sceneId, selfId))
						if GetHp(sceneId, selfId) < (GetMaxHp(sceneId, selfId)*x805044_SKILL_TBL[i].SkillBlood)/100 then
							nState = 1	
						end
					end
				end
			end
			
			if nState == 1 then
				if( TimeInterval <=0 and x805044_SKILL_TBL[i].MsgAlarm ~= "") then
					if x805044_SKILL_TBL[i].MsgAlarmType == 0 then
						LuaFnNpcChat(sceneId, selfId, 1, x805044_SKILL_TBL[i].MsgAlarm)
					elseif x805044_SKILL_TBL[i].MsgAlarmType == 1 then
						x805044_TipAllHuman(sceneId, x805044_SKILL_TBL[i].MsgAlarm)
					end
				end
				
				nState = 2
			end
			
			
			if nState == 2 then
				--Countdown TimerPrepare
				local TimeAlarm = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm)
				if(0<TimeAlarm) then
					TimeAlarm = TimeAlarm - nTick;
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm, TimeAlarm)
				else
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm, x805044_SKILL_TBL[i].AlarmTime)
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval, x805044_SKILL_TBL[i].SkilCoolDown)
					
					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					
					if x805044_SKILL_TBL[i].TargetType == 1 then
						nTarget = x805044_RandPlayer(sceneId)
					else 
						nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					end
					
					if(-1~=nTarget) then
						
						if (x805044_SKILL_TBL[i].MsgFire ~= "") then
							local msgFire = format(x805044_SKILL_TBL[i].MsgFire, LuaFnGetName(sceneId, nTarget) )
							LuaFnNpcChat(sceneId, selfId, 1, msgFire)
						end
						
						local posX, posZ = GetWorldPos(sceneId,nTarget)
						local fDir = 0.0
						
						if (x805044_SKILL_TBL[i].TargetCord == 1) then
							posX, posZ = GetWorldPos(sceneId,selfId)
						end
						
						LuaFnUnitUseSkill(sceneId, selfId, x805044_SKILL_TBL[i].BossSkill, nTarget, posX, posZ, fDir)
						MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_Count, nCount + 1)	
					end
					
					nState = 0
				end
			end
			
			MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_State, nState)
		end
		
	end
end

--**********************************
-- 初始化
--**********************************
function x805044_OnInit(sceneId, selfId)
	local i = 0;
	for i = 1, getn(x805044_SKILL_TBL) do
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm, x805044_SKILL_TBL[i].AlarmTime)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval, x805044_SKILL_TBL[i].SkilCoolDown)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_Count, 0)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_State, 0)
	end
	
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["genMonsterNum"] )	
	genNum = genNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805044_g_keySD["genMonsterNum"], genNum )
end

--**********************************
-- 杀死玩家
--**********************************
function x805044_OnKillCharacter(sceneId, selfId, targetId)

end

--**********************************
-- 进入战斗
--**********************************
function x805044_OnEnterCombat(sceneId, selfId, enmeyId)

end

--**********************************
-- 脱离战斗
--**********************************
function x805044_OnLeaveCombat(sceneId, selfId)

end

--**********************************
--提示所有副本内玩家
--**********************************
function x805044_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end
end

--随机选择一个玩家
function x805044_RandPlayer( sceneId )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景
	if nHumanNum < 1 then
		return -1
	end
	
	
	local rPlayerIndex = random( nHumanNum )

	local PlayerId = LuaFnGetCopyScene_HumanObjId( sceneId, rPlayerIndex )
	return PlayerId
end
