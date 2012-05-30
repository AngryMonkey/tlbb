--白马寺任务主事件脚本
--任务
--脚本号
x230000_g_ScriptId = 230000

--任务号
x230000_g_MissionId = 4011

--任务目标npc
x230000_g_Name ="智清大师"

--任务文本描述
x230000_g_MissionName="白马寺修行"
x230000_g_MissionInfo="阿弥陀佛"  --任务描述
x230000_g_MissionTarget="完成智清的任务"		--任务目标
x230000_g_ContinueInfo="任务做完了么?"		--未完成任务的npc对话
x230000_g_MissionComplete="太谢谢你了"					--完成任务npc说的话

--通用检查脚本
x230000_g_CheckScript=500502

--环数上限
x230000_g_MaxRound=20

--任务奖励


--**********************************
--任务入口函数
--**********************************
function x230000_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	if GetName( sceneId, targetId ) ~= x230000_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果玩家已经接了白马寺任务
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x230000_g_MissionId )
		local realMissionScript = GetMissionParam( sceneId, selfId, misIndex, 1 )

		CallScriptFunction( realMissionScript, "OnDefaultEvent", sceneId, selfId, targetId )
	else
		--如果未接白马寺任务
		--取得玩家附近的队友数量（包括自己）
		local i = 0
		local mems = { selfId }
		local nearteammembercount = 1

		if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
			if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then		-- 是队长
				nearteammembercount = GetNearTeamCount( sceneId, selfId )
				for	i=0, nearteammembercount-1 do
					mems[i+1] = GetNearTeamMember(sceneId, selfId, i)
				end
			end
		end

		local rand = random( 230011, 230012 )
		for	i=1, nearteammembercount do
			CallScriptFunction( rand, "OnDefaultEvent", sceneId, mems[i], targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x230000_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x230000_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接任务或满足任务接收条件,则列出任务
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) > 0 or x230000_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x230000_g_ScriptId, x230000_g_MissionName,4,-1 )
    end
end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x230000_CheckAccept( sceneId, selfId )
	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) > 0 then
		return 0
	end

	--检测是否任务已经达到20个,如果到了,则不能接
	if GetMissionCount( sceneId, selfId ) == 20 then
		x230000_NotifyFailTips( sceneId, selfId, "无法接受更多任务" )
		return 0
	end

	--需要15级才能接
	if GetLevel( sceneId, selfId ) >= 15 then
		--检测玩家是否符合接受任务的条件
		--begin modified by zhangguoxin 090207
		--local iDayCount = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
		--local iTime = mod( iDayCount, 100000 )
		local iTime = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
		local iDayTime = floor( iTime/100 )			--上一次交或放弃任务的时间(天数)
		local iQuarterTime = mod( iTime, 100 )		--上一次交或放弃任务的时间(一刻种)
		--local iDayHuan = floor( iDayCount/100000 )	--当天内完成的任务次数

		--local CurTime = GetHourTime()				--当前时间
		local CurTime = GetQuarterTime()				--当前时间
		local CurDaytime = floor( CurTime/100 )		--当前时间(天)
		local CurQuarterTime = mod( CurTime, 100 ) 	--当前时间(一刻钟)

		if iDayTime == CurDaytime then
			if CurQuarterTime == iQuarterTime then
				x230000_NotifyFailTips( sceneId, selfId, "你现在不能领取这个任务" )
				return 0
			end
		end
		--end modified by zhangguoxin 090207
		return 1
	else
		return 0
	end
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x230000_OnAccept( sceneId, selfId, targetId, scriptId )
 	if GetName( sceneId, targetId ) ~= x230000_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x230000_g_MissionId, scriptId, 0, 0, 1 )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x230000_g_MissionId )		--得到任务的序列号
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0 )						--根据序列号把任务变量的第0位置0 (任务完成情况)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, scriptId )					--根据序列号把任务变量的第1位置为任务脚本号

	--得到环数
	local MissionRound = GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )
	--环数增加1
	MissionRound = MissionRound + 1
	if	MissionRound > x230000_g_MaxRound then
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 1 )
	else
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, MissionRound )
	end

