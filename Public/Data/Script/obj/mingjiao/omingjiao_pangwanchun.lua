--����

--�ű���
x011005_g_scriptId = 011005

--��ӵ�е��¼�ID�б�
x011005_g_eventList={}
--x011005_g_eventList={200912,201011,201612,201811}		

--**********************************
--�¼��б�
--**********************************
function x011005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"#{MJJZ_081103_03}");
		x011005_g_MenPai = GetMenPai(sceneId, selfId)
		if x011005_g_MenPai == 1 then
			AddNumText(sceneId, x011005_g_scriptId, "ѧϰ����",12,0)
		end
	for i, eventId in x011005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	AddNumText(sceneId, x011005_g_scriptId, "�����ķ��Ľ���",11,10)
	--AddNumText(sceneId, x011005_g_scriptId, "#{JZBZ_081031_02}",11,11)
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x011005_OnDefaultEvent( sceneId, selfId,targetId )
	x011005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x011005_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_xinfajieshao_001}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end


	if	GetNumText()==0	then
			DispatchXinfaLevelInfo( sceneId, selfId, targetId, 1 );
	else
		for i, findId in x011005_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
				return
			end
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x011005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011005_g_eventList do
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
function x011005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x011005_g_eventList do
		if missionScriptId == findId then
			x011005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x011005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x011005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x011005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x011005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x011005_OnDie( sceneId, selfId, killerId )
end
