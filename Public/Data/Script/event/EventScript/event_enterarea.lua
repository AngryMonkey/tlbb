--探索区域(所有这一类型都使用这个LUA，修改请注意通用性)

--任务段分类列表_MissType	1.杀怪任务	2.送信任务	3.探索任务	4.寻物任务	5.护送任务
x006669_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

--**********************************
--任务入口函数
--**********************************
function x006669_DisplayBonus(sceneId, missionIndex)
	local itemCt
	local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0}}
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then 
			AddRadioItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct = TGetHideItem(missionIndex)
	for i=1, itemCt do
		if a[i].id > 0 then
			AddRandItemBonus( sceneId, a[i].id, a[i].ct)
		end
	end
	local awardMoney = TGetAwardMoney(missionIndex)
	AddMoneyBonus( sceneId, awardMoney)
end
			
--**********************************
--任务入口函数   点击该任务后执行此脚本
--**********************************
function x006669_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	--点击该任务后执行此脚本
	
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	local missionTarget
	local missionInfo
	local missionContinue
	local missionComplete 
	missionTarget, missionInfo, missionContinue, missionComplete = TGetMissionDesc(missionIndex)

	--发送任务需求的信息
	if IsHaveMission(sceneId,selfId,missionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId, missionName)
			AddText(sceneId, missionContinue)
		EndEvent( )
		local bDone = x006669_CheckSubmit( sceneId, selfId, missionIndex )
		--PrintStr("bDone=" .. tostring(bDone))
		DispatchMissionDemandInfo(sceneId,selfId,targetId,missionIndex,missionId,bDone)
	elseif x006669_CheckAccept(sceneId,selfId,missionIndex) > 0 then
		--PrintStr("elseif x006669_CheckAccept(sceneId,selfId) > 0 then...")
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId, missionName)
			AddText(sceneId,missionInfo)
			x006669_DisplayBonus(sceneId, missionIndex)
			
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,missionIndex,missionId)
	end
	
end

--**********************************
--列举事件
--**********************************
function x006669_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	--PrintStr("OnEnumerate..." .. sceneId .. selfId .. targetId .. missionIndex)
	--如果玩家完成过这个任务
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	-- 判定玩家的条件是不是够接受这个任务，如果够就显示，不够就不显示
	local nLevel
	local nMis1
	local nMis2
	local nMis3 
	nLevel, nMis1, nMis2, nMis3 = TGetCheckInfo(missionIndex)
	if nLevel > GetLevel(sceneId, selfId)  then
		return
	end
	
	if nMis1 >=0   then
		if IsMissionHaveDone(sceneId, selfId, nMis1) <= 0   then
			return
		end
	end
	
	if nMis2 >=0   then
		if IsMissionHaveDone(sceneId, selfId, nMis2) <= 0   then
			return
		end
	end
	
	if nMis3 >=0   then
		if IsMissionHaveDone(sceneId, selfId, nMis3) <= 0   then
			return
		end
	end
	
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0 then
   	return
   	
	--满足任务接收条件
	elseif IsHaveMission(sceneId, selfId, missionId) > 0 then
		local completeNpcScene, completeNpcName = TGetCompleteNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == completeNpcName then
			--TEndEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,2,-1);
			TEndEvent()	
			TDispatchEventList(sceneId, selfId, targetId)
		end
	--满足任务接收条件
  elseif x006669_CheckAccept(sceneId, selfId, missionIndex) > 0 then
  	local acceptNpcScene, acceptNpcName = TGetAcceptNpcInfo(missionIndex)
		if GetName(sceneId, targetId) == acceptNpcName then
			--TEndEvent(sceneId)
				TAddNumText(sceneId, missionIndex, missionName,1,-1);
			TEndEvent()
			TDispatchEventList(sceneId, selfId, targetId)	
		end
  end
  
end

