--商人Npc 古迪 B帮
--普通

--脚本号
x402298_g_scriptId = 402298

--商店编号
x402298_g_ShopTabId_1	= 143
x402298_g_ShopTabId_2	= 27

--所拥有的事件ID列表
x402298_g_eventList={}

--**********************************
--事件交互入口
--**********************************
function x402298_OnDefaultEvent( sceneId, selfId,targetId )
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_22}")
			AddNumText(sceneId,x402298_g_scriptId,"#{BHXZ_081103_83}",7,0)
			AddNumText(sceneId,x402298_g_scriptId,"#{BHXZ_081103_84}",7,1)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x402298_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 0 then
		return
	end
	
	if key == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x402298_g_ShopTabId_1 )
	elseif key == 1 then
		DispatchShopItem( sceneId, selfId, targetId, x402298_g_ShopTabId_2 )
	end
end
