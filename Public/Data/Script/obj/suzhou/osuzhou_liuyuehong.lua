--����NPC
--���º�
--һ��
x001025_g_ScriptId = 1025

x001025_g_ControlScript = 808071


--**********************************
--�¼��������
--**********************************
function x001025_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"  �����ڿ�ʼ����ֻ������һ����Ҫ���ң�����ƭ�ң���Ӧ�ҵ�ÿһ�����鶼Ҫ������")
		CallScriptFunction( x001025_g_ControlScript, "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


function x001025_OnEventRequest( sceneId, selfId, targetId, eventId )
  
	if eventId == x001025_g_ControlScript then
		CallScriptFunction( x001025_g_ControlScript, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end

end
