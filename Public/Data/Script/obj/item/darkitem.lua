--µÀ¾ß£º°µÆ÷Ë«±¶¾­ÑéÊ¹ÓÃÏà¹Ø
--½Å±¾ºÅ 332207
--Author:  houzhifang  2008-12-11

x332207_g_scriptId = 332207

x332207_DarkItem_DoubleExp = 
{
	{ItemIndex = 30503117, ImpactId = 32409, GiveExp = 2},
	{ItemIndex = 30503116, ImpactId = 32408, GiveExp = 1.5},
}

x332207_DarkItem_AdjustAttrItem = 30503115
x332207_DarkItem_AdjustSkillItem = 30503118
x332207_DarkItem_ResetQuality = {type1= 30503119, type2= 30503120}
x332207_DarkItem_Resetdark = 30503121

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x332207_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x332207_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x332207_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x332207_OnConditionCheck( sceneId, selfId )

	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ	
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local nItemIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local nGiveExp = 0
	local nGiveImpactId = 0	

	for i = 1, getn(x332207_DarkItem_DoubleExp) do
		if x332207_DarkItem_DoubleExp[i].ItemIndex == nItemIndex then
			nGiveExp = x332207_DarkItem_DoubleExp[i].GiveExp
			nGiveImpactId = x332207_DarkItem_DoubleExp[i].ImpactId
			break
		end
	end
	
	if nGiveExp == 0 or nGiveImpactId == 0 then
		return 0;
	end
	
	local nHaveImpact = 0
	--houzf 20090114ĞŞ¸Ä£¬Èç¹ûÒÑ¾­ÉèÖÃ¹ı2±¶µÄ£¬¾Í²»ÄÜÔÙÉèÁË£¬Èç¹ûÒÑ¾­Éè¹ıµÄÊÇ1.5±¶µÄ£¬Ôò¿ÉÒÔ±»2±¶µÄ¶¥µô£¬²»ÄÜÔÙÉè1.5±¶µÄ
	if (nItemIndex == x332207_DarkItem_DoubleExp[2].ItemIndex) then
		for i = 1, getn(x332207_DarkItem_DoubleExp) do
			local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x332207_DarkItem_DoubleExp[i].ImpactId)
			if nRet == 1 then
				nHaveImpact = 1
			end
		end
	elseif (nItemIndex == x332207_DarkItem_DoubleExp[1].ItemIndex) then
		local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x332207_DarkItem_DoubleExp[1].ImpactId)
		if nRet == 1 then
			nHaveImpact = 1
		end
	end

	--for i = 1, getn(x332207_DarkItem_DoubleExp) do
	--	local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x332207_DarkItem_DoubleExp[i].ImpactId)
	--	if nRet == 1 then
	--		nHaveImpact = 1
	--	end
	--end
	
	if nHaveImpact == 1 then
		local strNotice =  "#{FBSJ_081209_88}"
		x332207_ShowNotice( sceneId, selfId, strNotice)
		return 0;
	end
	
	return 1; --²»ĞèÒªÈÎºÎÌõ¼ş£¬²¢ÇÒÊ¼ÖÕ·µ»Ø1¡£
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x332207_OnDeplete( sceneId, selfId )
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

--**********************************
--Ö»»áÖ´ĞĞÒ»´ÎÈë¿Ú£º
--¾ÛÆøºÍË²·¢¼¼ÄÜ»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¾ÛÆø½áÊø²¢ÇÒ¸÷ÖÖÌõ¼ş¶¼Âú×ãµÄÊ±ºò£©£¬¶øÒıµ¼
--¼¼ÄÜÒ²»áÔÚÏûºÄÍê³Éºóµ÷ÓÃÕâ¸ö½Ó¿Ú£¨¼¼ÄÜµÄÒ»¿ªÊ¼£¬ÏûºÄ³É¹¦Ö´ĞĞÖ®ºó£©¡£
--·µ»Ø1£º´¦Àí³É¹¦£»·µ»Ø0£º´¦ÀíÊ§°Ü¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332207_OnActivateOnce( sceneId, selfId )

	local nItemIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	local nGiveExp = 0
	local nGiveImpactId = 0
	for i = 1, getn(x332207_DarkItem_DoubleExp) do
		if x332207_DarkItem_DoubleExp[i].ItemIndex == nItemIndex then
			nGiveExp = x332207_DarkItem_DoubleExp[i].GiveExp
			nGiveImpactId = x332207_DarkItem_DoubleExp[i].ImpactId
			break
		end
	end
	
	if nGiveExp == 0 or nGiveImpactId == 0 then
		return 0;
	end
	
	local nHaveImpact = 0
	--houzf 20090114ĞŞ¸Ä£¬Èç¹ûÒÑ¾­ÉèÖÃ¹ı2±¶µÄ£¬¾Í²»ÄÜÔÙÉèÁË£¬Èç¹ûÒÑ¾­Éè¹ıµÄÊÇ1.5±¶µÄ£¬Ôò¿ÉÒÔ±»2±¶µÄ¶¥µô£¬²»ÄÜÔÙÉè1.5±¶µÄ
	if (nItemIndex == x332207_DarkItem_DoubleExp[2].ItemIndex) then
		for i = 1, getn(x332207_DarkItem_DoubleExp) do
			local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x332207_DarkItem_DoubleExp[i].ImpactId)
			if nRet == 1 then
				nHaveImpact = 1
			end
		end
	elseif (nItemIndex == x332207_DarkItem_DoubleExp[1].ItemIndex) then
		local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x332207_DarkItem_DoubleExp[1].ImpactId)
		if nRet == 1 then
			nHaveImpact = 1
		end
	end
	
	--for i = 1, getn(x332207_DarkItem_DoubleExp) do
	--	local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x332207_DarkItem_DoubleExp[i].ImpactId)
	--	if nRet == 1 then
	--		nHaveImpact = 1
	--	end
	--end
	
	if nHaveImpact == 1 then
		local strNotice = "#{FBSJ_081209_88}"
		x332207_ShowNotice( sceneId, selfId, strNotice)
		return 0;
	end
	
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, nGiveImpactId, 0)
	
	return 1;
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332207_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end

