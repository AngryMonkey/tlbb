--����NPC
--�屪��
--һ��
--����ɱ������

--�ű���
x001063_g_ScriptId	= 1063

--��ӵ�е��¼�ID�б�
x001063_g_EventList	= { 808002 }

--**********************************
--�¼��������
--**********************************
function x001063_OnDefaultEvent( sceneId, selfId, targetId )

	x001063_UpdateEventList( sceneId, selfId, targetId )

end

--**********************************
--�¼��б�
--**********************************
function x001063_UpdateEventList( sceneId, selfId, targetId )

	local	i
	BeginEvent( sceneId )
		AddText( sceneId, "#{function_help_083}" );
		
		AddNumText( sceneId, x001063_g_ScriptId, "���������", 11, 10 )
		
		for i, eventId in x001063_g_EventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001063_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_065}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )

end

--**********************************
--�����¼�
--**********************************
function x001063_OnDie( sceneId, selfId, killerId )
end
