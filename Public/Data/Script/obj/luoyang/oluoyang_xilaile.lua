--����NPC
--ϲ����
--��ͨ

--�ű���
x000127_g_scriptId = 000127

--Ŀ��NPC
x000127_g_name	="ϲ����"

--��ӵ�е��¼�ID�б� {����Ѳ��, �����, �μӻ���}
x000127_g_RelationEventList={250036, 250037, 250038, 808122} --  808122���»��� zchw 

--**********************************
--�¼��������
--**********************************
function x000127_OnDefaultEvent( sceneId, selfId, targetId )
	x000127_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�
--**********************************
function x000127_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		local i
		local eventId
		AddText( sceneId, "#{OBJ_luoyang_0127}" )
		for i, eventId in x000127_g_RelationEventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
		AddNumText(sceneId, x000127_g_scriptId, "#{YHJZ_081007_2}", 11, 1111);
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000127_OnEventRequest( sceneId, selfId, targetId, eventId )
	local i
	local findId
	if GetNumText() == 1111 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{YHJZ_081007_48}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
		return
	end
	for i, findId in x000127_g_RelationEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000127_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	for i, findId in x000127_g_RelationEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000127_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i
	local findId
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000127_g_RelationEventList do
		if missionScriptId == findId then
			x000127_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
