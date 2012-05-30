--缥缈峰副本....
--桑土公对话脚本....

--脚本号
x402089_g_ScriptId = 402089

--副本逻辑脚本号....
x402089_g_FuBenScriptId = 402080

--**********************************
--任务入口函数....
--**********************************
function x402089_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "    #看来萧逸风不是你的对手，是我小看你了！废话不说，过招吧！！！" )
		AddNumText( sceneId, x402089_g_ScriptId, "挑战", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x402089_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x402089_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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

	--如果正在和别的BOSS战斗则返回....
--	local ret, msg = CallScriptFunction( x402089_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
--	if 1 == ret then
--		BeginEvent(sceneId)
--			AddText( sceneId, msg )
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--		return
--	end

	--判断当前是否可以挑战桑土公....	
	if 1 ~= CallScriptFunction( x402089_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "SangTuGong" ) then
		BeginEvent(sceneId)
			AddText( sceneId, "    #就凭你？先过了萧逸风那一关再来找我吧！" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	        local	lev	= GetLevel( sceneId, selfId )
		if (lev<=120  	and lev>  110 ) then
		--建立BOSS....
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402089_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong5_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--建立BOSS....
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402089_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong4_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--建立BOSS....
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402089_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong3_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--建立BOSS....
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402089_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong2_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei5_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--建立BOSS....
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402089_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong1_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "linzhenshouwei5_BOSS", -1, -1 )

	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x402089_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402089_g_ScriptId, -1, -1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x402089_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗5秒钟后开始" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗4秒钟后开始" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗3秒钟后开始" )
		return
	end

	if 4 == step then
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗2秒钟后开始" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗1秒钟后开始" )
		return
	end

	if 2 == step then
		--提示战斗开始....
		CallScriptFunction( x402089_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
--		CallScriptFunction( x402089_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
--		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "SangTuGong1_BOSS", -1, -1 )
--		CallScriptFunction( x402089_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa1_BOSS", -1, -1 )
		return
	end

end
end