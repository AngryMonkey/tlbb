--洛阳NPC
--吴素玲
--普通

--**********************************
--事件交互入口
--**********************************
function x000173_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId," #G "..PlayerName..PlayerSex.."，看你不开心哪，怎么缺钱花？找我老公哈德门吧，人家都说他是财神爷转世o(∩_∩)o")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
