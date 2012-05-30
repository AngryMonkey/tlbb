-- 城市内政之研究任务主事件脚本
-- 脚本号
x600040_g_ScriptId = 600040

-- 任务号
x600040_g_MissionId = 1113

-- 任务目标npc
x600040_g_Name = "郑无名"

-- 任务文本描述
x600040_g_MissionName = "研究任务"
x600040_g_MissionInfo = "城市内政－研究任务"			--任务描述
x600040_g_NoMissionInfo = "    帮里似乎没有研究什么。"	--不在研究时提示
x600040_g_MissionTarget = "完成帮会大总管的任务"		--任务目标
x600040_g_ContinueInfo = "    你的任务还没有完成么？"	--未完成任务的npc对话
x600040_g_MissionComplete = "太谢谢你了"				--完成任务npc说的话

x600040_g_MissionParam_SubId = 1

-- 通用城市任务脚本
x600040_g_CityMissionScript = 600001

-- 子任务表
x600040_g_SubMissionScriptList = { 600041, 600042, 600043 }

-- 任务奖励
x600040_g_ItemAwardIndexOffset = 30						-- 物品奖励所在表格中的列偏移
x600040_g_MissionRound = MD_CITY_RESEARCH_ROUND			-- 城市内政研究任务
x600040_g_MissionAbandonTime = MD_CITY_RESEARCH_TIME	-- 城市内政研究任务放弃任务的时间
x600040_g_ContribType = GUILD_CONTRIB_POINT				-- 帮会贡献度
x600040_g_CityProcess = 1								-- 0:研究，1:研究

--**********************************
--任务入口函数
--**********************************
function x600040_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600040_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if CityInBuildingResearch( sceneId, selfId, sceneId ) ~= 1 then
		x600040_NotifyFailBox( sceneId, selfId, targetId, x600040_g_NoMissionInfo )
		return
	end

	local rand = random( getn(x600040_g_SubMissionScriptList) )
	CallScriptFunction( x600040_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600040_g_MissionId, x600040_g_SubMissionScriptList[rand] )
end

--**********************************
--列举事件
--**********************************
function x600040_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600040_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	--如果已接任务或满足任务接收条件,则列出任务
	if IsHaveMission( sceneId, selfId, x600040_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600040_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600040_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600040_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600040_g_ScriptId, x600040_g_MissionName,4,-1 )
	end
end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x600040_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600040_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionAbandonTime )
	return ret
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x600040_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600040_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	CallScriptFunction( x600040_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600040_g_MissionId, x600040_g_MissionRound )
end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x600040_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600040_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionAbandonTime, x600040_g_MissionRound )
end

--**********************************
--继续
--**********************************
function x600040_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600040_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600040_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600040_g_MissionId )
	return ret
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x600040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600040_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600040_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600040_g_MissionId, x600040_g_MissionRound )

		-- 升级研究
		CityIncProgress( sceneId, selfId, sceneId, x600040_g_CityProcess )

		-- 经验奖励
		local ExpBonus = CallScriptFunction( x600040_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600040_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- 帮会贡献度奖励
		local ContribBonus = CallScriptFunction( x600040_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600040_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600040_g_ContribType, ContribBonus )
		end

		-- 物品奖励
		CallScriptFunction( x600040_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600040_g_MissionRound, x600040_g_ItemAwardIndexOffset )

		-- 统计信息
		LuaFnAuditQuest(sceneId, selfId, x600040_g_MissionName)
	end
end

--**********************************
-- 判断某个事件号是否存在于当前事件列表
--**********************************
function x600040_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600040_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

--**********************************
--对话窗口信息提示
--**********************************
function x600040_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
