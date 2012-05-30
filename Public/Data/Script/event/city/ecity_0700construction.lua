-- 城市内政之建设任务主事件脚本
-- 脚本号
x600035_g_ScriptId = 600035

-- 任务号
x600035_g_MissionId = 1111

-- 任务目标npc
x600035_g_Name = "郑无名"

-- 任务文本描述
x600035_g_MissionName = "建设任务"
x600035_g_MissionInfo = "城市内政－建设任务"			--任务描述
x600035_g_NoMissionInfo = "    帮里似乎没有建设什么。"	--不在建设时提示
x600035_g_MissionTarget = "完成帮会大总管的任务"		--任务目标
x600035_g_ContinueInfo = "    你的任务还没有完成么？"	--未完成任务的npc对话
x600035_g_MissionComplete = "太谢谢你了"				--完成任务npc说的话

x600035_g_MissionParam_SubId = 1

-- 通用城市任务脚本
x600035_g_CityMissionScript = 600001

-- 子任务表
x600035_g_SubMissionScriptList = { 600036, 600038, 600039 }

-- 任务奖励
x600035_g_ItemAwardIndexOffset = 29						-- 物品奖励所在表格中的列偏移
x600035_g_MissionRound = MD_CITY_CONSTRUCT_ROUND		-- 城市内政建设任务
x600035_g_MissionAbandonTime = MD_CITY_CONSTRUCT_TIME	-- 城市内政建设任务放弃任务的时间
x600035_g_ContribType = GUILD_CONTRIB_POINT				-- 帮会贡献度
x600035_g_CityProcess = 0								-- 0:建设，1:研究

--**********************************
--任务入口函数
--**********************************
function x600035_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600035_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if CityInBuildingLevelUp( sceneId, selfId, sceneId ) ~= 1 then
		x600035_NotifyFailBox( sceneId, selfId, targetId, x600035_g_NoMissionInfo )
		return
	end

	local rand = random( getn(x600035_g_SubMissionScriptList) )
	CallScriptFunction( x600035_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600035_g_MissionId, x600035_g_SubMissionScriptList[rand] )
end

--**********************************
--列举事件
--**********************************
function x600035_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600035_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	--如果已接任务或满足任务接收条件,则列出任务
	if IsHaveMission( sceneId, selfId, x600035_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600035_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600035_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600035_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600035_g_ScriptId, x600035_g_MissionName,4,-1 )
	end
end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x600035_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600035_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionAbandonTime )
	return ret
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x600035_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600035_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	CallScriptFunction( x600035_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600035_g_MissionId, x600035_g_MissionRound )
end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x600035_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600035_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionAbandonTime, x600035_g_MissionRound )
end

--**********************************
--继续
--**********************************
function x600035_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600035_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600035_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600035_g_MissionId )
	return ret
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x600035_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600035_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600035_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionRound )

		-- 升级建筑
		CityIncProgress( sceneId, selfId, sceneId, x600035_g_CityProcess )

		-- 经验奖励
		local ExpBonus = CallScriptFunction( x600035_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600035_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- 帮会贡献度奖励
		local ContribBonus = CallScriptFunction( x600035_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600035_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600035_g_ContribType, ContribBonus )
		end

		-- 物品奖励
		CallScriptFunction( x600035_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600035_g_MissionRound, x600035_g_ItemAwardIndexOffset )

		-- 统计信息
		LuaFnAuditQuest(sceneId, selfId, x600035_g_MissionName)
	end
end

--**********************************
-- 判断某个事件号是否存在于当前事件列表
--**********************************
function x600035_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600035_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

--**********************************
--对话窗口信息提示
--**********************************
function x600035_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
