--活动——
--中秋活动-团圆欢庆月饼活动

--脚本号
x808064_g_ScriptId = 808064
--活动时间--需要每年维护
--x808064_g_StartDayTime = 7267   --活动结束时间 2007-9-25
--x808064_g_EndDayTime = 7283   --活动结束时间 2007-10-11
x808064_g_StartDayTime = 8257   --活动结束时间 2008-9-14,包含当日
x808064_g_EndDayTime = 8282   --活动结束时间 2008-10-09,包含当日

x808064_g_TuanYuanPieSn = 30505130	--团圆欢庆月饼ID
x808064_g_GuiHuaPieSn = 38000000		--桂花月饼ID

--x808064_g_strPieInfo1 = "中秋团圆，十一欢庆，#c00ff00《天龙八部》#W特别为天龙玩家准备了团圆好礼，从现在起到10月11日为止，10级以上的玩家每天都可以来我这领取一次#c00ff00团圆欢庆月饼#W和#c00ff00桂花月饼#W。同时夫妻关系，结拜关系和师徒关系还可以额外再领取一次。#r"
--x808064_g_strPieInfo2 = "这个介绍太长了拆掉放字典里吧！！！！！"
--x808064_g_strPlayerLvErr = "亲爱的玩家，请达到10级后再来领取。"
--x808064_g_strNotSpace = "您的包裹没有足够空间，请整理后再来领取。"
--x808064_g_strTeamError2 = "请您与伴侣单独组队，并确认对方在有效范围内才能领取。"
--x808064_g_strTeamError3 = "请与您的结拜关系人组队，并确认对方都在有效范围内才能领取。"
--x808064_g_strTeamError4 = "请确认队长是师傅，并且队伍中的徒弟全部是队长的徒弟，师傅或徒弟在有效范围内才能领取。"
--x808064_g_strGetPieInfo = "中秋团圆，十一欢庆，祝你万事如意，心想事成。这两块月饼就送给你了。"
--x808064_g_strCannotToday1 = "不好意思，你今天已经领取过#c00ff00团圆欢庆月饼#W和#c00ff00桂花月饼#W了。"
--x808064_g_strCannotToday2 = "不好意思，你今天已经领取过夫妻#c00ff00团圆欢庆月饼#W和#c00ff00桂花月饼#W了。"
--x808064_g_strCannotToday3 = "不好意思，你今天已经领取过结拜#c00ff00团圆欢庆月饼#W和#c00ff00桂花月饼#W了。"
--x808064_g_strCannotToday4a = "不好意思，作为师傅，您今天已经领取过师徒#c00ff00团圆欢庆月饼#W和#c00ff00桂花月饼#W了。"
--x808064_g_strCannotToday4b = "不好意思，作为徒弟，您今天已经领取过师徒#c00ff00团圆欢庆月饼#W和#c00ff00桂花月饼#W了。"


x808064_g_strPieInfo1 = "#{ZHONGQIUHUANQING_001}"
x808064_g_strPieInfo2 = "#{ZHONGQIUHUANQING_002}"
x808064_g_strPlayerLvErr = "#{ZHONGQIUHUANQING_003}"
x808064_g_strNotSpace = "#{ZHONGQIUHUANQING_004}"
x808064_g_strTeamError2 = "#{ZHONGQIUHUANQING_005}"
x808064_g_strTeamError3 = "#{ZHONGQIUHUANQING_006}"
x808064_g_strTeamError4 = "#{ZHONGQIUHUANQING_007}"
x808064_g_strGetPieInfo = "#{ZHONGQIUHUANQING_008}"
x808064_g_strCannotToday1 = "#{ZHONGQIUHUANQING_009}"
x808064_g_strCannotToday2 = "#{ZHONGQIUHUANQING_010}"
x808064_g_strCannotToday3 = "#{ZHONGQIUHUANQING_011}"
x808064_g_strCannotToday4a = "#{ZHONGQIUHUANQING_012}"
x808064_g_strCannotToday4b = "#{ZHONGQIUHUANQING_013}"


