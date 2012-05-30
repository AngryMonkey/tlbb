--商人的Npc
--普通

--脚本号
x125003_g_scriptId = 125003

--商店编号
x125003_g_ShopTabId_1	= 143
x125003_g_ShopTabId_2	= 27

--所拥有的事件ID列表
x125003_g_eventList={}

--**********************************
--事件交互入口
--**********************************

function x125003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  你需要点什么啊？我这里很多吃喝的。价格还和洛阳城同步哦。")
		AddNumText(sceneId,x125003_g_scriptId,"购买药与食物",7,0)
		AddNumText(sceneId,x125003_g_scriptId,"购买珍兽口粮",7,1)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x125003_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	
	if key == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x125003_g_ShopTabId_1 )
	end
	if key == 1 then
		DispatchShopItem( sceneId, selfId, targetId, x125003_g_ShopTabId_2 )
	end
end

