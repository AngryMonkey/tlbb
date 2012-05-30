--地宫商人

--脚本号
x044600_g_ScriptId = 044600

--商店编号
x044600_g_shoptableindex = 187

--**********************************
--事件交互入口
--**********************************
function x044600_OnDefaultEvent( sceneId, selfId,targetId )
	DispatchShopItem( sceneId, selfId,targetId, x044600_g_shoptableindex )
end
