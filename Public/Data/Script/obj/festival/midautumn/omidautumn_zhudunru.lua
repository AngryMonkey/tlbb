-- ����NPC
-- �����

x050006_g_scriptId = 050006

--**********************************
--�¼��������
--**********************************
function x050006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    ƫ�������£��ӹŵ���񡣽����¶��䣬����һ���塣�Ǵ���������˭�ҹ��Ҳ����������㻶�顣Īָ��ɽ·����ʹ���򭡣ˮ���̣������ڣ����³ȡ���ƾ�ů�����ִ�����Ƶ�塣��ϧ���κ��ֱ�������Ϧ��ʮ������ӯ��δ�����꿴�����ƴ˻�����"
		AddText( sceneId, "ˮ����ͷ" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
