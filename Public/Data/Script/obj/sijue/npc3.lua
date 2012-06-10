--缥缈峰副本....
--哈大霸对话脚本....

--脚本号
x910003_g_ScriptId = 910003

--副本逻辑脚本号....
x910003_g_FuBenScriptId = 899992

--**********************************
--任务入口函数....
--**********************************
function x910003_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "#{PMF_20080521_06}" )
		AddNumText( sceneId, x910003_g_ScriptId, "挑战", 10, 1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x910003_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x910003_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
--	local ret, msg = CallScriptFunction( x910003_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
--	if 1 == ret then
--		BeginEvent(sceneId)
--			AddText( sceneId, msg )
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--		return
--	end
        local	lev	= GetLevel( sceneId, selfId )
		if ( lev>  110 ) then
		--建立BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa6_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--建立BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--建立BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--建立BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--建立BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
		return

		elseif (lev<=70  	and lev>  1 ) then
		--建立BOSS....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "WuLaoDa_NPC" )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "mohu5_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying1_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying2_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying3_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying4_BOSS", -1, -1 )
		CallScriptFunction( x910003_g_FuBenScriptId, "CreateBOSS", sceneId, "qingying5_BOSS", -1, -1 )
--		return
--	end
	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x910003_g_FuBenScriptId, "OpenPMFTimer", sceneId, 6, x910003_g_ScriptId, -1 ,-1 )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x910003_OnPMFTimer( sceneId, step, data1, data2 )

	if 6 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗5秒钟后开始" )
		return
	end

	if 5 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗4秒钟后开始" )
		return
	end

	if 4 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗3秒钟后开始" )
		return
	end

	if 3 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗2秒钟后开始" )
		return
	end

	if 2 == step then
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗1秒钟后开始" )
		return
	end

	if 1 == step then
		--提示战斗开始....
		CallScriptFunction( x910003_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
--		CallScriptFunction( x910003_g_FuBenScriptId, "DeleteBOSS", sceneId, "SangTuGong_NPC" )
		return
	end

--	if 1 == step then

	end

--end
end
