--�ɱ�

--�ű���
x020008_g_scriptId = 020008

--**********************************
--�¼��б�
--**********************************
function x020008_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����Զһ�㣬 ���˲������˵����#r  ������꣡ ���ɱ�ʤ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
