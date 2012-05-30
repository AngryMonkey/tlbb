--缥缈峰副本....
--战败乌老大对话脚本....

--脚本号
x890075_g_ScriptId = 890075

--副本逻辑脚本号....
x890075_g_FuBenScriptId = 890063


--**********************************
--任务入口函数....
--**********************************
function x890075_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "本人丁春秋。想和我战斗，先打败其他对手再说吧！要小心本人的全屏攻击哦!" )

		--判断当前是否可以挑战李秋水....	
		if 1 == CallScriptFunction( x890075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
			AddNumText( sceneId, x890075_g_ScriptId, "决战丁春秋？", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x890075_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x890075_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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

	--判断当前是否可以挑战李秋水....	
	if 1 ~= CallScriptFunction( x890075_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "DingChunQiu" ) then
		return
	end

	--如果正在和别的BOSS战斗则返回....
	local ret, msg = CallScriptFunction( x890075_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
	if 1 == ret then
		BeginEvent(sceneId)
			AddText( sceneId, msg )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x890075_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x890075_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x890075_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗5秒钟后开始" )
		return
	end

	if 6 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗4秒钟后开始" )
		return
	end

	if 5 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗3秒钟后开始" )
		return
	end

	if 4 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗2秒钟后开始" )
		return
	end

	if 3 == step then
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗1秒钟后开始" )
		return
	end

	if 2 == step then
		--提示战斗开始....
		CallScriptFunction( x890075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
	--local nMonsterNum = GetMonsterCount(sceneId)
	--for i=0, nMonsterNum-1 do
		--local MonsterId = GetMonsterObjID(sceneId,i)
		--if 42206 == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			--LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			--SetCharacterDieTime( sceneId, MonsterId, 1000 )
		--end
	--end
		--CallScriptFunction( x890075_g_FuBenScriptId, "DeleteBOSS", sceneId, "MuRongFuLoss_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
		CallScriptFunction( x890075_g_FuBenScriptId, "CreateBOSS", sceneId, "DingChunQiu_BOSS", -1, -1 )
		return
	end

end
