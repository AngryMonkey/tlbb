-- 收集宝石
--MisDescBegin
-- 脚本号
x600027_g_ScriptId = 600027

--任务号
x600027_g_MissionId = 1110

--任务目标npc
x600027_g_Name = "佟芙蓉"

--任务归类
x600027_g_MissionKind = 50

--任务等级
x600027_g_MissionLevel = 10000

--是否是精英任务
x600027_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x600027_g_IsMissionOkFail			=0	--0 任务完成标记[值不能变]
x600027_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置[值不能变]
x600027_g_GemCount					=2	--2 需要的宝石数量
x600027_g_GemSerialNum				=3	--3 需要的宝石

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x600027_g_MissionName = "扩张任务"
x600027_g_MissionInfo = ""			--任务描述
x600027_g_MissionTarget = "    找%s个%i交还到本帮的佟芙蓉 ( 148, 96 )处。"	--任务目标
x600027_g_ContinueInfo = "    你的任务还没有完成么？"					--未完成任务的npc对话
x600027_g_SubmitInfo = "    事情进展得如何？"							--完成未提交时的npc对话
x600027_g_MissionComplete = "    甚好甚好。"							--完成任务npc说话的话

x600027_g_Parameter_Item_AllRandom = { { id = 3, num = 2 } }

x600027_g_StrForePart = 2
x600027_g_Offset = 35													-- Suppose to ？, 表里第几个物品列的偏移量

x600027_g_MissionRound = 55

-- 通用城市任务脚本
x600027_g_CityMissionScript = 600001
x600027_g_ExpandScript = 600023

x600027_g_StrList = { " 0 ", " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 10 " }

--任务奖励


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x600027_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) > 0 then
		--发送任务需求的信息
		local bDone = x600027_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600027_g_SubmitInfo
		else
			strText = x600027_g_ContinueInfo
		end

		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x600027_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600027_g_ScriptId, x600027_g_MissionId, bDone )
	--满足任务接收条件
	elseif x600027_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600027_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600027_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600027_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) > 0 then
		AddNumText( sceneId, x600027_g_ScriptId, x600027_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600027_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600027_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据相应建筑得到对应MissionItem_HashTable.txt中的单元索引
--**********************************
function x600027_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_XIANYA )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600027_g_Offset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600027_g_Offset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600027_g_Offset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600027_g_Offset + 3
	else													-- 5
		nPos = 161
	end

	return nPos
end

--**********************************
--根据玩家等级得到需要找寻的宝石数量
--**********************************
function x600027_GetMissionItemCount( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nCount

	if nPlayerLevel < 55 then								-- 40 ~ 54
		nCount = 1
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nCount = random(2)
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nCount = random(2)
	else													-- 85 ~ 100
		nCount = random(3)
	end

	return nCount
end

--**********************************
--接受
--**********************************
function x600027_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600027_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600027_g_MissionId, x600027_g_ScriptId, 0, 0, 1 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600027_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600027_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
	local nitemId, strItemName, _ = GetOneMissionItem( x600027_GetMissionItemIndex( sceneId, selfId ) )
	local nCount = x600027_GetMissionItemCount( sceneId, selfId )

	SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_GemSerialNum, nitemId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_GemCount, nCount )

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    本帮为了结交江湖豪客，需要制作一些工艺品，你速去帮我找%d个%s来。", nCount, strItemName )
		else
			missionInfo = format( "    本帮需要%d个%s来结交江湖人士，找%s的任务非你莫属了。。", nCount, strItemName, strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#r    你接受了任务：" .. x600027_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	-- 检测身上是否已有此物品
	if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
		x600027_OnItemChanged( sceneId, selfId, nitemId )
	end
end

--**********************************
--放弃
--**********************************
function x600027_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600027_g_ExpandScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600027_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600027_g_MissionName )
		AddText( sceneId, x600027_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600027_g_ScriptId, x600027_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600027_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600027_g_ExpandScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
		local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum < nCountNeeded then
			ret = 0
		end
	end

	return ret
end

--**********************************
--提交
--**********************************
function x600027_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600027_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
		local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum >= nCountNeeded then
			LuaFnDelAvailableItem( sceneId, selfId, demandItemId, nCountNeeded )
		else											-- 只作为容错，理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600027_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600027_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x600027_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600027_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )

	local _, strItemName, _ = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
	local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
	local _, strDemandItemName, _ = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText = format( "得到%s %d/%d", strItemName, nItemNum, nCountNeeded )

		if nItemNum <= nCountNeeded then
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 0 )
		end

		if nItemNum >= nCountNeeded then
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 1 )
		end
		if (strText and nItemNum <= nCountNeeded) then
			CallScriptFunction( x600027_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
		end
	end
end
