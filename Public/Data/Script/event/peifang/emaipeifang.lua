--npc卖配方的脚本

--脚本号
x713502_g_scriptId = 713502

--(苏州)装备商人
x713502_g_shoptableindex=6

--**********************************
--事件交互入口
--**********************************
function x713502_OnDefaultEvent( sceneId, selfId,targetId )

	DispatchShopItem( sceneId, selfId,targetId, x713502_g_shoptableindex )

end
