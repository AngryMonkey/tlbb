--���ӹ���NPC....
--��ҩ��ʦ....

--�ű���
x001189_g_ScriptId = 001189

--��ӵ�е��¼�Id�б�
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--��ӵ�е��¼�ID�б�
x001189_g_eventList={713509,713568,713608}

x001189_g_shoptableindex = 73

x001189_g_MsgInfo = { "#{SHGZ_0612_11}",
											"#{SHGZ_0620_31}",
											"#{SHGZ_0620_32}",
											"#{SHGZ_0620_33}",
										}

--**********************************
--�¼��б�
--**********************************
function x001189_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001189_g_MsgInfo))
		AddText(sceneId, x001189_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001189_g_ScriptId, "���򹤾�", 6, 29 )
		for i, eventId in x001189_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x001189_OnDefaultEvent( sceneId, selfId,targetId )
	x001189_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001189_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 29 then
  	DispatchShopItem( sceneId, selfId, targetId, x001189_g_shoptableindex )
  	return 0
  end

	for i, findId in x001189_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001189_g_ScriptId )
		return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x001189_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001189_g_eventList do
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
function x001189_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x001189_g_eventList do
		if missionScriptId == findId then
			x001189_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x001189_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001189_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x001189_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001189_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
