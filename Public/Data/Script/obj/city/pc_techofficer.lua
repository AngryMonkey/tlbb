--城市NPC
--科技官员

x805015_g_scriptId = 805015
x805015_g_BuildingID9 = 13

--所拥有的事件ID列表
x805015_g_eventList = { 600012 }

-- 任务集事件 ID 列表，这类事件包含子事件
x805015_g_eventSetList = { 600012 }

--领取烫金名帖需要的帮贡点数	--add by xindefeng
x805015_g_MingTieNeedBangGong = 50
--烫金名帖ID	--add by xindefeng
x805015_g_TangJinMingTieID = 30505205
--每次可以领取烫金名帖数量
x805015_g_TangJinMingTieCount = 1

--**********************************
--事件列表
--**********************************
function x805015_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	
	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if Humanguildid == cityguildid then
			AddText( sceneId, "    满城之兴，无不在高深之技，咱们同帮兄弟，有什么我能帮你的，尽管开口。" )
			for i, eventId in x805015_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			AddNumText( sceneId, x805015_g_scriptId, "科技任务介绍", 11, 1 )
			--AddNumText( sceneId, x805015_g_scriptId, "修改帮会称号", 6, 3 )	--王一川要求干掉--del by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "研究新的商品", 6, 4 )
			AddNumText( sceneId, x805015_g_scriptId, "城市雕像", 6, 5 )
			AddNumText( sceneId, x805015_g_scriptId, "制作帮会徽章", 6, 6 )
			AddNumText( sceneId, x805015_g_scriptId, "书房介绍", 11, 2 )
			AddNumText( sceneId, x805015_g_scriptId, "领取烫金名帖", 6, 20 )	--add by xindefeng
			AddNumText( sceneId, x805015_g_scriptId, "关于领取帮会自订称号", 11, 22 )	--add by xindefeng
		
			--life 添加这个建筑物的相应生活技能选项
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "AddCityLifeAbilityOpt",sceneId, selfId, x805015_g_scriptId,x805015_g_BuildingID9,888)
		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "姑娘"
			elseif PlayerGender == 1 then
				rank = "先生"
			else
				rank = "请问"
			end

			AddText( sceneId, "    啊呀！" .. rank .. "不像是本帮中人，小生不便多言则个。" )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805015_OnDefaultEvent( sceneId, selfId, targetId )
	x805015_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805015_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805015_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805015_g_eventSetList do
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
function x805015_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805015_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	--life 处理这个建筑物的相应生活技能选项
	elseif eventId ~= x805015_g_scriptId then
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnDefaultEvent",sceneId, selfId, targetId, eventId, x805015_g_scriptId, x805015_g_BuildingID9 )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Tec_Mission_Help}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_ShuFang}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	--elseif GetNumText() == 3 then--王一川要求干掉--del by xindefeng
	--	BeginEvent(sceneId)
	--	AddText( sceneId, "这个功能即将开放" )		
	--	EndEvent(sceneId)
	--	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 5 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 6 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 20 then																--领取烫金名帖	--add by xindefeng
		-- 加入确认页面			add by WTT
		BeginEvent(sceneId)
			-- 领取烫金名帖需要消耗50点帮会贡献度。你确定要领取吗？
			AddText( sceneId, "#{TJMT_090213_01}" )
			--确定兑换按钮
			AddNumText(sceneId, x805015_g_scriptId, "是，我确定。", 6, 201)				
			--返回上一页按钮
			AddNumText(sceneId, x805015_g_scriptId, "不，我还是不要了。", 6, 202)		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 201 then																-- 确认领取烫金名帖		add by WTT
		x805015_GetTangJinMinTie(sceneId, selfId, targetId)

	elseif GetNumText() == 202 then																-- 放弃领取烫金名帖		add by WTT
		BeginEvent( sceneId )
			x805015_OnDefaultEvent( sceneId, selfId, targetId )				-- 返回上一页
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 22 then	--关于领取帮会自定义称号	--add by xindefeng
		BeginEvent(sceneId)
			AddText( sceneId, "#{TangJinMingTie_Help}")
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 888 then
		BeginEvent(sceneId)
		--life 添加这个建筑物的相应生活技能选项
		CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnEnumerate",sceneId, selfId, targetId, x805015_g_BuildingID9 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x805015_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805015_NotifyFailTips( sceneId, selfId, "你现在不能领取这个任务" )
		elseif ret == -2 then
			x805015_NotifyFailTips( sceneId, selfId, "无法接受更多任务" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805015_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805015_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805015_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805015_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805015_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805015_OnDie( sceneId, selfId, killerId )
end

function x805015_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--领取烫金名帖	--add by xindefeng
--**********************************
function x805015_GetTangJinMinTie(sceneId, selfId, targetId)
	--检测帮贡
	local szMsg = nil
	local nBangGongPoint = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)	--获取帮贡数量
  if nBangGongPoint < x805015_g_MingTieNeedBangGong then
  	szMsg = format("    阁下的帮会贡献不足#G%d#W，无法兑换自订职位名称。", x805015_g_MingTieNeedBangGong)
  	x805015_NotifyFailTips( sceneId, selfId, szMsg)
  	return
  end
  	
  --检测背包是否有地方
	if (LuaFnGetPropertyBagSpace( sceneId, selfId ) < x805015_g_TangJinMingTieCount) then
		--醒目提示"空间不足"
		x805015_NotifyFailTips(sceneId, selfId, "#{YRJ_BagFullTip}")
		return
	end	
	
	--条件通过
	
	--删除帮贡
  local ret = CityChangeAttr(sceneId, selfId, 6, -x805015_g_MingTieNeedBangGong)
	if not ret or ret ~= 1 then		
		x805015_NotifyFailTips(sceneId, selfId, "    无法扣除帮贡，请重试！")	--醒目提示"无法删除帮贡"
		return
	end
	
	--发放一个"烫金名帖"
	BeginAddItem(sceneId)
		AddItem(sceneId, x805015_g_TangJinMingTieID, x805015_g_TangJinMingTieCount)
	EndAddItem(sceneId, selfId)
	AddItemListToHuman(sceneId, selfId)--加物品给玩家
	
	--完事了,新界面:您收好:)
	BeginEvent( sceneId )
		AddText( sceneId, "    这是一张#G烫金名帖#W，拿去，好好使用！" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
