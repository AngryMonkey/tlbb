--����NPC
--����
--6������ͼֽ��

x035006_g_scriptId = 035006
x035006_g_shoptableindex = 108

--**********************************
--�¼��������
--**********************************
function x035006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    ����������������Ҫ�Ķ����߰ɣ�����������֪���������" )
		AddNumText( sceneId, x035006_g_scriptId, "���������Ķ���", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x035006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x035006_g_shoptableindex )
	end
end
