--洛阳NPC
--巴天石
--普通

--**********************************
--事件交互入口
--**********************************
function x000019_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  真巧"..PlayerName..PlayerSex.."，竟然又在这里见面了。大理每次参加蹴鞠大赛，都是陪太子读书而已。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
