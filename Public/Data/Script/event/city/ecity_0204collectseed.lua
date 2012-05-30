-- 寻找种植物任务
--MisDescBegin
-- 脚本号
x600011_g_ScriptId = 600011

--任务号
x600011_g_MissionId = 1106

--任务目标npc
x600011_g_Name = "朱世友"

--任务归类
x600011_g_MissionKind = 50

--任务等级
x600011_g_MissionLevel = 10000

--是否是精英任务
x600011_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x600011_g_IsMissionOkFail = 0							-- 任务完成标记

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x600011_g_MissionName = "发展任务"
x600011_g_MissionInfo = "    今天我想要 %s 了，去帮我找来吧！"			--任务描述
x600011_g_MissionTarget = "    从%n那里取回%s个%i。"					--任务目标
x600011_g_ContinueInfo = "    你的任务还没有完成么？"					--未完成任务的npc对话
x600011_g_SubmitInfo = "    事情进展得如何？"							--完成未提交时的npc对话
x600011_g_MissionComplete = "    干得不错，甚好甚好。"					--完成任务npc说话的话

x600011_g_Parameter_Item_AllRandom = { { id = 7, num = 6 } }

x600011_g_StrForePart = 5

x600011_g_MissionRound = 40

-- 通用城市任务脚本
x600011_g_CityMissionScript = 600001
x600011_g_DevelopmentScript = 600007

x600011_g_StrList = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }

--任务奖励

--MisDescEnd

x600011_g_NpcIdx = x600011_g_StrForePart											-- MissionNpc 存储位置
x600011_g_ItemCountIdx = x600011_g_StrForePart + 1									-- 任务物品数量的存储位置
x600011_g_ItemIdx = x600011_g_StrForePart + 2										-- 任务物品的存储位置

-- 随机因子
x600011_g_RandomSeed = 100
-- 掉落几率
x600011_g_DropOdds = 30

x600011_g_missionItemsInfo = {}

x600011_g_missionItemsInfo[20] = {
	[40004232] = {
		300219, 300209, 300220, 300221, 300222, 300224, 300223, 300225,
		300226, 300228, 300227, 300229, 300240, 300241, 300242, 300243,
		300244, 300246, 300245, 300260, 300247, 300248, },
	[40004200] = {
		300219, 300209, 300220, 300221, 300222, 300224, 300223, 300225,
		300226, 300228, 300227, 300229, 300240, 300241, 300242, 300243,
		300244, 300246, 300245, 300260, 300247, 300248, }
}

x600011_g_missionItemsInfo[30] = {
	[40004233] = {
		300261, 300249, 300262, 300263, 300264, 300265, 300266, 300268,
		300267, 300269, 300272, 300270, 300273, 300271, 300274, 300276,
		300275, 300278, 300277, 300280, 300279, 300281, 300282, 300284, },
	[40004202] = {
		300261, 300249, 300262, 300263, 300264, 300265, 300266, 300268,
		300267, 300269, 300272, 300270, 300273, 300271, 300274, 300276,
		300275, 300278, 300277, 300280, 300279, 300281, 300282, 300284, }
}

x600011_g_missionItemsInfo[40] = {
	[40004234] = {
		300286, 300283, 300285, 300288, 300287, 300289, 300290, 300291,
		300292, 300296, 300293, 300294, 300297, 300295, 300298, 300299,
		300300, 300301, 300302, 300304, 300303, 300305, 300312, 300306, },
	[40004204] = {
		300286, 300283, 300285, 300288, 300287, 300289, 300290, 300291,
		300292, 300296, 300293, 300294, 300297, 300295, 300298, 300299,
		300300, 300301, 300302, 300304, 300303, 300305, 300312, 300306, }
}

x600011_g_missionItemsInfo[50] = {
	[40004235] = {
		300313, 300310, 300307, 300311, 300308, 300314, 300309, 300315,
		300316, 300317, 300318, 300320, 300322, 300319, 300321, 300323,
		300324, 300325, 300326, 300327, 300328, 300332, 300330, 300329, },
	[40004206] = {
		300313, 300310, 300307, 300311, 300308, 300314, 300309, 300315,
		300316, 300317, 300318, 300320, 300322, 300319, 300321, 300323,
		300324, 300325, 300326, 300327, 300328, 300332, 300330, 300329, }
}

