--���ӹ���NPC....
--������....

x001179_g_scriptId = 001179
x001179_g_shoptableindex = 21

--**********************************
--�¼��������
--**********************************
function x001179_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x001179_g_shoptableindex )
end
