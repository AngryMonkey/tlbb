--楼兰NPC
--于婆
--一般
x001169_g_ScriptId = 1169

x001169_g_ShopTableIndex = 183 --出售102级神器配方


--**********************************
--事件交互入口
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
