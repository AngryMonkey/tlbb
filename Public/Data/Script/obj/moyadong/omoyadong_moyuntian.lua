--NPC
--
--��ͨ

--**********************************
--�¼��������
--**********************************
function x018112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"  ��Ħ�¶������ؼ�կ�˾ۼ�֮�������������������ö��Ҽ���ͬ��һͬ����Ƚϰ�ȫ��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
