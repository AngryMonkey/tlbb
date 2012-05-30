--测试商人NPC脚本

--脚本号
x800011_g_scriptId = 800011

--(苏州)装备饰品商人
x800011_g_shoptableindex=10

--**********************************
--事件交互入口
--**********************************
function x800011_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800011_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800011_OnDie( sceneId, selfId, killerId )
end
