--����NPC
--����ƽ
--����������

x002077_g_scriptId = 002077
x002077_g_shoptableindex = 10

--**********************************
--�¼��������
--**********************************
function x002077_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    ���˳��۶������Ƽ����������Լ����������͵�װ������ӭѡ����" )
		AddNumText( sceneId, x002077_g_scriptId, "���������Ķ���", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002077_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002077_g_shoptableindex )
	end
end
