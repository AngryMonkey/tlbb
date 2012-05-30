--火焰山NPC
--村民
--普通

x042511_g_ScriptId	= 042511

x042511_g_qunzhong =
{
	"#{HYS_20071224_04}",
	"#{HYS_20071224_05}",
	"#{HYS_20071224_06}",
	"#{HYS_20071224_07}",
	"#{HYS_20071224_08}",
	"#{HYS_20071224_09}",
	"#{HYS_20071224_10}",
}
--**********************************
--事件交互入口
--**********************************
function x042511_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local strText = x042511_g_qunzhong[random( getn(x042511_g_qunzhong) )]
		AddText( sceneId, strText )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
