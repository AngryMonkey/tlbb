--��������NPC�ű�

--�ű���
x800007_g_scriptId = 800007

--(����)�䷽����
x800007_g_shoptableindex=5

--**********************************
--�¼��������
--**********************************
function x800007_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800007_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800007_OnDie( sceneId, selfId, killerId )
end
