--活动——
--春节活动-天之饺子

--脚本号
x050056_g_ScriptId = 050056
--活动时间
x050056_g_StartDayTime = 20090119   --活动结束时间 2009/01/19
x050056_g_EndDayTime = 20090204   --活动结束时间 2009/02/04

x050056_g_ZiJiJiaoZi = {
												30103051,
												30103052,
												30103053,
												30103054,
												30103055,
												}	--对自己使用的饺子ID
x050056_g_BieRenJiaoZi = {
													38000001,
													38000002,
													38000003,
													38000004,
													38000005,
												 }		--对别人使用的饺子ID

x050056_g_strJiaoZiInfo1 = "#{TZJZ_20071229_17}"
--x050056_g_strJiaoZiInfo2 = "#c00ff00《天龙八部》#W从即日起到2月13日止春节期间提供天之饺子礼包。#Y10级以上#W玩家每天可在#G苏州#Y乐善使者左桐#W处领取，同时“夫妻关系”“结拜关系”和“师徒关系”可在组队情况下，额外领取一份天之饺子礼包。礼包中含有各种品目口味的饺子。#r结拜关系中每个人都只能领取一份，未领取的结拜人可以与已领取的兄弟去领取礼包；师徒关系中的师傅如已与其中一个徒弟领取了师徒天之饺子礼包，未领取的徒弟仍可以与师傅组队前往领取，但师傅每日只有一次机会领取。并且当你既是师傅又是徒弟时，还可以作为徒弟再领取一次。#r  #c00ff00三鲜饺子#W和#c00ff00素馅饺子#W的使用方式：右键点击使用，可按百分比恢复血。"
x050056_g_strJiaoZiInfo2 = "#{TZJZ_20071229_16}"

--x050056_g_strPlayerLvErr = "亲爱的玩家，请达到10级后再来领取。"
--x050056_g_strNotSpace = "您的包裹没有足够空间，请整理后再来领取。"
x050056_g_strPlayerLvErr = "#{TZJZ_20071229_01}"
x050056_g_strNotSpace = "#{TZJZ_20071229_02}"

--x050056_g_strTeam1 = "新年新气象，吃饺子成骄子！这两份饺子就送给你了。"
x050056_g_strTeam1 = "#{TZJZ_20071229_07}"

--x050056_g_strTeam2 = "新年新气象，吃饺子成骄子！祝二位合家欢乐，幸福美满。这两份饺子就送给你了。"
x050056_g_strTeam2 = "#{TZJZ_20071229_08}"

--x050056_g_strTeamError2 = "请您与伴侣单独组队，并确认对方在有效范围内才能领取。"
x050056_g_strTeamError2 = "#{TZJZ_20071229_09}"

--x050056_g_strTeam3 = "新年新气象，吃饺子成骄子！祝义薄云天的兄弟姐妹财源广进，这两份饺子就送给你了。"
x050056_g_strTeam3 = "#{TZJZ_20071229_10}"

--x050056_g_strTeamError3 = "请与您的结拜关系人组队，并确认对方都在有效范围内才能领取。"
x050056_g_strTeamError3 = "#{TZJZ_20071229_11}"

--x050056_g_strTeam4 = "新年新气象，吃饺子成骄子！祝师傅万事如意，徒弟步步高升，这两份饺子就送给你了。"
x050056_g_strTeam4 = "#{TZJZ_20071229_13}"

--x050056_g_strTeamError4 = "请确认队长是师傅，并且队伍中的徒弟全部是队长的徒弟，师傅或徒弟在有效范围内才能领取。"
x050056_g_strTeamError4 = "#{TZJZ_20071229_14}"

--x050056_g_strCannotToday1 = "不好意思，你今天已经领取过#c00ff00天之饺子#W礼包了。"
x050056_g_strCannotToday1 = "#{TZJZ_20071229_03}"
--x050056_g_strCannotToday2 = "不好意思，你今天已经领取过夫妻#c00ff00天之饺子#W礼包了。"
x050056_g_strCannotToday2 = "#{TZJZ_20071229_04}"

--x050056_g_strCannotToday3 = "不好意思，你今天已经领取过结拜#c00ff00天之饺子#W礼包了。"
x050056_g_strCannotToday3 = "#{TZJZ_20071229_05}"
--x050056_g_strCannotToday4 = "不好意思，您今天已经领取过师徒#c00ff00天之饺子#W礼包了。"
x050056_g_strCannotToday4 = "#{TZJZ_20071229_06}"

