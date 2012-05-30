--测试商人NPC脚本

--脚本号
x800005_g_scriptId = 800005

--(苏州)杂货商人
x800005_g_shoptableindex=3

--**********************************
--事件交互入口
--**********************************
function x800005_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800005_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800005_OnDie( sceneId, selfId, killerId )
end
