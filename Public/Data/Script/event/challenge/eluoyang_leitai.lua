-- ��̨���¼�����ű�

x806011_g_ScriptId = 806011
x806011_g_ChallengeScriptId = 806012

-- ��ҽ�����̨ʱ����
function x806011_OnEnterArea( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT, x806011_g_ChallengeScriptId )
	ResetChallengeData( sceneId, selfId )
end

-- ���ͣ������̨��ʱ����
function x806011_OnTimer( sceneId, selfId )
	return
end

-- ����뿪��̨ʱ����
function x806011_OnLeaveArea( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT, 0 )
	ResetChallengeData( sceneId, selfId )
end
