--�κ�NPC
--����
--��ͨ

x041500_g_ScriptId	= 041500

x041500_g_qunzhong =
{
	"#{YANHU_20070924_006}",
	"#{YANHU_20070924_007}",
	"#{YANHU_20070924_008}",	
}
--**********************************
--�¼��������
--**********************************
function x041500_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local strText = x041500_g_qunzhong[random( getn(x041500_g_qunzhong) )]
		AddText( sceneId, strText )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
