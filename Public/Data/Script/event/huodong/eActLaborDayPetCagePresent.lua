--------------------------------------------
--Title：	2008 5.1活动脚本 之 兽栏赠送
--Author：	刘盾
--Date：	2008-04-15
--------------------------------------------

--脚本号
x808092_g_ScriptId = 808092

--sceneId List
--9		少林寺
--10	丐帮总舵
--11	光明殿
--12	武当山
--13	天龙寺
--14	凌波洞
--15	峨嵋山
--16	星宿海
--17	天山

--MenPaiId List
--0		少林
--1		明教
--2		丐帮
--3		武当
--4		峨嵋
--5		星宿
--6		大理
--7		天山
--8		逍遥
--9		标准

--GlobalLaborDayActivityTable = {
--	PetCageCardID					= 40004446,
--	PetCageLv1 						= 30509500,
--	PetCageDelayBuff 				= 30187,
--	PetCagePresentStartTime 		= 20080415, --兑换兽栏开始时间
--	PetCagePresentEndTime 			= 20080417, --兑换兽栏结束时间
--	CardPresentStartTime 			= 20080417,	--签名牌开始兑换时间
--	CardPresentEndTime 				= 20080417,	--签名牌结束兑换时间
--	MailStartDayTime 				= 20080415,	--发送邮件开始时间
--	MailEndDayTime 					= 20080418	--发送邮件结束时间
--}

function x808092_Scene2MenPaiID( sceneId )
	if (sceneId == 9) then
		return 0
	elseif (sceneId == 10) then
		return 2
	elseif (sceneId == 11) then
		return 1
	elseif (sceneId == 12) then
		return 3
	elseif (sceneId == 13) then
		return 6
	elseif (sceneId == 14) then
		return 8
	elseif (sceneId == 15) then
		return 4
	elseif (sceneId == 16) then
		return 5
	elseif (sceneId == 17) then
		return 7
	end
end

--**********************************
--任务入口函数
--**********************************
function x808092_OnDefaultEvent( sceneId, selfId, targetId )
	local ItemID = GetNumText()	
	if(ItemID == 808092000) then
		BeginEvent(sceneId)
			AddText(sceneId, "#{SL_20080416_12}")
			AddNumText( sceneId, x808092_g_ScriptId, "我要领取兽栏", 6, 808092002 )
			AddNumText( sceneId, x808092_g_ScriptId, "还是算了吧", 11, 808092003 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif(ItemID == 808092001) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SL_20080416_11}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif(ItemID == 808092002) then
		--兑换兽栏
		local condition = x808092_CheckActivityCondition(sceneId, selfId, targetId)
		
		if (condition == 0) then
			if(x808092_PresentPetCage(sceneId, selfId) == 1) then
				--AuditPetCageActivity(sceneId, selfId)
				BeginEvent(sceneId)
					AddText(sceneId, "#{SL_20080416_19}")
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				x808092_PresentPetCageBuffer(sceneId, selfId)
				SetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_GIFT, 1)
				AuditPetCagePresent(sceneId, selfId)
			end
			
		--领取兽栏的时间已经过了
		elseif (condition == 1) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_14}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)

		--已经兑换过兽栏了
		elseif(condition == 2) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_16}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)

		--没有签名牌
		elseif(condition == 3) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_13}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)

		--非本门弟子
		elseif(condition == 4) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_15}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
			
		--特效还未消失
		elseif(condition == 5) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_17}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
		end
		
	elseif(ItemID == 808092003) then
		--关闭界面
		DispatchUICommand(sceneId, selfId, 1000)
	end	
end

--**********************************
--列举事件
--**********************************
function x808092_OnEnumerate( sceneId, selfId, targetId )
	if (x808092_IsActivityTimeOut() == 0) then
		AddNumText(sceneId, x808092_g_ScriptId, "春暖花开师门赠礼活动", 1, 808092000 )
		AddNumText(sceneId, x808092_g_ScriptId, "春暖花开师门赠礼活动帮助", 11, 808092001 )	
	end
end

--**********************************
--检测活动是否过期
--**********************************
function x808092_IsActivityTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.PetCagePresentStartTime) then 
		return 1
	
	elseif (curDayTime > GlobalLaborDayActivityTable.PetCagePresentEndTime) then
		return 1
	end
	return 0
end

--**********************************
--领取兽栏
--**********************************
function x808092_PresentPetCage(sceneId, selfId, targetId)	
	--道具背包已满
	local condition = x808092_CheckPresentCageCondition(sceneId, selfId)
	if (condition == 0) then
		--先删除，再添加
		LuaFnDelAvailableItem(sceneId, selfId, GlobalLaborDayActivityTable.PetCageCardID, 1)

		--送兽栏并绑定....
		local bagIndex = TryRecieveItem( sceneId, selfId, GlobalLaborDayActivityTable.PetCageLv1, QUALITY_MUST_BE_CHANGE )
		if bagIndex > 0 then
			LuaFnItemBind( sceneId, selfId, bagIndex)
		end

		--公告玩家自己
		BroadMsgByChatPipe( sceneId, selfId, "你成功兑换一个一级兽栏", MSG2PLAYER_PARA )	
		
		--醒目提示
		BeginEvent( sceneId )
			AddText( sceneId, "你成功兑换一个一级兽栏" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		
		x808092_PresentPetCageBuffer(sceneId, selfId)
		return 1
	elseif (condition == 1) then
		BeginEvent(sceneId)
			AddText(sceneId, "你的道具背包已经满了，整理一下再来吧")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return 0
	end
	return 0
	
end


--**********************************
--检测参与活动的情况
--**********************************
function x808092_CheckActivityCondition(sceneId, selfId)
	--领取兽栏的时间已经过了
	if (x808092_IsActivityTimeOut() == 1) then
		return 1
	end

	--已经兑换过兽栏了
	local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_GIFT)
	if(flag > 0) then
		return 2
	end

	--没有签名牌
	local card_count = GetItemCount( sceneId, selfId, GlobalLaborDayActivityTable.PetCageCardID )
	if (card_count < 1) then
		return 3
	end

	--非本门弟子
	local menpaiId = GetMenPai(sceneId, selfId)
	local curSceneMenPaiId = x808092_Scene2MenPaiID(sceneId)
	if ( menpaiId ~= curSceneMenPaiId ) then
		return 4
	end
	
	--特效还未消失
	local hasImapct = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff)
	if ( hasImapct > 0 ) then
		return 5
	end

	return 0
end

--**********************************
--检测接受兽栏物品情况
--**********************************
function x808092_CheckPresentCageCondition(sceneId, selfId)
	--道具包裹已经满了
	if (LuaFnGetPropertyBagSpace(sceneId, selfId) < 1) then
		return 1
	end
	return 0
end

--**********************************
--添加领取成功的效果
--**********************************
function x808092_PresentPetCageBuffer(sceneId, selfId)
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 )
end
