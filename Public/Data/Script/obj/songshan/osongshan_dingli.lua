--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x003006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��˵̫��ү�����ţ���ô�����أ�����̫��үȥ����ʱ������������������������ᷢ������������̫����˼���ˡ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
