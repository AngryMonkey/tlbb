--����

--�ű���
x300002_g_scriptId = 300002
--**********************************
--ˢ���¼�
--**********************************
function x300002_OnDefaultEvent( sceneId, selfId, BagIndex )
		if	sceneId == 30 then
			if DelItem( sceneId,selfId,40002077,1) == 1  then
				LuaFnCreateMonster(sceneId,529,181,258,1,0,-1)
			end
		else
			BeginEvent(sceneId)
				strText = "�������޷�ʹ��"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
end

function x300002_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
