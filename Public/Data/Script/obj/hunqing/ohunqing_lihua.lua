--���츱��NPC
--��ͨ

--�ű���
x155008_g_scriptId = 155008

x155008_g_shoptableindex=30

--**********************************
--�¼��������
--**********************************
function x155008_OnDefaultEvent(sceneId, selfId,targetId)
	DispatchShopItem( sceneId, selfId,targetId, x155008_g_shoptableindex )
end

