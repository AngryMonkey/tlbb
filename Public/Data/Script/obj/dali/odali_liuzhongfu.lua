-- ����NPC
-- ���ٸ�

x002092_g_scriptId = 002092

--**********************************
--�¼��������
--**********************************
function x002092_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    ��ĳѧ��������ʮ���꣬��δ�������֡�ֻ������֮ǰ����һλ��ɽ�������°ܹ�һ�Σ���ʱ��֪�������죬�������ˡ�" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
