--测试商人NPC脚本

--脚本号
x800006_g_scriptId = 800006

--(苏州)云游商人
x800006_g_shoptableindex=4

--**********************************
--事件交互入口
--**********************************
function x800006_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800006_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800006_OnDie( sceneId, selfId, killerId )
end
