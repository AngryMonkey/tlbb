--苏州NPC
--郑天寿
--一般

--**********************************
--事件交互入口
--**********************************
function x001048_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	  local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "姑娘"
		else
			PlayerSex = "少侠"
		end
		AddText(sceneId,"  "..PlayerName..PlayerSex.."，是否是想切磋武艺？那就擂台上请吧！")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
