-- 125011
-- ��ҽ

--�ű���
x125011_g_scriptId = 125011

--��ӵ�е��¼�ID�б�
x125011_g_eventList={}

x125011_g_shoptableindex = 14

--**********************************
--�¼��б�
--**********************************
function x125011_OnDefaultEvent( sceneId, selfId, targetId )
	DispatchShopItem( sceneId, selfId,targetId, x125011_g_shoptableindex )
end


