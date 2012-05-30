-- 城市内政之扩张任务主事件脚本
-- 脚本号
x600023_g_ScriptId = 600023

-- 任务号
x600023_g_MissionId = 1110

-- 任务目标npc
x600023_g_Name = "佟芙蓉"

-- 任务文本描述
x600023_g_MissionName = "扩张任务"
x600023_g_MissionInfo = "城市内政－扩张任务"			--任务描述
x600023_g_MissionTarget = "完成佟芙蓉的任务"			--任务目标
x600023_g_ContinueInfo = "    你的任务还没有完成么？"	--未完成任务的npc对话
x600023_g_MissionComplete = "太谢谢你了"				--完成任务npc说的话

x600023_g_MissionParam_SubId = 1

-- 通用城市任务脚本
x600023_g_CityMissionScript = 600001

-- 子任务表
x600023_g_SubMissionScriptList = { 600024, 600025, 600026, 600027 }

-- 任务奖励
x600023_g_ItemAwardIndexOffset = 28						-- 物品奖励所在表格中的列偏移
x600023_g_MissionRound = MD_CITY_EXPAND_ROUND			-- 城市内政扩张任务
x600023_g_MissionAbandonTime = MD_CITY_EXPAND_TIME		-- 城市内政扩张任务放弃任务的时间
x600023_g_ContribType = GUILD_CONTRIB_POINT				-- 帮会贡献度
x600023_g_SpecType = GUILD_AMBI_LEVEL					-- 专业值奖励
x600023_g_SpecRate = GUILD_AMBI_RATE					-- 专业律

--**********************************
--任务入口函数
--**********************************
function x600023_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600023_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	local rand = random( getn(x600023_g_SubMissionScriptList) )
	CallScriptFunction( x600023_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600023_g_MissionId, x600023_g_SubMissionScriptList[rand] )
end

--**********************************
--列举事件
--**********************************
function x600023_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600023_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	--如果已接任务或满足任务接收条件,则列出任务
	if IsHaveMission( sceneId, selfId, x600023_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600023_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600023_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600023_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600023_g_ScriptId, x600023_g_MissionName,4,-1 )
	end
end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x600023_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600023_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600023_g_MissionId, x600023_g_MissionAbandonTime )
	return ret
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x600023_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600023_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	CallScriptFunction( x600023_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600023_g_MissionId, x600023_g_MissionRound )
end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x600023_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600023_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600023_g_MissionId, x600023_g_MissionAbandonTime, x600023_g_MissionRound )
end

--**********************************
--继续
--**********************************
function x600023_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600023_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600023_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600023_g_MissionId )
	return ret
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x600023_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600023_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600023_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600023_g_MissionId, x600023_g_MissionRound )

		-- 经验奖励
		local ExpBonus = CallScriptFunction( x600023_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600023_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- 帮会贡献度奖励
		local ContribBonus = CallScriptFunction( x600023_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600023_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600023_g_ContribType, ContribBonus )
		end

		-- 专业奖励
		local SpecBonus = CallScriptFunction( x600023_g_CityMissionScript, "CalcSpecBonus", sceneId, selfId, x600023_g_MissionRound )
		-- print(SpecBonus)
		if SpecBonus > 0 then
		--	CityGetAttr( sceneId, selfId, x600023_g_SpecRate )
			CityChangeAttr( sceneId, selfId, x600023_g_SpecType, SpecBonus )
		end

		-- 物品奖励
		CallScriptFunction( x600023_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600023_g_MissionRound, x600023_g_ItemAwardIndexOffset )

		-- 统计信息
		LuaFnAuditQuest(sceneId, selfId, x600023_g_MissionName)

		-- 记录玩家完成了一个任务
		CallScriptFunction( x600023_g_CityMissionScript, "MissionComplete", sceneId, selfId)
	end
end

--**********************************
-- 判断某个事件号是否存在于当前事件列表
--**********************************
function x600023_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600023_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

