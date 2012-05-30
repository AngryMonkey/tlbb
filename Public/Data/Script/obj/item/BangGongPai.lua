--道具：帮贡牌30900050
--脚本号 300070

x300070_g_scriptId = 300070

x300070_g_TakeTimes = 1											-- 每天最多使用次数

--**********************************
--事件交互入口
--**********************************
function x300070_OnDefaultEvent( sceneId, selfId, bagIndex )

	local BangPaiID = GetBagItemParam(sceneId, selfId, bagIndex, 4, 2) --帮派ID
	local value = GetBagItemParam(sceneId, selfId, bagIndex, 8, 2) --帮贡数值
	local roleBangPaiID = GetHumanGuildID(sceneId, selfId)
	
	--PrintStr("BangPaiID "..BangPaiID.." value "..value.." roleBangPaiID "..roleBangPaiID)
	
	--帮派ID是否相同
	if roleBangPaiID ~= BangPaiID then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8829_06}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, selfId)
		
		return
	end
	
	--一天只能使用 x300070_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME, nowDate )
	end

	if takenTimes >= x300070_g_TakeTimes then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8922_31}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, selfId)
		
		return 0
	end
	
	if EraseItem(sceneId, selfId, bagIndex) > 0 then
	
		CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, value)
	
		BeginEvent(sceneId)
			AddText(sceneId,"#{BGCH_8829_04}"..value.."#{BGCH_8829_12}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		--一天只能使用 x300070_g_TakeTimes 次
		DayTimes = GetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME )
		takenTimes = floor( DayTimes/100000 )
		DayTimes = (takenTimes+1)*100000 + GetDayTime()
		SetMissionData( sceneId, selfId, MD_BANGGONGPAI_DAYTIME, DayTimes )
	end
	
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x300070_IsSkillLikeScript( sceneId, selfId)
	return 0; --这个脚本需要动作支持
end
