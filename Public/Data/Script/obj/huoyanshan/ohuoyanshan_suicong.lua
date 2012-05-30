--火焰山NPC
--村民
--普通

x042512_g_ScriptId	= 042512

x042512_g_qunzhong =
{
	"#{HYS_20071224_22}",
	"#{HYS_20071224_23}",
	"#{HYS_20071224_24}",
}
--**********************************
--事件交互入口
--**********************************
function x042512_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local strText = x042512_g_qunzhong[random( getn(x042512_g_qunzhong) )]
		AddText( sceneId, strText )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
