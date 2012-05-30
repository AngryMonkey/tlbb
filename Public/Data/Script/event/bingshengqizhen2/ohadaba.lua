--缥缈峰副本....
--哈大霸对话脚本....

--脚本号
x402075_g_ScriptId = 402075

--副本逻辑脚本号....
x402075_g_FuBenScriptId = 402082

--**********************************
--任务入口函数....
--**********************************
function x402075_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "    #我契丹一族定将平定中原，来着何人？报上名来！待我与你切磋切磋！！！" )
		AddNumText( sceneId, x402075_g_ScriptId, "挑战", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x402075_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x402075_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
--	local ret, msg = CallScriptFunction( x402075_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
--	if 1 == ret then
--		BeginEvent(sceneId)
--			AddText( sceneId, msg )
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--		return
--	end
        local	lev	= GetLevel( sceneId, selfId )
		if (lev<=120  	and lev>  110 ) then
		--建立BOSS....
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402075_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa5_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--建立BOSS....
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402075_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa4_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--建立BOSS....
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402075_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa3_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei5_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--建立BOSS....
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402075_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa2_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei5_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--建立BOSS....
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402075_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa1_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei1_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei2_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei3_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei4_BOSS", -1, -1 )
		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "fengzhenshouwei5_BOSS", -1, -1 )
--		return
	CallScriptFunction( x402075_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402075_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x402075_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗5秒钟后开始" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗4秒钟后开始" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗3秒钟后开始" )
		return
	end

	if 4 == step then
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗2秒钟后开始" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗1秒钟后开始" )
		return
	end

	if 2 == step then
		--提示战斗开始....
		CallScriptFunction( x402075_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
--		CallScriptFunction( x402075_g_FuBenScriptId, "DeleteBOSS", sceneId, "HaDaBa_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
--		CallScriptFunction( x402075_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa1_BOSS", -1, -1 )
		return
	end

end
end
