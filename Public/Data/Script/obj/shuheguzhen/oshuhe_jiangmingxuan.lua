--���ӹ���NPC....
--��ҩ��ʦ....

--�ű���
x001190_g_ScriptId = 001190

--��ӵ�е��¼�Id�б�
--estudy_zhiyao = 713503
--elevelup_zhiyao = 713562
--edialog_zhiyao = 713602
--��ӵ�е��¼�ID�б�
x001190_g_eventList={713503,713562,713602}

x001190_g_MsgInfo = { "#{SHGZ_0612_12}",
											"#{SHGZ_0620_34}",
											"#{SHGZ_0620_35}",
											"#{SHGZ_0620_36}",
										}

--**********************************
--�¼��б�
--**********************************
function x001190_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001190_g_MsgInfo))
		AddText(sceneId, x001190_g_MsgInfo[msgidx])
	for i, eventId in x001190_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001190_OnDefaultEvent( sceneId, selfId,targetId )
	x001190_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001190_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001190_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001190_g_ScriptId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001190_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001190_g_eventList do
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
function x001190_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001190_g_eventList do
		if missionScriptId == findId then
			x001190_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001190_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001190_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001190_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001190_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
