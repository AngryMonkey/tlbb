--�κ�NPC
--������

x041501_g_ScriptId	= 041501

--**********************************
--�¼��������
--**********************************
function x041501_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{YANHU_20070924_009}" )
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

