x044603_g_ScriptId = 044603


--**********************************
--�¼��������
--**********************************
function x044603_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msg = "#{DG_8724_17}"
		AddText(sceneId,msg);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
