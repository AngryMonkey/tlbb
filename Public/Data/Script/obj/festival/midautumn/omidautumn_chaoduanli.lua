-- ����NPC
-- �˶���

x050004_g_scriptId = 050004

--**********************************
--�¼��������
--**********************************
function x050004_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    �µ�����ҹ����ʤ��ҹԲ���ߺ�ɪɪת���̡���ʮ�����������������������ʪ�������ۺ���Ѱ�����ǲ�濾ꡣ����Ī����Ϧ�������ꡣ"
		AddText( sceneId, "�ϸ���" )
		AddText( sceneId, strText )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
