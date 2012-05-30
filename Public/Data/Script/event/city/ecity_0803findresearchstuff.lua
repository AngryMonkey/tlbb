--副本任务
--找到原料

--************************************************************************
--MisDescBegin
--脚本号
x600043_g_ScriptId	= 600043
--任务号
x600043_g_MissionId	= 1113
--目标NPC
x600043_g_Name			= "郑无名"
--任务等级
x600043_g_MissionLevel					= 10000
--任务归类
x600043_g_MissionKind						= 50
--是否是精英任务
x600043_g_IfMissionElite				= 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明
x600043_g_IsMissionOkFail				= 0	--0 任务完成标记
x600043_g_MissionParam_SubId		= 1	--1 子任务脚本号存放位置
x600043_g_MissionParam_Phase		= 2	--2 阶段号 此号用于区分当前任务UI的描述信息
x600043_g_MissionParam_NpcId		= 3	--3 任务 NPC 的 NPCId 号
x600043_g_MissionParam_ItemId		= 4	--4 任务物品的编号
x600043_g_MissionParam_MonsterId= 5	--5 任务 Monster 的 NPCId 号
x600043_g_MissionParam_IsCarrier= 6	--6 是否有送信任务
--循环任务的数据索引，里面存着已做的环数
x600043_g_MissionRound					= 61
--**********************************以上是动态****************************

--任务文本描述
x600043_g_MissionName			= "研究任务"
x600043_g_MissionInfo			= "城市内政－研究任务"									--任务描述
x600043_g_MissionTarget		= "%f"																	--任务目标
x600043_g_ContinueInfo		= "    你的任务还没有完成么？"					--未完成任务的npc对话
x600043_g_SubmitInfo			= "    事情进展得如何？"								--完成未提交时的npc对话
x600043_g_MissionComplete	= "    甚好甚好，研究进度又加快了不少。"--完成任务npc说话的话

x600043_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600043_g_StrForePart			= 2

--用来保存字符串格式化的数据
x600043_g_FormatList			= {
	"",
	"    找到%2i，交给帮会大总管。",	--1 寻找所需物品
	"    将%2i交还给帮会大总管。"			--2 送还
}

--通用城市任务脚本
x600043_g_CityMissionScript	= 600001
x600043_g_ConstructionScript= 600040

--任务奖励

--MisDescEnd
--************************************************************************

x600043_g_ItemOffset			= 31	--表里第几个物品列的偏移量

--阶段任务
x600043_g_PhaseKey				= {}
x600043_g_PhaseKey["fnd"]	= 1		--寻找所需物品
x600043_g_PhaseKey["end"]	= 2		--送还

--**********************************
--任务入口函数
--**********************************
function x600043_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) > 0 then
		local bDone = x600043_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600043_g_SubmitInfo
		else
			strText = x600043_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600043_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600043_g_ScriptId, x600043_g_MissionId, bDone )

	--未接此任务，且满足任务接收条件
	elseif x600043_CheckAccept( sceneId, selfId ) > 0 then
		x600043_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x600043_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) > 0 then
		AddNumText( sceneId, x600043_g_ScriptId, x600043_g_MissionName,3,-1 )
	end

end

--**********************************
--检测接受条件
--**********************************
function x600043_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600043_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--根据相应建筑得到对应MissionItem_HashTable.txt中的单元索引
--**********************************
function x600043_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_SHUFANG )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600043_g_ItemOffset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600043_g_ItemOffset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600043_g_ItemOffset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600043_g_ItemOffset + 3
	else													-- 5
		nPos = 160
	end

	return nPos
end

--**********************************
--接受
--**********************************
function x600043_OnAccept( sceneId, selfId, targetId )

	--没有任务才可以走这里
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600043_NotifyFailTips( sceneId, selfId, "等级不够" )
			return
		end

		--加入任务到玩家列表
		--LuaFnAddMission参数说明：
		--sceneId, selfId, misId(任务编号), scriptId, k(是否回调x600043_OnKillObject), e(是否回调OnEnterArea), i(是否回调OnItemChange)
		--功能说明：在玩家身上添加misId编号的任务，成功返回1
		AddMission( sceneId, selfId, x600043_g_MissionId, x600043_g_ScriptId, 0, 0, 1 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) <= 0 then
			return
		end

		--修改玩家身上misId编号的任务相应事件
		--eventId：调用脚本编号，0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--注册 OnLockedTarget 事件
--	SetMissionEvent( sceneId, selfId, x600043_g_MissionId, 4 )
		CallScriptFunction( x600043_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600043_g_ScriptId )
		local misIndex	= GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600043_GetMissionItemIndex( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_Phase, x600043_g_PhaseKey["fnd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId, nitemId )
		--是否有送信任务
		--如果是，怪物会不断掉落"收条书信"，此时要求玩家必须完成一次该任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_IsCarrier, 0 )

		--显示内容告诉玩家已经接受了任务
		local	missionInfo	= format( "    本帮在研究过程中，遇到了麻烦，急需要%s来做原料，这次任务是劳烦你帮我找来。",
				strItemName )
		BeginEvent( sceneId )
			AddText( sceneId, x600043_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    你接受了任务：" .. x600043_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		-- 检测身上是否已有此物品
		if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
			x600043_OnItemChanged( sceneId, selfId, nitemId )
		end
	end

end

--**********************************
--放弃
--**********************************
function x600043_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) <= 0 then
		return
	end

	--普通物品不需要删除

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600043_g_ConstructionScript, "OnAbandon", sceneId, selfId )

end

--**********************************
--继续
--**********************************
function x600043_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600043_g_MissionName )
		AddText( sceneId, x600043_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600043_g_ScriptId, x600043_g_MissionId )

end

--**********************************
--检测是否可以提交
--**********************************
function x600043_CheckSubmit( sceneId, selfId, selectRadioId )

	--判断任务是否已经完成
	local ret = CallScriptFunction( x600043_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--提交
--**********************************
function x600043_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

	if x600043_CheckSubmit( sceneId, selfId ) == 1 then
		--扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then	--成功提交
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else									--只作为容错，理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 0 )
			x600043_NotifyFailTips( sceneId, selfId, "任务失败" )
			return
		end

		CallScriptFunction( x600043_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x600043_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x600043_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600043_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )
	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if nItemNum > 0 then
		strText = format( "得到 %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_Phase, x600043_g_PhaseKey["end"] )
	else
		strText = format( "失去 %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 0 )
	end

	if strText ~= nil then
		x600043_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--醒目提示
--**********************************
function x600043_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