--x050056_g_strCannotToday4a = "不好意思，作为师傅，您今天已经领取过师徒#c00ff00天之饺子#W礼包了。"
x050056_g_strCannotToday4a = "#{TZJZ_20071229_15}"

x050056_g_strCannotToday4b = "不好意思，作为徒弟，您今天已经领取过师徒#c00ff00天之饺子#W礼包了。"

--**********************************
--任务入口函数
--**********************************
function x050056_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050056_CheckRightTime()
	if 1 ~= isTime then
		return
	end
	
	local NumText = GetNumText()

	if NumText == 101 then

		BeginEvent(sceneId)
			AddText(sceneId, x050056_g_strJiaoZiInfo1)
			AddNumText(sceneId, x050056_g_ScriptId, "我要领取", 6, 201 )
			AddNumText(sceneId, x050056_g_ScriptId, "夫妻关系领取", 6, 202 )
			AddNumText(sceneId, x050056_g_ScriptId, "结拜关系领取", 6, 203 )
			AddNumText(sceneId, x050056_g_ScriptId, "师徒关系领取", 6, 204 )
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif NumText == 201 then

		--领个人饺子....
		x050056_GiveSelfJiaoZi( sceneId, selfId, targetId )

	elseif NumText == 202 then

		--领夫妻饺子....
		x050056_GiveFuqiJiaoZi( sceneId, selfId, targetId )

	elseif NumText == 203 then

		--领结拜饺子....
		x050056_GiveJiebaiJiaoZi( sceneId, selfId, targetId )

	elseif NumText == 204 then

		--领师徒饺子....
		x050056_GiveShituJiaoZi( sceneId, selfId, targetId )

	elseif NumText == 205 then
		--天子饺子介绍
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strJiaoZiInfo2 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	end

end

--**********************************
--列举事件
--**********************************
function x050056_OnEnumerate( sceneId, selfId, targetId )

    local isTime = x050056_CheckRightTime()
    if 1 == isTime then
			AddNumText(sceneId, x050056_g_ScriptId, "天之饺子", 6, 101 )	
			AddNumText(sceneId, x050056_g_ScriptId, "关于天之饺子", 11, 205 )												
    end

end

--**********************************
--检测活动是否已结束
--**********************************
function x050056_CheckRightTime()

	local curDayTime = GetTime2Day()
	if curDayTime >= x050056_g_StartDayTime and curDayTime <= x050056_g_EndDayTime then
		return 1
	else
		return 0
	end

end

--**********************************
--领个人饺子
--**********************************
function x050056_GiveSelfJiaoZi( sceneId, selfId, targetId )

	--检测玩家等级....
	if x050056_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--今天是否已经领过了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strCannotToday1 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x050056_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家饺子....
	BeginEvent(sceneId)
		AddText( sceneId, x050056_g_strTeam1 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x050056_GivePlayerJiaoZi( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI1_DAYTIME, CurDayTime )

end

--**********************************
--领夫妻饺子
--**********************************
function x050056_GiveFuqiJiaoZi( sceneId, selfId, targetId )

	--检测玩家等级....
	if x050056_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--是否2人队伍....并且队员全部在附近....
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	local NearTeamSize = GetNearTeamCount( sceneId, selfId )
	if TeamSize ~= 2 or TeamSize ~= NearTeamSize then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strTeamError2 )
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
			AddText( sceneId, x050056_g_strTeamError2 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--今天是否已经领过了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strCannotToday2 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x050056_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家饺子....
	BeginEvent(sceneId)
		AddText( sceneId, x050056_g_strTeam2 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x050056_GivePlayerJiaoZi( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI2_DAYTIME, CurDayTime )

end

--**********************************
--领结拜饺子
--**********************************
function x050056_GiveJiebaiJiaoZi( sceneId, selfId, targetId )

	--检测玩家等级....
	if x050056_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--是否2人(含)以上队伍....并且队员全部在附近....
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	local NearTeamSize = GetNearTeamCount( sceneId, selfId )
	if TeamSize < 2 or TeamSize ~= NearTeamSize then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strTeamError3 )
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
			AddText( sceneId, x050056_g_strTeamError3 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--今天是否已经领过了....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strCannotToday3 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x050056_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家饺子....
	BeginEvent(sceneId)
		AddText( sceneId, x050056_g_strTeam3 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x050056_GivePlayerJiaoZi( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI3_DAYTIME, CurDayTime )

end

--**********************************
--领师徒饺子
--**********************************
function x050056_GiveShituJiaoZi( sceneId, selfId, targetId )

	--检测玩家等级....
	if x050056_CheckPlayerLv( sceneId, selfId, targetId ) == 0 then
		return
	end

	--是否2人(含)以上队伍....并且队员全部在附近....
	local TeamSize = LuaFnGetTeamSize( sceneId, selfId )
	local NearTeamSize = GetNearTeamCount( sceneId, selfId )
	if TeamSize < 2 or TeamSize ~= NearTeamSize then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strTeamError4 )
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
			AddText( sceneId, x050056_g_strTeamError4 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--今天是否已经领过了....
	local lastDayTime
	if leaderID == selfId then
		lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI4A_DAYTIME )
	else
		lastDayTime = GetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI4B_DAYTIME )
	end
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		BeginEvent(sceneId)
			if leaderID == selfId then
				AddText( sceneId, x050056_g_strCannotToday4a )
			else
				--AddText( sceneId, x050056_g_strCannotToday4b )
				AddText( sceneId, x050056_g_strCannotToday4 )
				
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--检测背包是否有地方....
	if x050056_CheckPacketSpace( sceneId, selfId, targetId ) == 0 then
		return
	end

	--给玩家饺子....
	BeginEvent(sceneId)
		AddText( sceneId, x050056_g_strTeam4 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x050056_GivePlayerJiaoZi( sceneId, selfId )
	if leaderID == selfId then
		SetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI4A_DAYTIME, CurDayTime )
	else
		SetMissionData( sceneId, selfId, MD_CHUNJIE_TUANYUANJIAOZI4B_DAYTIME, CurDayTime )
	end

end

--**********************************
--检测玩家等级是否符合要求
--**********************************
function x050056_CheckPlayerLv( sceneId, selfId, targetId )

	if GetLevel( sceneId, selfId ) < 10 then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strPlayerLvErr )
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
function x050056_CheckPacketSpace( sceneId, selfId, targetId )

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
		BeginEvent(sceneId)
			AddText( sceneId, x050056_g_strNotSpace )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	else
		return 1
	end

