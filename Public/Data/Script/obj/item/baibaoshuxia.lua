--µÀ¾ß£º°Ù±¦ÊéÏ»
--½Å±¾ºÅ 332205
--Author:  houzhifang  2008-11-06

x332205_g_scriptId = 332205
x332205_g_strGongGaoInfo = "#HÊ«Ô»¡°ÊéÖĞ×ÔÓĞ»Æ½ğÎİ¡±£¬#{_INFOUSR%s}#HÇóÊéÈô¿Ê£¬½ñÈÕÅ¼È»¼äÔÚ#G#{_ITEM30501171}#HÖĞ·¢ÏÖÁËÒ»±¾#{_INFOMSG%s}#H¡£"
--x332205_g_strGongGaoInfo = "#{_INFOUSR%s}#HÔÚÊ¹ÓÃ°Ù±¦ÊéÏ»ºó£¬»ñµÃÁËÒ»±¾#{_INFOMSG%s}#HÕäÊŞ¼¼ÄÜÊé¡£"
x332205_g_giftitem_index = 30501318

--**********************************
--ÊÂ¼ş½»»¥Èë¿Ú
--**********************************
function x332205_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ²»ĞèÒªÕâ¸ö½Ó¿Ú£¬±£Áô¿Õº¯Êı
end

--**********************************
--Õâ¸öÎïÆ·µÄÊ¹ÓÃ¹ı³ÌÊÇ·ñÀàËÆÓÚ¼¼ÄÜ£º
--ÏµÍ³»áÔÚÖ´ĞĞ¿ªÊ¼Ê±¼ì²âÕâ¸öº¯ÊıµÄ·µ»ØÖµ£¬Èç¹û·µ»ØÊ§°ÜÔòºöÂÔºóÃæµÄÀàËÆ¼¼ÄÜµÄÖ´ĞĞ¡£
--·µ»Ø1£º¼¼ÄÜÀàËÆµÄÎïÆ·£¬¿ÉÒÔ¼ÌĞøÀàËÆ¼¼ÄÜµÄÖ´ĞĞ£»·µ»Ø0£ººöÂÔºóÃæµÄ²Ù×÷¡£
--**********************************
function x332205_IsSkillLikeScript( sceneId, selfId)
	return 1; --Õâ¸ö½Å±¾ĞèÒª¶¯×÷Ö§³Ö
end

--**********************************
--Ö±½ÓÈ¡ÏûĞ§¹û£º
--ÏµÍ³»áÖ±½Óµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÒÑ¾­È¡Ïû¶ÔÓ¦Ğ§¹û£¬²»ÔÙÖ´ĞĞºóĞø²Ù×÷£»·µ»Ø0£ºÃ»ÓĞ¼ì²âµ½Ïà¹ØĞ§¹û£¬¼ÌĞøÖ´ĞĞ¡£
--**********************************
function x332205_CancelImpacts( sceneId, selfId )
	return 0; --²»ĞèÒªÕâ¸ö½Ó¿Ú£¬µ«Òª±£Áô¿Õº¯Êı,²¢ÇÒÊ¼ÖÕ·µ»Ø0¡£
end

--**********************************
--Ìõ¼ş¼ì²âÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜ¼ì²âµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÌõ¼ş¼ì²âÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÌõ¼ş¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--**********************************
function x332205_OnConditionCheck( sceneId, selfId )

	--Ğ£ÑéÊ¹ÓÃµÄÎïÆ	
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
					
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then
	        local strNotice = "¶Ô²»Æğ£¬ÄúµÄ±³°üÒÑÂú£¬ÇëÖÁÉÙÁô³öÁ½¸öµÀ¾ßÀ¸¿Õ¼ä¡£"
		      x332205_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	return 1;
end

--**********************************
--ÏûºÄ¼ì²â¼°´¦ÀíÈë¿Ú£º
--ÏµÍ³»áÔÚ¼¼ÄÜÏûºÄµÄÊ±¼äµãµ÷ÓÃÕâ¸ö½Ó¿Ú£¬²¢¸ù¾İÕâ¸öº¯ÊıµÄ·µ»ØÖµÈ·¶¨ÒÔºóµÄÁ÷³ÌÊÇ·ñÖ´ĞĞ¡£
--·µ»Ø1£ºÏûºÄ´¦ÀíÍ¨¹ı£¬¿ÉÒÔ¼ÌĞøÖ´ĞĞ£»·µ»Ø0£ºÏûºÄ¼ì²âÊ§°Ü£¬ÖĞ¶ÏºóĞøÖ´ĞĞ¡£
--×¢Òâ£ºÕâ²»¹â¸ºÔğÏûºÄµÄ¼ì²âÒ²¸ºÔğÏûºÄµÄÖ´ĞĞ¡£
--**********************************
function x332205_OnDeplete( sceneId, selfId )
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
function x332205_OnActivateOnce( sceneId, selfId )

    local RandomBase = GetBaibaoshuxiaItemDropBase( sceneId, selfId )
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = BaibaoshuxiaItemDropItem( sceneId, selfId, RandomNum )
       
        if( RandomID > 0 ) then
        	BeginAddItem(sceneId)
			AddItem( sceneId, RandomID, 1 )
			AddItem( sceneId, x332205_g_giftitem_index, 1 )
			local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			    if 1 == Notice then
			    	local szItemTransfer = GetItemTransfer(sceneId,selfId, 0)
						x332205_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				   	end
				      
				    local ItemName = GetItemName(sceneId, RandomID)
				    local strNotice = "#{BBSX_081106_2}"..ItemName
				    x332205_ShowNotice( sceneId, selfId, strNotice)
				    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				 else
				    local strNotice = "#{BBSX_081106_1}"
				    x332205_ShowNotice( sceneId, selfId, strNotice)
			     end		
        	end
    	end
    
	return 1;
end

--**********************************
--Òıµ¼ĞÄÌø´¦ÀíÈë¿Ú£º
--Òıµ¼¼¼ÄÜ»áÔÚÃ¿´ÎĞÄÌø½áÊøÊ±µ÷ÓÃÕâ¸ö½Ó¿Ú¡£
--·µ»Ø£º1¼ÌĞøÏÂ´ÎĞÄÌø£»0£ºÖĞ¶ÏÒıµ¼¡£
--×¢£ºÕâÀïÊÇ¼¼ÄÜÉúĞ§Ò»´ÎµÄÈë¿Ú
--**********************************
function x332205_OnActivateEachTick( sceneId, selfId)
	return 1; --²»ÊÇÒıµ¼ĞÔ½Å±¾, Ö»±£Áô¿Õº¯Êı.
end

function x332205_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332205_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local str = format( "#HÊ«Ô»¡°ÊéÖĞ×ÔÓĞ»Æ½ğÎİ¡±£¬#{_INFOUSR%s}#HÇóÊéÈô¿Ê£¬½ñÈÕÅ¼È»¼äÔÚ#G#{_ITEM30501171}#HÖĞ·¢ÏÖÁËÒ»±¾#{_INFOMSG%s}#H¡£", PlayerName, strItemInfo )
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
