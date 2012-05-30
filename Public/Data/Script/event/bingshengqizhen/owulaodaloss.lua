--缥缈峰副本....
--战败乌老大对话脚本....

--脚本号
x402092_g_ScriptId = 402092

--副本逻辑脚本号....
x402092_g_FuBenScriptId = 402080


--**********************************
--任务入口函数....
--**********************************
function x402092_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText( sceneId, "    #居然能让中原人站在我的面前？一帮废物，死不足惜！今天吾就让你尝尝本将军的厉害~~拿命来......" )

		--判断当前是否可以挑战李秋水....	
		if 1 == CallScriptFunction( x402092_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
			AddNumText( sceneId, x402092_g_ScriptId, "决战耶律连城？", 10, 1 )
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x402092_OnEventRequest( sceneId, selfId, targetId, eventId )

	--如果正在激活BOSS则返回....
	if 1 == CallScriptFunction( x402092_g_FuBenScriptId, "IsPMFTimerRunning", sceneId ) then
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
	if 1 ~= CallScriptFunction( x402092_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" ) then
		return
	end

	--如果正在和别的BOSS战斗则返回....
--	local ret, msg = CallScriptFunction( x402092_g_FuBenScriptId, "CheckHaveBOSS", sceneId )
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
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui5_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return

		elseif (lev<=110  	and lev>  100 ) then
		--建立BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui4_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return

		elseif (lev<=100  	and lev>  90 ) then
		--建立BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui3_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return

		elseif (lev<=90  	and lev>  80 ) then
		--建立BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui2_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
		return
	
		elseif (lev<=80  	and lev>  70 ) then
		--建立BOSS....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui1_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "yuanshen_BOSS", -1, -1 )
		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "tiegu_BOSS", -1, -1 )
	--开启缥缈峰计时器来激活自己....
	CallScriptFunction( x402092_g_FuBenScriptId, "OpenPMFTimer", sceneId, 7, x402092_g_ScriptId, -1 ,-1 )
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

end

--**********************************
--缥缈峰计时器的OnTimer....
--**********************************
function x402092_OnPMFTimer( sceneId, step, data1, data2 )

	if 7 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗5秒钟后开始" )
		return
	end

	if 6 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗4秒钟后开始" )
		return
	end

	if 5 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗3秒钟后开始" )
		return
	end

	if 4 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗2秒钟后开始" )
		return
	end

	if 3 == step then
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗1秒钟后开始" )
		return
	end

	if 2 == step then
		--提示战斗开始....
		CallScriptFunction( x402092_g_FuBenScriptId, "TipAllHuman", sceneId, "战斗开始" )
		--删除NPC....
--		CallScriptFunction( x402092_g_FuBenScriptId, "DeleteBOSS", sceneId, "LiQiuShui_NPC" )
		return
	end

	if 1 == step then
		--建立BOSS....
--		CallScriptFunction( x402092_g_FuBenScriptId, "CreateBOSS", sceneId, "LiQiuShui1_BOSS", -1, -1 )
		return
	end

end
end