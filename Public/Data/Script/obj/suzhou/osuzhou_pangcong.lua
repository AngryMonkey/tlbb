--苏州NPC
--庞葱
--补药店

x001057_g_shoptableindex=29

--**********************************
--事件交互入口
--**********************************
function x001057_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我正在在师傅的指导下研制补药，等哪一天研制成功了，我可以以成本价卖给你。嘘——一般人我不告诉他。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	--DispatchShopItem( sceneId, selfId,targetId, x001057_g_shoptableindex )
end