function x332207_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332207_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	--Õâ¸öº¯ÊıÏÖÔÚÃ»ÓĞÓÃ
	--local PlayerName = GetName(sceneId,selfId)
	--local str = format( x332206_g_strGongGaoInfo, PlayerName, strItemInfo )
	--BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end



function x332207_DarkAttrAdjustForBagItem( sceneId, selfId, bagpos, attrfrom )
	
	local nCleanTimes = GetDarkCleanTimes(sceneId, selfId, bagpos);
	local nTotalCleanTimes = GetDarkTotalCleanTimes(sceneId, selfId, bagpos);
	if (nCleanTimes >= nTotalCleanTimes) then
		DarkOperateResult(sceneId, selfId, 0, -3);
		return
	end
	
	local nAttrValue = GetDarkAttrForBagItem(sceneId, selfId, bagpos, attrfrom);
	if (nAttrValue <= 1) then
		DarkOperateResult(sceneId, selfId, 0, -1);
		return
	end
	
	--ÓĞÕâ¸öÎïÆ·Âğ
	local bHave = LuaFnGetAvailableItemCount(sceneId, selfId, x332207_DarkItem_AdjustAttrItem);
	if(bHave < 1) then
		DarkOperateResult(sceneId, selfId, 0, -2);
		return
	end
	
	local bMoneyEnough = x332207_HaveEnoughMoney(sceneId, selfId, 0, 10000);
	if ( 1 ~= bMoneyEnough ) then
	    return
	end
	local bCostMoney = x332207_CostMoney(sceneId, selfId, 0, 10000);
	if ( 1 ~= bCostMoney ) then
	    return
	end
	
	--¿Û³ı³É¹¦
	if (LuaFnDelAvailableItem(sceneId, selfId, x332207_DarkItem_AdjustAttrItem, 1) ~= 1)  then
		DarkOperateResult(sceneId, selfId, 0, -2);
		return
	end
	
	SetDarkCleanTimes(sceneId, selfId, bagpos, nCleanTimes+1);
	local nAttrTo = AdjustDarkAttrForBagItem(sceneId, selfId, bagpos, attrfrom );
	if nAttrTo == -1 then
		--Ê§°ÜÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 0, -1);
	else
		--³É¹¦ÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 0, nAttrTo);
		x332207_SendImpact(sceneId, selfId, 1);
	end
end

function x332207_DarkSkillAdjustForBagItem( sceneId, selfId, bagpos )
	
	--ÓĞÕâ¸öÎïÆ·Âğ
	local bHave = LuaFnGetAvailableItemCount(sceneId, selfId, x332207_DarkItem_AdjustSkillItem);
	if(bHave < 1) then
		DarkOperateResult(sceneId, selfId, 1, -2);
		return
	end
	local bMoneyEnough = x332207_HaveEnoughMoney(sceneId, selfId, 1, 50000);
	if ( 1 ~= bMoneyEnough ) then
	    return
	end
	local bCostMoney = x332207_CostMoney(sceneId, selfId, 1, 50000);
	if ( 1 ~= bCostMoney ) then
	    return
	end
	--¿Û³ı³É¹¦
	if (LuaFnDelAvailableItem(sceneId, selfId, x332207_DarkItem_AdjustSkillItem, 1) ~= 1)  then
		DarkOperateResult(sceneId, selfId, 1, -2);
		return
	end
	
	local nSucc = AdjustDarkSkillForBagItem(sceneId, selfId, bagpos);
	if nSucc ~= 1 then
		--Ê§°ÜÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 1, -1);
	else
		--³É¹¦ÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 1, 1);
		x332207_SendImpact(sceneId, selfId, 2);
	end
