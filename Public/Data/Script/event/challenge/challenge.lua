-- challenge.lua
-- ��ս��ؽű�

x806010_g_ScriptId = 806010

-- �жϸ�����Ƿ�����ս����
function x806010_HaveChallengeFlag( sceneId, selfId )
	return (GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT ) > 0)
end

-- �� selfId (������) ��ս targetId (������)
function x806010_ProcChallenge( sceneId, selfId, targetId )
	local ChallengeScript = GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT )

	if ChallengeScript ~= GetMissionData( sceneId, targetId, MD_TIAOZHAN_SCRIPT ) then
		return
	end

	-- ���þ������ս�ű���ÿ����̨Ӧ�ð�һ���ű�
	CallScriptFunction(ChallengeScript, "DoChallenge", sceneId, selfId, targetId )
end
