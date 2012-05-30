--经验分配

--脚本号
x806018_g_ScriptId					= 806018

--每天可以拿帮贡兑换的经验最多为200*600=12万点
x806018_g_AssignExpDateMax	= 120000

--**********************************
--任务入口函数
--**********************************
function x806018_OnDefaultEvent( sceneId, selfId, targetId )

	local	nMlevel	= LuaFnGetmasterLevel( sceneId, selfId )
	if nMlevel < 1 or nMlevel > 4 then
		x806018_MsgBox( sceneId, selfId, targetId, "  师德等级错误。" )
		return
	end
	if LuaGetPrenticeSupplyExp( sceneId, selfId ) == 0 then
		x806018_MsgBox( sceneId, selfId, targetId, "  没有可以领取的经验。" )
		return
	end
	
	--领取上限
	local	nOldTime		= GetMissionData( sceneId, selfId, MD_PEXP_GP_TIME )
	local	nOldValue		= GetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE )
	local	nNewTime		= GetDayTime()
	if nOldTime == nNewTime and nOldValue >= x806018_g_AssignExpDateMax then
		x806018_MsgBox( sceneId, selfId, targetId, "  您当天用帮派贡献度兑换的经验已达上限，请明天再来领取。" )
		return
	end
	
	--打开客户端帮派贡献度兑换经验窗口
	LuaFnExpAssign( sceneId, selfId, 2 )
	--关闭窗口
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 ) 

end

--**********************************
--列举事件
--**********************************
function x806018_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x806018_g_ScriptId, "我想用帮派贡献度领取经验", 6, -1 )

end

--**********************************
--C++回调接口：
--帮会贡献度领取师傅经验
--**********************************
function x806018_CallBackExpAssignByGuildPoint( sceneId, selfId, nExp )

	--是否处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return 0
	end

	local	nAssignExp	= nExp
	local	nMlevel			= LuaFnGetmasterLevel( sceneId, selfId )
	if nMlevel < 1 or nMlevel > 4 then
		x806018_MsgTip( sceneId, selfId, "师德等级错误" )
		return 0
	end
	if nAssignExp < 0 or nAssignExp > LuaGetPrenticeSupplyExp( sceneId, selfId ) then
		x806018_MsgTip( sceneId, selfId, "领取经验值错误" )
		return 0
	end
	if IsLocked( sceneId, selfId, 0 ) == 1 then
		x806018_MsgTip( sceneId, selfId, "帮派贡献度锁定，请稍后再试" )
		return 0
	end
	
	--领取上限
	local	nOldTime		= GetMissionData( sceneId, selfId, MD_PEXP_GP_TIME )
	local	nOldValue		= GetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE )
	local	nNewTime		= GetDayTime()
	if nOldTime == nNewTime and nOldValue >= x806018_g_AssignExpDateMax then
		x806018_MsgTip( sceneId, selfId, "当日兑换达上限" )
		return 0
	end
	if nOldTime ~= nNewTime then
		nOldValue				= 0
	end
	if nAssignExp + nOldValue > x806018_g_AssignExpDateMax then
		nAssignExp			= x806018_g_AssignExpDateMax - nOldValue
		x806018_MsgTip( sceneId, selfId, "每日兑换上限为"..x806018_g_AssignExpDateMax.."点经验，您仅剩余"..nAssignExp.."点" )
	end
	
	local	nBasePoint	= 0
	if nMlevel == 1 then
		nBasePoint			= 250
	elseif nMlevel == 2 then
		nBasePoint			= 300
	elseif nMlevel == 3 then
		nBasePoint			= 400
	elseif nMlevel == 4 then
		nBasePoint			= 600
	end
	local	nGPValue		= ceil( nAssignExp / nBasePoint )
	if nGPValue > CityGetAttr( sceneId, selfId, GUILD_CONTRIB_POINT ) then
		x806018_MsgTip( sceneId, selfId, "帮派贡献度不足" )
		return 0
	end
	--减少帮派贡献度
	CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, -nGPValue )
	--减少徒弟贡献的经验
	LuaAddPrenticeProExp( sceneId, selfId, 0, -nAssignExp )
	--增加经验
	AddExp( sceneId, selfId, nAssignExp )
	--数据统计
	LuaFnAuditMasterExp( sceneId, selfId, nGPValue, nAssignExp, 2 )

	--领取记录
	if nOldTime ~= nNewTime then
		SetMissionData( sceneId, selfId, MD_PEXP_GP_TIME, nNewTime )
		SetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE, nAssignExp )
	else
		SetMissionData( sceneId, selfId, MD_PEXP_GP_VALUE, nOldValue + nAssignExp )
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x806018_MsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--醒目提示
--**********************************
function x806018_MsgTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
