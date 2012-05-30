--城市NPC
--米仓

x805014_g_scriptId = 805014
x805014_g_BuildingID8 = 7

--所拥有的事件ID列表
x805014_g_eventList = { 600007 }

-- 任务集事件 ID 列表，这类事件包含子事件
x805014_g_eventSetList = { 600007 }

--**********************************
--事件列表
--**********************************
function x805014_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    帮会强大在乎农也，有什么需要我帮你的么？" )
			for i, eventId in x805014_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805014_g_scriptId, "发展任务介绍", 11, 1 )
			AddNumText( sceneId, x805014_g_scriptId, "加厚城墙", 6, 3 )
			AddNumText( sceneId, x805014_g_scriptId, "米仓介绍", 11, 2 )
			AddNumText( sceneId, x805014_g_scriptId, "换取冰镇西瓜", 6, 4 )
			AddNumText( sceneId, x805014_g_scriptId, "冰镇西瓜介绍", 11, 5 )

			--life 添加这个建筑物的相应生活技能选项
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805014_g_scriptId,x805014_g_BuildingID8,888)
		else
			AddText( sceneId, "    阁下不是本帮成员，面生的紧啊！" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805014_OnDefaultEvent( sceneId, selfId, targetId )
	x805014_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805014_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805014_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805014_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--事件列表选中一项
--**********************************
function x805014_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805014_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life 处理这个建筑物的相应生活技能选项
	elseif eventId ~= x805014_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805014_g_scriptId, x805014_g_BuildingID8 )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Dev_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_MiCang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 3 then
		BeginEvent(sceneId)
			AddText( sceneId, "这个功能即将开放" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805014_g_BuildingID8 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 4 then
		--确认是否换取冰镇西瓜
		BeginEvent(sceneId)
			AddText( sceneId, "#{BGHXG_JS}" )
			AddText( sceneId, "您确认要用9点帮贡换取冰镇西瓜吗？" )
			AddNumText( sceneId, x805014_g_scriptId, "确认", 6, 16 )
			AddNumText( sceneId, x805014_g_scriptId, "取消", 8, 17 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		--冰镇西瓜介绍
		BeginEvent(sceneId)
			AddText( sceneId, "#{BGHXG_JS}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 16 then
		--确认换西瓜
		x805014_BingZhenXiGua(sceneId, selfId, targetId);
	elseif GetNumText() == 17 then
		--取消换西瓜
		x805014_OnDefaultEvent( sceneId, selfId, targetId )
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x805014_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805014_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805014_NotifyFailTips( sceneId, selfId, "你现在不能领取这个任务" )
		elseif ret == -2 then
			x805014_NotifyFailTips( sceneId, selfId, "无法接受更多任务" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805014_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805014_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805014_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805014_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805014_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805014_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805014_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805014_OnDie( sceneId, selfId, killerId )
end

function x805014_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--换取冰镇西瓜
--**********************************
function x805014_BingZhenXiGua(sceneId, selfId, targetId)
	local humanGuildId 	= GetHumanGuildID(sceneId,selfId)
	local cityGuildId 	= GetCityGuildID(sceneId, selfId, sceneId)
	if not humanGuildId or not cityGuildId or humanGuildId ~= cityGuildId then
		BeginEvent(sceneId)
			AddText( sceneId, "只有本帮成员才能换取。" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return 0;
	end
	
	local guildPoint = CityGetAttr(sceneId, selfId, 6);
	if not guildPoint or guildPoint < 9 then
		BeginEvent(sceneId)
			AddText( sceneId, "你的帮贡不足9点，无法换取。" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return 0;
	end

	LuaFnBeginAddItem(sceneId);
		LuaFnAddItem(sceneId, 30501103, 1);
	local ret = LuaFnEndAddItem(sceneId, selfId);
	if not ret or 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId, "你现在无法获得物品，请检查背包。");
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return 0;
	end
	
	ret = CityChangeAttr(sceneId, selfId, 6, -9);
	if not ret or ret ~= 1 then
		BeginEvent(sceneId)
			AddText(sceneId, "操作失败，请重试。");
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return 0;
	end
	
	AddItemListToHuman(sceneId,selfId);
	x805014_NotifyFailTips(sceneId, selfId, "你获得了一个冰镇西瓜。");
	
	local szTransferItem = GetItemTransfer(sceneId, selfId, 0);
	local selfName = LuaFnGetName(sceneId, selfId);
	local strChatMessage = "#{_INFOUSR"..selfName.."}#P乐呵呵的从#G朱世友[129，100]#P手里接过一瓤#Y#{_INFOMSG" .. szTransferItem .. "}#P，吃上一口真是从头顶凉到脚底板啊！";
	BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;GLD:"..strChatMessage, 6);
	x805014_OnDefaultEvent( sceneId, selfId, targetId )
end
