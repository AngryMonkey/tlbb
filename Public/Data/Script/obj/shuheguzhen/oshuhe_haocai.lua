--���ӹ���NPC....
--��⿴�ʦ....

--�ű���
x001188_g_ScriptId = 001188

--��ӵ�е��¼�Id�б�
--elevelup_pengren = 713561
--edialog_pengren = 713601
--��ӵ�е��¼�ID�б�
x001188_g_eventList={713561,713601}

x001188_g_MsgInfo = { "#{SHGZ_0612_10}",
											"#{SHGZ_0620_28}",
											"#{SHGZ_0620_29}",
											"#{SHGZ_0620_30}",
										}

--**********************************
--�¼��б�
--**********************************
function x001188_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local msgidx = random(getn(x001188_g_MsgInfo))
	AddText(sceneId, x001188_g_MsgInfo[msgidx])
	for i, eventId in x001188_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001188_OnDefaultEvent( sceneId, selfId,targetId )
	x001188_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001188_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001188_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001188_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001188_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,ABILITY_PENGREN )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x001188_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			x001188_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001188_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001188_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
