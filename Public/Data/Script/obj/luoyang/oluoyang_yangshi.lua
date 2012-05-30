--洛阳NPC
--杨时
--普通

--**********************************
--事件交互入口
--**********************************
function x000040_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."，你也是来拜见老师的吗？我和师兄专程来看望他老人家，不等到老师我们就一直不走。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