--**********************************
--任务入口函数
--**********************************
function x808064_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x808064_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	local NumText = GetNumText()

	if NumText == 101 then

		BeginEvent(sceneId)
			AddText(sceneId, x808064_g_strPieInfo1)
			AddNumText(sceneId, x808064_g_ScriptId, "我要领取", 6, 701 )
			AddNumText(sceneId, x808064_g_ScriptId, "夫妻关系领取", 6, 702 )
			AddNumText(sceneId, x808064_g_ScriptId, "结拜关系领取", 6, 703 )
			AddNumText(sceneId, x808064_g_ScriptId, "师徒关系领取", 6, 704 )
			--AddNumText(sceneId, x808064_g_ScriptId, "什么是团圆欢庆活动？", 11, 705 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 701 then

		--领个人月饼....
		x808064_GiveSelfPie( sceneId, selfId, targetId )

	elseif NumText == 702 then

		--领夫妻月饼....
		x808064_GiveFuqiPie( sceneId, selfId, targetId )

	elseif NumText == 703 then

		--领结拜月饼....
		x808064_GiveJiebaiPie( sceneId, selfId, targetId )

	elseif NumText == 704 then

		--领师徒月饼....
		x808064_GiveShituPie( sceneId, selfId, targetId )

	elseif NumText == 705 then

		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strPieInfo2 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--列举事件
--**********************************
function x808064_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x808064_CheckRightTime()
    if 1 == isTime then
			AddNumText(sceneId, x808064_g_ScriptId, "我要领取团圆月饼", 6, 101 )													
    end

end

--**********************************
--检测活动是否已结束
--**********************************
function x808064_CheckRightTime()

	local curDayTime = GetDayTime()
	if curDayTime >= x808064_g_StartDayTime and curDayTime <= x808064_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--领个人月饼
--**********************************
function x808064_GiveSelfPie( sceneId, selfId, targetId )

	--检测玩家等级....
	if x808064_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--今天是否已经领过了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE1_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strCannotToday1 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x808064_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家月饼....
	BeginEvent(sceneId)
		AddText( sceneId, x808064_g_strGetPieInfo )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x808064_GivePlayerPie( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE1_DAYTIME, CurDayTime )

end

--**********************************
--领夫妻月饼
--**********************************
function x808064_GiveFuqiPie( sceneId, selfId, targetId )

	--检测玩家等级....
	if x808064_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--是否2人队伍....并且队员全部在附近....
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	local NearTeamSize = GetNearTeamCount( sceneId, selfId )
	if TeamSize ~= 2 or TeamSize ~= NearTeamSize then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strTeamError2 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--是否夫妻....
	local	ObjID0		= GetNearTeamMember( sceneId, selfId, 0 )
	local	ObjID1		= GetNearTeamMember( sceneId, selfId, 1 )
	local	SelfGUID	= LuaFnObjId2Guid( sceneId, ObjID0 )
	local	SpouGUID	= LuaFnGetSpouseGUID( sceneId, ObjID1 )
	if LuaFnIsMarried( sceneId, ObjID0 ) == 0 or LuaFnIsMarried( sceneId, ObjID1 ) == 0 or SelfGUID ~= SpouGUID then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strTeamError2 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--今天是否已经领过了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE2_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strCannotToday2 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x808064_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家月饼....
	BeginEvent(sceneId)
		AddText( sceneId, x808064_g_strGetPieInfo )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x808064_GivePlayerPie( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE2_DAYTIME, CurDayTime )

end

--**********************************
--领结拜月饼
--**********************************
function x808064_GiveJiebaiPie( sceneId, selfId, targetId )

	--检测玩家等级....
	if x808064_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--是否2人(含)以上队伍....并且队员全部在附近....
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	local NearTeamSize = GetNearTeamCount( sceneId, selfId )
	if TeamSize < 2 or TeamSize ~= NearTeamSize then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strTeamError3 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--是否全部结拜....
	local allJieBai = 1
	local firstPlayer = GetNearTeamMember( sceneId, selfId, 0 )
	local otherPlayer
	for i=1, NearTeamSize-1 do
		otherPlayer = GetNearTeamMember( sceneId, selfId, i )
		if LuaFnIsBrother(sceneId, firstPlayer, otherPlayer) ~= 1 then
			allJieBai = 0
		end
	end
	if allJieBai == 0 then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strTeamError3 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--今天是否已经领过了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE3_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strCannotToday3 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x808064_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家月饼....
	BeginEvent(sceneId)
		AddText( sceneId, x808064_g_strGetPieInfo )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x808064_GivePlayerPie( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE3_DAYTIME, CurDayTime )

end

--**********************************
--领师徒月饼
--**********************************
function x808064_GiveShituPie( sceneId, selfId, targetId )

	--检测玩家等级....
	if x808064_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--是否2人(含)以上队伍....并且队员全部在附近....
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	local NearTeamSize = GetNearTeamCount( sceneId, selfId )
	if TeamSize < 2 or TeamSize ~= NearTeamSize then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strTeamError4 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--队伍是否队员全是队长徒弟....
	local OkTeam = 1
	local leaderID = GetTeamLeader( sceneId, selfId )
	local otherPlayer
	for i=0, NearTeamSize-1 do
		otherPlayer = GetNearTeamMember( sceneId, selfId, i )
		if leaderID ~= otherPlayer and LuaFnIsMaster(sceneId, otherPlayer, leaderID) ~= 1 then
			OkTeam = 0
		end
	end
	if OkTeam == 0 then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strTeamError4 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--今天是否已经领过了....
	local lastDayTime
	if leaderID == selfId then
		lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE4A_DAYTIME )
	else
		lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE4B_DAYTIME )
	end
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			if leaderID == selfId then
				AddText( sceneId, x808064_g_strCannotToday4a )
			else
				AddText( sceneId, x808064_g_strCannotToday4b )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x808064_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家月饼....
	BeginEvent(sceneId)
		AddText( sceneId, x808064_g_strGetPieInfo )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x808064_GivePlayerPie( sceneId, selfId )
	if leaderID == selfId then
		SetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE4A_DAYTIME, CurDayTime )
	else
		SetMissionData( sceneId, selfId, MD_ZHONGQIU_TUANYUANPIE4B_DAYTIME, CurDayTime )
	end

