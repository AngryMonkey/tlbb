--测试商人NPC脚本

--脚本号
x800009_g_scriptId = 800009

--(苏州)装备护腕商人
x800009_g_shoptableindex=8

--**********************************
--事件交互入口
--**********************************
function x800009_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800009_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800009_OnDie( sceneId, selfId, killerId )
end
