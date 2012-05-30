--测试商人NPC脚本

--脚本号
x800003_g_scriptId = 800003

--(苏州)装备商人
x800003_g_shoptableindex=1

--**********************************
--事件交互入口
--**********************************
function x800003_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800003_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800003_OnDie( sceneId, selfId, killerId )
end
