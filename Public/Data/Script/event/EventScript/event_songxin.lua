-- 送信任务(所有这一类型都使用这个LUA，修改请注意通用性)

MOD_EVENT = 006672

x006668_g_duanyanqiId = 002016 --[tx43452]

x006668_g_IsMissionOkFail = 0							-- 任务完成标记
x006668_g_SongXinFlag = 1									-- 送信完成标记

-- 按照顺序存储一些涉及到客户端任务目标显示的动态信息
-- 规则：在任何情况下，每一种可能随机的类型最多只有一个随机项
-- 即同时最多只能拥有 1 个随机 NPC（怪物）、1 个随机物品和 1 个随机珍兽
-- 位置按照优先顺序存储，例如如果有随机 NPC，则随机 NPC 占据第一个任务数据
-- 否则随机物品占据第一个任务数据，依此类推
-- 该值最好不要修改，即使要修改也要和客户端的解析部分（SetTableMissionInfo）同时修改
x006668_g_StrForePart = 5

--任务段分类列表_MissType	1.杀怪任务	2.送信任务	3.探索任务	4.寻物任务	5.护送任务
x006668_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

--**********************************
-- 获取动态任务目标 NPC 的存储位置
-- 如果是静态任务目标 NPC，则返回 -1
--**********************************
function x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex )
	local _, _, isTargetDynamic = TGetTargetNpcInfo( missionIndex )

	if not isTargetDynamic or isTargetDynamic ~= 1 then					-- 该 NPC 是静态 NPC
		return -1
	end

	return x006668_g_StrForePart
end

--**********************************
-- 获取动态任务目标 NPC 的 NPCID
-- 如果是静态任务目标 NPC，则返回 -1
--**********************************
function x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	local loc = x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex )
	if loc == -1 then
		return -1
	end

	local missionId = TGetMissionIdByIndex( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
	return GetMissionParam( sceneId, selfId, misIndex, loc )
end

--**********************************
-- 获取动态任务物品的 ItemIndex
-- 如果是静态任务物品，则返回 -1
--**********************************
function x006668_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	local ItemCount, _, _, _, _, _, _, _, _, _, _, _, _, Item, Count, bGiveFlag = TGetSongXinInfo( missionIndex )

	if not Item or Item <= 0 then
		return -1
	end

	local nOffset = 0
	if x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex ) ~= -1 then
		nOffset = nOffset + 1
	end

	return x006668_g_StrForePart + nOffset
end

