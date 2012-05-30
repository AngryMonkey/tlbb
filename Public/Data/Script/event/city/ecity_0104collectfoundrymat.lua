-- 寻找矿石任务
--MisDescBegin
-- 脚本号
x600006_g_ScriptId = 600006

--任务号
x600006_g_MissionId = 1105

--任务目标npc
x600006_g_Name = "马应雄"

--任务归类
x600006_g_MissionKind = 50

--任务等级
x600006_g_MissionLevel = 10000

--是否是精英任务
x600006_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x600006_g_IsMissionOkFail = 0							-- 任务完成标记

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x600006_g_MissionName = "工程任务"
x600006_g_MissionInfo = ""													--任务描述
x600006_g_MissionTarget = "    从%n打落%s个%i。"								--任务目标
x600006_g_ContinueInfo = "    你的任务还没有完成么？"						--未完成任务的npc对话
x600006_g_SubmitInfo = "    事情进展得如何？"								--完成未提交时的npc对话
x600006_g_MissionComplete = "    干得不错，甚好甚好。"						--完成任务npc说话的话

x600006_g_Parameter_Item_AllRandom = { { id = 7, num = 6 } }

x600006_g_StrForePart = 5

x600006_g_MissionRound = 38

-- 通用城市任务脚本
x600006_g_CityMissionScript = 600001
x600006_g_EngineeringScript = 600002

x600006_g_StrList = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }

--任务奖励

--MisDescEnd

x600006_g_NpcIdx = x600006_g_StrForePart											-- MissionNpc 存储位置
x600006_g_ItemCountIdx = x600006_g_StrForePart + 1									-- 任务物品数量的存储位置
x600006_g_ItemIdx = x600006_g_StrForePart + 2										-- 任务物品的存储位置

-- 随机因子
x600006_g_RandomSeed = 100
-- 掉落几率
x600006_g_DropOdds = 30

x600006_g_missionItems = {
	40003090, 40003091, 40003092, 40003093, 40003094, 40003095, 40003096, 40003097,
	40003098, 40003099, 40003100, 40003101, 40003102, 40003103, 40003104, 40003105,
	40003106, 40003107, 40003108, 40003109, 40003110, 40003111, 40003112, 40003113,
	40003114, 40003115, 40003116, 40003117, 40003118, 40003119, 40003120, 40003121,
	40003122, 40003123, 40003124, 40003125, 40003126, 40003127
}

x600006_g_missionItemsInfo = {}

