--����NPC
--Сʫ
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ž���������̸��һ�����������ҵ��ˣ�˵���ǲ������Ĵ�Ӣ�ۣ����Ժ͡����Ƿ塱������Ľ�ݡ�����������")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
