--��������NPC�ű�

--�ű���
x800010_g_scriptId = 800010

--(����)װ��ѥ������
x800010_g_shoptableindex=7

--**********************************
--�¼��������
--**********************************
function x800010_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800010_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800010_OnDie( sceneId, selfId, killerId )
end
