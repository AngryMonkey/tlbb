--��ɽNPC
--����
--��ͨ

x017002_g_scriptId = 017002

x017002_g_eventList = { 228902 }

--**********************************
--�¼��������
--**********************************
function x017002_OnDefaultEvent( sceneId, selfId, targetId )
	x017002_g_MenPai = GetMenPai( sceneId, selfId )
	if x017002_g_MenPai == 7 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{TSJZ_081103_04}" )

			for i, eventId in x017002_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end

			AddNumText( sceneId, x017002_g_scriptId, "ѧϰ����", 12, 0 )
			AddNumText( sceneId, x017002_g_scriptId, "�����ķ��Ľ���", 11, 10 )
			--AddNumText(sceneId, x017002_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else
		BeginEvent( sceneId )
			AddText( sceneId, "  ��ʵ������ɽ�ɵ����ǵĶ�ʦ�㣬÷�������Ǵ�ʦ�㡣�ٺ١�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x017002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x017002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if GetNumText() == 10 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_xinfajieshao_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 7 )
end

--**********************************
--���ܴ�NPC������
--**********************************
function x017002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017002_g_eventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
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
function x017002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x017002_g_eventList do
		if missionScriptId == findId then
			x017002_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x017002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x017002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x017002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x017002_OnDie( sceneId, selfId, killerId )
end
