-- 套装兑换任务

--************************************************************************
--MisDescBegin

-- 脚本号
x500620_g_ScriptId = 500620

-- 任务目标 NPC
x500620_g_Name = "立繁"

--MisDescEnd
--************************************************************************

x500620_g_NumText_Main = 1						-- 接任务的选项
x500620_g_NumText_ExchangeLeve76 = 100	--兑换76级套装
x500620_g_NumText_ExchangeLeve86 = 200	--兑换86级套装
x500620_g_NumText_ExchangeLeve96 = 300	--兑换96级套装

x500620_g_EquipName ={{"兑换明月套装","兑换碧天套装","兑换渡泸套装","兑换倚楼套装"},
{"兑换玉骨套装","兑换尘拂套装","兑换香焚套装","兑换琴横套装"},
{"兑换雕阑套装","兑换太阴套装","兑换银筝套装","兑换恨天套装"}
}

x500620_g_EquipID ={
{{10521099,10511090,10515099,10520090},{10521100,10511091,10515100,10520091},{10510090,10521101,10511092,10514099},{10510091,10521102,10511093,10514100}},
{{10510092,10511094,10514101,10522099},{10510093,10511095,10514102,10522100},{10510094,10512090,10514103,10523099},{10510095,10512091,10514104,10523100}},
{{10511096,10512092,10520092,10522101,10523101},{10511097,10512093,10520093,10522102,10523102},{10511098,10512094,10520094,10522103,10523103},{10511099,10512095,10520095,10522104,10523104}}
}

x500620_g_Stone = 20310020      --玄昊玉
x500620_g_BindStone = 20310021  --绑定玄昊玉

--**********************************
-- 任务入口函数
--**********************************
function x500620_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x500620_g_Name then		-- 判断该npc是否是对应任务的npc
		return
	end

	local numText = GetNumText()
	
	if numText == x500620_g_NumText_Main then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_2}")
		AddNumText(sceneId, x500620_g_ScriptId, "兑换76级套装", 6, x500620_g_NumText_ExchangeLeve76)
		AddNumText(sceneId, x500620_g_ScriptId, "兑换86级套装", 6, x500620_g_NumText_ExchangeLeve86)
		AddNumText(sceneId, x500620_g_ScriptId, "兑换96级套装", 6, x500620_g_NumText_ExchangeLeve96)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == x500620_g_NumText_ExchangeLeve76 then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_3}")
		for i = 1, getn( x500620_g_EquipName[1] ) do
			AddNumText(sceneId, x500620_g_ScriptId, x500620_g_EquipName[1][i], 6, x500620_g_NumText_ExchangeLeve76+i)
		end
		AddNumText(sceneId, x500620_g_ScriptId, "返回上一层", 0, x500620_g_NumText_Main)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == x500620_g_NumText_ExchangeLeve86 then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_7}")
		for i = 1, getn( x500620_g_EquipName[2] ) do
			AddNumText(sceneId, x500620_g_ScriptId, x500620_g_EquipName[2][i], 6, x500620_g_NumText_ExchangeLeve86+i)
		end
		AddNumText(sceneId, x500620_g_ScriptId, "返回上一层", 0, x500620_g_NumText_Main)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == x500620_g_NumText_ExchangeLeve96 then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_8}")
		for i = 1, getn( x500620_g_EquipName[3] ) do
			AddNumText(sceneId, x500620_g_ScriptId, x500620_g_EquipName[3][i], 6, x500620_g_NumText_ExchangeLeve96+i)
		end
		AddNumText(sceneId, x500620_g_ScriptId, "返回上一层", 0, x500620_g_NumText_Main)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		if numText > x500620_g_NumText_ExchangeLeve76 then
			local level = floor( numText/100 )
			local type = mod( numText, 100 )
			
			local str
			if level == 1 then
				str = "#{LLFB_80821_9}"
			elseif level == 2 then
				str = "#{LLFB_80821_10}"
			elseif level == 3 then
				str = "#{LLFB_80821_11}"
			else
				return
			end

			BeginEvent(sceneId)
			AddText(sceneId, str)
			for i = 1, getn( x500620_g_EquipID[level][type] ) do
				AddRadioItemBonus( sceneId, x500620_g_EquipID[level][type][i], 4 )
			end
			EndEvent(sceneId)
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x500620_g_ScriptId,0)
		end
	end
	
