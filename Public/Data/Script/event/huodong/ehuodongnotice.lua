--用于辅助活动公告进行时间控制

--脚本号
x808076_g_ScriptId	= 808076

--**********************************
--脚本入口函数
--**********************************
function x808076_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	if 1 == x808076_CheckActTime( sceneId, actId ) then
		StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )
	end

end

--**********************************
--心跳函数
--**********************************
function x808076_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end

--**********************************
--是否是活动时间....
--**********************************
function x808076_CheckActTime( sceneId, actId )

	local curDayTime = GetDayTime()

	--双响炮活动公告....2008-03-06 ~ 2008-04-06
	if actId == 107 or actId == 108 then
		if curDayTime >= 8065 and curDayTime <= 8096 then
			return 1
		end
	end

	--双响炮活动结束公告....2008-04-07 ~ 2008-04-20
	if actId == 109 then
		if curDayTime >= 8097 and curDayTime <= 8110 then
			return 1
		end
	end

    --愚人大变身活动公告....2009-03-26 ~ 2009-04-03
  if actId == 110 then
		if curDayTime >= 8090 and curDayTime <= 8092 then
			return 1
		end
	end
	
	--端午节活动公告....2009-05-27 ~ 2009-06-02
-- if actId == 175 then
--		local curTime2Day = GetTime2Day()
--		if curTime2Day >= 20090527 and curTime2Day <= 20090602 then
--			return 1
--		end
--	end
	
       --天龙嘉年华开始公告....2009-04-8 ~ 2009-05-12
--       if actId == 237 then
--		if curDayTime >= 9097 and curDayTime <= 9131 then
--			return 1
--		end
--	end
       --天龙嘉年华结束提醒兑换公告....2009-05-13 ~ 2009-05-31
--       if actId == 238 then
--		if curDayTime >= 9132 and curDayTime <= 9150 then
--			return 1
--		end
--	end

  --天龙嘉年华开始公告....2009-04-8 ~ 2009-05-12
    --向前冲前期公告 2009-07-09 ~ 2009-08-12
    if actId == 225 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20090709 and curTime2Day <= 20090812 then
			return 1
		end
	end

     --天龙嘉年华结束提醒兑换公告....2009-05-13 ~ 2009-05-31
    --向前冲后期公告 2009-08-13 ~ 2009-08-16
    if actId == 226 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20090813 and curTime2Day <= 20090816 then
			return 1
		end
	end

	--五一摆摊活动滚动公告
	if (actId >= 117 and actId <= 123) then
		if curDayTime >= 8121 and curDayTime <= 8127 then
			return 1
		end
	end
	
	--兽栏赠礼活动
	if actId >= 128 and actId <= 130 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080428 and curTime2Day <= 20080430 then
			return 1
		end
	end

	if actId >= 131 and actId <= 133 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080501 and curTime2Day <= 20080503 then
			return 1
		end
	end

	--师徒总动员活动公告....2008-07-03 ~ 2009-12-25
	if actId >= 163 and actId <= 164 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080703 and curTime2Day <= 20091225 then
			return 1
		end
	end
	
  --蹴鞠活动公告....2008-08-16 ~ 2008-08-17
	if actId >= 168 and actId <= 169 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080816 and curTime2Day <= 20080817 then
			return 1
		end
	end
	
	-- 2009.08.23加开1次蹴鞠，czf，2009.08.12
	-- 2009.08.22播放活动预告公告227
	if actId ==227 then
		local curTime2Day = GetTime2Day()
		if curTime2Day == 20090822 then
			return 1
		end
	end
	-- 2009.08.23播放正式活动公告228
	if actId ==228 then
		local curTime2Day = GetTime2Day()
		if curTime2Day == 20090823 then
			return 1
		end
	end

	--新圣火活动系列公告
	if actId >= 134 and actId <= 139 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080428 and curTime2Day <= 20080503 then
			return 1
		end
	end

	if actId >= 140 and actId <= 146 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080504 and curTime2Day <= 20080510 then
			return 1
		end
	end
	
	if actId >= 147 and actId <= 153 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080504 and curTime2Day <= 20080510 then
			return 1
		end
	end
	
	if actId >= 154 and actId <= 160 then
		local curTime2Day = GetTime2Day()
		if curTime2Day >= 20080504 and curTime2Day <= 20080510 then
			return 1
		end
	end
	
	return 0

end



	
