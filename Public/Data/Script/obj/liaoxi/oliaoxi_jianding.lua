--����NPC
--����
--7��10��������

x021008_g_scriptId = 021008
x021008_g_shoptableindex = 141

--**********************************
--�¼��������
--**********************************
function x021008_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    �������ڼ�����������軹����ȥ����ʲô���԰���ģ�" )
		AddNumText( sceneId, x021008_g_scriptId, "���������", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x021008_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x021008_g_shoptableindex )
	end
end
