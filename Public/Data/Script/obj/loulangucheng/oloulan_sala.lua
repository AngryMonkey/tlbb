--¥��NPC....
--�ӻ�����....

x001125_g_scriptId = 001125
x001125_g_shoptableindex = 26

--**********************************
--�¼��������
--**********************************
function x001125_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001125_g_shoptableindex )
end
