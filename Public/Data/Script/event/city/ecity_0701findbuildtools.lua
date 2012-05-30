--副本任务
--寻找建设工具

--************************************************************************
--MisDescBegin

--脚本号
x600036_g_ScriptId = 600036

--任务号
x600036_g_MissionId = 1111

--目标NPC
x600036_g_Name = "郑无名"

--任务等级
x600036_g_MissionLevel = 10000

--任务归类
x600036_g_MissionKind = 50

--是否是精英任务
x600036_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明

x600036_g_IsMissionOkFail			=0	--0 任务完成标记
x600036_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置
x600036_g_MissionParam_Phase		=2	--2 阶段号 此号用于区分当前任务UI的描述信息
x600036_g_MissionParam_NpcId		=3	--3 任务 NPC 的 NPCId 号
x600036_g_MissionParam_ItemId		=4	--4 任务物品的编号
x600036_g_MissionParam_MonsterId	=5	--5 任务 Monster 的 NPCId 号

--循环任务的数据索引，里面存着已做的环数
x600036_g_MissionRound = 59
--**********************************以上是动态****************************

--任务文本描述
x600036_g_MissionName = "建设任务"
x600036_g_MissionInfo = "城市内政－建设任务"								--任务描述
x600036_g_MissionTarget = "%f"												--任务目标
x600036_g_ContinueInfo = "    你的任务还没有完成么？"						--未完成任务的npc对话
x600036_g_SubmitInfo = "    事情进展得如何？"								--完成未提交时的npc对话
x600036_g_MissionComplete = "    甚好甚好，建筑的进度又加快了。"			--完成任务npc说话的话

x600036_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600036_g_StrForePart = 2

--用来保存字符串格式化的数据
x600036_g_FormatList = {
	"",
	"    前往%1n借取%2i。",					-- 1
	"    将%2i交还给帮会大总管。",			-- 2
	"    前往%1n借取%2i。",					-- 3
	"    前往%1n借取%2i。",					-- 4
	"    %3n抢走了%2i，需要你去夺回来。",	-- 5
	"    将%2i交还给帮会大总管。",			-- 6
}

-- 通用城市任务脚本
x600036_g_CityMissionScript = 600001
x600036_g_ConstructionScript = 600035

--任务奖励

--MisDescEnd
--************************************************************************

x600036_g_ItemOffset = 29				-- Suppose to 29, 表里第几个物品列的偏移量
x600036_g_NPCOffset = 34				-- Suppose to 34, 表里第几列 NPC 的偏移量
x600036_g_NPCOffsetEx	= 257 		--表里第几列 NPC 的偏移量扩充 modi:lby20071126
x600036_g_MonsterOffset = 43		-- Suppose to 43, 表里第几列 Monster 的偏移量

x600036_g_subScriptId = 600037
x600036_g_subMissionId = 1112

x600036_g_FamilyNamesList = { "赵", "钱", "孙", "李", "周", "吴", "郑", "王", "冯", "陈", "褚", "魏", "蒋", "沈", "韩", "杨", "朱", "秦", "尤", "许", "何", "吕", "施", "张", }

--**********************************
--任务入口函数
--**********************************
function x600036_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) > 0 then
		local bDone = x600036_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600036_g_SubmitInfo
		else
			strText = x600036_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600036_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600036_g_ScriptId, x600036_g_MissionId, bDone )

	--满足任务接收条件
	elseif x600036_CheckAccept( sceneId, selfId ) > 0 then
		x600036_OnAccept( sceneId, selfId, targetId )
	end
end

