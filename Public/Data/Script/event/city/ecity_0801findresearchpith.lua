--副本任务
--寻找研究要术

--************************************************************************
--MisDescBegin
--脚本号
x600041_g_ScriptId	= 600041
--任务号
x600041_g_MissionId	= 1113
--目标NPC
x600041_g_Name			= "郑无名"
--任务等级
x600041_g_MissionLevel					= 10000
--任务归类
x600041_g_MissionKind						= 50
--是否是精英任务
x600041_g_IfMissionElite				= 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明
x600041_g_IsMissionOkFail				= 0	--0 任务完成标记
x600041_g_MissionParam_SubId		= 1	--1 子任务脚本号存放位置
x600041_g_MissionParam_Phase		= 2	--2 阶段号 此号用于区分当前任务UI的描述信息
x600041_g_MissionParam_NpcId		= 3	--3 任务 NPC 的 NPCId 号
x600041_g_MissionParam_ItemId		= 4	--4 任务物品的编号
x600041_g_MissionParam_MonsterId= 5	--5 任务 Monster 的 NPCId 号
x600041_g_MissionParam_IsCarrier= 6	--6 是否有送信任务
--循环任务的数据索引，里面存着已做的环数
x600041_g_MissionRound					= 61
--**********************************以上是动态****************************

--任务文本描述
x600041_g_MissionName			= "研究任务"
x600041_g_MissionInfo			= "城市内政－研究任务"									--任务描述
x600041_g_MissionTarget		= "%f"																	--任务目标
x600041_g_ContinueInfo		= "    你的任务还没有完成么？"					--未完成任务的npc对话
x600041_g_SubmitInfo			= "    事情进展得如何？"								--完成未提交时的npc对话
x600041_g_MissionComplete	= "    甚好甚好，研究进度又加快了不少。"--完成任务npc说话的话

x600041_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600041_g_StrForePart			= 2

--用来保存字符串格式化的数据
x600041_g_FormatList			= {
	"",
	"    密信曰：呈吾友贵帮首领，所送来的%2i已收到，购入之银两随后奉上。吾当静候大驾来取。友：%1n顿首。",	--1 收条书信
	"    找到%3n夺回%2i。",					--2 寻找研究要术
	"    将%2i交还给帮会大总管。"		--3 送还
}

--通用城市任务脚本
x600041_g_CityMissionScript	= 600001
x600041_g_ConstructionScript= 600040

--任务奖励

--MisDescEnd
--************************************************************************

x600041_g_ItemOffset			= 39	--表里第几个物品列的偏移量
x600041_g_NPCOffset				= 38	--表里第几列 NPC 的偏移量
x600041_g_NPCOffsetEx			= 259 --表里第几列 NPC 的偏移量扩充 modi:lby20071126
x600041_g_MonsterOffset		= 43	--表里第几列 Monster 的偏移量

--阶段任务
--掉落规则：10%几率掉落任务物品；在掉落的几率中，1成直接打出研究要术，另9成会打出"收条书信"
x600041_g_PhaseKey				= {}
x600041_g_PhaseKey["mal"]	= 1		--收条书信：掉落书信，刷新任务描述，到NPC处追还所需物品
x600041_g_PhaseKey["fnd"]	= 2		--寻找研究要术：直接掉落所需物品
x600041_g_PhaseKey["end"]	= 3		--送还

--随机因子
x600041_g_RandomSeed			= 100
--掉落几率
x600041_g_DropOdds				= 10
--所需物品
x600041_g_itmNeed					= { 40004288 }
--求援书信
x600041_g_itmMail					= 40004289

--**********************************
--任务入口函数
--**********************************
function x600041_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600041_g_Name then
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600041_g_MissionId ) > 0 then
		local bDone = x600041_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600041_g_SubmitInfo
		else
			strText = x600041_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600041_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600041_g_ScriptId, x600041_g_MissionId, bDone )

	--未接此任务，且满足任务接收条件
	elseif x600041_CheckAccept( sceneId, selfId ) > 0 then
		x600041_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x600041_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600041_g_Name then
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600041_g_MissionId ) > 0 then
		AddNumText( sceneId, x600041_g_ScriptId, x600041_g_MissionName,3,-1 )
	end

end

