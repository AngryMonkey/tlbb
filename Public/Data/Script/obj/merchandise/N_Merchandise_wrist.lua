--��������NPC�ű�

--�ű���
x800009_g_scriptId = 800009

--(����)װ����������
x800009_g_shoptableindex=8

--**********************************
--�¼��������
--**********************************
function x800009_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800009_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800009_OnDie( sceneId, selfId, killerId )
end
