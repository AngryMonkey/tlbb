--����NPC
--Ԫ����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x035002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����Ϻ��������������Ǻųơ��Ϻ����񡱵���������������Ƿ�����֮����ȥ���򵺰���ɩ�������ݡ�������ɩ�Ѿ����ˣ�����������������ȥ����������硣")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
