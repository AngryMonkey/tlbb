--ؤ��NPC
--����Խ
--��ͨ

--�ű���
x010011_g_scriptId			= 010011

x010011_g_shoptableindex= 49

--**********************************
--�¼��������
--**********************************
function x010011_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  �������ɣ����������Ϻõ����")
		AddNumText( sceneId, x010011_g_scriptId, "��������", 7, 100 )
		AddNumText( sceneId, x010011_g_scriptId, "��������", 11, 101 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x010011_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		DispatchShopItem( sceneId, selfId, targetId, x010011_g_shoptableindex )
	elseif GetNumText() == 101 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_012}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
end
