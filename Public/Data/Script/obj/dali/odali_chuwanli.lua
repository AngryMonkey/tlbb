--大理NPC
--褚万里
--普通

--**********************************
--事件交互入口
--**********************************
function x002011_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  想练就一身好的武功，和我们一样成为皇家护卫吗？"..PlayerName..PlayerSex.."，你可以拜入九大门派，玉华坛就有九大门派的指引人，你去各大门派去看看，没准会有意外的收获呢。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
