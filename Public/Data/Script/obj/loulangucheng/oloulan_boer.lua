--¥��NPC....
--ҩ���ϰ�....

x001116_g_scriptId = 001116
x001116_g_shoptableindex = 179

--**********************************
--�¼��������
--**********************************
function x001116_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLGC_20080324_02}" )
		AddNumText( sceneId, x001116_g_scriptId, "���������Ķ���", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001116_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x001116_g_shoptableindex )
	end
end