--**********************************
-- 获取动态任务物品的 ItemIndex
-- 如果是静态任务物品，则返回 -1
--**********************************
function x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
	local loc = x006668_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	if loc == -1 then
		return -1
	end

	local missionId = TGetMissionIdByIndex( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
	return GetMissionParam( sceneId, selfId, misIndex, loc )
end

--**********************************
-- 扣除任务物品，成功返回 1，失败返回 0
--**********************************
function x006668_TakeOutMissionItem( sceneId, selfId, missionIndex )
	local ItemCount = 0
	local item, count, bGiveFlag = 1, 2, 3

	-- Mission Items
	local mi = { { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, }

	local itemList = {}

	ItemCount, mi[1][1], mi[1][2], mi[1][3], mi[2][1], mi[2][2], mi[2][3], mi[3][1], mi[3][2], mi[3][3],
		mi[4][1], mi[4][2], mi[4][3], mi[5][1], mi[5][2], mi[5][3] = TGetSongXinInfo( missionIndex )

	if ItemCount > 0 then
		-- mi[5][1], mi[5][2], mi[5][3] 是随机物品项
		if mi[5][item] > 0 then
			-- mi[5][item] 的转换
			mi[5][item] = GetOneMissionItem( mi[5][item] )
			tinsert( itemList, { mi[5][item], mi[5][count] } )
			ItemCount = ItemCount - 1
		end																-- 以下读取固定任务物品

		for i = 1, ItemCount do
			tinsert( itemList, { mi[i][item], mi[i][count] } )
		end

		for i = 1, getn( itemList ) do
			if itemList[i][item] > 0 then
				if LuaFnGetAvailableItemCount( sceneId, selfId, itemList[i][item] ) < itemList[i][count] then
					return 0
				end
			end
		end

		for i = 1, getn( itemList ) do
			if itemList[i][item] > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, itemList[i][item], itemList[i][count] )
			end
		end
	end

	return 1
end

--**********************************
-- 任务入口函数
--**********************************
function x006668_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )		-- 点击该任务后执行此脚本
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local _, missionInfo, missionContinue = TGetMissionDesc( missionIndex )
	local npcId = -1
	local itemIndex = -1

	-- 发送任务需求的信息
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		local _, targetNPCName, isTargetDynamic, targetDuologue = TGetTargetNpcInfo( missionIndex )
		local _, completeNpcName = TGetCompleteNpcInfo( missionIndex )
		local szNpcName = GetName( sceneId, targetId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )

		-- 如果任务目标 NPC 和任务完成 NPC 不是同一个人
		if targetNPCName ~= completeNpcName then
			local bAchieveMission = 0

			-- 如果当前 NPC 是任务目标 NPC
			if not isTargetDynamic or isTargetDynamic ~= 1 then			-- 该 NPC 是静态 NPC
				if szNpcName == targetNPCName then
					bAchieveMission = 1
				end
			else
				npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
				local _, strNpcName = GetNpcInfoByNpcId(sceneId, npcId )
				if strNpcName == szNpcName then
					bAchieveMission = 1
				end
			end

			-- 则任务完成，并显示任务目标 NPC 对白
			if bAchieveMission == 1 then
				-- 如果需要任务物品，并且能够删除，则成功
				if x006668_TakeOutMissionItem( sceneId, selfId, missionIndex ) == 1 then
					-- 显示目标 NPC 随机对话
					local strText = CallScriptFunction( MOD_EVENT, "GetRandomDuologue", sceneId, missionIndex, targetDuologue )
					if strText ~= "" then
						itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
						strText = CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, strText, npcId, itemIndex, "" )
						x006668_NotifyFailBox( sceneId, selfId, targetId, strText )
					end
					
					if (missionIndex >= 1010243 and missionIndex <= 1010250) or
						 (missionIndex >= 1010402 and missionIndex <= 1010409) or
						 (missionIndex >= 1018000 and missionIndex <= 1018033) or
						 (missionIndex >= 1018050 and missionIndex <= 1018084) or
						 (missionIndex >= 1018100 and missionIndex <= 1018155) or
						 (missionIndex >= 1018200 and missionIndex <= 1018235) or
						 (missionIndex >= 1018300 and missionIndex <= 1018311) or
						 (missionIndex >= 1018350 and missionIndex <= 1018352) or
						 (missionIndex >= 1018360 and missionIndex <= 1018367) or
						 (missionIndex >= 1018400 and missionIndex <= 1018455) or
						 (missionIndex >= 1018500 and missionIndex <= 1018504) or
						 (missionIndex >= 1018530 and missionIndex <= 1018541) or
						 (missionIndex >= 1018560 and missionIndex <= 1018566) then
							BeginEvent( sceneId )
								AddText( sceneId, "任务目标已达成！" )
							EndEvent( sceneId )
							DispatchMissionTips( sceneId, selfId )
					end
			

					SetMissionByIndex( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail, 1 )
					return
				end
			end
		elseif GetMissionParam( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail ) ~= 1 then
			-- 如果任务目标 NPC 和任务完成 NPC 是同一个人，并且这个家伙还没有完成任务
			if x006668_TakeOutMissionItem( sceneId, selfId, missionIndex ) == 1 then
				SetMissionByIndex( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail, 1 )
			end
		end

		-- 如果当前 NPC 是任务完成 NPC，则按照原有流程显示任务对白以及提交任务
		if completeNpcName == szNpcName then
			local bHaveContinue = TIsHaveContinue( missionIndex )

			if bHaveContinue <= 0 then									-- 直接跳到完成界面
				x006668_OnContinue( sceneId, selfId, targetId, missionIndex )
			else														-- 转到Continue界面
				local bDone = x006668_CheckSubmit( sceneId, selfId, missionIndex )
				npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
				itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )

				BeginEvent( sceneId )
					AddText( sceneId, missionName )
					AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionContinue, npcId, itemIndex, "" ) )
				EndEvent( )
				DispatchMissionDemandInfo( sceneId, selfId, targetId, missionIndex, missionId, bDone )
			end
		end
	elseif CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex ) > 0 then
		local _, acceptNpcName = TGetAcceptNpcInfo( missionIndex )
		if acceptNpcName == "" then										-- 随机任务，自动接取
			if x006668_OnAccept( sceneId, selfId, targetId, missionIndex ) ~= 1 then
				return
			end

			npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
			itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
		end

		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, missionName )
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionInfo, npcId, itemIndex, "" ) )
			CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )
		EndEvent( )

		if acceptNpcName == "" then										-- 随机任务，自动接取
			DispatchEventList( sceneId, selfId, targetId )
		else
			DispatchMissionInfo( sceneId, selfId, targetId, missionIndex, missionId )
		end
	end
