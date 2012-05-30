--���¹�

--�ű���
x000126_g_scriptId 				= 000126
x000126_g_shoptableindex 	= 34

--��ӵ�е��¼�ID�б�
x000126_g_eventList={}

--**********************************
--�¼��������
--**********************************
function x000126_OnDefaultEvent( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
		AddText( sceneId, "#{QZG_80919_1}" )
		AddNumText( sceneId, x000126_g_scriptId, "���˽���", 11, 1 )
		AddNumText( sceneId, x000126_g_scriptId, "���̵�", 7, 2 )

		for i, eventId in x000126_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000126_OnEventRequest( sceneId, selfId, targetId, eventId )
	--�ز��̵�
	if GetNumText() == 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SHANGREN_JIESHAO_02}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		if(LuaFnGetAvailableItemCount(sceneId, selfId, 40002000) == 1 ) then
			DispatchShopItem( sceneId, selfId,targetId, x000126_g_shoptableindex )
		else
			BeginEvent(sceneId)
				AddText( sceneId, "���²���������Ʊ�����ҽ��״Ӻ�̸��" )		
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
	
	for i, findId in x000126_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000126_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x000126_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			x000126_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000126_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000126_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000126_OnDie( sceneId, selfId, killerId )
end