x600006_g_missionItemsInfo[20] = {
	[40003091] = { 300218 },
	[40003094] = { 300202, 300260 },
	[40003096] = { 300246, 300248 },
	[40003099] = { 300200, 300210, 300201, 300211, 300212, 300213, 300228, 300229 },
	[40003101] = { 300240 },
	[40003102] = { 300204, 300205, 300224, 300225 },
	[40003103] = { 300242 },
	[40003107] = { 300220, 300221, 300244, 300245 },
	[40003111] = { 300226 },
	[40003112] = { 300222 },
	[40003117] = { 300214, 300215, 300208, 300209 },
	[40003126] = { 300206 },
	[40003127] = { 300216 }
}
x600006_g_missionItemsInfo[30] = {
	[40003094] = { 300260 },
	[40003096] = { 300247, 300248, 300249 },
	[40003097] = { 300268 },
	[40003102] = { 300272 },
	[40003106] = { 300280, 300281, 300282 },
	[40003107] = { 300278, 300279, 300284 },
	[40003120] = { 300276 },
	[40003122] = { 300262, 300263, 300270, 300271 },
	[40003124] = { 300264, 300265, 300266, 300267 },
	[40003125] = { 300274 }
}
x600006_g_missionItemsInfo[40] = {
	[40003097] = { 300304 },
	[40003100] = { 300288 },
	[40003102] = { 300286, 300287, 300296, 300297 },
	[40003106] = { 300283, 300312 },
	[40003107] = { 300285 },
	[40003113] = { 300290, 300291, 300292, 300293, 300294, 300295 },
	[40003122] = { 300298, 300299, 300300, 300301, 300302, 300303, 300306 }
}
x600006_g_missionItemsInfo[50] = {
	[40003099] = { 300332 },
	[40003100] = { 300322 },
	[40003106] = { 300313, 300314, 300315, 300316, 300317, 300318, 300319 },
	[40003107] = { 300310 },
	[40003109] = { 300330 },
	[40003113] = { 300324, 300325, 300326, 300327, 300328, 300329 },
	[40003122] = { 300307 },
	[40003125] = { 300308 },
	[40003126] = { 300320 }
}
x600006_g_missionItemsInfo[60] = {
	[40003092] = { 300348, 300349, 300350, 300351, 300352, 300353, 300354 },
	[40003099] = { 300333 },
	[40003100] = { 300344 },
	[40003107] = { 300356 },
	[40003109] = { 300331 },
	[40003115] = { 300336, 300337, 300338, 300339, 300342, 300343 },
	[40003116] = { 300340 },
	[40003126] = { 300334, 300335, 300346, 300347 }
}
x600006_g_missionItemsInfo[70] = {
	[40003092] = { 300355 },
	[40003094] = { 300358 },
	[40003107] = { 300357 },
	[40003108] = { 300380 },
	[40003110] = { 300378 },
	[40003111] = { 300360, 300361, 300362, 300363, 300364, 300365 },
	[40003115] = { 300372, 300373, 300374, 300375, 300376, 300377 },
	[40003118] = { 300366 },
	[40003125] = { 300370 },
	[40003126] = { 300368 }
}
x600006_g_missionItemsInfo[80] = {
	[40003090] = { 300400 },
	[40003092] = { 300382, 300383, 300384, 300385, 300386, 300387 },
	[40003093] = { 300404 },
	[40003094] = { 300394 },
	[40003098] = { 300402 },
	[40003107] = { 300392 },
	[40003108] = { 300381 },
	[40003110] = { 300379 },
	[40003111] = { 300396, 300397, 300398, 300399 },
	[40003114] = { 300388, 300389, 300390, 300391 }
}
x600006_g_missionItemsInfo[90] = {
	[40003092] = { 300408 },
	[40003093] = { 300405 },
	[40003094] = { 300416 },
	[40003095] = { 300422 },
	[40003098] = { 300403 },
	[40003100] = { 300424 },
	[40003101] = { 300426 },
	[40003102] = { 300414 },
	[40003119] = { 300406, 300407, 300410, 300411, 300412, 300413 },
	[40003121] = { 300418, 300419, 300420, 300421 },
	[40003123] = { 300428 }
}
x600006_g_missionItemsInfo[100] = {
	[40003093] = { 300434, 300435, 300444, 300445 },
	[40003098] = { 300456, 300457, 300458, 300459, 300460, 300461, 300462, 300463 },
	[40003100] = { 300425, 300454, 300455 },
	[40003105] = { 300446, 300447, 300448, 300449, 300450, 300451, 300452, 300453 },
	[40003119] = { 300436, 300437, 300438, 300439, 300440, 300441, 300442, 300443 },
	[40003123] = { 300430, 300431, 300432, 300433 }
}

