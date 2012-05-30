--塔里木NPC
--百姓
--普通

x044508_g_ScriptId	= 044508

x044508_g_qunzhong =
{
	"  #{TLM_20080118_02}",
	"  #{TLM_20080118_03}",
	"  #{TLM_20080118_04}",
	"  #{TLM_20080118_05}",
	"  #{TLM_20080118_06}",
}
--**********************************
--事件交互入口
--**********************************
function x044508_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local strText = x044508_g_qunzhong[random( getn(x044508_g_qunzhong) )]
		AddText( sceneId, strText )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
