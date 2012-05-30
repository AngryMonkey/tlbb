--½Å±¾ºÅ
x210250_g_ScriptId = 210250


x210250_g_Warning1 = "TÛ© khoän cÄ¬ các hÕ hi®n không ğång kı bè lßu kinh nghi®m"
x210250_g_Warning2 = "Ği·© kinh nghi®m ğßşc chuy¬n vào phò™g lßu træ!"
x210250_g_Warning3 = "ThôÌ gian online th¤p h½n 1 tiªng, các hÕ chßa th¬ nh§n ğßşc kinh nghi®m ğã lßu træ!"
x210250_g_Warning4 = "Hôm nay các hÕ ğã 3 l¥n nh§n ği·© kinh nghi®m lßu træ, các hÕ không th¬ nh§n thêm!"

x210250_g_HuodongName = "Nh§n ği·© kinh nghi®m lßu træ"




--**********************************
--ÈÎÎñÈë¿Úº¯Êı
--**********************************
function x210250_OnDefaultEvent( sceneId, selfId, targetId )	--µã»÷¸ÃÈÎÎñºóÖ´ĞĞ´Ë½Å±¾
	local bSuccess = LuaFnGetFromIncomePool( sceneId, selfId, 1, 3600, 7200, 10800 )
	if bSuccess == 1 then					--ÕÊºÅ²»ÊÜ·À³ÁÃÔÓ°Ïì
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning1 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )       
	elseif bSuccess == 2 then			--ÊÕÒæ³ØÎª¿Õ
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning2 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )   
	elseif bSuccess == 3 then			--ÔÚÏßÊ±¼äĞ¡ÓÚ1Ğ¡Ê±£¬²»µÃÁìÈ¡
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning3 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )  
	elseif bSuccess == 4 then			--½ñÌìÒÑ¾­ÁìÈ¡¹ı3´Î£¬²»µÃÔÙ´ÎÁìÈ¡ÁË
		BeginEvent(sceneId)
		AddText( sceneId, x210250_g_Warning4 )
		EndEvent( )
		DispatchEventList( sceneId, selfId, targetId )    
	elseif bSuccess == 0 then			--ÁìÈ¡³É¹¦
		--¹Ø±Õ½çÃæ
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
	end
	
end



--**********************************
--ÁĞ¾ÙÊÂ¼ş
--**********************************
function x210250_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x210250_g_ScriptId,x210250_g_HuodongName,1,-1);
end



--**********************************
--¼ì²â½ÓÊÜÌõ¼ş
--**********************************
function x210250_CheckAccept( sceneId, selfId )

end

--**********************************
--½ÓÊÜ
--**********************************
function x210250_OnAccept( sceneId, selfId )
end

--**********************************
--·ÅÆú
--**********************************
function x210250_OnAbandon( sceneId, selfId )
end

--**********************************
--¼ÌĞø
--**********************************
function x210250_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--¼ì²âÊÇ·ñ¿ÉÒÔÌá½»
--**********************************
function x210250_CheckSubmit( sceneId, selfId )
end

--**********************************
--Ìá½»
--**********************************
function x210250_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--É±ËÀ¹ÖÎï»òÍæ¼Ò
--**********************************
function x210250_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--½øÈëÇøÓòÊÂ¼ş
--**********************************
function x210250_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--µÀ¾ß¸Ä±ä
--**********************************
function x210250_OnItemChanged( sceneId, selfId, itemdataId )
end


