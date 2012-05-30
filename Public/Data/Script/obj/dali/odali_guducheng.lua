--大理NPC
--古笃诚
--普通

--**********************************
--事件交互入口
--**********************************
function x002012_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."，多日不见了，皇上正在等你呢。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
