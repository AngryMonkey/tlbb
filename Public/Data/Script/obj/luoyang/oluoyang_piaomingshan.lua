--洛阳NPC
--朴明善
--普通

--**********************************
--事件交互入口
--**********************************
function x000046_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  洛阳的牡丹真是名不虚传啊，和我们高丽的山茶花有的一比。听说宋王朝的苏州城也漂亮的很，"..PlayerName..PlayerSex.."，可曾去过？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
