--测试商人NPC脚本

--脚本号
x800008_g_scriptId = 800008

--(苏州)装备衣服商人
x800008_g_shoptableindex=9

--**********************************
--事件交互入口
--**********************************
function x800008_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800008_g_shoptableindex )
	
end


--**********************************
--死亡事件
--**********************************
function x800008_OnDie( sceneId, selfId, killerId )
end
