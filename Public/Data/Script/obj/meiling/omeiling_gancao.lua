--÷��NPC
--�ʲ�
--��ͨ

--**********************************
--�¼��������
--**********************************
function x033004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����󻤷�˵�úã�÷��Ĵ���С�飬�޲��ڴ󻤷������֮�С����Ƕ����Ŵ󻤷�����˼ȥ����������һ��Σ�Ҳ��ϡ���Ϳ���ſ��öࡣ")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