end

--**********************************
-- 列举事件
--**********************************
function x006668_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	CallScriptFunction( MOD_EVENT, "DoEnumerate", sceneId, selfId, targetId, missionIndex )
end

--**********************************
-- 选中
--**********************************
function x006668_OnLockedTarget( sceneId, selfId, targetId, missionIndex )
	local targetNpcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	local targetNPCName

	if targetNpcId ~= -1 then
		_, targetNPCName = GetNpcInfoByNpcId(sceneId, targetNpcId )
	else
		_, targetNPCName = TGetTargetNpcInfo( missionIndex )
	end

	local szNpcName = GetName( sceneId, targetId )
	local _, completeNpcName = TGetCompleteNpcInfo( missionIndex )
	if szNpcName == targetNPCName then
		local missionId = TGetMissionIdByIndex( missionIndex )
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		if completeNpcName ~= targetNPCName and GetMissionParam( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail ) == 1 then
			return															-- 已经完成了就不再对话了
		end
		
		--if completeNpcName == targetNPCName then
			SetMissionByIndex( sceneId, selfId, misIndex, x006668_g_SongXinFlag, 1 )
		--end
	end

	if szNpcName == targetNPCName or szNpcName == completeNpcName then
		-- 找对人咯
		local missionName = TGetMissionName( missionIndex )
		-- 是否为循环任务
		if TIsMissionRoundable( missionIndex ) == 1 then
			TAddNumText( sceneId, missionIndex, missionName, 4, -1 )
		else
			TAddNumText( sceneId, missionIndex, missionName, 2, -1 )
		end
		TDispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
