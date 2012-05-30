--苍山NPC
--马兜灵
--4级配方商人

x025007_g_scriptId = 025007
x025007_g_shoptableindex = 147

--**********************************
--事件交互入口
--**********************************
function x025007_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x025007_g_shoptableindex )
end

