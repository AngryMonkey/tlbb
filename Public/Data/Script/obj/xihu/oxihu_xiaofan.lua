-- ����NPC
-- С��

x050201_g_scriptId = 050201

x050201_g_shoptableindex = 166	--��ʱ

--**********************************
--�¼��������
--**********************************
function x050201_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    ��λ�������������̶���ȥȥ�����ɣ�С��ı����̶�����Բ���ﶼ��������" )
		AddNumText( sceneId, x050201_g_scriptId, "�����̶���", 7, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x050201_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		DispatchShopItem( sceneId, selfId, targetId, x050201_g_shoptableindex )
	end
end
