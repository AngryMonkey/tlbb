--�䵱NPC
--�ź�֥
--��ͨ

--**********************************
--�¼��������
--**********************************
function x012005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"��������ӣ������е㲻���ġ�Ҫ��Ҫһ���ȥ���棿")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
