--��������NPC�ű�

--�ű���
x800003_g_scriptId = 800003

--(����)װ������
x800003_g_shoptableindex=1

--**********************************
--�¼��������
--**********************************
function x800003_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800003_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800003_OnDie( sceneId, selfId, killerId )
end