-- 接受，返回 1 表示接取成功，否则表示失败
--**********************************
function x006668_OnAccept( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local ItemCount = 0

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone( sceneId, selfId, missionId ) > 0
	 and TIsMissionRoundable( missionIndex ) ~= 1 then
		return 0
	end

	if CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex ) <= 0 then
		return 0
	end

	local strText

	-- 检测是否任务已经达到 20 个，如果到了，则不能接
	if GetMissionCount( sceneId, selfId ) >= 20 then
		strText = "#Y你的任务日志已经满了。"
		-- x006668_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
		return 0
	end

	local item, count, bGiveFlag = 1, 2, 3
	-- Mission Items
	local mi = { { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, }

	ItemCount, mi[1][1], mi[1][2], mi[1][3], mi[2][1], mi[2][2], mi[2][3], mi[3][1], mi[3][2], mi[3][3],
		mi[4][1], mi[4][2], mi[4][3], mi[5][1], mi[5][2], mi[5][3] = TGetSongXinInfo( missionIndex )

	local bAddItem = 0

	if ItemCount > 0 then
		BeginAddItem( sceneId )

		-- mi[5][1], mi[5][2], mi[5][3] 是随机物品项
		if mi[5][item] > 0 then
			-- mi[5][item] 的转换在这里一定要做，因为以后要用到
			mi[5][item] = GetOneMissionItem( mi[5][item] )

			if mi[5][bGiveFlag] > 0 then
				AddItem( sceneId, mi[5][item], mi[5][count] )
				bAddItem = 1
			end

			ItemCount = ItemCount - 1
		end																-- 以下读取固定任务物品

		for i = 1, ItemCount do
			if mi[i][bGiveFlag] > 0 then
				AddItem( sceneId, mi[i][item], mi[i][count] )
				bAddItem = 1
			end
		end

		if bAddItem > 0 then
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then
				strText = "#Y你的任务背包已经满了。"
				-- x006668_NotifyFailTips( sceneId, selfId, strText )
				Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
				return 0
			end
		end
	end

	local ret = AddMission( sceneId, selfId, missionId, missionIndex, 0, 0, 0 )	-- kill、area、item
	if ret ~= 1 then
		return 0
	end

	SetMissionEvent( sceneId, selfId, missionId, 4 )

	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
	local targetNpcStoreLocation, itemStoreLocation
	local _, targetNPCName, isTargetDynamic = TGetTargetNpcInfo( missionIndex )

	-- 如果当前 NPC 是任务目标 NPC
	targetNpcStoreLocation = x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex )
	if targetNpcStoreLocation ~= -1 then					-- 该 NPC 是动态 NPC
		local nNpcId, _, _, nScene, nPosX, nPosZ = GetOneMissionNpc( tonumber(targetNPCName) )
		SetMissionByIndex( sceneId, selfId, misIndex, targetNpcStoreLocation, nNpcId )
	end

	-- 如果当前任务物品是动态
	itemStoreLocation = x006668_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	if itemStoreLocation ~= -1 then
		SetMissionByIndex( sceneId, selfId, misIndex, itemStoreLocation, mi[5][item] )
	end

	if bAddItem > 0 then
		AddItemListToHuman( sceneId, selfId )
	end

	strText = "#Y接受任务" .. missionName
	-- x006668_NotifyFailTips( sceneId, selfId, strText )
	Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	return 1
end

--**********************************
-- 放弃
--**********************************
function x006668_OnAbandon( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local ItemCount = 0
	local item, count, bGiveFlag = 1, 2, 3

	-- 删除任务物品
	local mi = { { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, }

	ItemCount, mi[1][1], mi[1][2], mi[1][3], mi[2][1], mi[2][2], mi[2][3], mi[3][1], mi[3][2], mi[3][3],
		mi[4][1], mi[4][2], mi[4][3], mi[5][1], mi[5][2], mi[5][3] = TGetSongXinInfo( missionIndex )

	if ItemCount > 0 then
		-- mi[5][1], mi[5][2], mi[5][3] 是随机物品项
		if mi[5][item] > 0 then
			-- mi[5][item] 的转换
			mi[5][item] = GetOneMissionItem( mi[5][item] )
			LuaFnDelAvailableItem( sceneId, selfId, mi[5][item], mi[5][count] )
			ItemCount = ItemCount - 1
		end																-- 以下读取固定任务物品

		for i = 1, ItemCount do
			if mi[i][item] > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, mi[i][item], mi[i][count] )
			end
		end
	end

	-- 惩罚，扣除关系值
	CallScriptFunction( MOD_EVENT, "PunishRelationShip", sceneId, selfId, missionIndex )

	-- 惩罚，一段时间不让接任务
	CallScriptFunction( MOD_EVENT, "AcceptTimeLimit", sceneId, selfId, missionIndex )

	-- 删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, missionId )
end

