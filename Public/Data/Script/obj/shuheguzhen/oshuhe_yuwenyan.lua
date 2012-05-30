--���ӹ���NPC....
--�ɿ��ܴ�ʦ....

--�ű���
x001180_g_ScriptId = 001180

--��ӵ�е��¼�Id�б�
--estudy_caikuang = 713508
--elevelup_caikuang = 713567
--edialog_caikuang = 713607
--��ӵ�е��¼�ID�б�
x001180_g_eventList={713508,713567,713607}

x001180_g_shoptableindex = 73

x001180_g_MsgInfo = { "#{SHGZ_0612_05}",
											"#{SHGZ_0620_13}",
											"#{SHGZ_0620_14}",
											"#{SHGZ_0620_15}",
										}

--**********************************
--�¼��б�
--**********************************
function x001180_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001180_g_MsgInfo))
		AddText(sceneId, x001180_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001180_g_ScriptId, "���򹤾�", 6, 26 )
		for i, eventId in x001180_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001180_OnDefaultEvent( sceneId, selfId,targetId )
	x001180_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001180_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 26 then
  	DispatchShopItem( sceneId, selfId, targetId, x001180_g_shoptableindex )
  	return 0
  end

	for i, findId in x001180_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001180_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001180_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001180_g_eventList do
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
function x001180_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001180_g_eventList do
		if missionScriptId == findId then
			x001180_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001180_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001180_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001180_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001180_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
