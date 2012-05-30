--洛阳NPC
--瑞福祥
--普通

--药店

x000099_g_scriptId = 000099

x000099_g_shoptableindex=16

--**********************************
--事件交互入口
--**********************************
function x000099_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  众人熙熙，皆为利来，众人攘攘，皆为利往。" )
		AddNumText( sceneId, x000099_g_scriptId, "买卖杂货", 7, 1 )
			--for i, eventId in x000099_g_eventList do
				--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId)
			--end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000099_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1	then
		DispatchShopItem( sceneId, selfId, targetId, x000099_g_shoptableindex)
	end
end
