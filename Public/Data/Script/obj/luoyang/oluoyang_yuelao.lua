--����NPC
--����
--��ͨ

--�ű���
x000093_g_scriptId = 000093

--Ŀ��NPC
x000093_g_name	="����"

x000093_StartTime   = 9040
x000093_EndTime     = 9047

--��ӵ�е��¼�ID�б� {���, ѧϰ���޼���, ���, ǿ�����, ��������,�����ʴ�}
x000093_g_RelationEventList={806003, 806016, 806005, 806004, 806017,888901, 808010} --������� 808010 zchw

--**********************************
--�¼��������
--**********************************
function x000093_OnDefaultEvent( sceneId, selfId, targetId )
	x000093_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�
--**********************************
function x000093_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		local i
		local eventId
		AddText( sceneId, "#{OBJ_luoyang_0025}" )
		
		AddNumText( sceneId, x000093_g_scriptId, "������", 11, 10 )
		AddNumText( sceneId, x000093_g_scriptId, "����������Ϭ", 11, 11 )
		
		local curDayTime = GetDayTime()
		if (curDayTime>=x000093_StartTime and curDayTime<x000093_EndTime) then
			AddNumText(sceneId,x000093_g_scriptId,"���ڰ���֮�ǻ",11,12)
		end
		
		for i, eventId in x000093_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000093_OnEventRequest( sceneId, selfId, targetId, eventId )

	if x000093_g_scriptId == eventId and GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_066}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if x000093_g_scriptId == eventId and GetNumText() == 11 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_102}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	if x000093_g_scriptId == eventId and GetNumText() == 12 then
		
		BeginEvent(sceneId)	
					
				AddText( sceneId, "#{QRJ_81009_01}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end


	local i
	local findId
	for i, findId in x000093_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
--		x000093_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000093_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	for i, findId in x000093_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000093_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000093_g_RelationEventList do
		if missionScriptId == findId then
			x000093_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
