--��������NPC�ű�

--�ű���
x800005_g_scriptId = 800005

--(����)�ӻ�����
x800005_g_shoptableindex=3

--**********************************
--�¼��������
--**********************************
function x800005_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800005_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800005_OnDie( sceneId, selfId, killerId )
end
