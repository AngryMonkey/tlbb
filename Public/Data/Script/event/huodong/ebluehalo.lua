--活动——
--新蓝光环

--脚本号
x808063_g_ScriptId = 808063
x808063_g_BlueHalo_EndDayTime = 7262   --活动结束时间 2007-9-20

x808063_g_Impact = {

		8000,
		8001,
		8002,
		8003,
		8004,
		8005,
		8006,
		8007,
		8008,
		8009,
		30141,
		30142,
		30143,
		30144,
		30145,
		30146,
		30147,
		30148,
		30149,
		30150,
}


--**********************************
--任务入口函数
--**********************************
function x808063_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x808063_CheckRightTime()
	if 1 ~= isTime then
		return
	end


	local lastDayTime = GetMissionData( sceneId, selfId, MD_BLUEHALO_DAYTIME )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
	
		x808063_AddBlueHalo( sceneId, selfId )
		SetMissionData( sceneId, selfId, MD_BLUEHALO_DAYTIME, CurDayTime )

		BeginEvent(sceneId)
			AddText(sceneId,"    为了庆祝#c00ff00《天龙八部》#W资料片#c00ff00《仙人指路》#W的发布，新蓝电脑特别为所有天龙玩家准备了#c00ff00新蓝光环#W，从现在起到9月20日为止，所有玩家每天都可以前来领取1次光环。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	else

		BeginEvent(sceneId)
			AddText(sceneId,"    不好意思，你今天已经领取过#c00ff00新蓝光环#W了。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--列举事件
--**********************************
function x808063_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x808063_CheckRightTime()

    if 1 == isTime then
			AddNumText(sceneId, x808063_g_ScriptId, "新蓝光环", 1, 101 )
    end

end

--**********************************
--检测活动是否已结束
--**********************************
function x808063_CheckRightTime()

    local curDayTime = GetDayTime()

    if curDayTime > x808063_g_BlueHalo_EndDayTime then
       return 0
    else
    	return 1
    end

end

--**********************************
--给玩家加上新蓝光环buff
--**********************************
function x808063_AddBlueHalo( sceneId, selfId )

	local myLevel = GetLevel(sceneId, selfId)
	local impactID = x808063_g_Impact[1]

	if myLevel > 190 then
		impactID = x808063_g_Impact[20]
	elseif myLevel > 180 then
		impactID = x808063_g_Impact[19]
	elseif myLevel > 170 then
		impactID = x808063_g_Impact[18]
	elseif myLevel > 160 then
		impactID = x808063_g_Impact[17]
	elseif myLevel > 150 then
		impactID = x808063_g_Impact[16]
	elseif myLevel > 140 then
		impactID = x808063_g_Impact[15]
	elseif myLevel > 130 then
		impactID = x808063_g_Impact[14]
	elseif myLevel > 120 then
		impactID = x808063_g_Impact[13]
	elseif myLevel > 110 then
		impactID = x808063_g_Impact[12]
	elseif myLevel > 100 then
		impactID = x808063_g_Impact[11]
	elseif myLevel > 90 then
		impactID = x808063_g_Impact[10]
	elseif myLevel > 80 then
		impactID = x808063_g_Impact[9]
	elseif myLevel > 70 then
		impactID = x808063_g_Impact[8]
	elseif myLevel > 60 then
		impactID = x808063_g_Impact[7]
	elseif myLevel > 50 then
		impactID = x808063_g_Impact[6]
	elseif myLevel > 40 then
		impactID = x808063_g_Impact[5]
	elseif myLevel > 30 then
		impactID = x808063_g_Impact[4]
	elseif myLevel > 20 then
		impactID = x808063_g_Impact[3]
	elseif myLevel > 10 then
		impactID = x808063_g_Impact[2]
	else
		impactID = x808063_g_Impact[1]
	end

	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactID, 0);

end

--**********************************
--检测接受条件
--**********************************
function x808063_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x808063_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x808063_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x808063_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x808063_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x808063_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x808063_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x808063_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808063_OnItemChanged( sceneId, selfId, itemdataId )
end
