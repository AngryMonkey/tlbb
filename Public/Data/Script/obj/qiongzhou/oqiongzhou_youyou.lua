--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x035001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���ء��������кö�����㰡���ѵ����Ƹ��������������������Ļ�������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�����¼�
--**********************************
function x035001_OnDie( sceneId, selfId, killerId )
end