--**********************************
--检测接受条件
--**********************************
function x600041_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600041_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--根据玩家等级得到对应MissionItem_HashTable.txt中的单元索引
--**********************************
function x600041_GetMissionItemIndex( sceneId, selfId )

	return x600041_g_ItemOffset

end

--**********************************
--根据玩家等级得到对应MissionNPC_HashTable.txt中的选择信息
--**********************************
function x600041_GetMissionNPCKey( sceneId, selfId )

	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos
	if nPlayerLevel < 30 then					-- 10 ~ 30 Level
		nPos = 0
	elseif nPlayerLevel < 50 then			-- 30 ~ 50 Level
		nPos = 1
	elseif nPlayerLevel < 70 then			-- 50 ~ 70 Level
		nPos = 2
	elseif	nPlayerLevel < 100 then		-- 70 ~ 100 Level
		nPos = 3
	elseif nPlayerLevel < 120 then		-- 100 ~ 120 Level	modi:lby20071126
		nPos = 0
	else 															-- >=120 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600041_g_NPCOffset
	else
		return nPos + x600041_g_NPCOffsetEx
	end

end

--**********************************
--接受
--**********************************
function x600041_OnAccept( sceneId, selfId, targetId )

	--没有任务才可以走这里
	if IsHaveMission( sceneId, selfId, x600041_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600041_NotifyFailTips( sceneId, selfId, "等级不够" )
			return
		end

		--加入任务到玩家列表
		--LuaFnAddMission参数说明：
		--sceneId, selfId, misId(任务编号), scriptId, k(是否回调x600041_OnKillObject), e(是否回调OnEnterArea), i(是否回调OnItemChange)
		--功能说明：在玩家身上添加misId编号的任务，成功返回1
		AddMission( sceneId, selfId, x600041_g_MissionId, x600041_g_ScriptId, 1, 0, 1 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600041_g_MissionId ) <= 0 then
			return
		end

		--修改玩家身上misId编号的任务相应事件
		--eventId：调用脚本编号，0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--注册 x600041_OnLockedTarget 事件
		SetMissionEvent( sceneId, selfId, x600041_g_MissionId, 4 )
		CallScriptFunction( x600041_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600041_g_ScriptId )
		local misIndex	= GetMissionIndexByID( sceneId, selfId, x600041_g_MissionId )

		-- 随机挑出一个适用的物品
		local	nitemId					= x600041_g_itmNeed[ random( getn(x600041_g_itmNeed) ) ]
		local _, strItemName	= GetItemInfoByItemId( nitemId )

		--选择送信NPC
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600041_GetMissionNPCKey( sceneId, selfId ) )
		--选择攻击Monster
		local nMonsterId, strMonsterName, strMonsterSceneDesc, _, _, _, _, _, nLevel = LuaFnGetLevelMatchingMonster( x600041_g_MonsterOffset, GetLevel( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_Phase, x600041_g_PhaseKey["fnd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_ItemId, nitemId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_MonsterId, nMonsterId )
		--是否有送信任务
		--如果是，怪物会不断掉落"收条书信"，此时要求玩家必须完成一次该任务
		if random( 10 ) <= 1 then
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_IsCarrier, 0 )
		else
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_IsCarrier, 1 )
		end

		--显示内容告诉玩家已经接受了任务
		local	missionInfo	= format( "    %s，你来的正好，在我们研究过程中，需要%s，可是在途经%s时，不慎被%s抢走，命你速去寻回。",
				GetName( sceneId, selfId ), strItemName, strMonsterSceneDesc, strMonsterName )
		BeginEvent( sceneId )
			AddText( sceneId, x600041_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    你接受了任务：" .. x600041_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--当锁定一个对象
--**********************************
function x600041_OnLockedTarget( sceneId, selfId, objId )

	if IsHaveMission( sceneId, selfId, x600041_g_MissionId ) < 1 then
		return		--没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600041_g_MissionId )
	local nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600041_g_MissionParam_NpcId )
	local _, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then
		return		--找错人了
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x600041_NotifyFailTips( sceneId, selfId, "此任务需要至少一格任务物品空间" )
		return
	end

	local itemId = GetMissionParam( sceneId, selfId, misIndex, x600041_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( itemId )

	local Phase = GetMissionParam( sceneId, selfId, misIndex, x600041_g_MissionParam_Phase )

	--求援书信
	if Phase == x600041_g_PhaseKey["mal"] then
		local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE)
		if pos == -1 then
			x600041_NotifyFailTips( sceneId, selfId, "背包空间不足" )
			return
		end

		local missionInfo = format( "    什么？你是说这是赃物？唉！真是倒霉，好吧，%s你拿去啊。",
				strDemandItemName )
		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600041_g_MissionId, 4 )
		DelItem( sceneId, selfId, x600041_g_itmMail, 1 )

		--任务完成
		SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_Phase, x600041_g_PhaseKey["end"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_IsMissionOkFail, 1 )
		x600041_NotifyFailTips( sceneId, selfId, "任务完成" )

	-- 意外情况
	else
		return
	end

