--�κ�NPC
--������

x041505_g_ScriptId	= 041505

--**********************************
--�¼��������
--**********************************
function x041505_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_004}" )
		EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

