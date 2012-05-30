--婚庆副本NPC
--普通

--脚本号
x155008_g_scriptId = 155008

x155008_g_shoptableindex=30

--**********************************
--事件交互入口
--**********************************
function x155008_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem( sceneId, selfId,targetId, x155008_g_shoptableindex )
end