end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x230000_OnAbandon( sceneId, selfId )
    DelMission( sceneId, selfId, x230000_g_MissionId )
	-- SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 0 )	--环数不清0，允许自由放弃

	--begin modified by zhangguoxin 090207
	--local iDayCount = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
	--local iDayHuan = floor( iDayCount/100000 )					--当天内完成的任务次数
	--local iTime = mod(iDayCount,100000)
	--local iDayTime = floor(iTime/100)							--上一次交或放弃任务的时间(天数)
	--local CurTime = GetHourTime()								--当前时间
	--local CurDaytime = floor(CurTime/100)						--当前时间(天)
  --
	--if iDayTime ~= CurDaytime then								--不是今天的话则环数清 0
	--	iDayHuan = 0
	--end
  --
	--iDayCount = iDayHuan * 100000 + CurTime
	----设置循环任务的时间
	--SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
	local iTime = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime = floor(iTime/100)																			--上一次交或放弃任务的时间(天数) 
	local CurTime = GetQuarterTime()																			--当前时间
	local CurDaytime = floor(CurTime/100)																	--当前时间(天)
	if iDayTime ~= CurDaytime then
		SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, 0 )						--不是今天的话则环数清 0
	end
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, CurTime )
	
	--end modified by zhangguoxin 090207
end

--**********************************
--继续
--**********************************
function x230000_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x230000_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x230000_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x230000_g_MissionId )			--得到任务的序列号
	if GetMissionParam( sceneId, selfId, misIndex, 0 ) >= 1 then
		return 1
	end

	return  0
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x230000_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x230000_CheckSubmit( sceneId, selfId ) == 1 then
		if DelMission( sceneId, selfId, x230000_g_MissionId ) > 0 then
			local Level = GetLevel( sceneId, selfId )
			
			--begin modified by zhangguoxin 090207
			local iDayCount = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
			--local iTime = mod( iDayCount, 100000 )
			local iTime = GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
			local iDayTime = floor( iTime/100 )				--上一次交或放弃任务的时间(天数)
			local iQuarterTime = mod( iTime, 100 )			--上一次交或放弃任务的时间(刻)
			--local iDayHuan = floor( iDayCount/100000 )		--当天内完成的任务次数
			local iDayHuan = iDayCount		--当天内完成的任务次数

			--local CurTime = GetHourTime()					--当前时间
			local CurTime = GetQuarterTime()					--当前时间
			local CurDaytime = floor( CurTime/100 )			--当前时间(天)
			local CurQuarterTime = mod( CurTime, 100 )		--当前时间(刻)

			if CurDaytime == iDayTime then				 	--上次完成任务是同一天内
				iDayHuan = iDayHuan + 1
			else											--上次完成任务不在同一天，重置
				iDayTime			= CurDaytime
				iQuarterTime	= 0
				iDayHuan			= 1
			end

			--iDayCount = iDayHuan * 100000 + iDayTime * 100 + iQuarterTime
			iDayCount = iDayHuan
			local newTime = iDayTime * 100 + iQuarterTime

			local Reward_Append = 1
			if iDayHuan <= 20 then
				Reward_Append = 2
			end

			--设置循环任务的环数
			SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
			SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, newTime )
			--end modified by zhangguoxin 090207
			
			local MissionRound = GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )

			--衰减系数
			local l_Exp = 0.75
			local l_Money = (49 + Level) / (160 + 40 * Level )
			--计算奖励经验的数量
			local Round = mod( MissionRound, 10 )
			if Round == 0 then
				Round = 10
			end

			local Exp = 2400 * (Level+4) * Round * l_Exp / 120					--等级+环数函数，受经验调节常数的影响
			local Money = 2400 * (Level+4) * Round * l_Money /120				--等级+环数函数，受经验调节常数的影响

			if MissionRound > 10 then
				Exp = 2400 * (Level+4) * l_Exp / 120 + Exp						--11~20环任务，每环额外增加一定经验增量，金钱没有增量
			end

			Exp = Exp * Reward_Append

			Exp = floor(Exp)
			Money = floor(Money)

			--增加经验值和钱
			--添加任务奖励
			AddExp( sceneId, selfId, Exp )
			AddMoney( sceneId, selfId, Money )
			--显示对话框
			BeginEvent( sceneId )
				AddText( sceneId, "  做得不错，这里有" .. Exp .. "点经验值和#{_MONEY"..Money.."}，算是给你的奖励。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x230000_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x230000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x230000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示的界面
--**********************************
function x230000_AcceptDialog(sceneId, selfId,rand,g_Dialog,targetId)
	BeginEvent(sceneId)
		AddText(sceneId,g_Dialog)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--交任务后显示的界面
--**********************************
function x230000_SubmitDialog(sceneId, selfId,rand)

end

--**********************************
--把信送到后显示的界面
--**********************************
function x230000_SubmitDialog(sceneId, selfId,rand)

end

function x230000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--取得本事件的MissionId，用于obj文件中对话情景的判断
--**********************************
function x230000_GetEventMissionId(sceneId, selfId)
	return x230000_g_MissionId
end
