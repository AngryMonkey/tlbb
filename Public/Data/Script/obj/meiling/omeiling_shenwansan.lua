--÷��NPC
--������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  û�뵽������֬ˮ��������ô�죬������������ˡ�;����ԭ��ʱ�����꿤�������ҵĻ����������ҵúúü���һ����ο���׬���١���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
