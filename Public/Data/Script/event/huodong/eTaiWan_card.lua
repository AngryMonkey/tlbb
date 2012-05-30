--活动——
--网聚活动卡

x808077_g_ScriptId						= 808077
x808077_g_SportsPrize_Active	= 0			--默认关闭

x808077_g_ActiveStartTime			= 7168	--20070618


function x808077_SportsCard(sceneId,selfId,targetId)
	--是否已经领取过体育竞猜奖励
	--if GetMissionFlag( sceneId, selfId, MF_ActiveJuCard ) == 1 then
	--	x808077_NotifyFailBox( sceneId, selfId, targetId, "    您已经领取过活动奖励，不能重复领取。" )
	--	return
	--end
	
	--是否大于20级
	--if GetLevel( sceneId, selfId ) < 5 then
	--	x808077_NotifyFailBox( sceneId, selfId, targetId, "    请您的等级超过5级后再来领取活动奖励。" )
	--	return
	--end
	
	--检查背包空间
	--local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	--if( FreeSpace < 1 ) then
	--	x808077_NotifyFailBox( sceneId, selfId, targetId, "    对不起，您没有足够的物品栏空间，请整理后再来领取。" )
	--	return
	--end

	--打开输入卡号界面
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2007950 )		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x808077_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检查活动时间
--**********************************
function x808077_CheckRightTime()
	--local DayTime = GetDayTime()
	--PrintNum(DayTime)
	--if DayTime < x808077_g_ActiveStartTime then
	--	x808077_g_SportsPrize_Active = 0
	--	return 0    --此前非活动时间
	--end

--if DayTime > x808077_g_ActiveEndTime then
--	x808077_g_SportsPrize_Active = 0
--	return 0    --此后活动已经结束
--end

	x808077_g_SportsPrize_Active = 1
	return 1
end

--**********************************
--列举事件
--**********************************
function x808077_OnEnumerate( sceneId, selfId, targetId )
    x808077_CheckRightTime()
	  if 1 == x808077_g_SportsPrize_Active then
			AddNumText(sceneId, x808077_g_ScriptId, "#{CB_XUBAO_LINGQU_1}", 1, 1 )
    end
end

--**********************************
--任务入口函数
--**********************************
function x808077_OnDefaultEvent( sceneId, selfId, targetId )
	x808077_CheckRightTime()
	if 1 ~= x808077_g_SportsPrize_Active then
		return
	end

	local TextNum = GetNumText()

	if TextNum == 1 then
		x808077_SportsCard( sceneId, selfId, targetId )
	end
end
