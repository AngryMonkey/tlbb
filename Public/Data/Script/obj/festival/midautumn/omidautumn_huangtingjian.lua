-- ����NPC
-- ��ͥ��

x050003_g_scriptId = 050003

--**********************************
--�¼��������
--**********************************
function x050003_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    �������ꡣ������������ȥ��Ц���뿪�����������������ǰ�꽭�⡣��Ů�����ֵܻᡣ��ҹ��¥��Сл����ο��ͷ��"
		AddText( sceneId, "����ľ����" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
