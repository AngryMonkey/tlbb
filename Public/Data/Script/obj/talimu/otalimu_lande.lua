--����ľNPC
--����
--**********************************
--�¼��������
--**********************************
function x044507_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC�Ի�
--**********************************
		AddText(sceneId,"¥���ǿ���ɳĮ�е�һ�����飬���������ɳ�ƺ�Խ��Խ���ˡ���")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
