--����NPC
--С��
--��װ��

x002055_g_scriptId = 002055
x002055_g_shoptableindex = 3

--**********************************
--�¼��������
--**********************************
function x002055_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    �����д�����Ʒ���ۣ���ӭѡ����" )
		AddNumText( sceneId, x002055_g_scriptId, "���������Ķ���", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002055_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x002055_g_shoptableindex )
	end
end
