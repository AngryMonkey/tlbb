--*********************************************************************

-- Author	: liudun
-- Desc		: 通用抽奖流程，统一温州，网聚，幸运星抽奖功能
-- ScriptID	: 808078
-- Date		: 2008/03/15

--*********************************************************************

x808078_g_ScriptId						= 808078
x808078_g_CommonPrize_Active			= 0			--默认关闭

x808078_g_ActiveStartTime				= 7168	--20070618
--x808078_g_ActiveEndTime				= 7198	--20070718

function x808078_CommonCard(sceneId,selfId,targetId)	
	--打开输入卡号界面
	--if GetLevel(sceneId, selfId) > 30 then
		--BeginEvent(sceneId)
			--AddText(sceneId, "您的等级过高，无法激活财富卡！")
		--EndEvent()
		--DispatchEventList( sceneId, selfId, targetId )
		--return 
	--end
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2006 )		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x808078_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检查活动时间
--**********************************
--function x808078_CheckRightTime()
--	local DayTime = GetDayTime()
--	PrintNum(DayTime)
--	if DayTime < x808078_g_ActiveStartTime then
--		x808078_g_CommonPrize_Active = 0
--		return 0    --此前非活动时间
--	end

--	if DayTime > x808078_g_ActiveEndTime then
--		x808078_g_CommonPrize_Active = 0
--		return 0    --此后活动已经结束
--	end

--	x808078_g_CommonPrize_Active = 1
--	return 1
--	end

--**********************************
--列举事件
--**********************************
function x808078_OnEnumerate( sceneId, selfId, targetId )
    --x808078_CheckRightTime()
	AddNumText(sceneId, x808078_g_ScriptId, "领取天龙物品卡奖励", 1, 1 )
end

--**********************************
--任务入口函数
--**********************************
function x808078_OnDefaultEvent( sceneId, selfId, targetId )
	local TextNum = GetNumText()
	if TextNum == 1 then
		x808078_CommonCard( sceneId, selfId, targetId )
	end
end
