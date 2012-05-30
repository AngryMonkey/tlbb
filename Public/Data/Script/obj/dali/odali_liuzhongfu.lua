-- 大理NPC
-- 刘仲甫

x002092_g_scriptId = 002092

--**********************************
--事件交互入口
--**********************************
function x002092_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    刘某学棋至今凡五十二年，从未遇到敌手。只是数年之前，在一位骊山仙姥手下败过一次，那时才知天外有天，人上有人。" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
