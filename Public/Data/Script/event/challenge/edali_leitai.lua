-- ��̨���¼�����ű�

x806013_g_ScriptId = 806013
x806013_g_ChallengeScriptId = 806014

-- ��ҽ�����̨ʱ����
function x806013_OnEnterArea( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT, x806013_g_ChallengeScriptId )
	ResetChallengeData( sceneId, selfId )
end

-- ���ͣ������̨��ʱ����
function x806013_OnTimer( sceneId, selfId )
	return
end

-- ����뿪��̨ʱ����
function x806013_OnLeaveArea( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT, 0 )
	ResetChallengeData( sceneId, selfId )
end
