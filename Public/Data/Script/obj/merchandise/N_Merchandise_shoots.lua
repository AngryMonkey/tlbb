--测试商人NPC脚本

--脚本号
x800010_g_scriptId = 800010

--(苏州)装备靴子商人
x800010_g_shoptableindex=7

--**********************************
--事件交互入口
--**********************************
function x800010_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800010_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800010_OnDie( sceneId, selfId, killerId )
end
