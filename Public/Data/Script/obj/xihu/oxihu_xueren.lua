-- ����NPC
-- ѩ��

x050200_g_scriptId = 050200

--**********************************
--�¼��������
--**********************************
function x050200_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    �ҡ������Ǹ�ѩ�˰���" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
