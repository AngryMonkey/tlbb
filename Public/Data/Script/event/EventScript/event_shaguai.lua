--杀怪任务(所有这一类型都使用这个LUA，修改请注意通用性)

MOD_EVENT = 006672
x006666_g_duanyanqiId = 002016 --[tx43452]

x006666_g_IsMissionOkFail = 0							-- 任务完成标记

--任务段分类列表_MissType	1.杀怪任务	2.送信任务	3.探索任务	4.寻物任务	5.护送任务
x006666_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

--**********************************
--任务入口函数
--**********************************
function x006666_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	--点击该任务后执行此脚本
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	local missionTarget, missionInfo, missionContinue = TGetMissionDesc( missionIndex )

	--发送任务需求的信息
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, missionName )
			AddText( sceneId, missionContinue )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, "  " .. missionTarget )
		EndEvent( )
		local bDone = x006666_CheckSubmit( sceneId, selfId, missionIndex )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, missionIndex, missionId, bDone )
	elseif CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex ) > 0 then
		local _, acceptNpcName = TGetAcceptNpcInfo( missionIndex )
		if acceptNpcName == "" then										-- 随机任务，自动接取
			if x006666_OnAccept( sceneId, selfId, targetId, missionIndex ) ~= 1 then
				return
			end
		end

		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, missionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, "  " .. missionTarget )
			CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex )
		EndEvent( )

		if acceptNpcName == "" then										-- 随机任务，自动接取
			DispatchEventList( sceneId, selfId, targetId )
		else
			DispatchMissionInfo( sceneId, selfId, targetId, missionIndex, missionId )
		end
	end

end

--**********************************
--列举事件
--**********************************
function x006666_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	CallScriptFunction( MOD_EVENT, "DoEnumerate", sceneId, selfId, targetId, missionIndex )
end

--**********************************
--接受
--**********************************
function x006666_OnAccept( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone( sceneId, selfId, missionId ) > 0
	 and TIsMissionRoundable( missionIndex ) ~= 1 then
		return 0
	end

	-- 防止玩家直接发包，再次检测是不是能够接这个任务
	if CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex )  <= 0  then
		return 0
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, missionId, missionIndex, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player( sceneId, selfId, "#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return 0
	end

	--设置任务变量宝物的场景编号和坐标位置
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )		--得到任务在20个任务中的序列号
	SetMissionByIndex( sceneId, selfId, misIndex, x006666_g_IsMissionOkFail, 0 )	--根据序列号把任务变量的第一位置0	第一位是完成/失败情况

	-- 如果交任务的人不是接任务的人
	local nscene1, name1 = TGetAcceptNpcInfo( missionIndex )
	local nscene2, name2 = TGetCompleteNpcInfo( missionIndex )
	if name1 ~= name2 then
		SetMissionEvent( sceneId, selfId, missionId, 4 )
	end

	local killDataCt = 0
	local a = { { name = "", ct = 0 }, { name = "", ct = 0 }, { name = "", ct = 0 }, { name = "", ct = 0 }, { name = "", ct = 0 }, }
	killDataCt, a[1].name, a[1].ct, a[2].name, a[2].ct, a[3].name, a[3].ct, a[4].name, a[4].ct, a[5].name, a[5].ct = TGetKillInfo( missionIndex )
	print( killDataCt, a[1].name, a[1].ct, a[2].name, a[2].ct, a[3].name, a[3].ct, a[4].name, a[4].ct, a[5].name, a[5].ct )

	for i = 1, killDataCt do
		if a[i].name ~= "" then
			SetMissionByIndex( sceneId, selfId, misIndex, i, 0 )			--设置杀怪标记
		end
	end

	Msg2Player( sceneId, selfId, "#Y接受任务" .. missionName, MSG2PLAYER_PARA )
	return 1
end

--**********************************
--放弃
--**********************************
function x006666_OnAbandon( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	-- 惩罚，扣除关系值
	CallScriptFunction( MOD_EVENT, "PunishRelationShip", sceneId, selfId, missionIndex )

	-- 惩罚，一段时间不让接任务
	CallScriptFunction( MOD_EVENT, "AcceptTimeLimit", sceneId, selfId, missionIndex )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, missionId )

end

