--�κ�NPC
--����ˮ

x041502_g_ScriptId	= 041502

--**********************************
--�¼��������
--**********************************
function x041502_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_010}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

