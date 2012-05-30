--洛阳NPC
--业了
--普通

--**********************************
--事件交互入口
--**********************************
function x000096_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."，雁门关在打仗吗？怎么那么多难民呀？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
