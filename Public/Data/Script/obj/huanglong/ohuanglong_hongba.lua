--����NPC
--���
--Ұ�ⱦʯ����

x023007_g_scriptId = 023007
x023007_g_shoptableindex = 111

--**********************************
--�¼��������
--**********************************
function x023007_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "����������ۿɱ��м۵Ͷ��ˣ��Ų������㡣" )
		AddNumText( sceneId, x023007_g_scriptId, "����������ʲô", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x023007_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		if(GetLevel(sceneId, selfId) < 30 ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BSSR_20080131_01}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		DispatchShopItem( sceneId, selfId, targetId, x023007_g_shoptableindex )
	end
end
