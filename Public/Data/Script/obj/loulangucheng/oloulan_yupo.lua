--¥��NPC
--����
--һ��
x001169_g_ScriptId = 1169

x001169_g_ShopTableIndex = 183 --����102�������䷽


--**********************************
--�¼��������
--**********************************
function x001169_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{PMF_090205_1}")
    AddNumText(sceneId,x001169_g_ScriptId,"#{PMF_090205_2}",7,0)		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


function x001169_OnEventRequest( sceneId, selfId, targetId, eventId )
  
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId,targetId, x001169_g_ShopTableIndex )
	end

end
