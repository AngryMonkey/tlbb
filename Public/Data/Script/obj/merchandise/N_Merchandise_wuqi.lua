--测试商人NPC脚本

--脚本号
x800004_g_scriptId = 800004

--(苏州)武器商人
x800004_g_shoptableindex=2

--**********************************
--事件交互入口
--**********************************
function x800004_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800004_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800004_OnDie( sceneId, selfId, killerId )
end
