--������

--�ű���
x311001_g_scriptId = 311001

--**********************************
--�¼��б�
--**********************************
function x311001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ������ȥ������������������û�м���ʦʦ�����˵ÿ�λ���ʦʦ���ﶼ��ǰ������ϧ���ҹ�������������Ե�ü�����")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x311001_OnDefaultEvent( sceneId, selfId,targetId )
end
