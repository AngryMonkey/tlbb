--��������NPC�ű�

--�ű���
x800008_g_scriptId = 800008

--(����)װ���·�����
x800008_g_shoptableindex=9

--**********************************
--�¼��������
--**********************************
function x800008_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800008_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800008_OnDie( sceneId, selfId, killerId )
end
