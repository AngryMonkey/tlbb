--����NPC
--�����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x035003_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ����������Ҫ�������ݣ���������İ���������������֮�࣬��ʵ�ڲ��������Ƕ�ȥ��#r  ����������ݣ���Ҫ��������˵�Ϻ���һλ��ҽ�������������Ƥ���������ߡ��������������ż���֮���һ�Ҫ�ϻ�������������İ��յġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