--**********************************
--检测接受条件
--**********************************
function x006669_CheckAccept( sceneId, selfId, missionIndex )
	local nLevel = LuaFnGetLevel(sceneId, selfId)
	local limitLevel
	local PreMisId1
	local PreMisId2
	local PreMisId3 
	
	limitLevel,PreMisId1,PreMisId2,PreMisId3 = TGetCheckInfo(missionIndex)

	if nLevel < limitLevel then
			TAddText(sceneId, "你的江湖阅历太低，恐怕不能胜任，待".. tostring(limitLevel) .."级之后再来找我吧")
		TEndEvent()
		TDispatchEventList(sceneId, selfId)
		return 0
	else
		local a = {}
		local index = 1
		if PreMisId1 > 0 then
			a[index] = PreMisId1
			index = index + 1
		end
		if PreMisId2 > 0 then
			a[index] = PreMisId2
			index = index + 1
		end
		if PreMisId3 > 0 then
			a[index] = PreMisId3
			index = index + 1
		end
		
		for i, v in a do
			if IsMissionHaveDone(sceneId, selfId, v) <= 0 then
				return 0
			end	
		end
		return 1
	end
end

--**********************************
--接受
--**********************************
function x006669_OnAccept( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, missionId) > 0   then
		return
	end

	-- 再次检测玩家是不是可以接这个任务
	if x006669_CheckAccept( sceneId, selfId, missionIndex ) <= 0  then
		return		
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, missionId, missionIndex, 0, 1, 0 )
	
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#Y接受任务" .. tostring(missionName), MSG2PLAYER_PARA )
	BeginEvent(sceneId)
		strText = "#Y接受任务 " .. tostring(missionName)
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--放弃
--**********************************
function x006669_OnAbandon( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	
  DelMission( sceneId, selfId, missionId )
end

--**********************************
--继续
--**********************************
function x006669_OnContinue( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local missionTarget
	local missionInfo
	local missionContinue
	local missionComplete 
	missionTarget,missionInfo,missionContinue,missionComplete = TGetMissionDesc(missionIndex)
	
	BeginEvent(sceneId)
		AddText(sceneId,missionName)
		AddText(sceneId,missionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,missionTarget)
		x006669_DisplayBonus(sceneId, missionIndex)  
	EndEvent( )
	DispatchMissionContinueInfo(sceneId, selfId, targetId, missionIndex, missionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x006669_CheckSubmit( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
	
	-- 检测玩家是否已经探索了所有的区域
	local enterAreaCount = 0;
	local a = {{scene=0,ea=0},{scene=0,ea=0},{scene=0,ea=0}}
	
	enterAreaCount, a[1].scene, a[1].ea, a[2].scene, a[2].ea, a[3].scene, a[3].ea = TGetEnterAreaInfo(missionIndex)
	
	for i=1, enterAreaCount   do
		local misIndex=GetMissionIndexByID(sceneId,selfId,missionId)
		local num0 = GetMissionParam(sceneId,selfId,misIndex,i-1)
		if num0 < 1  then 
			return 0
		end
	end
	return 1
	
end	

--**********************************
--提交
--**********************************
function x006669_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	if x006669_CheckSubmit(sceneId, selfId, missionIndex) > 0 then
		local missionId = TGetMissionIdByIndex(missionIndex)
		local missionName = TGetMissionName(missionIndex)
		
		-- 安全性检测
		-- 1、检测玩家是不是有这个任务
		if IsHaveMission(sceneId,selfId,missionId) <= 0 then
			return
		end
		-- 2、其他检测
		
		local nAddItemNum = 0;
		BeginAddItem(sceneId)
			local itemCt
			local a = {{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},{id=-1, ct=0},} 
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetAwardItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetRadioItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 and a[i].id == selectRadioId then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
					break
				end
			end
			--///////////////////////////////////////////////////////////////////////////////////
			itemCt, a[1].id, a[1].ct, a[2].id, a[2].ct, a[3].id, a[3].ct, a[4].id, a[4].ct, a[5].id, a[5].ct = TGetHideItem(missionIndex)
			for i=1, itemCt do
				if a[i].id > 0 then
					AddItem( sceneId, a[i].id, a[i].ct)
					nAddItemNum = nAddItemNum + 1
				end
			end
		local ret = EndAddItem(sceneId,selfId)
		--///////////////////////////////////////////////////////////////////////////////////
		if ret > 0 then
			--删除任务中提交的物品
			--local a = {{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0},{name="",item=0,pro=0,ct=0}}
			--local killDataCount = 0
			--killDataCount,a[1].name,a[1].item,a[1].pro,a[1].ct, a[2].name,a[2].item,a[2].pro,a[2].ct,a[3].name,a[3].item,a[3].pro,a[3].ct,a[4].name,a[4].item,a[4].pro,a[4].ct,a[5].name,a[5].item,a[5].pro,a[5].ct = TGetLootItemInfo(missionIndex)
			--for i=1, killDataCount  do
			--	--PrintStr("id =" .. a[i].item .. "   num =" .. a[i].ct)
			--	if LuaFnGetAvailableItemCount(sceneId, selfId, a[i].item) >= a[i].ct then
			--		DelItem( sceneId, selfId, a[i].item, a[i].ct )
			--	else
			--		BeginEvent(sceneId)
			--			AddText(sceneId, "您的物品现在不可用或已被锁定。")
			--		EndEvent( )
			--		DispatchMissionTips(sceneId,selfId)
			--		return		
			--	end
			--end

			if 	nAddItemNum > 0   then
				AddItemListToHuman(sceneId,selfId)
			end

			--添加任务奖励
			local awardMoney = TGetAwardMoney(missionIndex)
			AddMoney(sceneId,selfId,awardMoney )
			local awardExp = TGetAwardExp(missionIndex)
			LuaFnAddExp( sceneId, selfId, awardExp)
			
			DelMission( sceneId,selfId, missionId )
			--设置任务已经被完成过
			MissionCom( sceneId,selfId, missionId )

			local strText = "#Y" .. missionName .. "任务已完成。"
			BeginEvent( sceneId )
				AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
			Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

			-- 获得后续任务的Index
			local NextMissIndex = GetNextMissionIndex( missionIndex )

			for i, MissType in x006669_g_MissionTypeList do
				if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
					if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
						local missionId = TGetMissionIdByIndex( NextMissIndex )
						local szNpcName = GetName( sceneId, targetId )
						local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

						if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
							if MissType.ScriptId == 006669 then
								if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
									x006669_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
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

		else
			--任务奖励没有加成功
			BeginEvent(sceneId)
				AddText(sceneId, "背包已满,无法完成任务");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x006669_OnKillObject( sceneId, selfId, objdataId ,objId, missionIndex)--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
	
end

--**********************************
--道具改变
--**********************************
function x006669_OnItemChanged( sceneId, selfId,targetId,  itemdataId )
	
end

--**********************************
--进入区域事件
--**********************************
function x006669_OnEnterArea( sceneId, selfId, areaId, missionIndex)
	
	local missionId 	= TGetMissionIdByIndex(missionIndex)
	local missionName = TGetMissionName(missionIndex)

	local enterAreaCount = 0;
	local a = {{scene=0,ea=0},{scene=0,ea=0},{scene=0,ea=0}}
	
	enterAreaCount, a[1].scene, a[1].ea, a[2].scene, a[2].ea, a[3].scene, a[3].ea = TGetEnterAreaInfo(missionIndex)

	for i=1, enterAreaCount do
		if sceneId == a[i].scene and areaId == a[i].ea  then
			
			local bHave = 0
			local szDesc = ""
			local szTip = ""
			bHave, szDesc, szTip = TGetEnterAreaDesc(missionIndex)

			if bHave > 0  then
				BeginEvent(sceneId)
					AddText(sceneId,szDesc)
				EndEvent(sceneId)
				DispatchEventList(sceneId,selfId,selfId)
			end
	
			--任务处理
			local misIndex=GetMissionIndexByID(sceneId,selfId,missionId)
			local num0 = GetMissionParam(sceneId,selfId,misIndex,0)
			if num0 < 1 then				--如果不满足任务完成得条件
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--任务变量第一位增加1
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)		--任务变量第一位增加1
				-- 只有在有任务，并且在完成的时候会弹出
				BeginEvent(sceneId)										--显示提示信息
					AddText(sceneId, szTip);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
	end
end
