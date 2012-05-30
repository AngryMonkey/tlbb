--����NPC		���״�ͼ
--��d
--�ű���

x001058_g_ScriptId = 001058


--��ӵ�е��¼�ID�б�
x001058_g_eventList={229020}

--**********************************

--�¼��б�

--**********************************

function x001058_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  ��ͽ�Ĵ����ң����ܲ��ܰ��ҳ������ǣ������ͽҲ���ܵõ��ر�ͼŶ��")
	
	AddNumText( sceneId, x001058_g_ScriptId, "�����������", 11, 10 )
	
	for i, eventId in x001058_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--�¼��������

--**********************************

function x001058_OnDefaultEvent( sceneId, selfId,targetId )

	x001058_UpdateEventList( sceneId, selfId, targetId )

end



--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001058_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_072}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end


	for i, findId in x001058_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001058_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001058_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x001058_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001058_g_eventList do
		if missionScriptId == findId then
			x001058_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001058_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001058_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x001058_OnDie( sceneId, selfId, killerId )
end
