--哨子

--脚本号
x300001_g_scriptId = 300001

--**********************************
--刷新事件
--**********************************
function x300001_OnDefaultEvent( sceneId, selfId, BagIndex )
	if ( GetHumanWorldX(sceneId,selfId) >= 225 ) and ( GetHumanWorldX(sceneId,selfId) <= 243 ) then		--X坐标满足要求
		if (GetHumanWorldZ(sceneId,selfId) >= 12) and (GetHumanWorldZ(sceneId,selfId) <= 28 ) then		--Z坐标满足要求
			if LuaFnGetCopySceneData_Param(sceneId, 2) == 0 then			--场景变量为0,场景变量在服务器启动时为0,之后由脚本控制
				npcobjid = LuaFnCreateMonster( sceneId, 28, 234,18, 3,2, 019000 ) ;
				LuaFnSetCopySceneData_Param(sceneId, 2, npcobjid);
				--设置定时器,用来控制20秒后鲁平消失
				timeIndex = SetTimer( sceneId,selfId,300001,"OnTimeUp",20000)
			else
				BeginEvent(sceneId)
				AddText(sceneId,"鲁平就在附近")
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		else
			BeginEvent(sceneId)
			AddText(sceneId,"需要在猎人小屋附近使用")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		BeginEvent(sceneId)
		AddText(sceneId,"需要在猎人小屋附近使用")
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

