--重置缥缈峰副本挑战次数....

--！！！注意！！！
--重置次数和日期是使用一个INT来保存的....
--INT的低2位表示次数....因此每天最多只支持重置99次....
--不过由于每次消耗的物品数量是上次的2倍....所以第99次需要的数量是天文数字....2^99


--脚本号
x402289_g_ScriptId = 402289


--**********************************
--任务入口函数....
--**********************************
function x402289_OnDefaultEvent( sceneId, selfId, targetId )

	local NumText = GetNumText()

	if NumText == 1	then

		x402289_CheckCanReset( sceneId, selfId, targetId )

	elseif NumText == 2	then

		BeginEvent(sceneId)
			AddText(sceneId,"#{XPMCZ_81106_6}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 3	then

		x402289_ResetPMFCount( sceneId, selfId, targetId )

	elseif NumText == 4	then

		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

	end

end

--**********************************
--列举事件
--**********************************
function x402289_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x402289_g_ScriptId, "#{INTERFACE_XML_1183}", 9, 1 )
	AddNumText( sceneId, x402289_g_ScriptId, "#{INTERFACE_XML_1184}", 11, 2 )

end

--**********************************
--判断是否可以再战缥缈峰....
--**********************************
function x402289_CheckCanReset( sceneId, selfId, targetId )

	--获取今天挑战小缥缈的次数....
	local CurDayTime = GetDayTime()
	local lastTime = GetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_SMALL_LASTTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	--如果还没挑战过小缥缈峰....则不需要重置次数....
	if lastDayCount <= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XPMCZ_81106_1}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--获取 今天重置挑战次数 的次数....
	local lastTime2 = GetMissionData( sceneId, selfId, MD_RESET_PMFSMALL_COUNT_LASTTIME )
	local lastDayTime2 = floor( lastTime2 / 100 )
	local lastDayCount2 = mod( lastTime2, 100 )
	if CurDayTime > lastDayTime2 then
		lastDayTime2 = CurDayTime
		lastDayCount2 = 0
	end

	--二级确认菜单....
	local NeedNum = 2^lastDayCount2
	local NeedNum2 = 2^(lastDayCount2+1)
	BeginEvent(sceneId)
		AddText( sceneId, "#{CZPMF_90212_1}"..NeedNum.."#{CZPMF_90212_2}"..NeedNum2.."#{CZPMF_90212_3}" )
		AddNumText( sceneId, x402289_g_ScriptId, "确定", 8, 3 )
		AddNumText( sceneId, x402289_g_ScriptId, "取消", 8, 4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--重置小缥缈峰挑战次数....
--**********************************
function x402289_ResetPMFCount( sceneId, selfId, targetId )

	--获取今天挑战小缥缈的次数....
	local CurDayTime = GetDayTime()
	local lastTime = GetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_SMALL_LASTTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	--如果还没挑战过小缥缈峰....则不需要重置次数....
	if lastDayCount <= 0 then
		return
	end

	--获取 今天重置挑战次数 的次数....
	local lastTime2 = GetMissionData( sceneId, selfId, MD_RESET_PMFSMALL_COUNT_LASTTIME )
	local lastDayTime2 = floor( lastTime2 / 100 )
	local lastDayCount2 = mod( lastTime2, 100 )
	if CurDayTime > lastDayTime2 then
		lastDayTime2 = CurDayTime
		lastDayCount2 = 0
	end

	--是否有足够的物品....
	local NeedNum = 2^lastDayCount2
	if LuaFnGetAvailableItemCount( sceneId, selfId, 30501170 ) < NeedNum then
		BeginEvent(sceneId)
			AddText(sceneId,"#{XPMCZ_81106_4}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--扣物品....
	if 1 ~= LuaFnDelAvailableItem(sceneId, selfId, 30501170, NeedNum ) then
		return
	end

	--重置小缥缈峰挑战次数....
	lastTime = lastDayTime * 100 + 0 --lastDayCount
	SetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_SMALL_LASTTIME, lastTime )

	--设置今天重置次数....
	lastDayCount2 = lastDayCount2 + 1
	lastTime2 = lastDayTime2 * 100 + lastDayCount2
	SetMissionData( sceneId, selfId, MD_RESET_PMFSMALL_COUNT_LASTTIME, lastTime2 )

	--统计....
	LuaFnAuditResetPMFCountSmall( sceneId, selfId, lastDayCount2 )

	--恭喜你又可以去了....
	BeginEvent(sceneId)
		AddText(sceneId,"#{XPMCZ_81106_5}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end