--**********************************
--列举事件
--**********************************
function x600036_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) > 0 then
		AddNumText( sceneId, x600036_g_ScriptId, x600036_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600036_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600036_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据玩家等级得到对应MissionItem_HashTable.txt中的单元索引
--**********************************
function x600036_GetMissionItemIndex( sceneId, selfId )
	return x600036_g_ItemOffset
end

--**********************************
--根据玩家等级得到对应MissionNPC_HashTable.txt中的选择信息
--**********************************
function x600036_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 30 then								-- 10 ~ 30
		nPos = 0
	elseif nPlayerLevel < 50 then							-- 30 ~ 50
		nPos = 1
	elseif nPlayerLevel < 70 then							-- 50 ~ 70
		nPos = 2
	--else													-- 70 ~ 100
	--	nPos = 3
	--end

	--return nPos + x600036_g_NPCOffset
	elseif	nPlayerLevel < 100 then		-- 70 ~ 100 Level
		nPos = 3
	elseif nPlayerLevel < 120 then		-- 100 ~ 120 Level	modi:lby20071126
		nPos = 0
	else 															-- >=120 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600036_g_NPCOffset
	else
		return nPos + x600036_g_NPCOffsetEx
	end
end

--**********************************
--接受
--**********************************
function x600036_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 10 then
			CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600036_g_MissionId, x600036_g_ScriptId, 0, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 ) -- 注册 x600036_OnLockedTarget 事件
		CallScriptFunction( x600036_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600036_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600036_GetMissionItemIndex( sceneId, selfId ) )
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600036_GetMissionNPCKey( sceneId, selfId ) )
		local PlayerGender = GetSex( sceneId, selfId )
		local rank

		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId, nitemId )

		if PlayerGender == 0 then
			rank = "侠女"
		elseif PlayerGender == 1 then
			rank = "少侠"
		else
			rank = "阁下"
		end

		--显示内容告诉玩家已经接受了任务
		BeginEvent( sceneId )
			AddText( sceneId, x600036_g_MissionName )
			local missionInfo = format( "    在工地%s师傅，不幸失落了%s，恳请%s前往%s%s（%d，%d）处借取，甚是感激。",
				x600036_g_FamilyNamesList[random(getn(x600036_g_FamilyNamesList))], strItemName, rank,
				strNpcSceneDesc, strNpcName, nPosX, nPosZ )

			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    你接受了任务：" .. x600036_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--当锁定一个对象
--**********************************
function x600036_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

	local nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_NpcId )
	local _, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then			-- 找错人了
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x600036_NotifyFailTips( sceneId, selfId, "此任务需要至少一格任务物品空间" )
		return
	end

	local itemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( itemId )

	local Phase = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase )

	local PlayerGender = GetSex( sceneId, selfId )
	local rank

	if PlayerGender == 0 then
		rank = "侠女"
	else
		rank = "少侠"
	end

	if Phase == 1 then				-- 刚接了任务来找 NPC
		-- 8 成机会直接给与任务物品，任务完成，1 成机会给副本任务，1 成机会给杀怪任务
		local rand = random(100)	-- 直接完成任务
		if rand <= 80 then
			local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE )
			if pos == -1 then
				CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "背包空间不足" )
				return
			end

			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 2 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )		-- 任务完成

			local missionInfo = format( "    既然是%s来取，自当效力，这是%s，请笑纳。",
				rank, strDemandItemName )

			TAddText( sceneId, missionInfo )

			ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
			return
		elseif rand <= 90 then		-- 分派副本任务
			--加入任务到玩家列表
			AddMission( sceneId, selfId, x600036_g_subMissionId, x600036_g_subScriptId, 1, 0, 0 )	-- kill、area、item
			if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
				return
			end

			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 3 )
			local subMisIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_subMissionId )
			SetMissionByIndex( sceneId, selfId, subMisIndex, 2, 10 )						--需要杀死的怪物数量，仅供客户端使用

			CallScriptFunction( x600036_g_subScriptId, "OnEnumerate", sceneId, selfId, objId )

			return
		else						-- 分派杀怪任务
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 5 )

			SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 0 )					-- 注册 KillObj 事件
			SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 2 )					-- 注册 itemchange 事件
			local myLevel = GetLevel( sceneId, selfId )
			local nMonsterId, strMonsterName, strMonsterSceneDesc, _, _, _, _, _, nLevel = LuaFnGetLevelMatchingMonster( x600036_g_MonsterOffset, myLevel )