--**********************************
-- 继续
--**********************************
function x006668_OnContinue( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local missionTarget, _, _, missionComplete = TGetMissionDesc( missionIndex )
	local npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	local itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )

	BeginEvent( sceneId )
		AddText( sceneId, missionName )
		--[tx43452]
			--AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
			--AddText( sceneId, "#{M_MUBIAO}#r" )
			--AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, "" ) )
			--CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )	
		local ret = CallScriptFunction(x006668_g_duanyanqiId, "NPCTalkOnFirstSubmission", sceneId, selfId, missionIndex, 0 )
		if ret == 0 then
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, "" ) )
			CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )		
		end
		--[/tx43452]
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, missionIndex, missionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x006668_CheckSubmit( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )

	local bComplete = GetMissionParam( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail )
	if bComplete == 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x006668_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	-- 检测是不是满足完成任务的条件
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		if x006668_CheckSubmit( sceneId, selfId, missionIndex ) ~= 1 then
			return 0
		end

		local ItemCount, nAddItemNum = 0, 0
		local item, count = 1, 2
		local mi = { { -1, 0 }, { -1, 0 }, { -1, 0 }, { -1, 0 }, { -1, 0 } }

		-- 尝试增加奖励物品
		BeginAddItem( sceneId )
		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetAwardItem( missionIndex )

		if ItemCount > 0 then											-- 固定奖励
			for i = 1, ItemCount do
				if mi[i][item] > 0 then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
				end
			end
		end

		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetRadioItem( missionIndex )

		if ItemCount > 0 then											-- 选择奖励
			for i = 1, ItemCount do
				if mi[i][item] > 0 and mi[i][item] == selectRadioId then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
					break
				end
			end
		end

		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetHideItem( missionIndex )

		if ItemCount > 0 then											-- 隐藏奖励
			for i = 1, ItemCount do
				if mi[i][item] > 0 then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
				end
			end
		end
		
		if CallScriptFunction(x006668_g_duanyanqiId, "OnAddRewards", sceneId, selfId, missionIndex) == 1 then--[tx43452]
			nAddItemNum = nAddItemNum + 1			
		end--[/tx43452]
		
		local ret = EndAddItem( sceneId, selfId )
		if ret <= 0 then
			x006668_NotifyFailTips( sceneId, selfId, "背包已满,无法完成任务" )
			return
		end

		if nAddItemNum > 0 then
			AddItemListToHuman( sceneId, selfId )
		end

		-- 添加任务奖励
		local awardMoney = TGetAwardMoney( missionIndex )
		if awardMoney > 0 then
			AddMoney( sceneId, selfId, awardMoney )
		end

		local awardExp = TGetAwardExp( missionIndex )
		if awardExp > 0 then
			LuaFnAddExp( sceneId, selfId, awardExp )
		end

		-- 奖励关系值
		CallScriptFunction( MOD_EVENT, "RewardRelationShip", sceneId, selfId, missionIndex, targetId )

		local mdLocation, _, _ = TGetRelationShipAwardInfo( missionIndex );
		if mdLocation == MD_RELATION_AZHU then
			CallScriptFunction(005001, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)
		elseif mdLocation == MD_RELATION_DUANYANQING then
			CallScriptFunction(x006668_g_duanyanqiId, "OnMissionSubmitionSuccess", sceneId, selfId, targetId, missionIndex) --[tx43452]
		elseif mdLocation == MD_RELATION_MUWANQING then --zchw
			CallScriptFunction(002010, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)				
		end

		DelMission( sceneId, selfId, missionId )
		-- 设置任务已经被完成过
		MissionCom( sceneId, selfId, missionId )

		local strText = "#Y" .. missionName .. "任务已完成。"
		x006668_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
		
		-- 获得后续任务的Index
		local NextMissIndex = GetNextMissionIndex( missionIndex )

		for i, MissType in x006668_g_MissionTypeList do
			if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
				if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
					local missionId = TGetMissionIdByIndex( NextMissIndex )
					local szNpcName = GetName( sceneId, targetId )
					local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

					if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
						if MissType.ScriptId == 006668 then
							if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
								x006668_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
							end
						else
							if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
								CallScriptFunction( MissType.ScriptId, "OnDefaultEvent", sceneId, selfId, targetId, NextMissIndex )
							end
						end
					end
					
					break;
				end
			end
		end
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x006668_OnKillObject( sceneId, selfId, objdataId, objId, missionIndex )	-- 参数意思：场景号、玩家objId、怪物表位置号、怪物objId

end

--**********************************
--道具改变
--**********************************
function x006668_OnItemChanged( sceneId, selfId, itemdataId )

end

--**********************************
-- 对话窗口信息提示
--**********************************
function x006668_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x006668_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
