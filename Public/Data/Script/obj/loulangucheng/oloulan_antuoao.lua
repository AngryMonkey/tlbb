--¥��NPC....
--������....

x001102_g_scriptId = 001102
x001102_g_shoptableindex = 21

--**********************************
--�¼��������
--**********************************
function x001102_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001102_g_shoptableindex )
end
