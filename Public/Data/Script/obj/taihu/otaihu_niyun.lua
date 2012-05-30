--̫�� ����



--�ű���

x004009_g_scriptId = 003009



--��ӵ�е��¼�ID�б�

x004009_g_eventList={}	--210401



--**********************************

--�¼��б�

--**********************************

function x004009_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)

	local  PlayerName=GetName(sceneId,selfId)

	

	local IsDone471 = IsMissionHaveDone(sceneId,selfId,471)	

		

		AddText(sceneId, "#{OBJ_taihu_0003}")		    				

	

	

	

	for i, eventId in x004009_g_eventList do

		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )

	end

	EndEvent(sceneId)

	DispatchEventList(sceneId,selfId,targetId)

end



--**********************************

--�¼��������

--**********************************

function x004009_OnDefaultEvent( sceneId, selfId,targetId )

	x004009_UpdateEventList( sceneId, selfId, targetId )

end



--**********************************

--�¼��б�ѡ��һ��

--**********************************

function x004009_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x004009_g_eventList do

		if eventId == findId then

			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )

			return

		end

	end

end



--**********************************

--���ܴ�NPC������

--**********************************

function x004009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x004009_g_eventList do

		if missionScriptId == findId then

			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )

			if ret > 0 then

				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )

			end

			return

		end

	end

end



--**********************************

--�ܾ���NPC������

--**********************************

function x004009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--�ܾ�֮��Ҫ����NPC���¼��б�

	for i, findId in x004009_g_eventList do

		if missionScriptId == findId then

			x004009_UpdateEventList( sceneId, selfId, targetId )

			return

		end

	end

end



--**********************************

--�������Ѿ���������

--**********************************

function x004009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x004009_g_eventList do

		if missionScriptId == findId then

			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )

			return

		end

	end

end



--**********************************

--�ύ�����������

--**********************************

function x004009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x004009_g_eventList do

		if missionScriptId == findId then

			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )

			return

		end

	end

end



--**********************************

--�����¼�

--**********************************

function x004009_OnDie( sceneId, selfId, killerId )

end