--		PrintStr( "我的级别: " .. myLevel .. "，怪的级别: " .. nLevel )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_MonsterId, nMonsterId )

			strMonsterSceneDesc	= gsub( strMonsterSceneDesc, "的", "" )
			local missionInfo = format( "    呵呀，真是不巧，%s倒是有，前些日路过%s时，不慎被那里的%s抢了去，如果%s愿意可去夺回。",
				strDemandItemName, strMonsterSceneDesc, strMonsterName, rank )

			TAddText( sceneId, missionInfo )

			ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
			return
		end
	elseif Phase == 3 then			-- 分配了副本任务
			--加入任务到玩家列表
		if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
			AddMission( sceneId, selfId, x600036_g_subMissionId, x600036_g_subScriptId, 1, 0, 0 )	-- kill、area、item
			if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
				return
			end
		end

		CallScriptFunction( x600036_g_subScriptId, "OnEnumerate", sceneId, selfId, objId )
		return
	elseif Phase == 4 then			-- 副本任务完成了
		-- 删除副本任务，给与任务物品
		local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE)
		if pos == -1 then
			CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "背包空间不足" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 2 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )		-- 任务完成

		local missionInfo = format( "    多谢%s拔刀援手，这个%s请呈回贵帮吧。",
			rank, strDemandItemName )

		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
		return
	elseif Phase == 5 then			-- 已经分配了杀怪任务
		local myLevel = GetLevel( sceneId, selfId )
		local nMonsterId, strMonsterName, strMonsterSceneDesc = LuaFnGetLevelMatchingMonster( x600036_g_MonsterOffset, myLevel )
		strMonsterSceneDesc	= gsub( strMonsterSceneDesc, "的", "" )
		local missionInfo = format( "    呵呀，真是不巧，%s倒是有，前些日路过%s时，不慎被那里的%s抢了去，如果%s愿意可去夺回。",
			strDemandItemName, strMonsterSceneDesc, strMonsterName, rank )

		TAddText( sceneId, missionInfo )
		return
	else							-- 意外情况
		return
	end
end

--**********************************
--放弃
--**********************************
function x600036_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) == 1 then
		x600036_NotifyFailTips( sceneId, selfId, "请先放弃其他关联任务" )
		return		-- 没有该任务
	end

	--删除物品
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600036_g_ConstructionScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600036_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600036_g_MissionName )
		AddText( sceneId, x600036_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600036_g_ScriptId, x600036_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600036_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务是否已经完成
	local ret = CallScriptFunction( x600036_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600036_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600036_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else											-- 只作为容错，理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600036_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600036_OnKillObject( sceneId, selfId, objdataId, objId )
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--取得这个怪物死后拥有分配权的人数
	local i, curOwner, misIndex, nNpcId, strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId, demandItemCount

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--取得拥有分配权的人的objId
		if IsHaveMission( sceneId, curOwner, x600036_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600036_g_MissionId ) == x600036_g_ScriptId then		--如果这个人拥有任务
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600036_g_MissionId )

		 	if GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_Phase ) ~= 5 then
		 		return
		 	end

			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_ItemId )

			if MonsterName == strNpcName then
			-- 一定几率打出任务所需物品
				if GetItemCount( sceneId, curOwner, demandItemId ) < 1 then
					--if random( 100 ) > 10 then
						--return
					--end

					AddMonsterDropItem( sceneId, objId, curOwner, demandItemId )
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x600036_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600036_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText
		if nItemNum > 0 then
			strText = format( "已得到 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 6 )
		else
			strText = format( "失去 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 0 )
		end

		CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
	end
end

function x600036_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
