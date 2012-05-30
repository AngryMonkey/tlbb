--洛阳NPC
--镖头
--普通

--**********************************
--事件交互入口
--**********************************
function x000072_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  本镖局诚信第一，义薄云天，得黑白两道朋友赏脸，才能保证连续十年不丢镖。"..PlayerName..PlayerSex.."，有什么需要的您尽管开口，上刀山，下火海，我盖千鸣眼都不眨一下。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
