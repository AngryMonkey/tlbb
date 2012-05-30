--苏州NPC
--张耒
--一般

--**********************************
--事件交互入口
--**********************************
function x001004_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	  local  PlayerName=GetName(sceneId,selfId)
		local  PlayerSex=GetSex(sceneId,selfId)
		if PlayerSex == 0 then
			PlayerSex = "姑娘"
		else
			PlayerSex = "少侠"
		end
		AddText(sceneId,"  "..PlayerName..PlayerSex.."，你也来参加考试？等考试结束我要去拜见老师，"..PlayerSex.."不如一起前往？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
