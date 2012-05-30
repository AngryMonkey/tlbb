--洛阳NPC
--花仙
--普通

--**********************************
--事件交互入口
--**********************************
function x000094_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
 	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  杨柳青青江水平，闻郎江上唱歌声。东边日出西边雨，道是无晴却有晴。"..PlayerName..PlayerSex.."，可喜欢只羡鸳鸯不羡仙的日子？")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
