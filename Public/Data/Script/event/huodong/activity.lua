--活动的缺省脚本

--脚本号
x808000_g_ScriptId	= 808000

--**********************************
--脚本入口函数
--**********************************
function x808000_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--参数说明：场景ID，活动ID，时间间隔，公告类型（可以不传，默认普通公告类型）
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )

end

--**********************************
--心跳函数
--**********************************
function x808000_OnTimer( sceneId, actId, uTime )

	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		StopOneActivity( sceneId, actId )
	end

end