end

--**********************************
-- 列举事件
--**********************************
function x500620_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x500620_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	AddNumText( sceneId, x500620_g_ScriptId, "玄昊玉兑换玄昊套装", 6, x500620_g_NumText_Main )
end

--**********************************
-- 检测接受条件
--**********************************
function x500620_CheckAccept( sceneId, selfId, targetId )
	return 1
end

--**********************************
--接受
--**********************************
function x500620_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--有玩家进入副本事件
--**********************************
function x500620_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--obj死亡
--**********************************
function x500620_OnDie( sceneId, objId, selfId )
end

--**********************************
--继续
--**********************************
function x500620_OnContinue( sceneId, selfId, targetId )
--	BeginEvent( sceneId )
--		AddText( sceneId, x500620_g_MissionName )
--		AddText( sceneId, "good 继续" )
--	EndEvent( )
--	DispatchMissionContinueInfo( sceneId, selfId, targetId, x500620_g_ScriptId, x500620_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x500620_OnAbandon( sceneId, selfId )
end

--**********************************
--检测是否可以提交
--**********************************
function x500620_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--提交
--**********************************
function x500620_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	local level = -1
	local type = -1
	
	for i = 1, getn( x500620_g_EquipID ) do
		for j = 1, getn( x500620_g_EquipID[i] ) do
			for k = 1, getn( x500620_g_EquipID[i][j] ) do
				if x500620_g_EquipID[i][j][k] == selectRadioId then
					level = i
					type = j
					break
				end
			end
		end
	end
	
	if level == -1 or type == -1 then
		return
	end
	
	local bindCount = LuaFnGetAvailableItemCount(sceneId, selfId, x500620_g_BindStone)
	local Count = LuaFnGetAvailableItemCount(sceneId, selfId, x500620_g_Stone)
	local mustdelnum = level*10
	--PrintStr(bindCount.." + "..Count)

	if bindCount+Count < mustdelnum then
		x500620_NotifyFailTips(sceneId, selfId, "#{LLFB_80821_5}")
		return
	end
	
	--检查背包空间
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	if bBagOk < 1 then
		x500620_NotifyFailTips(sceneId, selfId, "#{LLFB_80821_6}")
		return
	end
	
	local nItemBagIndexStone = 0
	local szTransferStone = 0
	
	--优先扣除绑定的玄昊玉
	local bDelOk = 0
	if bindCount >= mustdelnum then
		nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x500620_g_BindStone)
		szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
		
		bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x500620_g_BindStone, mustdelnum)
	else
		nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x500620_g_Stone)
		szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
		
		if bindCount > 0 then
			bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x500620_g_BindStone, bindCount)
		end
		bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x500620_g_Stone, mustdelnum-bindCount)
	end

	if bDelOk < 1  then
		x500620_NotifyFailTips(sceneId, selfId, "#{JPZB_0610_12}")
		return
	end
	
	local nBagIndex = TryRecieveItem( sceneId, selfId, selectRadioId, 1 );
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	x500620_NotifyFailTips(sceneId, selfId, "#{JPZB_0610_13}")
	if level == 1 then
		AuditExchangeXuanHaoYu(sceneId, selfId, 76, selectRadioId)
	elseif level == 2 then
		AuditExchangeXuanHaoYu(sceneId, selfId, 86, selectRadioId)
	elseif level == 3 then
		AuditExchangeXuanHaoYu(sceneId, selfId, 96, selectRadioId)
	end
	
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	
	local message = format("#{LLFB_80821_12}#{_INFOUSR%s}#{LLFB_80821_13}#{_INFOMSG%s}#{LLFB_80821_14}#{_INFOMSG%s}#{LLFB_80821_16}",LuaFnGetName(sceneId, selfId),szTransferStone, szTransferEquip)
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x500620_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x500620_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