--**********************************
--任务入口函数
--**********************************
function x600006_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600006_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600006_g_MissionId ) > 0 then
		--发送任务需求的信息
		local bDone = x600006_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600006_g_SubmitInfo
		else
			strText = x600006_g_ContinueInfo
		end

		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x600006_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600006_g_ScriptId, x600006_g_MissionId, bDone )
	--满足任务接收条件
	elseif x600006_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600006_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600006_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600006_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600006_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600006_g_MissionId ) > 0 then
		AddNumText( sceneId, x600006_g_ScriptId, x600006_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600006_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600006_g_EngineeringScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--接受
--**********************************
function x600006_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600006_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if GetLevel( sceneId, selfId ) < 20 then
		CallScriptFunction( x600006_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600006_g_MissionId, x600006_g_ScriptId, 1, 0, 1 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600006_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600006_g_EngineeringScript, "OnAccept", sceneId, selfId, targetId, x600006_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600006_g_MissionId )

	-- 找到玩家适合的级别
	local idx, value, level, myLevel
	level = 0
	myLevel = LuaFnGetLevel( sceneId, selfId )

	for idx, value in x600006_g_missionItemsInfo do
		if idx > level and idx <= myLevel then
			level = idx
		end
	end

	local validMissions = x600006_g_missionItemsInfo[level]
	if not validMissions then
		x600006_OnAbandon( sceneId, selfId )
		CallScriptFunction( x600006_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "无法找到合适的任务" )
		return
	end

	local missionArray = {}
	local i = 1

	for idx, value in validMissions do
		missionArray[i] = idx
		i = i + 1
	end

	-- 随机挑出一个适用的物品
	local missionItem = missionArray[random( getn(missionArray) )]

	-- 再随机挑出一个适用掉落该物品的怪物 NpcId 号
	local missionNpc = validMissions[missionItem][random( getn(validMissions[missionItem]) )]

	local itemCount = 5 + random(5)

	SetMissionByIndex( sceneId, selfId, misIndex, x600006_g_NpcIdx, missionNpc )
	SetMissionByIndex( sceneId, selfId, misIndex, x600006_g_ItemIdx, missionItem )
	SetMissionByIndex( sceneId, selfId, misIndex, x600006_g_ItemCountIdx, itemCount )

	local _, strDemandItemName = GetItemInfoByItemId( missionItem )
	local _, strNpcName, strNpcSceneDesc = GetNpcInfoByNpcId(sceneId, missionNpc )

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    我们打造需要#Y%s#W，%s%s那里可以找到，你去找%d个来。",
				strDemandItemName, strNpcSceneDesc, strNpcName, itemCount )
		else
			missionInfo = format( "    听说%s%s可以打出#Y%s#W来，对工业研究非常有用，就辛苦你取来%d个了。",
				strNpcSceneDesc, strNpcName, strDemandItemName, itemCount )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    你接受了任务：" .. x600006_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600006_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600006_g_MissionId ) <= 0 then
		return
	end

	-- 删除物品
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600006_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600006_g_ItemIdx )
	local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

	if nItemNum > 0 then
		DelItem( sceneId, selfId, demandItemId, nItemNum )
	end

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600006_g_EngineeringScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600006_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600006_g_MissionName )
		AddText( sceneId, x600006_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600006_g_ScriptId, x600006_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600006_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600006_g_EngineeringScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600006_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600006_g_ItemIdx )
		local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600006_g_ItemCountIdx )
		local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

		if nItemNum < demandItemCount then
			ret = 0
		end
	end

	return ret
end

--**********************************
--提交
--**********************************
function x600006_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600006_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600006_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600006_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600006_g_ItemIdx )
		local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600006_g_ItemCountIdx )
		local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

		if nItemNum >= demandItemCount then
			DelItem( sceneId, selfId, demandItemId, demandItemCount )
		else											-- 只作为容错，理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600006_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600006_g_EngineeringScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600006_OnKillObject( sceneId, selfId, objdataId, objId )				--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--取得这个怪物死后拥有分配权的人数
	local i
	local curOwner
	local misIndex
	local nNpcId
	local strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId
	local demandItemCount

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--取得拥有分配权的人的objId
		if IsHaveMission( sceneId, curOwner, x600006_g_MissionId ) > 0 and	--如果这个人拥有任务
		   GetScriptIDByMissionID( sceneId, curOwner, x600006_g_MissionId ) == x600006_g_ScriptId then		--并且是本脚本的任务
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600006_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600006_g_NpcIdx )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600006_g_ItemIdx )
			demandItemCount = GetMissionParam( sceneId, curOwner, misIndex, x600006_g_ItemCountIdx )

			if MonsterName == strNpcName then
			-- 一定几率打出任务所需物品
				if GetItemCount( sceneId, curOwner, demandItemId ) < demandItemCount then
					--if random( x600006_g_RandomSeed ) > x600006_g_DropOdds then
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
function x600006_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600006_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600006_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600006_g_ItemIdx )
	local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600006_g_ItemCountIdx )
	local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

	if demandItemId == itemdataId then
		local _, strItemName = GetItemInfoByItemId( itemdataId )
		
		local strText = format( "得到%s %d/%d", strItemName, nItemNum, demandItemCount )

		if nItemNum <= demandItemCount then
			SetMissionByIndex( sceneId, selfId, misIndex, x600006_g_IsMissionOkFail, 0 )
		end

		if nItemNum >= demandItemCount then
			strText = format( "得到%s %d/%d", strItemName, demandItemCount, demandItemCount )
			SetMissionByIndex( sceneId, selfId, misIndex, x600006_g_IsMissionOkFail, 1 )
		end


		if strText and nItemNum <= demandItemCount then
			CallScriptFunction( x600006_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
		end
	end
end
