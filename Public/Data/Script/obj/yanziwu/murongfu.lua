-- 402254
-- 慕容复

x402254_TBL = 
{
IDX_TimerPrepare = 1,
IDX_TimerInterval = 2,
IDX_FlagCombat = 1,
BossSkill = 1002,
PrepareTime = 60000,
SkillInterval = 60000,
BossBuff = 9998
}

-- 王语言开始点名的开关
x402254_g_bWangyuyanSpeak = 24
x402254_g_DuanAndWangFlag = 29

--**********************************
-- 自己死亡
--**********************************
function x402254_OnDie( sceneId, selfId, killerId )

	LuaFnNpcChat(sceneId, selfId, 0, "难道我大燕的复国霸业，终究只是黄粱一梦？")

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- 停止点名
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
	
	-- 删除段誉语嫣等人
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "王语嫣")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "段誉")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "巴天石")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "范骅")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "褚万里")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "古笃诚")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "傅思归")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "朱丹臣")
	
	x402254_TipAllHuman( sceneId, "慕容复已被打败，讨伐燕子坞成功，请从出口回到太湖。" )
	
	--LuaFnDeleteMonster(sceneId, selfId)
	
	-- 发世界公告
--#w【队长名】#P与#{_BOSS0}单挑，却暗使队友在其身后砸板砖、使绊子、敲闷棍、洒石灰……无所不用，终于将#{_BOSS0}打得大败，落荒而逃，一举攻下了燕子坞。
--#w【队长名】#P率领队友与#{_BOSS0}酣战半日，忽而领悟到武学的真谛，顿时武功暴涨，#{_BOSS0}抵敌不过，只得落荒而逃，燕子坞遂陷。
--#w【队长名】#P在燕子坞调兵遣将，运筹帷幄，在使用了瞒天过海，暗度陈仓等三十六计之后，打得#{_BOSS0}只得使用第三十七计逃之夭夭了。
	
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
		--如果组了队则获取队长的ID....
	local nLeaderId = GetTeamLeader(sceneId, playerID)
	if nLeaderId < 1   then
		nLeaderId = playerID
	end
	local str = ""
	local ran = random(3)
	if ran == 1  then
		str = format("#W#{_INFOUSR%s}#P与#{_BOSS0}单挑，却暗使队友在其身后砸板砖、使绊子、敲闷棍、洒石灰……无所不用，终于将#{_BOSS0}打得大败，落荒而逃，一举攻下了燕子坞。", GetName(sceneId,nLeaderId))
	elseif ran == 2  then
		str = format("#W#{_INFOUSR%s}#P率领队友与#{_BOSS0}酣战半日，忽而领悟到武学的真谛，顿时武功暴涨，#{_BOSS0}抵敌不过，只得落荒而逃，燕子坞遂陷。", GetName(sceneId,nLeaderId))
	else
		str = format("#W#{_INFOUSR%s}#P在燕子坞调兵遣将，运筹帷幄，在使用了瞒天过海，暗渡陈仓等三十六计之后，打得#{_BOSS0}只得使用第三十七计逃之夭夭了。", GetName(sceneId,nLeaderId))
	end
	
	BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
	
	
end

--**********************************
-- 心跳
--**********************************
function x402254_OnHeartBeat(sceneId, selfId, nTick)

	-- 当慕容复血量掉到50%的时候，让 王语嫣 点名，同时段誉佯攻
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat)) then
			--PrintNum(1)
			-- 如果 慕容复 血少于多少，就怎么样子
			if LuaFnGetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak) == 0  then
				if GetHp(sceneId, selfId)*2 <= GetMaxHp(sceneId, selfId) then
					LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 1)
				end
			end
		else
			--PrintNum(2)
		end
	end

--	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
--		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat)) then
--			--Countdown TimerPrepare
--			local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare)
--			if(0<TimePrepare) then
--				TimePrepare = TimePrepare - nTick;
--				MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, TimePrepare)
--			else
--				local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval)
--				if(0<TimeInterval) then
--					--Countdown TimerInterval
--					TimeInterval = TimeInterval - nTick;
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, TimeInterval)
--				else
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, x402254_TBL.SkillInterval)
--					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
--					if(-1~=nTarget) then
--						local posX, posZ = GetWorldPos(sceneId,nTarget)
--						local fDir = 0.0
--						LuaFnUnitUseSkill(sceneId, selfId, x402254_TBL.BossSkill, nTarget, posX, posZ, fDir)			
--						LuaFnNpcChat(sceneId, selfId, 0, "尝尝浔阳江上的烈焰吧！")
--					end
--				end
--			end
--		end
--	end
end

--**********************************
-- 初始化
--**********************************
function x402254_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)
end

--**********************************
-- 杀死玩家
--**********************************
function x402254_OnKillCharacter(sceneId, selfId, targetId)
--	if(-1~=targetId) then
--		local szTarget = GetName(sceneId, targetId)
--		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. "，你就算再厉害十倍，遇上爷爷也只有死路一条！")
--	end
end

--**********************************
-- 进入战斗
--**********************************
function x402254_OnEnterCombat(sceneId, selfId, enmeyId)
	if(0<x402254_TBL.BossBuff) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402254_TBL.BossBuff, 0)
	end
	
	-- 进入战斗状态，
	LuaFnNpcChat(sceneId, selfId, 0, "无名鼠辈，安敢坏我复国大计！真是找死！")
	
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, x402254_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 1)
	
	CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "王姑娘，你看这里兵马凶险，不如我护着你先走好吗？")
	CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "表哥不走，我也不会走的，我要留下来帮表哥。")

end

--**********************************
-- 脱离战斗
--**********************************
function x402254_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- 删除段誉语嫣等人
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "王语嫣")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "段誉")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "巴天石")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "范骅")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "褚万里")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "古笃诚")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "傅思归")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "朱丹臣")

	-- 从新在场景中生成这些Npc
	CallScriptFunction((401040), "CreateMonster_11",sceneId)

	-- 停止点名
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
end

--**********************************
--提示所有副本内玩家
--**********************************
function x402254_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end
