--ʯ�� ֣��

--�ű���
x026000_g_scriptId = 026000

--��ӵ�е��¼�ID�б�
x026000_g_eventList={212103, 212104}

--**********************************
--�¼��б�
--**********************************
function x026000_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
		AddText(sceneId, "  $N����֪���㣬��������ڴ����Ѿ������ˣ��ǳ���������ʯ�����￴���㡣���ǣ�����ʯ���Ǹ��ǳ�Σ�յĵط����㷲�¶�ҪС�ġ�")
		--AddNumText(sceneId, x026000_g_scriptId,"����ȥ�κ�", 9, 6)
		for i, eventId in x026000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		if	IsHaveMission(sceneId,selfId,602) > 0	then
			AddNumText(sceneId, x026000_g_scriptId,"����֮�صĹ���", 6, 1)
			x026000_nDescIndex = 1
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x026000_OnDefaultEvent( sceneId, selfId,targetId )
	x026000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x026000_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	arg	= GetNumText()
	if arg == 6 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 415, 45,34 )
		return
	end
	if eventId == x026000_g_scriptId  then
		BeginEvent(sceneId)
			if x026000_nDescIndex == 1 then
				AddText(sceneId, "#{Lua_Shilin_002}")
				AddNumText(sceneId, x026000_g_scriptId,"ʲô���ֲ������ߣ��Ǻ����أ�", 8, 1)
			elseif x026000_nDescIndex == 2 then
				AddText(sceneId, "#{Lua_Shilin_003}")
				AddNumText(sceneId, x026000_g_scriptId,"��������ʦ����Բ�´壬����", 8, 1)
			elseif x026000_nDescIndex == 3 then
				AddText(sceneId, "#{Lua_Shilin_004}")
			end
			x026000_nDescIndex = x026000_nDescIndex +1
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		if x026000_nDescIndex == 4 then
			-- ��������������������
			local misIndex=GetMissionIndexByID(sceneId,selfId,602)
			local num0 = GetMissionParam(sceneId,selfId,misIndex,0)
			
			if num0 < 1 then				--���������������ɵ�����
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--���������һλ����1
				BeginEvent(sceneId)										--��ʾ��ʾ��Ϣ
					AddText(sceneId, "�Ѿ�����֣���Ĺ��£�1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
	end
		
	if	IsHaveMission(sceneId,selfId,602) <= 0	then
		CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	
	for i, findId in x026000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x026000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
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
function x026000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			x026000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x026000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x026000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x026000_OnDie( sceneId, selfId, killerId )
end
