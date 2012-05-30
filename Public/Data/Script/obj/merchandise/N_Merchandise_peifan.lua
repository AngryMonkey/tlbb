--测试商人NPC脚本

--脚本号
x800007_g_scriptId = 800007

--(苏州)配方商人
x800007_g_shoptableindex=5

--**********************************
--事件交互入口
--**********************************
function x800007_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800007_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800007_OnDie( sceneId, selfId, killerId )
end
