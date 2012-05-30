-- 311012
-- 漕运，的一些限制，

-- 玩家每杀一个跑漕运的人，系统将会记录一次，并显示在“其他”界面中，显示为“劫漕次数：XX”
-- 该数据每天0点时复位为0
-- 当玩家的劫漕次数>=10时，强行设置其杀气值=10，并复位劫漕次数=0。

--MD_KILL_CAOYUN_PAOSHANG_CT = 150  -- 一天时间里头打劫漕运人的次数
--MD_KILL_CAOYUN_PAOSHANG_PRE_TIME = 151 --上一次打劫时间 

--脚本号
x311012_g_ScriptId = 311012
x311012_TIME_2000_01_03_ = 946828868

--**********************************
-- 被劫之后
--**********************************
function x311012_OnDacoity( sceneId, selfId, Killer )
	-- 先看你是不是被人杀的
	local nKiller = Killer
	if LuaFnIsObjValid(sceneId, nKiller)==1  and
				--LuaFnIsCanDoScriptLogic(sceneId, nKiller) == 1 and
				GetCharacterType(sceneId, nKiller) == 3  then
		-- 如果是宠物杀死，需要转换成人
		nKiller = GetPetCreator(sceneId, nKiller)
	end	

	if nKiller == -1  then
		return
	end
	
	if LuaFnIsObjValid(sceneId, nKiller)==1  and
				LuaFnIsCanDoScriptLogic(sceneId, nKiller) == 1 and
				0 == IsInGuildWar(sceneId, selfId, nKiller) and   --是否是公会战争
				GetCharacterType(sceneId, nKiller) == 1  then
				
		local nDacoityCount = GetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT)
		local nPreTime = GetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME)
		local nCurTime = LuaFnGetCurrentTime()

		-- 看时间是不是过了一天，过了就先更新
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x311012_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x311012_TIME_2000_01_03_)/(3600*24)))   then
			nDacoityCount = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nPreTime)
		end
		
		nDacoityCount = nDacoityCount + 1
		
		if nDacoityCount >= 10  then
			-- 强制设置玩家的杀气为10
			local nPkValue = LuaFnGetHumanPKValue(sceneId, nKiller)
			LuaFnSetHumanPKValue(sceneId, nKiller, 10)
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT, 0)
			
			-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
			local LogInfo	= format( "[ChangePKValue]:CaoYun sceneId=%d, GUID=%0X, CaoYunCount=%d, PKValueBgn=%d, PKValueEnd=%d",
					sceneId,
					LuaFnObjId2Guid( sceneId, selfId ),
					nDacoityCount,
					nPkValue,
					LuaFnGetHumanPKValue(sceneId, nKiller) )
			WriteCheckLog( sceneId, selfId, LogInfo )
			
			local KillGuid = LuaFnObjId2Guid(sceneId, nKiller)
			LuaFnSendMailToGUID(sceneId, KillGuid, "你今天劫漕的次数多达10次，已经影响到其他玩家的正常利益，现暂时封禁你的自由，还望下次行事三思而后行！")

		else
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_CT, nDacoityCount)
			SetMissionData(sceneId, nKiller, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nCurTime)
			BeginEvent(sceneId)
				strText = "你今天劫漕的次数为" .. tostring(nDacoityCount) .. "次，当你劫漕次数达到10次时，将被抓进监狱，还请三思而行！"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nKiller)
		end
	end
end

--**********************************
-- 更新被打劫的数据
--**********************************
function x311012_UpdataDacoityData( sceneId, selfId )

	local nDacoityCount = GetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_CT)
	local nPreTime = GetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	-- 看时间是不是过了一天，过了就先更新
	if (nCurTime - nPreTime  >= 3600*24)  or
		 (floor((nCurTime-x311012_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x311012_TIME_2000_01_03_)/(3600*24)))   then
		nDacoityCount = 0
		nPreTime = nCurTime
		SetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_PRE_TIME, nPreTime)
		SetMissionData(sceneId, selfId, MD_KILL_CAOYUN_PAOSHANG_CT, nDacoityCount)
	end
	
end