end

function x332207_DarkResetForBagItem( sceneId, selfId, bagpos )
	--ÓĞÕâ¸öÎïÆ·Âğ
	local nNeedItem = x332207_DarkItem_Resetdark;
		 
	local bHave = LuaFnGetAvailableItemCount(sceneId, selfId, nNeedItem);
	if(bHave < 1) then
		DarkOperateResult(sceneId, selfId, 6, -2);		
		return
	end
	local bMoneyEnough = x332207_HaveEnoughMoney(sceneId, selfId, 6, 10000);
	if ( 1 ~= bMoneyEnough ) then
	    return
	end
	local bCostMoney = x332207_CostMoney(sceneId, selfId, 6, 10000);
	if ( 1 ~= bCostMoney ) then
	    return
	end
	--¿Û³ı³É¹¦
	if (LuaFnDelAvailableItem(sceneId, selfId, nNeedItem, 1) ~= 1)  then
		DarkOperateResult(sceneId, selfId, 6, -2);
		return
	end
	
	local nSucc = ResetDarkForBagItem(sceneId, selfId, bagpos);
	if nSucc ~= 1 then
		--Ê§°ÜÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 6, -1);
	else
		--³É¹¦ÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 6, 1);
		x332207_SendImpact(sceneId, selfId, 3);
	end
end

function x332207_DarkResetQualityForBagItem( sceneId, selfId, bagpos, resettype)
--ÓĞÕâ¸öÎïÆ·Âğ
	local nNeedItem = x332207_DarkItem_ResetQuality.type1;
	if(resettype == 2) then
		nNeedItem = x332207_DarkItem_ResetQuality.type2;
	end
		 
	local bHave = LuaFnGetAvailableItemCount(sceneId, selfId, nNeedItem);
	if(bHave < 1) then
		if(resettype == 2) then
			DarkOperateResult(sceneId, selfId, 2, -3);
		else
			DarkOperateResult(sceneId, selfId, 2, -2);		
		end
		return
	end
	
    local bMoneyEnough = x332207_HaveEnoughMoney(sceneId, selfId, 2, 10000);
	if ( 1 ~= bMoneyEnough ) then
	    return
	end
	local bCostMoney = x332207_CostMoney(sceneId, selfId, 2, 10000);
	if ( 1 ~= bCostMoney ) then
	    return
	end
	
	--¿Û³ı³É¹¦
	if (LuaFnDelAvailableItem(sceneId, selfId, nNeedItem, 1) ~= 1)  then
		DarkOperateResult(sceneId, selfId, 2, -2);
		return
	end
	
	local nSucc = ResetDarkQualityForBagItem(sceneId, selfId, bagpos, resettype);
	if nSucc ~= 1 then
		--Ê§°ÜÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 2, -1);
	else
		--³É¹¦ÁË£¬Í¨Öª¿Í»§¶Ë
		DarkOperateResult(sceneId, selfId, 2, 1);
		x332207_SendImpact(sceneId, selfId, 3);
	end
end

function x332207_CalcDarkMultiExpRate(sceneId, selfId)
	local fRate = 1.0;
	for i = 1, getn(x332207_DarkItem_DoubleExp) do
		local nRet = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x332207_DarkItem_DoubleExp[i].ImpactId)
		if nRet == 1 then
			fRate = x332207_DarkItem_DoubleExp[i].GiveExp;
			break;
		end
	end
	
	SetDarkGainExpRate(sceneId, selfId, fRate);
end


function x332207_SendImpact(sceneId, playerId, ntype)

	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 18, 0 )   --ÓëÕäÊŞÎòĞÔÌáÉıµÄÌØĞ§Ò»ÖÂ
	
end


function x332207_NotifyMailOnLogin(sceneId, selfId)

	if ( GetLevel(sceneId, selfId) >= 30 ) then
		local flag = GetMissionFlag(sceneId, selfId, MF_DARK_NOTIFYMAIL)
		if (flag == 0) then
			LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), "#{FBSJ_090311_09}" )
			SetMissionFlag(sceneId, selfId, MF_DARK_NOTIFYMAIL, 1)
		end
	end
	
end

function x332207_HaveEnoughMoney(sceneId, selfId, nType, nMoney)
   	--ÅĞ¶ÏÍæ¼ÒÉíÉÏÊÇ·ñÓĞ×ã¹»µÄÇ®
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney >= nMoney) then
	    return 1;
	else
        DarkOperateResult(sceneId, selfId, nType, -4);
	    return 0;
	end
end

function x332207_CostMoney(sceneId, selfId, nType, nMoney)
   	--¿ÛÇ®
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId,nMoney);
	if (nRet == -1) then
        DarkOperateResult(sceneId, selfId, nType, -4);
	    return 0;
	else
		return 1;
	end
end