end

--**********************************
--检测玩家等级是否符合要求
--**********************************
function x808064_CheckPlayerLv( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) < 10 then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strPlayerLvErr )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--检测玩家背包空间是否足够
--**********************************
function x808064_CheckPacketSpace( sceneId, selfId, targetId )

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
		BeginEvent(sceneId)
			AddText( sceneId, x808064_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--给玩家团圆欢庆月饼和桂花月饼
--**********************************
function x808064_GivePlayerPie( sceneId, selfId )

	--给团圆欢庆月饼....
	TryRecieveItem( sceneId, selfId, x808064_g_TuanYuanPieSn, QUALITY_MUST_BE_CHANGE )

	--给桂花月饼....
	local BagIndex = TryRecieveItem( sceneId, selfId, x808064_g_GuiHuaPieSn, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then
		--设置物品所有者....桂花月饼自己不能用....只能送给别人用....所以要记录所有者的GUID....
		local guid = LuaFnGetGUID( sceneId, selfId )
		SetBagItemParam( sceneId, selfId, BagIndex, 4, 2, guid-2147483648 )
		--设置物品创建者....用于礼品类物品在tooltips上显示"xxx的礼品"....
		LuaFnSetItemCreator( sceneId, selfId, BagIndex, GetName( sceneId, selfId ) )
		LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
	end

end

--**********************************
--检测接受条件
--**********************************
function x808064_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x808064_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x808064_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x808064_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x808064_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x808064_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x808064_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x808064_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808064_OnItemChanged( sceneId, selfId, itemdataId )
end
