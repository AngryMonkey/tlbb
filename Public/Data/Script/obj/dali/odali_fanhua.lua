--大理NPC
--范骅
--普通

--**********************************
--事件交互入口
--**********************************
function x002015_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0005}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
