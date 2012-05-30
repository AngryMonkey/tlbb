--马戏团活动
--回调脚本

--脚本号
x808006_g_ScriptId			= 808006
x808006_g_ScriptId_Pao	= 200060	--泡泡脚本
--活动ID，定义在《ActivityNotice》表中
x808006_g_ActId					= 37
--活动有效期：2007年5月9日至5月31
x808006_g_ActBegin			= 7129
x808006_g_ActEnd				= 7151

x808006_g_TickTime			= 60			--回调脚本的时钟时间（单位：秒/次）
x808006_g_PrizeMax			= 5				--每次活动中大奖的最大数额

--活动数据区索引
x808006_g_ActParam			=
{
	["tim"]			= 0,			--时钟总点数
	["n_chg"]		= 1,			--兑换人数
	["n_bty"]		= 2,			--大奖人数
}

--字串集
x808006_g_Str	=
{
	--不包含转义字符的字串
	["npc"]			= "#W看来天黑之前我还得需要更多的珍兽宝宝才能完成任务了，不知道有没有热心人来帮我完成。",
	
	--包含转义字符的字串
}

--**********************************
--脚本入口函数
--C++回调函数
--**********************************
function x808006_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--统一只开启编号为 x808006_g_ActId 的活动
	m_actId		= x808006_g_ActId

	if x808006_OnActivityCheck() == 0 then
		--Add Log
		--begin modified by zhangguoxin 090207
		--LogInfo	= format( "[CIRCUS]: x808006_OnActivityCheck()==0, sceneId=%d, actId=%d, CurrentHour=%d",
		--	sceneId, m_actId, GetHourTime() )
		LogInfo	= format( "[CIRCUS]: x808006_OnActivityCheck()==0, sceneId=%d, actId=%d, CurrentHour=%d",
			sceneId, m_actId, GetQuarterTime() )
		--end modified by zhangguoxin 090207
		MissionLog( sceneId, LogInfo )
		return
	end

	--参数说明：场景ID，活动ID，时间间隔（毫秒）
	StartOneActivity( sceneId, m_actId, floor(x808006_g_TickTime*1000), iNoticeType )

	--活动数据区
	SetActivityParam( sceneId, m_actId, x808006_g_ActParam["tim"], 0 )		--保存时钟总点数
	SetActivityParam( sceneId, m_actId, x808006_g_ActParam["n_chg"], 0 )	--保存兑换人数
	SetActivityParam( sceneId, m_actId, x808006_g_ActParam["n_bty"], 0 )	--保存大奖人数

	--Add Log
	--begin modified by zhangguoxin 090207
	--LogInfo	= format( "[CIRCUS]: x808006_OnDefaultEvent( sceneId=%d, actId=%d, iNoticeType=%d ), CurrentHour=%d",
	--	sceneId, m_actId, iNoticeType, GetHourTime() )
	LogInfo	= format( "[CIRCUS]: x808006_OnDefaultEvent( sceneId=%d, actId=%d, iNoticeType=%d ), CurrentHour=%d",
		sceneId, m_actId, iNoticeType, GetQuarterTime() )
	--end modified by zhangguoxin 090207
	MissionLog( sceneId, LogInfo )

end

--**********************************
--心跳函数
--C++回调函数
--**********************************
function x808006_OnTimer( sceneId, actId, uTime )

	if x808006_g_ActId ~= actId then
		return
	end

	--活动数据区
	tim		= GetActivityParam( sceneId, actId, x808006_g_ActParam["tim"] )
	SetActivityParam( sceneId, actId, x808006_g_ActParam["tim"], tim+1 )	--保存时钟总点数

	--活动在第二天凌晨前关闭
	--begin modified by zhangguoxin 090207
	--hur		= GetHourTime()
	--qua		= hur - floor( hur / 100 ) * 100
	qua = mod(GetQuarterTime(),100);
	--end modified by zhangguoxin 090207
	--全天96个时刻
	if qua >= 95 then
		x808006_OnActivityEnd( sceneId, actId )
	end
	
	--一小时一次的NPC频道
	mul		= tim - floor( tim / 60 ) * 60
	if tim == 59 then
		CallScriptFunction( x808006_g_ScriptId_Pao, "Paopao", sceneId, "芮斯", "大理", x808006_g_Str["npc"] )
	end

end

--**********************************
--活动结束
--**********************************
function x808006_OnActivityEnd( sceneId, actId )

	if x808006_g_ActId ~= actId then
		return
	end

	SetActivityParam( sceneId, actId, x808006_g_ActParam["tim"], 0 )			--保存时钟总点数
	SetActivityParam( sceneId, actId, x808006_g_ActParam["n_chg"], 0 )		--保存兑换人数
	SetActivityParam( sceneId, actId, x808006_g_ActParam["n_bty"], 0 )		--保存大奖人数
	StopOneActivity( sceneId, actId )

	--Add Log
	--begin modified by zhangguoxin 090207
	--LogInfo	= format( "[CIRCUS]: x808006_OnActivityEnd( sceneId=%d, actId=%d ), CurrentHour=%d",
	--	sceneId, actId, GetHourTime() )
	LogInfo	= format( "[CIRCUS]: x808006_OnActivityEnd( sceneId=%d, actId=%d ), CurrentHour=%d",
		sceneId, actId, GetQuarterTime() )
	--end modified by zhangguoxin 090207
	MissionLog( sceneId, LogInfo )

end

--**********************************
--活动检查
--**********************************
function x808006_OnActivityCheck()

	local	day	= GetDayTime()
	if day < x808006_g_ActBegin or day > x808006_g_ActEnd then
		return 0
	end
	return 1

end

--**********************************
--成功兑换一次，计数
--无上限
--**********************************
function x808006_OnSuccChange( sceneId )

	local	num_chg	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_chg"] )
	SetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_chg"], num_chg + 1 )
	return num_chg + 1

end

--**********************************
--成功大奖一次，计数
--有上限
--**********************************
function x808006_OnSuccPrize( sceneId )

	local	num_chg	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_chg"] )
	local	num_bty	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_bty"] )
	if num_bty >= x808006_g_PrizeMax then
		return 0
	end
	SetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["n_bty"], num_bty + 1 )
	--Add Log
	--begin modified by zhangguoxin 090207
	--LogInfo	= format( "[CIRCUS]: x808006_OnSuccPrize(), num_chg=%d, num_bty=%d, CurrentHour=%d",
	--	num_chg, num_bty, GetHourTime() )
	LogInfo	= format( "[CIRCUS]: x808006_OnSuccPrize(), num_chg=%d, num_bty=%d, CurrentHour=%d",
		num_chg, num_bty, GetQuarterTime() )
	--end modified by zhangguoxin 090207
	MissionLog( sceneId, LogInfo )
	return num_bty + 1

end

--**********************************
--是否处在活动中
--**********************************
function x808006_IsActivityDoing( sceneId )

	tim	= GetActivityParam( sceneId, x808006_g_ActId, x808006_g_ActParam["tim"] )
	if tim > 0 then
		return 1
	end
	return 0

end
