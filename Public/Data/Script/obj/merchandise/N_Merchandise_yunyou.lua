--��������NPC�ű�

--�ű���
x800006_g_scriptId = 800006

--(����)��������
x800006_g_shoptableindex=4

--**********************************
--�¼��������
--**********************************
function x800006_OnDefaultEvent( sceneId, selfId,targetId )
	
	DispatchShopItem( sceneId, selfId,targetId, x800006_g_shoptableindex )
	
end


--**********************************
--�����¼�
--**********************************
function x800006_OnDie( sceneId, selfId, killerId )
end
