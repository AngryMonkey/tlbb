--��������NPC�ű�

--�ű���
x800011_g_scriptId = 800011

--(����)װ����Ʒ����
x800011_g_shoptableindex=10

--**********************************
--�¼��������
--**********************************
function x800011_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800011_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800011_OnDie( sceneId, selfId, killerId )
end
