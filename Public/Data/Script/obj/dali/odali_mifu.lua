--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x002002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ɽ��īǧ�ﻭ��������������١���������Ȼ�Ǹ��õط������󽫾�������������Ȼ��ѡ�˵����ӡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
