--老兵

--脚本号
x020006_g_scriptId = 020006

--**********************************
--事件列表
--**********************************
function x020006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.."#{OBJ_caoyuan_0007}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
