--¥��NPC....
--���̲�������....

x001110_g_scriptId = 001110
x001110_g_shoptableindex = 18

--**********************************
--�¼��������
--**********************************
function x001110_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001110_g_shoptableindex )
end
