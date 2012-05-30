--水牢任务主事件脚本
--任务
--脚本号
x232000_g_ScriptId	= 232000

--所拥有的事件ID列表
x232000_g_EventList	= { 232001 }

--任务号
x232000_g_MissionId			= 1212
--下一个任务的ID
x232000_g_MissionIdNext	= 1213
--任务目标npc
x232000_g_Name			= "呼延豹"
--任务文本描述
x232000_g_MissionName			= "帮助平定水牢叛乱"
x232000_g_MissionInfo			= "  平定水牢叛乱。"	--任务描述
x232000_g_MissionTarget		= "  苏州的呼延豹#{_INFOAIM244,215,1,呼延豹}让你帮他完成水牢平叛的任务。"	--任务目标
x232000_g_ContinueInfo		= "  任务完成了么?"		--未完成任务的npc对话
x232000_g_MissionComplete	= "  太感谢你了！"		--完成任务npc说的话
--环数上限
--x232000_g_MaxRound	= 20

--环数修改 20-29  1次 30-49  2次 50-69  4次 70-89  7次 90以上 10次 120以上 20次
x232000_g_MaxRoundList = {{lev=20,rnd=1},{lev=30,rnd=2},{lev=50,rnd=4},{lev=70,rnd=7},{lev=90,rnd=10},{lev=120,rnd=20}}

--接取任务的最低等级
x232000_g_minLevel	= 20


--**********************************
--任务入口函数
--**********************************
--点击该任务后执行此脚本
function x232000_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x232000_g_Name then
		return
	end

	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) > 0 then

		local misIndex			= GetMissionIndexByID( sceneId, selfId, x232000_g_MissionId )
		local misRealScript	= GetMissionParam( sceneId, selfId, misIndex, 1 )
		CallScriptFunction( misRealScript, "OnDefaultEvent", sceneId, selfId, targetId )

	--如果未接任务
	else

		--检测等级
		if LuaFnGetLevel( sceneId, selfId ) < x232000_g_minLevel then
			x232000_NotifyTip( sceneId, selfId, "阁下的等级太低，犯人比较厉害，" )
			x232000_NotifyTip( sceneId, selfId, "还是等你到了"..x232000_g_minLevel.."级之后再来找我吧。" )
			return 0
		end

		--取得玩家附近的队友数量（包括自己）
		local i				= 0
		--队员列表
		local lstMem	= { selfId }
		--附近队员的个数
		local numMem	= 1
		if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
			--如果是队长
			if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then
				numMem		= GetNearTeamCount( sceneId, selfId )
				for	i=0, numMem-1 do
					lstMem[i+1] = GetNearTeamMember( sceneId, selfId, i )
				end
			end
		end

		--随机选一个任务
--	local rand	= random( 230011, 230012 )
		local	rand	= x232000_g_EventList[1]
		for	i=1, numMem do
			CallScriptFunction( rand, "OnDefaultEvent", sceneId, lstMem[i], targetId )
		end

	end

end

--**********************************
--列举事件
--**********************************
function x232000_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x232000_g_Name then
		return
	end

	--如果已接任务或满足任务接收条件,则列出任务
	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) > 0 or x232000_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x232000_g_ScriptId, x232000_g_MissionName,4,-1 )
	end

end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x232000_CheckAccept( sceneId, selfId )

	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) > 0 then
		return 0
	end

	-- [ QUFEI 2007-08-27 19:13 UPDATE BugID 23910 ]
	local iDayCount = GetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_TIME )	
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local nData  = (nMonth+1)*100+nDay							
	

	if iDayCount ~= nData then								--不是今天的话则接受次数清 0

		SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT, 0 )
	end

	--检测玩家是否符合接受任务的条件

	local	iDayCount	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )

	local	iTime	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime	= floor( iTime/100 )				--上一次交或放弃任务的时间(天数)
	local iQuarterTime	= mod( iTime, 100 )			--上一次交或放弃任务的时间(一刻种)
	local iDayHuan	= iDayCount	--当天内完成的任务次数

	--------------------------------------------------------
	--local CurTime		= GetHourTime()								--当前时间
	local CurTime		= GetQuarterTime()								--当前时间
	local CurDaytime= floor(CurTime/100)					--当前时间(天)
	

	if iDayTime ~= CurDaytime then	
		iDayHuan	= 0
		iDayCount		= iDayHuan;
		--设置循环任务的时间
		SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, CurTime )
		SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )

	end
	--------------------------------------------------------
	

	if iDayHuan >= x232000_GetMaxRound(sceneId,selfId) then

	--检测是否任务次数已达上限
	--if iDayHuan >= x232000_g_MaxRound then
		x232000_NotifyTip( sceneId, selfId, "今天的任务已经接受超过了规定次数" )
		return 0
	end

	--这里貌似是没用的 注释 by zhangguoxin 090208
	--local CurTime				= GetHourTime()					--当前时间
	--local CurDaytime		= floor( CurTime/100 )	--当前时间(天)
	--local CurQuarterTime= mod( CurTime, 100 ) 	--当前时间(一刻钟)
	--end modified by zhangguoxin 090208
	--------------------------------------------------------
