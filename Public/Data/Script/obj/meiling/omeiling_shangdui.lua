--÷��NPC
--�̶�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033010_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �̶���÷���Ѿ�ͣ�˺ö����ˣ��������Ѿ������ˣ���һ��������Ҷ��ֵܷ����ٰɡ�#r  ���ϰ�����Ǹ���ҵ��Ű�����������������ǰ�������ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
