--��Ĺ���NPC
--���׻�
--5���䷽����

x040000_g_scriptId = 040000
x040000_g_shoptableindex = 148

--**********************************
--�¼��������
--**********************************
function x040000_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId, targetId, x040000_g_shoptableindex )
end

