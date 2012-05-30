--活动的缺省脚本

--脚本号
x402042_g_ScriptId	= 402042

x402042_g_NotifyDay = --09年开放日
{
	20090103,
	20090131,
	20090228,
	20090404,
	20090502,
	20090606,
	20090704,
	20090801,
	20090905,
	20091003,
	20091031,
	20091205,
}

--**********************************
--脚本入口函数
--**********************************
function x402042_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )
	
	-- 这个活动只在每月的第一和第三个周六开启，
	local nToday = GetTime2Day();
	for i, item in x402042_g_NotifyDay do
		if item == nToday then
			--参数说明：场景ID，活动ID，时间间隔，公告类型（可以不传，默认普通公告类型）
			StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )	
		end
	end
	
end

--**********************************
--心跳函数
--**********************************
function x402042_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end
