--����Npc ��� A��
--��ͨ

--�ű���
x402294_g_scriptId = 402294

--�̵���
x402294_g_ShopTabId_1	= 143
x402294_g_ShopTabId_2	= 27

--��ӵ�е��¼�ID�б�
x402294_g_eventList={}

--**********************************
--�¼��������
--**********************************
function x402294_OnDefaultEvent( sceneId, selfId,targetId )
	if CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_22}")
			AddNumText(sceneId,x402294_g_scriptId,"#{BHXZ_081103_83}",7,0)
			AddNumText(sceneId,x402294_g_scriptId,"#{BHXZ_081103_84}",7,1)
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
--�¼��б�ѡ��һ��
--**********************************
function x402294_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	
	if CallScriptFunction(402047, "IsCommonAGuild", sceneId, selfId ) == 0 then
		return
	end

	if key == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x402294_g_ShopTabId_1 )
	elseif key == 1 then
		DispatchShopItem( sceneId, selfId, targetId, x402294_g_ShopTabId_2 )
	end
end
