--����

--�ű���
x300001_g_scriptId = 300001

--**********************************
--ˢ���¼�
--**********************************
function x300001_OnDefaultEvent( sceneId, selfId, BagIndex )
	if ( GetHumanWorldX(sceneId,selfId) >= 225 ) and ( GetHumanWorldX(sceneId,selfId) <= 243 ) then		--X��������Ҫ��
		if (GetHumanWorldZ(sceneId,selfId) >= 12) and (GetHumanWorldZ(sceneId,selfId) <= 28 ) then		--Z��������Ҫ��
			if LuaFnGetCopySceneData_Param(sceneId, 2) == 0 then			--��������Ϊ0,���������ڷ���������ʱΪ0,֮���ɽű�����
				npcobjid = LuaFnCreateMonster( sceneId, 28, 234,18, 3,2, 019000 ) ;
				LuaFnSetCopySceneData_Param(sceneId, 2, npcobjid);
				--���ö�ʱ��,��������20���³ƽ��ʧ
				timeIndex = SetTimer( sceneId,selfId,300001,"OnTimeUp",20000)
			else
				BeginEvent(sceneId)
				AddText(sceneId,"³ƽ���ڸ���")
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		else
			BeginEvent(sceneId)
			AddText(sceneId,"��Ҫ������С�ݸ���ʹ��")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		BeginEvent(sceneId)
		AddText(sceneId,"��Ҫ������С�ݸ���ʹ��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

function x300001_OnTimeUp( sceneId, selfId, timeIndex )
	npcobjid = LuaFnGetCopySceneData_Param(sceneId, 2)
	if npcobjid ~= 0 then
		LuaFnDeleteMonster( sceneId, npcobjid )
		LuaFnSetCopySceneData_Param(sceneId, 2, 0)
		StopTimer( sceneId,timeIndex)
	end
end


function x300001_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

