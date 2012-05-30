--洛阳NPC
--柳复生
--普通

--**********************************
--事件交互入口
--**********************************
function x000097_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  放心，"..PlayerName..PlayerSex.."，我一定会尽力参加比赛的。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