x600011_g_missionItemsInfo[60] = {
	[40004236] = {
		300333, 300331, 300334, 300336, 300335, 300337, 300338, 300339,
		300340, 300344, 300342, 300341, 300345, 300343, 300346, 300348,
		300347, 300349, 300350, 300351, 300352, 300353, 300354, 300356, },
	[40004208] = {
		300333, 300331, 300334, 300336, 300335, 300337, 300338, 300339,
		300340, 300344, 300342, 300341, 300345, 300343, 300346, 300348,
		300347, 300349, 300350, 300351, 300352, 300353, 300354, 300356, }
}

x600011_g_missionItemsInfo[70] = {
	[40004237] = {
		300355, 300358, 300357, 300359, 300360, 300361, 300362, 300363,
		300364, 300365, 300366, 300368, 300367, 300370, 300369, 300372,
		300371, 300373, 300374, 300375, 300376, 300380, 300378, 300377, },
	[40004210] = {
		300355, 300358, 300357, 300359, 300360, 300361, 300362, 300363,
		300364, 300365, 300366, 300368, 300367, 300370, 300369, 300372,
		300371, 300373, 300374, 300375, 300376, 300380, 300378, 300377, }
}

x600011_g_missionItemsInfo[80] = {
	[40004238] = {
		300382, 300381, 300379, 300383, 300384, 300385, 300386, 300387,
		300388, 300392, 300389, 300390, 300394, 300393, 300391, 300395,
		300396, 300397, 300398, 300400, 300399, 300401, 300404, 300402, },
	[40004212] = {
		300382, 300381, 300379, 300383, 300384, 300385, 300386, 300387,
		300388, 300392, 300389, 300390, 300394, 300393, 300391, 300395,
		300396, 300397, 300398, 300400, 300399, 300401, 300404, 300402, }
}

x600011_g_missionItemsInfo[90] = {
	[40004239] = {
		300405, 300403, 300406, 300408, 300407, 300409, 300410, 300414,
		300411, 300412, 300416, 300415, 300413, 300417, 300418, 300419,
		300420, 300422, 300426, 300421, 300423, 300427, 300428, 300424,
		300429, },
	[40004214] = {
		300405, 300403, 300406, 300408, 300407, 300409, 300410, 300414,
		300411, 300412, 300416, 300415, 300413, 300417, 300418, 300419,
		300420, 300422, 300426, 300421, 300423, 300427, 300428, 300424,
		300429, }
}

x600011_g_missionItemsInfo[100] = {
	[40004240] = {
		300425, 300430, 300434, 300431, 300432, 300435, 300436, 300433,
		300437, 300438, 300439, 300440, 300444, 300441, 300442, 300445,
		300446, 300443, 300447, 300448, 300449, 300450, 300454, 300451,
		300452, },
	[40004216] = {
		300425, 300430, 300434, 300431, 300432, 300435, 300436, 300433,
		300437, 300438, 300439, 300440, 300444, 300441, 300442, 300445,
		300446, 300443, 300447, 300448, 300449, 300450, 300454, 300451,
		300452, }
}

