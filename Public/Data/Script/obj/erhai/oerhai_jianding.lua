--����NPC
--��
--5��7��������

x024006_g_scriptId = 024006
x024006_g_shoptableindex = 139

--**********************************
--�¼��������
--**********************************
function x024006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    û���Ҿ������������ģ���Ҫô��" )
		AddNumText( sceneId, x024006_g_scriptId, "���������", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x024006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x024006_g_shoptableindex )
	end
end