--	if iDayTime == CurDaytime then
--		if CurQuarterTime == iQuarterTime then
--			x232000_NotifyTip( sceneId, selfId, "你现在不能领取这个任务" )
--			return 0
--		end
--	end
	--------------------------------------------------------
	return 1
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x232000_OnAccept( sceneId, selfId, targetId, scriptId )

	--判断该npc是否是对应任务的npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232000_g_Name then
		return
	end

	-- [ QUFEI 2007-08-27 19:13 UPDATE BugID 23910 ]
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local nData  = (nMonth+1)*100+nDay							
	SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_TIME, nData )
	-- PrintNum(nData)

	local	iDayCount	= GetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT )	--当天内接受任务的次数
		
	--检测是否任务次数已达上限


	if iDayCount >= x232000_GetMaxRound(sceneId,selfId) then
	--if iDayCount >= x232000_g_MaxRound then
		x232000_NotifyTip( sceneId, selfId, "今天的任务已经接受超过了规定次数" )
		return
	else
		-- PrintStr("Succesy")
		iDayCount = iDayCount + 1
		-- PrintNum(iDayCount)
		SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT, iDayCount )
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x232000_g_MissionId, scriptId, 0, 0, 1 )
	--得到任务的序列号
	local	misIndex		= GetMissionIndexByID( sceneId, selfId, x232000_g_MissionId )
	--根据序列号把任务变量的第0位置0 (任务完成情况)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0 )
	--根据序列号把任务变量的第1位置为任务脚本号
	SetMissionByIndex( sceneId, selfId, misIndex, 1, scriptId )

	--得到环数
	local	MissionRound= GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )
	--环数增加1
	MissionRound			= MissionRound + 1
	
	--if	MissionRound > x232000_g_MaxRound then
	if	MissionRound > x232000_GetMaxRound(sceneId,selfId) then
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 1 )
	else
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, MissionRound )
	end

end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x232000_OnAbandon( sceneId, selfId )

  DelMission( sceneId, selfId, x232000_g_MissionId )
  --环数不清0，允许自由放弃
	--SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 0 )
	--begin modified by zhangguoxin 090208
	local	iDayCount	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
	--local iDayHuan	= floor( iDayCount/100000 )		--当天内完成的任务次数
	local iDayHuan	= iDayCount		--当天内完成的任务次数
	--local iTime			= mod(iDayCount,100000)
	local iTime			= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime	= floor(iTime/100)						--上一次交或放弃任务的时间(天数)
	
	--local CurTime		= GetHourTime()								--当前时间
	local CurTime		= GetQuarterTime()								--当前时间
	local CurDaytime= floor(CurTime/100)					--当前时间(天)

	if iDayTime ~= CurDaytime then								--不是今天的话则环数清0
		SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT, 0 )
		iDayHuan	= 0
	end

	--iDayCount		= iDayHuan * 100000 + CurTime
	iDayCount		= iDayHuan;
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, CurTime )
	--设置循环任务的时间
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
	--end modified by zhangguoxin 090208
end

