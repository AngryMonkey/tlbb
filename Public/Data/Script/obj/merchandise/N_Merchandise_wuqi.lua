--��������NPC�ű�

--�ű���
x800004_g_scriptId = 800004

--(����)��������
x800004_g_shoptableindex=2

--**********************************
--�¼��������
--**********************************
function x800004_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800004_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800004_OnDie( sceneId, selfId, killerId )
end
