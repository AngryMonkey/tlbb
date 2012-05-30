--古墓五层NPC
--郭底辉
--5级配方商人

x040000_g_scriptId = 040000
x040000_g_shoptableindex = 148

--**********************************
--事件交互入口
--**********************************
function x040000_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x040000_g_shoptableindex )
end

