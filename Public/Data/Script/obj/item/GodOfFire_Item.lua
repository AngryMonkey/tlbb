-- 创建人:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
-- 火把使者 ItemID 40004444

-- 脚本号
x808084_g_scriptId = 808084

x808084_g_event = 808080				-- 龟兔赛跑任务脚本
--任务号
x808084_g_MissionId			= 1000

--任务每天环数标记
x808084_g_Mission_RoundNum	 = 7		--任务参数的第7位

-- 任务物品参数标记
x808084_g_LuoYangLighten_Cnt 	= 5	--孔明灯洛阳开启数量索引
x808084_g_SuZhouLighten_Cnt		= 7	--孔明灯苏州开启数量索引
x808084_g_DaLiLighten_Cnt		= 9		--孔明灯大理开启数量索引

--孔明灯完成数量标记
x808084_g_KongMing_Lighten				= 4		--任务参数的第4位

x808084_g_KongMingLighten_Count		=	8		-- 每段路中需要点燃的孔明灯数量
x808084_g_KongMingLighten_MaxCnt	=	24	-- 龟兔赛跑活动需要点燃的孔明灯总数

-- 每天龟兔赛跑活动开启时间
x808084_g_ActivityTime						= { {tstart=1230, tend=1330},
																		  {tstart=1930, tend=2030},
																		  {tstart=2130, tend=2230} }

--**********************************
--事件交互入口
--**********************************
function x808084_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end


--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x808084_IsSkillLikeScript( sceneId, selfId )
	return 1	 --这个脚本需要动作支持
end


--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x808084_CancelImpacts( sceneId, selfId )
	return 0	 --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x808084_OnActivateEachTick( sceneId, selfId )
	return 1	 --不是引导性脚本, 只保留空函数。
end


--**********************************
--信息提示
--**********************************
function x808084_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x808084_OnConditionCheck( sceneId, selfId )
	
	--背包中的位置
	local	BagPos	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )

	if BagPos < 0 then
		return 0
	end
	
	--校验使用的物品是否存在
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--检测有没有龟兔赛跑任务
	if IsHaveMission( sceneId, selfId, x808084_g_MissionId ) <= 0 then
		x808084_MsgBox( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end

	--检测是否处于活动时间内
	if x808084_CheckHuoDongTime() == 0 then
		x808084_MsgBox( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x808084_g_MissionId)
	
	--获得孔明灯完成信息
	local LuoYangCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_LuoYangLighten_Cnt, 1)
	local SuZhouCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_SuZhouLighten_Cnt, 1)
	local DaLiCnt = GetBagItemParam(sceneId, selfId, BagPos, x808084_g_DaLiLighten_Cnt, 1)
	local	nAllCount = GetMissionParam(sceneId, selfId, misIndex, x808084_g_KongMing_Lighten)
		
	BeginEvent(sceneId)
		AddText(sceneId, "#{GodFire_Info_001}")
		local str01 = format("#{GodFire_Info_021} %d/%d", LuoYangCnt, x808084_g_KongMingLighten_Count)
		local str02 = format("#{GodFire_Info_022} %d/%d", SuZhouCnt, x808084_g_KongMingLighten_Count)
		local str03 = format("#{GodFire_Info_023} %d/%d", DaLiCnt, x808084_g_KongMingLighten_Count)
		local str04 = format("#{GodFire_Info_035} %d/%d", nAllCount, x808084_g_KongMingLighten_MaxCnt)
		AddText(sceneId, str01)
		AddText(sceneId, str02)
		AddText(sceneId, str03)
		AddText(sceneId, str04)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	return 1
	
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x808084_OnDeplete( sceneId, selfId )	
	--
	--在此还要再次检测一下....
	--
	return 0
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x808084_OnActivateOnce( sceneId, selfId )
	return 0
end

--**********************************
--检测活动时间
--**********************************
function x808084_CheckHuoDongTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808084_g_ActivityTime) do
	  if curHourTime >= x808084_g_ActivityTime[i].tstart and curHourTime <= x808084_g_ActivityTime[i].tend then
	  	return i		
	  end
	end

	return 0

end