--**********************************
--继续
--**********************************
function x006666_OnContinue( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local missionTarget, _, _, missionComplete = TGetMissionDesc( missionIndex )

	BeginEvent( sceneId )
		AddText( sceneId, missionName )
		AddText( sceneId, missionComplete )
		AddText( sceneId, "#{M_MUBIAO}#r" )
		AddText( sceneId, missionTarget )
		CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, missionIndex, missionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x006666_CheckSubmit( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )

	local bComplete = GetMissionParam( sceneId, selfId, misIndex, 0 )
	if bComplete > 0 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x006666_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	if x006666_CheckSubmit( sceneId, selfId, missionIndex ) > 0 then
		local missionId = TGetMissionIdByIndex( missionIndex )
		local missionName = TGetMissionName( missionIndex )

		-- 安全性检测
		-- 1、检测玩家是不是有这个任务
		if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
			return
		end
		-- 2、其他检测
		-- 发奖
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
		
		if CallScriptFunction(x006666_g_duanyanqiId, "OnAddRewards", sceneId, selfId, missionIndex) == 1 then--[tx43452]
			nAddItemNum = nAddItemNum + 1			
		end--[/tx43452]
		
		local ret = EndAddItem( sceneId, selfId )
		if ret <= 0 then
			x006666_NotifyFailTips( sceneId, selfId, "背包已满,无法完成任务" )
			return
		end

		if nAddItemNum > 0 then
			AddItemListToHuman( sceneId, selfId )
		end

		-- 添加任务奖励
		local awardMoney = TGetAwardMoney( missionIndex )
		if awardMoney > 0 then
			AddMoney( sceneId, selfId, awardMoney, missionId, missionIndex )
		end

		local awardExp = TGetAwardExp( missionIndex )
		if awardExp > 0 then
			LuaFnAddExp( sceneId, selfId, awardExp )
		end

		-- 奖励关系值
		CallScriptFunction( MOD_EVENT, "RewardRelationShip", sceneId, selfId, missionIndex )

		local mdLocation, _, _ = TGetRelationShipAwardInfo( missionIndex );
		if mdLocation == MD_RELATION_AZHU then
			CallScriptFunction(005001, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)
		elseif mdLocation == MD_RELATION_DUANYANQING then
			CallScriptFunction(x006666_g_duanyanqiId, "OnMissionSubmitionSuccess", sceneId, selfId, targetId, missionIndex) --[tx43452]	
		elseif mdLocation == MD_RELATION_MUWANQING then --zchw
			CallScriptFunction(002010, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)
		end

		DelMission( sceneId, selfId, missionId )
		-- 设置任务已经被完成过
		MissionCom( sceneId, selfId, missionId )
		local strText = "#Y" .. missionName .. "任务已完成。"
		x006666_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
		
		-- 获得后续任务的Index
		local NextMissIndex = GetNextMissionIndex( missionIndex )

		for i, MissType in x006666_g_MissionTypeList do
			if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
				if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
					local missionId = TGetMissionIdByIndex( NextMissIndex )
					local szNpcName = GetName( sceneId, targetId )
					local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

					if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
						if MissType.ScriptId == 006666 then
							if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
								x006666_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
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
function x006666_OnKillObject( sceneId, selfId, objdataId ,objId, missionIndex)--参数意思：场景号、玩家objId、怪物表位置号、怪物objId

	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	local killDataCount = 0
	local a = {{name="", ct=0},{name="", ct=0},{name="", ct=0},{name="", ct=0},{name="", ct=0},}
	killDataCount, a[1].name, a[1].ct, a[2].name, a[2].ct, a[3].name, a[3].ct, a[4].name, a[4].ct,a[5].name, a[5].ct = TGetKillInfo(missionIndex)

	local monsterName = GetMonsterNamebyDataId(objdataId)

	for i=1, killDataCount do
		if monsterName ==	a[i].name then
			-- 取得这个怪物死后拥有分配权的人数
			local num = GetMonsterOwnerCount(sceneId,objId)
			for j=0,num-1  do
				-- 取得拥有分配权的人的objId
				local humanObjId = GetMonsterOwnerID(sceneId,objId,j)

				-- 看这个人是不是有这个任务
				if IsHaveMission(sceneId, humanObjId, missionId) > 0 then
					-- 先判断是不是已经满足了完成标志
					local misIndex = GetMissionIndexByID(sceneId,humanObjId,missionId)

					if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
						-- 获得已经击杀的数量
						local ct = GetMissionParam(sceneId, humanObjId, misIndex, i)
						if ct < a[i].ct  then
							SetMissionByIndex(sceneId, humanObjId, misIndex, i, ct+1)
							-- 通知客户端
				     	BeginEvent(sceneId)
								local strText = format("已杀死%s%d/%d", a[i].name, ct+1, a[i].ct )
								AddText(sceneId, strText)
						  EndEvent(sceneId)
					  	DispatchMissionTips(sceneId,humanObjId)
						end

						local IsOk = 1
						-- 看玩家是不是已经完成了这个任务
				  	if ct+1 == a[i].ct then
				  		for j=1,  killDataCount do
								-- 获得已经击杀的数量
								local ct1 = GetMissionParam(sceneId, humanObjId, misIndex, j)
				  			if ct1 < a[j].ct  then
				  				IsOk = 0
				  			end
				  		end

					  	if IsOk == 1 then
					  		SetMissionByIndex( sceneId, humanObjId, misIndex, x006666_g_IsMissionOkFail, 1 )
					  	end
				  	end
				  end
				end
			end
		end
	end
end

--**********************************
--访问锁定对象
--**********************************
function x006666_OnLockedTarget(sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local szNpcName = GetName(sceneId, targetId)
	local nScene, szName = TGetCompleteNpcInfo(missionIndex)
	if szNpcName == szName then -- and  sceneId == nScene  then
		-- 找对人咯
		-- 是否为循环任务
		if TIsMissionRoundable( missionIndex ) == 1 then
			TAddNumText( sceneId, missionIndex, missionName, 4, -1 )
		else
			TAddNumText( sceneId, missionIndex, missionName, 2, -1 )
		end
		TDispatchEventList(sceneId, selfId, targetId)
		return 1
	end
	return 0
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x006666_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
