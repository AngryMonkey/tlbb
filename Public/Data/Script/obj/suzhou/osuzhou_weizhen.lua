--苏州NPC
--魏真
--一般

--**********************************
--事件交互入口
--**********************************
function x001035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	  local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "姑娘"
		else
			PlayerSex = "少侠"
		end
		AddText(sceneId,"    "..PlayerName..PlayerSex.."，梅花桩上比试才见功夫。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
