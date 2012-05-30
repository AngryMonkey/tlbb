--洛阳NPC
--李妈妈
--普通

--**********************************
--事件交互入口
--**********************************
function x000044_OnDefaultEvent( sceneId, selfId,targetId )
local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  哎吆吆，这不是"..PlayerName..PlayerSex.."#{OBJ_luoyang_0015}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
