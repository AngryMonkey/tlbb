--¥��NPC....
--��������....

x001124_g_scriptId = 001124
x001124_g_shoptableindex = 18

--**********************************
--�¼��������
--**********************************
function x001124_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001124_g_shoptableindex )
end
