-- ����NPC
-- ����
-- ��ͨ

x000142_g_ScriptId = 000142

x000142_g_eventList = { 800116 }

--**********************************
-- �¼��������
--**********************************
function x000142_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{OBJ_luoyang_0128}" )

		--for i, eventId in x000142_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		--end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000142_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x000142_g_eventList do

		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end

	end

end
