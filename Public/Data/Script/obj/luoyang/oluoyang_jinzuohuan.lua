--洛阳NPC
--金左焕
--普通

--**********************************
--事件交互入口
--**********************************
function x000028_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  谁说我们高丽国进贡的国礼丢了，胡说，根本没有的事情。"..PlayerName..PlayerSex.."，要是再听见有人胡言乱语就带他来见我，我倒要好好问问他哪只眼睛看见国礼丢了。")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
