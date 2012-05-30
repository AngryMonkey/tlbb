

function x300019_OnDefaultEvent( sceneId, selfId, BagIndex )	
	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "√√√√"
	else
		PlayerSex = "–÷µ‹"
	end
	BeginEvent(sceneId)
			AddText(sceneId,"#{obj_item_0001}"..PlayerName..PlayerSex.."#{obj_item_0002}");
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end


function x300019_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
