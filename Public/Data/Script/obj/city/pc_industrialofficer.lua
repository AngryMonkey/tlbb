--城市NPC
--工部

x805008_g_scriptId = 805008
x805008_g_BuildingID16 = 5

--所拥有的事件ID列表
x805008_g_eventList = { 600002 }

-- 任务集事件 ID 列表，这类事件包含子事件
x805008_g_eventSetList = { 600002 }

--**********************************
--事件列表
--**********************************
function x805008_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    本帮工铸之事，都可以找俺老马，但有能相助之处，在所不辞。" )
			for i, eventId in x805008_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805008_g_scriptId, "工程任务介绍", 11, 7 )
			AddNumText( sceneId, x805008_g_scriptId, "修理装备", 6, 9 )
			AddNumText( sceneId, x805008_g_scriptId, "代理合成宝石", 6, 10 )
			AddNumText( sceneId, x805008_g_scriptId, "配方商店", 7, 6 )
			AddNumText( sceneId, x805008_g_scriptId, "锻台介绍", 11, 8 )
			AddNumText( sceneId, x805008_g_scriptId, "关于关怀技能", 11, 11 )
			AddNumText( sceneId, x805008_g_scriptId, "领取关怀技能", 6, 12 )

			--life 添加这个建筑物的相应生活技能选项
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805008_g_scriptId,x805008_g_BuildingID16,888)
		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "侠女"
			elseif PlayerGender == 1 then
				rank = "大侠"
			else
				rank = "请问"
			end

			AddText( sceneId, "    老马乃一粗人，" .. rank .. "有何见教？" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805008_OnDefaultEvent( sceneId, selfId, targetId )
	x805008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805008_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805008_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805008_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

function x805008_CheckFavorOfGuild( sceneId, selfId )
    --成功返回 0
    --帮派不符返回 1
    --帮贡不足返回 2
    --不足领取时间 3
    --低维护状态   4

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	if( Humanguildid ~= cityguildid ) then
		return 1   --不是本帮成员
	end

	local GuidPoint = CityGetAttr( sceneId, selfId, 6 )

	local CurDay = GetDayTime()
	local OldDay = GetMissionData( sceneId, selfId, MD_FAVOROFGUILD_LASTTIME ) --取出上次领取帮派关怀的时间

	if( CurDay <= OldDay ) then
	    return 3  --距上次领取时间不足1天
	end

	if( GuidPoint < 1 ) then
	    return 2   --帮贡不够1点
	end

	local citySceneId = CityGetSelfCityID( sceneId, selfId )
	local Status = CityGetMaintainStatus( sceneId, selfId, citySceneId )

	if( Status == 1 ) then
	    return 4     --低维护状态,不能领取帮派关怀
	end

	return 0  --成功
end

function x805008_SetFavorOfGuild( sceneId, selfId )

    local FavorCode = x805008_CheckFavorOfGuild( sceneId, selfId )
	if( 0 ~= FavorCode ) then
	    return
	end

	local Level = GetLevel( sceneId, selfId )
	--根据等级设置buff

	local Name = GetName( sceneId, selfId )
	local Point = 0
	local BuffLevel = 0

	if( Level >= 10 and Level < 20 ) then
	    Point = 10
	    BuffLevel = 7800
	elseif ( Level >= 20 and Level < 30 ) then
	    Point = 15
	    BuffLevel = 7801
	elseif ( Level >= 30 and Level < 40 ) then
	    Point = 20
	    BuffLevel = 7802
	elseif ( Level >= 40 and Level < 50 ) then
	    Point = 25
	    BuffLevel = 7803
	elseif ( Level >= 50 and Level < 60 ) then
	    Point = 30
	    BuffLevel = 7804
	elseif ( Level >= 60 and Level < 70 ) then
	    Point = 35
	    BuffLevel = 7805
	elseif ( Level >= 70 and Level < 80 ) then
	    Point = 40
	    BuffLevel = 7806
	elseif ( Level >= 80 and Level < 90 ) then
	    Point = 45
	    BuffLevel = 7807
	elseif ( Level >= 90 and Level < 100 ) then
	    Point = 50
	    BuffLevel = 7808
	elseif ( Level >= 100 and Level < 110 ) then
	    Point = 55
	    BuffLevel = 30000
	elseif ( Level >= 110 and Level < 120 ) then
	    Point = 60
	    BuffLevel = 30001
	elseif ( Level >= 120 and Level < 130 ) then
	    Point = 65
	    BuffLevel = 30002
	elseif ( Level >= 130 and Level < 140 ) then
	    Point = 70
	    BuffLevel = 30003
	elseif ( Level >= 140 and Level < 150 ) then
	    Point = 75
	    BuffLevel = 30004
	elseif ( Level >= 150 and Level <= 160) then
	    Point = 80
	    BuffLevel = 30005
	else
	    Point = 0
	    BuffLevel = 0
	end

	if( Point > 0 ) then
	    local CurDay = GetDayTime()
	    local GuidPoint = CityGetAttr( sceneId, selfId, 6 )

        --CitySetAttr( sceneId, selfId, 6, GuidPoint - 1 )   --消耗一点帮贡
        CityChangeAttr( sceneId, selfId, 6, -1 )   --消耗一点帮贡

        SetMissionData( sceneId, selfId, MD_FAVOROFGUILD_LASTTIME, CurDay ) --设置领取帮派关怀的时间
        local sMessage = format("@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00在工业官员#c00ff00马应雄#cffff00处成功的领取了今天的帮派关怀技，#c00ff00力量#cffff00和#c00ff00灵气#cffff00各增加了#c00ff00%d#cffff00点。", Name, Point );

	    BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
	    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, BuffLevel, 0)   --设置buff
	end



end

--**********************************
--事件列表选中一项
--**********************************
function x805008_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805008_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life 处理这个建筑物的相应生活技能选项
	elseif eventId ~= x805008_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805008_g_scriptId, x805008_g_BuildingID16 )
		return
	end
	if GetNumText() == 6 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )								--调用城市商店界面
			UICommand_AddInt( sceneId, x805008_g_BuildingID16 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 104 )
	elseif GetNumText() == 7 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Industry_Mission_Help}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_DuanTai}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 9 then
		BeginEvent(sceneId)
			AddText( sceneId, "这个功能即将开放" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 10 then
		BeginEvent(sceneId)
			AddText( sceneId, "这个功能即将开放" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 11 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{function_help_085}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 12 then
	    local FavorCode = x805008_CheckFavorOfGuild( sceneId, selfId )
	    if( 0 == FavorCode ) then  --满足条件
	        x805008_SetFavorOfGuild( sceneId, selfId )
	    elseif( 1 == FavorCode ) then  --不是本帮
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_NOTMEMBER}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
	    elseif( 2 == FavorCode ) then  --帮贡不够1点
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_POINTNOTENOUGH}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
	    elseif( 3 == FavorCode ) then  --不足领取时间 3
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_TIMENOTENOUGH}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
        elseif( 4 == FavorCode ) then  --低维护状态   4
	        BeginEvent(sceneId)
			    AddText( sceneId, "#{FAVOROFGUILD_CITYSTATENOTENOUGH}" )
		    EndEvent(sceneId)
		    DispatchEventList( sceneId, selfId, targetId )
	    end



	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805008_g_BuildingID16 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x805008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805008_NotifyFailTips( sceneId, selfId, "你现在不能领取这个任务" )
		elseif ret == -2 then
			x805008_NotifyFailTips( sceneId, selfId, "无法接受更多任务" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805008_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805008_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805008_OnDie( sceneId, selfId, killerId )
end

function x805008_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
