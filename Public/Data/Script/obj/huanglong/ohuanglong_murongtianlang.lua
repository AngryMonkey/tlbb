--����NPC
--Ľ������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x023004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ϧ����·�������������࣬���ı��죡���ð���ע��һ�������ж�������ȴÿ�ζ�������������Ϊû��ʲô�쳣�����Ҿ�����û�п����ˣ�һ����ʲô������ⷢ���ˡ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
