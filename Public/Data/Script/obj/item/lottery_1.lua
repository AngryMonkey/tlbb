--��ȯ

--�ű���
x300060_g_scriptId = 300060

--**********************************
--ˢ���¼�
--**********************************
function x300060_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId,"#{Help_lottery_001}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

function x300060_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
