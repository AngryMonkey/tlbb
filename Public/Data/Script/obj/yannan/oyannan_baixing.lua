--����NPC
--����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x018007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ƕ��ǺúõĴ��ΰ��գ�ס�����Ź����м����ˣ��������ѣ������Լҵ����ѡ������ǲ����뿪�ġ�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