--**********************************
--继续
--**********************************
function x232000_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x232000_CheckSubmit( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) <= 0 then
		return 0
	end

	--得到任务的序列号
	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232000_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, 0 ) == 1 then
		return 1
	end

	return  0
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x232000_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x232000_CheckSubmit( sceneId, selfId ) ~= 1 then
		return
	end

	if DelMission( sceneId, selfId, x232000_g_MissionId ) <= 0 then
		return
	end
	--如果有后续任务，则删除
	if IsHaveMission( sceneId, selfId, x232000_g_MissionIdNext ) > 0 then
		DelMission( sceneId, selfId, x232000_g_MissionIdNext )
	end

	local	Level			= GetLevel( sceneId, selfId )
	--begin modified by zhangguoxin 090208
	local iDayCount	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
	--local iTime			= mod( iDayCount, 100000 )
	local iTime			= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime	= floor( iTime/100 )				--上一次交或放弃任务的时间(天数)
	local iQuarterTime	= mod( iTime, 100 )			--上一次交或放弃任务的时间(刻)
	--local iDayHuan	= floor( iDayCount/100000 )	--当天内完成的任务次数
	local iDayHuan	= iDayCount	--当天内完成的任务次数

	--local CurTime				= GetHourTime()					--当前时间
	local CurTime				= GetQuarterTime()					--当前时间
	local CurDaytime		= floor( CurTime/100 )	--当前时间(天)
	local CurQuarterTime= mod( CurTime, 100 )		--当前时间(刻)

	--上次完成任务是同一天内
	if CurDaytime == iDayTime then
		iDayHuan			= iDayHuan + 1
	--上次完成任务不在同一天，重置
	else
		iDayTime			= CurDaytime
		iQuarterTime	= 0
		iDayHuan			= 1
	end

	local	Reward_Append	= 1
	
	if iDayHuan <= x232000_GetMaxRound(sceneId,selfId) then
	--if iDayHuan <= x232000_g_MaxRound then
		Reward_Append	= 2
	end
	
	--iDayCount	= iDayHuan * 100000 + iDayTime * 100 + iQuarterTime
	iDayCount	= iDayHuan;
	local newTime = iDayTime * 100 + iQuarterTime;
	--设置循环任务的环数
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, newTime )
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
	--begin modified by zhangguoxin 090208
	local	MissionRound	= GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )

	--衰减系数
	local l_Exp		= 0.75
	local l_Money	= (49+Level) / (160+40*Level)
	--计算奖励经验的数量
	local Round		= mod( MissionRound, 10 )
	if Round == 0 then
		Round = 10
	end

	--等级+环数函数，受经验调节常数的影响
	local Exp		= 2400 * (Level+4) * Round * l_Exp / 120
	--等级+环数函数，受经验调节常数的影响
	local Money	= 2400 * (Level+4) * Round * l_Money /120

	if MissionRound > 10 then
		--10环以上，每环额外增加一定经验增量，金钱没有增量
		Exp	= 2400 * (Level+4) * l_Exp / 120 + Exp
	end

	Exp		= Exp * Reward_Append
	Exp		= floor(Exp)
	Money	= floor(Money)

	--增加经验值和钱
	--添加任务奖励
--AddExp( sceneId, selfId, Exp )
	AddMoney( sceneId, selfId, Money )
	--显示对话框
	BeginEvent( sceneId )
--	AddText( sceneId, "  做得不错，这里有" .. Exp .. "点经验值和#{_MONEY"..Money.."}，算是给你的奖励。" )
		AddText( sceneId, "  做得不错，这里有#{_MONEY"..Money.."}，算是给你的奖励。" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	--记录统计信息
	LuaFnAuditShuiLao(sceneId, selfId)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x232000_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x232000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x232000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示的界面
--**********************************
function x232000_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示的界面
--**********************************
function x232000_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--把信送到后显示的界面
--**********************************
function x232000_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x232000_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--取得本事件的MissionId，用于obj文件中对话情景的判断
--**********************************
function x232000_GetEventMissionId( sceneId, selfId )
	return x232000_g_MissionId
end

------------------------------
--取得最多完成次数
------------------------------
function x232000_GetMaxRound(sceneId,selfId)
	
	local	level	= GetLevel( sceneId, selfId )
	local index = 5
	while level < x232000_g_MaxRoundList[index].lev do
		index = index - 1
		if index == 1 then
			break
		end
	end

	return x232000_g_MaxRoundList[index].rnd
  
end
