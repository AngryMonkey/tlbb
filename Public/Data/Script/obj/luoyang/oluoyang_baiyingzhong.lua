--����NPC
--��ӱ��
--��ҩ��

x000085_g_shoptableindex=29

--**********************************
--�¼��������
--**********************************
function x000085_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��������ʦ����ָ�������Ʋ�ҩ������һ�����Ƴɹ��ˣ��ҿ����Գɱ��������㡣�ꡪ��һ�����Ҳ���������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	--DispatchShopItem( sceneId, selfId,targetId, x000085_g_shoptableindex )
end
