--����NPC
--�·�֮
--��ͨ

--�ű���
x000112_g_scriptId = 000112

--Ŀ��NPC
x000112_g_name	="�·�֮"

--��ӵ�е��¼�ID�б� {��ݣ�������,ǿ�ƽ�����}
x000112_g_RelationEventList={806001,806002,806000}

--**********************************
--�¼��������
--**********************************
function x000112_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  ��ͱ��˽�����ҿ��Ը�����д�����ס�")
		
		AddNumText( sceneId, x000112_g_scriptId, "��ݽ���", 11, 10 )
		
		for i, eventId in x000112_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000112_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_067}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	local i
	local findId
	for i, findId in x000112_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
--		x000112_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000112_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	for i, findId in x000112_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000112_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000112_g_RelationEventList do
		if missionScriptId == findId then
			x000112_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
