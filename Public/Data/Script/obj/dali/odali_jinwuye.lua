--����NPC
--����ү
--Ԫ������

--**********************************
--�¼��������
--**********************************
function x002059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���߽�������Ȼ��˭ȭͷӲ˭���Ǵ�ү�����׻�˵�úã���Ǯ��ʹĥ�ƹ���������Ԫ��������ʹ�ܶ��Ѱ�������ü�������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
