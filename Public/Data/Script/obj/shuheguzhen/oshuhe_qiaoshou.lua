--���ӹ���NPC....
--���Ҵ�ʦ....

--�ű���
x001199_g_ScriptId = 001199

--��ӵ�е��¼�Id�б�
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--��ӵ�е��¼�ID�б�
x001199_g_eventList={713506,713565,713605}

x001199_g_shoptableindex = 62

x001199_g_MsgInfo = { "#{SHGZ_0612_16}",
											"#{SHGZ_0620_46}",
											"#{SHGZ_0620_47}",
											"#{SHGZ_0620_48}",
										}

--**********************************
--�¼��б�
--**********************************
function x001199_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001199_g_MsgInfo))
		AddText(sceneId, x001199_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001199_g_ScriptId, "�������ͼ", 7, 31 )          
		AddNumText( sceneId, x001199_g_ScriptId, "#{INTERFACE_XML_1195}", 7, 32 )
		for i, eventId in x001199_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001199_OnDefaultEvent( sceneId, selfId,targetId )
	x001199_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001199_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 31 then
  	DispatchShopItem( sceneId, selfId, targetId, x001199_g_shoptableindex )
  elseif arg == 32 then
  	DispatchShopItem( sceneId, selfId, targetId, 203 )
  	return 0
  end

	for i, findId in x001199_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001199_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001199_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001199_g_eventList do
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
function x001199_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001199_g_eventList do
		if missionScriptId == findId then
			x001199_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001199_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001199_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001199_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001199_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
