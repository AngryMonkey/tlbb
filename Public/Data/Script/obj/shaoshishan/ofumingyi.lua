--缥缈峰副本....
--符敏仪对话脚本....

--脚本号
x890073_g_ScriptId = 890073

--副本逻辑脚本号....
x890073_g_FuBenScriptId = 890063

--震慑buff表....
x890073_g_ZhenSheBuffTbl = { 10264, 10265, 10266 }
--有趣buff表....
x890073_g_YouQuBuffTbl = { 10261, 10262, 10263 }


--**********************************
--任务入口函数....
--**********************************
function x890073_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "少侠要想在少室山立足，必须先打败庄聚贤和慕容复，再来我这里领取战斗任务。" )

		--判断当前是否可以挑战双子....	
		if 1 == CallScriptFunction( x890073_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
			AddNumText( sceneId, x890073_g_ScriptId, "挑战凶神恶煞", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x890073_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x890073_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
		return
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		BeginEvent(sceneId)
			AddText( sceneId, "#{PMF_20080521_07}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--判断当前是否可以挑战双子....	
	if 1 ~= CallScriptFunction( x890073_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" ) then
		return
	end

	--如果正在和别的BOSS战斗则返回....
	local ret, msg = CallScriptFunction( x890073_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x890073_g_FuBenScriptId, "OpenPMFTimer", sceneId, 16, x890073_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x890073_OnPMFTimer( sceneId, step, data1, data2 )

	if 16 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_165}" )
		return
	end

	if 13 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_164}" )
		return
	end

	if 10 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_170}" )
		return
	end

	if 7 == step then
		MonsterTalk(sceneId, -1, "", "#{CJG_101231_181}" )
		x890073_UseZhenShe( sceneId )
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗5秒钟后开始" )
		return
	end

	if 6 == step then
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗4秒钟后开始" )
		return
	end

	if 5 == step then
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗3秒钟后开始" )
		return
	end

	if 4 == step then
		MonsterTalk(sceneId, -1, "", "#{PMF_20080530_04}" )
		x890073_UseYouQu( sceneId )
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗2秒钟后开始" )
		return
	end

	if 3 == step then
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗1秒钟后开始" )
		return
	end

	if 2 == step then
		--提示战斗开始....
		CallScriptFunction( x890073_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		return
	end

	if 1 == step then
		--建立BOSS....
		CallScriptFunction( x890073_g_FuBenScriptId, "CreateBOSS", sceneId, "YaoBoDang_BOSS", -1, -1 )
		CallScriptFunction( x890073_g_FuBenScriptId, "CreateBOSS", sceneId, "SiMaLing_BOSS", -1, -1 )
		return
	end

end

--**********************************
--发动震慑....
--**********************************
function x890073_UseZhenShe( sceneId )

	local bossId = CallScriptFunction( x890073_g_FuBenScriptId, "FindBOSS", sceneId, "LiFan_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x890073_g_ZhenSheBuffTbl) )
	local buffId = x890073_g_ZhenSheBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end

--**********************************
--发动有趣....
--**********************************
function x890073_UseYouQu( sceneId )

	local bossId = CallScriptFunction( x890073_g_FuBenScriptId, "FindBOSS", sceneId, "LiFan_NPC" )
	if bossId == -1 then
		return
	end

	local idx = random( getn(x890073_g_YouQuBuffTbl) )
	local buffId = x890073_g_YouQuBuffTbl[idx]

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
		end
	end

end