end

--**********************************
--给玩家饺子
--**********************************
function x050056_GivePlayerJiaoZi( sceneId, selfId )

		--BeginAddItem(sceneId)
		--AddItem( sceneId, 40001005, 1 )
		--local ret = EndAddItem(sceneId,selfId)
		--if ret < 1  then
		--	BeginEvent(sceneId)
		--		AddText( sceneId, "你的背包已满", 0 )
		--	EndEvent(sceneId)
		--	DispatchMissionTips(sceneId,selfId)
		--else
		--	AddItemListToHuman(sceneId,selfId)
		--	BeginEvent(sceneId)
		--	AddText( sceneId, "你得到了悲酥清风的解药", 0 )
		--EndEvent(sceneId)
		--	DispatchMissionTips(sceneId,selfId)
		--end
	local num1 = getn(x050056_g_ZiJiJiaoZi)
	local num2 = getn(x050056_g_BieRenJiaoZi)
	
	local id1 = x050056_g_ZiJiJiaoZi[random(num1)]
	local id2 = x050056_g_BieRenJiaoZi[random(num2)]
	
	--给饺子1自己的....
	local BagIndex = TryRecieveItem( sceneId, selfId, id1, QUALITY_MUST_BE_CHANGE )

	if BagIndex ~= -1 then
		LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
		BeginEvent( sceneId )
			AddText( sceneId, "你得到了"..GetItemName(sceneId,id1) )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	end
	
	--给饺子2别人的....
	BagIndex = TryRecieveItem( sceneId, selfId, id2, QUALITY_MUST_BE_CHANGE )
	
	if BagIndex ~= -1 then
		--设置物品所有者....别人饺子自己不能用....只能送给别人用....所以要记录所有者的GUID....
		local guid = LuaFnGetGUID( sceneId, selfId )
		SetBagItemParam( sceneId, selfId, BagIndex, 4, 2, guid-2147483648 )
		--设置物品创建者....用于礼品类物品在tooltips上显示"xxx的礼品"....
		LuaFnSetItemCreator( sceneId, selfId, BagIndex, GetName( sceneId, selfId ) )
		LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
		BeginEvent( sceneId )
			AddText( sceneId, "你得到了"..GetItemName(sceneId,id2) )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	end

end

--**********************************
--检测接受条件
--**********************************
function x050056_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x050056_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x050056_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x050056_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x050056_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x050056_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050056_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x050056_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050056_OnItemChanged( sceneId, selfId, itemdataId )
end