--**********************************
--任务入口函数
--**********************************
function x600011_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600011_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600011_g_MissionId ) > 0 then
		--发送任务需求的信息
		local bDone = x600011_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600011_g_SubmitInfo
		else
			strText = x600011_g_ContinueInfo
		end

		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x600011_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600011_g_ScriptId, x600011_g_MissionId, bDone )
	--满足任务接收条件
	elseif x600011_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600011_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600011_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600011_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600011_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600011_g_MissionId ) > 0 then
		AddNumText( sceneId, x600011_g_ScriptId, x600011_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600011_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600011_g_DevelopmentScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--接受
--**********************************
function x600011_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600011_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if GetLevel( sceneId, selfId ) < 30 then
		CallScriptFunction( x600011_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600011_g_MissionId, x600011_g_ScriptId, 1, 0, 1 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600011_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600011_g_DevelopmentScript, "OnAccept", sceneId, selfId, targetId, x600011_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600011_g_MissionId )

	-- 找到玩家适合的级别
	local idx, value, level, myLevel
	level = 0
	myLevel = LuaFnGetLevel( sceneId, selfId )

	for idx, value in x600011_g_missionItemsInfo do
		if idx > level and idx <= myLevel then
			level = idx
		end
	end

	local validMissions = x600011_g_missionItemsInfo[level]
	if not validMissions then
		x600011_OnAbandon( sceneId, selfId )
		CallScriptFunction( x600011_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "无法找到合适的任务" )
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

	SetMissionByIndex( sceneId, selfId, misIndex, x600011_g_NpcIdx, missionNpc )
	SetMissionByIndex( sceneId, selfId, misIndex, x600011_g_ItemCountIdx, itemCount )
	SetMissionByIndex( sceneId, selfId, misIndex, x600011_g_ItemIdx, missionItem )

	local _, strDemandItemName = GetItemInfoByItemId( missionItem )
	local _, strNpcName, strNpcSceneDesc = GetNpcInfoByNpcId(sceneId, missionNpc )

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    现在需要%d个#Y%s#W，听说%s%s非常喜欢吃这种种子，麻烦你帮我弄些来。",
				itemCount, strDemandItemName, strNpcSceneDesc, strNpcName )
		else
			missionInfo = format( "    %s%s，抢走了我们%d个#Y%s#W，取回来自然有你好处。",
				strNpcSceneDesc, strNpcName, itemCount, strDemandItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    你接受了任务：" .. x600011_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600011_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600011_g_MissionId ) <= 0 then
		return
	end

	-- 删除物品
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600011_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600011_g_ItemIdx )
	local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

	if nItemNum > 0 then
		DelItem( sceneId, selfId, demandItemId, nItemNum )
	end

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600011_g_DevelopmentScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600011_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600011_g_MissionName )
		AddText( sceneId, x600011_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600011_g_ScriptId, x600011_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600011_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600011_g_DevelopmentScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600011_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600011_g_ItemIdx )
		local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600011_g_ItemCountIdx )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum < demandItemCount then
			ret = 0
		end
	end

	return ret
end

--**********************************
--提交
--**********************************
function x600011_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600011_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600011_CheckSubmit( sceneId, selfId ) == 1 then
		-- 扣东西
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600011_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600011_g_ItemIdx )
		local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600011_g_ItemCountIdx )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum >= demandItemCount then
			LuaFnDelAvailableItem( sceneId, selfId, demandItemId, demandItemCount )
		else											-- 只作为容错，理论上不可能发生
			SetMissionByIndex( sceneId, selfId, misIndex, x600011_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600011_g_DevelopmentScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600011_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
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
		if IsHaveMission( sceneId, curOwner, x600011_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600011_g_MissionId ) == x600011_g_ScriptId then		--如果这个人拥有任务
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600011_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600011_g_NpcIdx )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600011_g_ItemIdx )
			demandItemCount = GetMissionParam( sceneId, curOwner, misIndex, x600011_g_ItemCountIdx )

			if MonsterName == strNpcName then
			-- 一定几率打出任务所需物品
				if GetItemCount( sceneId, curOwner, demandItemId ) < demandItemCount then
					--if random( x600011_g_RandomSeed ) > x600011_g_DropOdds then
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
function x600011_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600011_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600011_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600011_g_ItemIdx )
	local demandItemCount = GetMissionParam( sceneId, selfId, misIndex, x600011_g_ItemCountIdx )
	local nItemNum = GetItemCount( sceneId, selfId, demandItemId )

	if demandItemId == itemdataId then
		local _, strItemName = GetItemInfoByItemId( itemdataId )
		
		local strText = format( "得到%s %d/%d", strItemName, nItemNum, demandItemCount )

		if nItemNum <= demandItemCount then
			SetMissionByIndex( sceneId, selfId, misIndex, x600011_g_IsMissionOkFail, 0 )
		end

		if nItemNum >= demandItemCount then
			SetMissionByIndex( sceneId, selfId, misIndex, x600011_g_IsMissionOkFail, 1 )
		end



		if strText and nItemNum <= demandItemCount then
			CallScriptFunction( x600011_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
		end
	end
end


function x600011_OnTimer( sceneId, selfId )

	--祝凯 2008-03-06
	--不应该出现这种情况....
	ResetMissionEvent( sceneId, selfId, x600011_g_MissionId, 5 )
	local msg = format( "CityMission_OnTimer_Error x600011_OnTimer %0X,%d,%d", LuaFnObjId2Guid( sceneId, selfId ), sceneId, selfId )
	MissionLog( sceneId, msg )

end
