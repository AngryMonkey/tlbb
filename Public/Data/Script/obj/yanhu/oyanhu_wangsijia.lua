--�κ�NPC
--��˼��

x041503_g_ScriptId	= 041503

--**********************************
--�¼��������
--**********************************
function x041503_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_003}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