end

--**********************************
--放弃
--**********************************
function x600041_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600041_g_MissionId ) <= 0 then
		return
	end

	-- 删除物品
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600041_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600041_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end
	if GetItemCount( sceneId, selfId, x600041_g_itmMail ) > 0 then
		DelItem( sceneId, selfId, x600041_g_itmMail, 1 )
	end

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600041_g_ConstructionScript, "OnAbandon", sceneId, selfId )

end

--**********************************
--继续
--**********************************
function x600041_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600041_g_MissionName )
		AddText( sceneId, x600041_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600041_g_ScriptId, x600041_g_MissionId )

end

--**********************************
--检测是否可以提交
--**********************************
function x600041_CheckSubmit( sceneId, selfId, selectRadioId )

	--判断任务是否已经完成
	local ret = CallScriptFunction( x600041_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--提交
--**********************************
function x600041_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc是否是对应任务的npc
	if GetName( sceneId, targetId ) ~= x600041_g_Name then
		return
	end

	if x600041_CheckSubmit( sceneId, selfId ) == 1 then
		--扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600041_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600041_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then	--成功提交
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else									--只作为容错，理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600041_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x600041_OnKillObject( sceneId, selfId, objdataId, objId )

	--取得这个怪物死后拥有分配权的人数
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )
	local i, curOwner, misIndex, nNpcId, strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId, demandItemCount

	for i = 0, allOwnersCount - 1 do
		--取得拥有分配权的人的objId
		curOwner = GetMonsterOwnerID( sceneId, objId, i )
		--如果这个人拥有任务
		if IsHaveMission( sceneId, curOwner, x600041_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600041_g_MissionId ) == x600041_g_ScriptId then
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600041_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600041_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600041_g_MissionParam_ItemId )

			if MonsterName == strNpcName then
				x600041_OnItemDrop( sceneId, selfId, objId, curOwner, demandItemId )
			end
		end
	end

end

--**********************************
--进入区域事件
--**********************************
function x600041_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600041_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600041_g_MissionId )
	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600041_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId and itemdataId ~= x600041_g_itmMail then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if itemdataId == x600041_g_itmMail then
		if nItemNum > 0 then
			strText = format( "你得到一封密信，似乎其中有玄机，可看看任务" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_Phase, x600041_g_PhaseKey["mal"] )
		else
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_Phase, x600041_g_PhaseKey["end"] )
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_IsCarrier, 0 )
		end
	else
		if nItemNum > 0 then
			strText = format( "得到 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_MissionParam_Phase, x600041_g_PhaseKey["end"] )
		else
			strText = format( "失去 %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600041_g_IsMissionOkFail, 0 )
		end
	end

	if strText ~= nil then
		x600041_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--物品掉落
--**********************************
function x600041_OnItemDrop( sceneId, selfId, monsterId, curOwner, demandItemId )

	--一定几率打出任务所需物品
	--if random( x600041_g_RandomSeed ) > x600041_g_DropOdds then
		--return
	--end

	--必须接受送信任务
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600041_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x600041_g_MissionParam_IsCarrier ) == 1 then
		if GetItemCount( sceneId, curOwner, x600041_g_itmMail ) >= 1 then
			return	--包中已经有信
		end
		AddMonsterDropItem( sceneId, monsterId, curOwner, x600041_g_itmMail )

	--直接掉落任务所需物品
	else
		AddMonsterDropItem( sceneId, monsterId, curOwner, demandItemId )
	end

end

--**********************************
--醒目提示
--**********************************
function x600041_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
