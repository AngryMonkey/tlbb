--��ȯ

--�ű���
x300062_g_scriptId = 300062

--**********************************
--ˢ���¼�
--**********************************
function x300062_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId,"#{Help_lottery_003}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

function x300062_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
