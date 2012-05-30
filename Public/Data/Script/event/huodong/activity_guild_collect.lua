--帮派收集的活动脚本
--Created by zchw
--脚本号
x808041_g_ScriptId	= 808041
x808041_g_Time = 2000;

--**********************************
--脚本入口函数
--**********************************
function x808041_OnDefaultEvent( sceneId, actId, iNoticeType, param2, param3, param4, param5 )

	--参数说明：场景ID，活动ID，时间间隔，公告类型（可以不传，默认普通公告类型）
	StartOneActivity( sceneId, actId, floor(60*1000), iNoticeType )

end

--**********************************
--心跳函数
--**********************************
function x808041_OnTimer( sceneId, actId, uTime )
	local curTime = GetHour()*100 + GetMinute();
	if curTime >= x808041_g_Time and curTime < x808041_g_Time+1 then
		--帮派收集 排名
		LuaFnSortGuildCollectNum(sceneId); 		
	end
	--检测活动是否过期
	if CheckActiviyValidity( sceneId, actId ) == 0 then
		LuaFnClearGuildCollectNum(sceneId);
		StopOneActivity( sceneId, actId )
	end
end
