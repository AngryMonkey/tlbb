--火焰山NPC
--宋兵随从
--普通

x042510_g_ScriptId	= 042510

x042510_g_qunzhong =
{
	"#{HYS_20071224_19}",
	"#{HYS_20071224_20}",
}
--**********************************
--事件交互入口
--**********************************
function x042510_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local strText = x042510_g_qunzhong[random( getn(x042510_g_qunzhong) )]
		AddText( sceneId, strText )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
