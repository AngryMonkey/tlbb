--ʯ��NPC
--֣����
--��ͨ

--**********************************
--�¼��������
--**********************************
function x026005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"    �ҽ�֣���ɣ������͹õ�����Զ���ˡ��ù����춼�ڿޡ���ʵ�����ÿ޵İ��������͹õ�����һ�������İ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
