--����NPC
--С��
--��ͨ

--**********************************
--�¼��������
--**********************************
function x015004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ���Ž������ݻ���֮��һ���ü��춼�跹��˼�ģ������кܶ�������ء�")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
