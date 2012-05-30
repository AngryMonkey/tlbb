-- 125011
-- 神医

--脚本号
x125011_g_scriptId = 125011

--所拥有的事件ID列表
x125011_g_eventList={}

x125011_g_shoptableindex = 14

--**********************************
--事件列表
--**********************************
function x125011_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId,targetId, x125011_g_shoptableindex )
end


