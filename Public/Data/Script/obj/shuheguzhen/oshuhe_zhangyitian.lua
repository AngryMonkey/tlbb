--���ӹ���NPC....
--��ֲ��ʦ....

--�ű���
x001201_g_ScriptId = 001201

--��ӵ�е��¼�Id�б�
--estudy_zhongzhi = 713511
--elevelup_zhongzhi = 713570
--edialog_zhongzhi = 713610
x001201_g_eventList={713511,713570,713610}

x001201_g_MsgInfo = { "#{SHGZ_0612_18}",
											"#{SHGZ_0620_52}",
											"#{SHGZ_0620_53}",
											"#{SHGZ_0620_54}",
										}

--**********************************
--�¼��б�
--**********************************
function x001201_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001201_g_MsgInfo))
		AddText(sceneId, x001201_g_MsgInfo[msgidx])
	for i, eventId in x001201_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001201_OnDefaultEvent( sceneId, selfId,targetId )
	x001201_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001201_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001201_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001201_g_ScriptId )
		return
	end
end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001201_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001201_g_eventList do
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
function x001201_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001201_g_eventList do
		if missionScriptId == findId then
			x001201_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001201_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001201_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001201_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001201_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
