--�κ�NPC
--֣��

x041506_g_ScriptId	= 041506

--**********************************
--�¼��������
--**********************************
function x041506_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_005}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

