--����NPC
--��������
--��ͨ

--**********************************
--�¼��������
--**********************************
function x008009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  �����׻ʵ۱���ΪʲôҪ���ƺ��˾��ţ����ǵ�����ŵ�ս����ԶԶ�������˰���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

