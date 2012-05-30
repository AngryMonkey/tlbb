--创建人:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
--龟兔赛跑任务孔明灯生长点

--脚本号
x808085_g_ScriptId	= 808085

x808085_g_Impact_Light_Complete 	= 47	-- 点亮孔明灯时的特效
x808085_g_Impact_GodOfFire_Mission = 5929 -- 龟兔赛跑状态特效

--龟兔赛跑任务号
x808085_g_MissionId			= 1000
x808085_g_MissItemId = 40004444					-- 任务物品
--任务是否完成
x808085_g_Mission_IsComplete 			= 0		--任务参数的第0位
--龟兔赛跑任务每天轮数标记
x808085_g_RoundIndex 				 			= 7		--任务参数的第7位

-- 任务物品参数标记
x808085_g_LuoYangLighten_Cnt 			= 5	--孔明灯洛阳开启数量索引
x808085_g_SuZhouLighten_Cnt				= 7	--孔明灯苏州开启数量索引
x808085_g_DaLiLighten_Cnt					= 9		--孔明灯大理开启数量索引

--孔明灯完成数量标记
x808085_g_KongMing_Lighten				= 4		--任务参数的第4位

x808085_g_KongMingLighten_Count		=	8		-- 每段路中需要点燃的孔明灯数量
x808085_g_KongMingLighten_MaxCnt	=	24	-- 龟兔赛跑活动需要点燃的孔明灯总数

-- 每天龟兔赛跑活动开启时间
x808085_g_ActivityTime						= { {tstart=1230, tend=1330},
																		  {tstart=1930, tend=2030},
																		  {tstart=2130, tend=2230} }

function x808085_OnRecycle(sceneId,selfId,targetId)

	if selfId <= 0 then
		return 1
	end
	
	-- 通知孔明灯刷新脚本继续刷新孔明灯
	local nTargetX = GetItemBoxWorldPosX( sceneId, targetId )
	local nTargetZ = GetItemBoxWorldPosZ( sceneId, targetId )
	CallScriptFunction( 808083, "RecordKongMingLightInfo", sceneId, selfId, targetId, nTargetX, nTargetZ )	

	return 1;
end

function x808085_OnCreate(sceneId,growPointType,x,y)

end

function x808085_OnOpen(sceneId,selfId,targetId)

	-- 检测点燃孔明灯条件
	if x808085_CheckActivityEvent( sceneId, selfId ) == 0 then
		return OR_INVALID_TARGET
	end

	return OR_OK;
end

function x808085_OnProcOver(sceneId,selfId,targetId)

	-- 检测点燃孔明灯条件
	if x808085_CheckActivityEvent( sceneId, selfId ) == 0 then
		return OR_INVALID_TARGET
	end
		
	-- 给开启者加特效
	-- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808085_g_Impact_Light_Complete, 0)
end

--**********************************
--检测当前是否是活动时间
--**********************************
function x808085_CheckActivityTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808085_g_ActivityTime) do
	  if curHourTime >= x808085_g_ActivityTime[i].tstart and curHourTime <= x808085_g_ActivityTime[i].tend then
	  	return i
	  end
	end

	return 0

end

--**********************************
--检测激活条件
--**********************************
function x808085_CheckActivityEvent( sceneId, selfId )
	
	-- 检测是否有龟兔赛跑任务
	if IsHaveMission( sceneId, selfId, x808085_g_MissionId ) <= 0 then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_011}" )		
		return 0
	end

	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x808085_g_MissionId)
	
	-- 检测任务是否完成	
	if GetMissionParam(sceneId, selfId, misIndex, x808085_g_Mission_IsComplete) > 0 then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_028}" )
		return 0
	end

	-- 检测本轮活动时间是否有效
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_017}" )
		return 0
	end
	
	local nTimePoint = x808085_CheckActivityTime()
	if nTimePoint ~= GetMissionParam(sceneId, selfId, misIndex, x808085_g_RoundIndex) then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end

	-- 检测是否有任务物品
	if HaveItem(sceneId, selfId, x808085_g_MissItemId) <= 0 then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_039}" )
		return 0
	end
	
	-- 检测该类孔明灯是否已点完
	local BagPos = GetItemBagPos( sceneId, selfId, x808085_g_MissItemId, 0 )
	local LuoYangCnt = GetBagItemParam(sceneId, selfId, BagPos, x808085_g_LuoYangLighten_Cnt, 1)
	local SuZhouCnt = GetBagItemParam(sceneId, selfId, BagPos, x808085_g_SuZhouLighten_Cnt, 1)
	local DaLiCnt = GetBagItemParam(sceneId, selfId, BagPos, x808085_g_DaLiLighten_Cnt, 1)
	local	nAllCount = GetMissionParam(sceneId, selfId, misIndex, x808085_g_KongMing_Lighten)
	
	if sceneId == 6 and DaLiCnt >= x808085_g_KongMingLighten_Count then					-- 无量山
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_060}" )		
		return 0
	elseif sceneId == 5 and DaLiCnt >= x808085_g_KongMingLighten_Count then			-- 镜湖
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_060}" )		
		return 0
	elseif sceneId == 4 and SuZhouCnt >= x808085_g_KongMingLighten_Count then		-- 太湖
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_059}" )		
		return 0
	elseif sceneId == 3 and SuZhouCnt >= x808085_g_KongMingLighten_Count then		-- 嵩山
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_059}" )		
		return 0
	elseif sceneId == 7 and LuoYangCnt >= x808085_g_KongMingLighten_Count then	-- 剑阁
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_058}" )		
		return 0
	elseif sceneId == 8 and LuoYangCnt >= x808085_g_KongMingLighten_Count then	-- 敦煌
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_058}" )		
		return 0
	end

	if nAllCount >= x808085_g_KongMingLighten_MaxCnt then
		x808085_MsgBox( sceneId, selfId, "#{GodFire_Info_035}" )		
		return 0
	end

	return 1
end

--**********************************
--信息提示
--**********************************
function x808085_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
