--����NPC
--�ذ���
--��ͨ

--**********************************
--�¼��������
--**********************************
function x023001_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  Ϧ������ȥ���ߵ������ˣ����������飬�Ҷ������ˡ������ǣ����������������Ľ�ݳ��ϣ���һ���ᴦ��Ϧ�յġ����Ҹ���ô�졭��")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
