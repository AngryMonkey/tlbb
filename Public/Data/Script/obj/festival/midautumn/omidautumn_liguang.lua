-- ����NPC
-- ���

x050005_g_scriptId = 050005

--**********************************
--�¼��������
--**********************************
function x050005_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    ���������ϣ���Ϧ�����Ⱥ����Һ��£���ת�����ݡ��綨��ƽ��������ɢ�������磬�����ڱ��ۡ�Ц��һ���ƣ�ˮ������ک�����곡��������������ͷ�����������������ʮ�����������������ӣ������������飬��·ָ���񡣲��ó˷������˼������Ρ�"
		AddText( sceneId, "ˮ����ͷ" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
