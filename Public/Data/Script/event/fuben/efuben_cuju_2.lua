--活动的缺省脚本

--脚本号
x402043_g_ScriptId	= 402043

--**********************************
--脚本入口函数
--**********************************
function x402043_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	
	-- 这个活动只在每月的第一和第三个周日开启，
	local nToday = LuaFnGetDayOfThisMonth()
	if (nToday > 7 and nToday < 15) or (nToday > 21) then -- zchw
		return
	end

	--参数说明：场景ID，活动ID，时间间隔，公告类型（可以不传，默认普通公告类型）
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )
	
end

--**********************************
--心跳函数
--**********************************
function x402043_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end
