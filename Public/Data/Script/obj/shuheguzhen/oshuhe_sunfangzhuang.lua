--���ӹ���NPC....
--�����ʦ....

--�ű���
x001198_g_ScriptId = 001198


--��ӵ�е��¼�Id�б�
--estudy_diaoyu = 713510
--elevelup_diaoyu = 713569
--edialog_diaoyu = 713609
--��ӵ�е��¼�ID�б�
x001198_g_eventList={713510,713569,713609}

x001198_g_shoptableindex = 73

x001198_g_MsgInfo = { "#{SHGZ_0612_15}",
											"#{SHGZ_0620_43}",
											"#{SHGZ_0620_44}",
											"#{SHGZ_0620_45}",
										}

--**********************************
--�¼��б�
--**********************************
function x001198_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001198_g_MsgInfo))
		AddText(sceneId, x001198_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001198_g_ScriptId, "���򹤾�", 7, 30 )
		for i, eventId in x001198_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001198_OnDefaultEvent( sceneId, selfId,targetId )
	x001198_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001198_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 30 then
  	DispatchShopItem( sceneId, selfId, targetId, x001198_g_shoptableindex )
  	return 0
  end

	for i, findId in x001198_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001198_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001198_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001198_g_eventList do
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
function x001198_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001198_g_eventList do
		if missionScriptId == findId then
			x001198_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001198_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001198_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001198_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001198_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
