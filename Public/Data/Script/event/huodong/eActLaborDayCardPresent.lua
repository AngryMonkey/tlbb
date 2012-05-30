---------------------------------------------------
--Name：	2008 5.1活动脚本 之 签名牌兑换
--Author：	刘盾
--Date：	2008-04-15
---------------------------------------------------

--脚本号
x808091_g_ScriptId = 808091

--领取声音效果ID

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

--**********************************
--任务入口函数
--**********************************
function x808091_OnDefaultEvent( sceneId, selfId, targetId )

	local ItemID = GetNumText()
	if(ItemID == 808091001) then
		BeginEvent(sceneId)
			AddText(sceneId, "#{SL_20080416_06}")
			AddNumText( sceneId, x808091_g_ScriptId, "我要参加", 6, 808091003 )
			AddNumText( sceneId, x808091_g_ScriptId, "还是算了吧", 13, 808091004 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--活动帮助
	elseif(ItemID == 808091002) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SL_20080416_11}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif(ItemID == 808091003) then
	
		local condition = x808091_CheckActivityCondition(sceneId, selfId)
		
		--发放兑换签名牌，并给一个50分钟的buf
		if condition == 0 then
			local is_suc = x808091_PresentPetCageCard(sceneId, selfId, targetId)
			if(is_suc == 1) then
				BeginEvent(sceneId)
					AddText(sceneId, "#{SL_20080416_10}")
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
			end

		--兑换签名牌的时间已经过了
		elseif(condition == 1) then
			BeginEvent(sceneId)
				AddText(sceneId, "对不起，师门赠礼活动已经结束兑换签名牌了啊")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
			
		--已经参加过兑换签名牌的活动了, 并且已经兑换了兽栏
		elseif(condition == 2) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_09}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
	
		--已经参加，并且身上还带着签名牌
		elseif(condition == 3) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_08}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
				
		--你还没有加入门派呢
		elseif(condition == 4) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_07}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)	
		end

	elseif(ItemID == 808091004) then
		--关闭界面
		DispatchUICommand(sceneId, selfId, 1000)
	end
end

--**********************************
--列举事件
--**********************************
function x808091_OnEnumerate( sceneId, selfId, targetId )
	if (x808091_IsActivityTimeOut() == 0) then
		AddNumText( sceneId, x808091_g_ScriptId, "春暖花开师门赠礼活动", 6, 808091001 )
		AddNumText( sceneId, x808091_g_ScriptId, "春暖花开师门赠礼活动帮助", 11, 808091002 )
	end
end

--**********************************
--检测参与活动的情况
--**********************************
function x808091_CheckActivityCondition(sceneId, selfId)
	--兑换签名牌的时间已经过了
	if (x808091_IsActivityTimeOut() == 1) then
		return 1
	end
		
	--已经兑换过兽栏了
	local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_GIFT)
	if(flag > 0) then
		return 2
	end
	
	--身上还带着签名牌
	local card_count = GetItemCount(sceneId, selfId, GlobalLaborDayActivityTable.PetCageCardID)
	if (card_count >= 1) then
		return 3
	end
	
	--你还没有加入门派呢
	local mp_id = GetMenPai(sceneId, selfId)
	if (mp_id == 9) then
		return 4
	end
		
	return 0
end

--**********************************
--检测赠送兑换牌的情况
--**********************************
function x808091_CheckPresentCardCondition(sceneId, selfId)
	--检测任务背包是否有地方
	if (LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 ) then
		return 1
	end	
	return 0
end

--**********************************
--检测添加Buff的情况
--**********************************
function x808091_CheckBuffCondition(sceneId, selfId)
	return 0
end


--**********************************
--检测活动是否过期
--**********************************
function x808091_IsActivityTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.CardPresentStartTime) then 
		return 1
	
	elseif (curDayTime > GlobalLaborDayActivityTable.CardPresentEndTime) then
		return 1
	end
	return 0
end

--**********************************
--检测邮件通知时间是否过期
--**********************************
function x808091_IsMailTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.MailStartDayTime) then
		return 1
	elseif (curDayTime > GlobalLaborDayActivityTable.MailEndDayTime) then
		return 1
	end
	return 0
end

--**********************************
--赠送兑换牌，加buff
--**********************************
function x808091_PresentPetCageCard(sceneId, selfId, targetId)

	local present_card_condition = x808091_CheckPresentCardCondition(sceneId, selfId)

	--可以添加兑换牌
	if (present_card_condition == 0) then
		--发放一个"活动兑奖牌"
		BeginAddItem(sceneId)
			AddItem(sceneId, GlobalLaborDayActivityTable.PetCageCardID, 1)
		EndAddItem(sceneId, selfId)
		AddItemListToHuman(sceneId, selfId)--加物品给玩家
		
		--公告玩家自己
		BroadMsgByChatPipe( sceneId, selfId, "你获得一个兽栏赠礼签名牌", MSG2PLAYER_PARA )	
		
		--醒目提示
		BeginEvent( sceneId )
			AddText( sceneId, "你获得一个兽栏赠礼签名牌。" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		
		--添加50分钟的特效
		x808091_PresentPetCageBuffer(sceneId, selfId)
		return 1
	
	--任务物品背包空间不足
	elseif(present_card_condition == 1) then		
		BeginEvent(sceneId)
			AddText(sceneId, "你的任务背包已经满啦，先整理一下吧")
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
end

--**********************************
--给玩家添加兑换Buff
--**********************************
function x808091_PresentPetCageBuffer(sceneId, selfId)
	LuaFnCancelSpecificImpact( sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff, 100 )
end

--**********************************
--给新玩家发邮件
--**********************************
function x808091_OnPlayerLogin( sceneId, selfId )
	if ( x808091_IsMailTimeOut() == 0 ) then
		local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_MAIL)
		if (flag == 0) then
			LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), "#{SL_20080416_01}" )
			SetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_MAIL, 1)
		end
	end
end
