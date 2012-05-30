--����NPC
--����ʹ
--����ѭ������

--�ű���
x311006_g_scriptId = 311006

--��ӵ�е��¼�ID�б�
x311006_g_eventList={311010}

--�������������
x311006_g_MissionId			= 1000
--�������������¼��б�
x311006_g_GodFireEventList={}   -- 808080
--ÿ��������ܻ����ʱ��
x311006_g_ActivityTime		= { {tstart=1230, tend=1330},
														  {tstart=1930, tend=2030},
														  {tstart=2130, tend=2230} }

--��������������ɱ��
x311006_g_Mission_IsComplete = 0	--��������ĵ�0λ
--�������������򿨱��
x311006_g_LuoYang_RecordIdx = 1		--��������ĵ�1λ
--�����������ݴ򿨱��
x311006_g_SuZhou_RecordIdx = 2		--��������ĵ�2λ
--�������ܴ���򿨱��
x311006_g_DaLi_RecordIdx = 3			--��������ĵ�3λ
--����������������
x311006_g_KongMing_Lighten = 4		--��������ĵ�4λ
--�������ܴ�������ÿ���������
x311006_g_RoundIndex = 7					--��������ĵ�7λ

--��Ҫ��ȼ�����Ƶ�����
x311006_g_KongMing_CntMax	 = 24

--**********************************
--�¼��б�
--**********************************
function x311006_UpdateEventList( sceneId, selfId, targetId )

	for i, eventId in x311006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
	end

end

--**********************************
--�¼��������
--**********************************
function x311006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		-- ��ȼ������Դ
		if x311006_OnIsFillPlayCard(sceneId, selfId, targetId) == 1 then

			local misIndex = GetMissionIndexByID(sceneId,selfId,x311006_g_MissionId)
			SetMissionByIndex(sceneId, selfId, misIndex, x311006_g_LuoYang_RecordIdx, 1)
			x311006_NotifyTip( sceneId, selfId, "#{GodFire_Info_002}" )
			
			-- ��������Ƿ����
			if GetMissionParam(sceneId, selfId, misIndex, x311006_g_LuoYang_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311006_g_SuZhou_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311006_g_DaLi_RecordIdx) == 1 then
				
				-- ����Ƿ��ȼ���п�����
				if GetMissionParam(sceneId, selfId, misIndex, x311006_g_KongMing_Lighten) >= x311006_g_KongMing_CntMax then								
					-- �������
					AddText( sceneId, "#{GodFire_Info_028}" )
					SetMissionByIndex( sceneId, selfId, misIndex, x311006_g_Mission_IsComplete, 1 )
				else
					AddText( sceneId, "#{GodFire_Info_037}" )
				end
			else
				-- ��ȼ��Դ
				AddText( sceneId, "#{GodFire_Info_010}" )
			end
			
		else
			AddText( sceneId, "#{function_caoyun_0}" )
			AddNumText( sceneId, x311006_g_scriptId, "�˽�����", 11, 1 )
			AddNumText( sceneId, x311006_g_scriptId, "��ʼ����", 7, 2 )
		
			for i, eventId in x311006_g_GodFireEventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x311006_OnEventRequest( sceneId, selfId, targetId, eventId )
	local NumText = GetNumText();
	if NumText == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_051}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif NumText == 2 then
		x311006_UpdateEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x311006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnHandle_QuestUI",sceneId, selfId, targetId, NumText )
			return
		end
	end
	
	for i, findId in x311006_g_GodFireEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			
			return 0
		end
	end
	
end

--**********************************
--���ܴ�NPC������
--**********************************
function x311006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311006_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x311006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮�󣬹رնԻ�����
	return
end

--**********************************
--�������Ѿ���������
--**********************************
function x311006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311006_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x311006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311006_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x311006_OnDie( sceneId, selfId, killerId )
end


-- ���������ܴ��ݻ�Ƿ����������
function x311006_OnIsFillPlayCard(sceneId, selfId, targetId)

  --��������Ƿ��й�����������
	if IsHaveMission( sceneId, selfId, x311006_g_MissionId ) <= 0 then				
		return 0
	end

	--�����Ҳμӻ��ʱ��
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x311006_g_MissionId)
	
	--��⵱��μӵ��ǵڼ���
	local nRoundIdx = GetMissionParam(sceneId, selfId, misIndex, x311006_g_RoundIndex)

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	if curHourTime < x311006_g_ActivityTime[nRoundIdx].tstart or curHourTime > x311006_g_ActivityTime[nRoundIdx].tend then
		return 0
	end
	
	--����Ƿ������������
	if GetMissionParam(sceneId, selfId, misIndex, x311006_g_LuoYang_RecordIdx) == 1 then
		return 0
	end
	
	return 0
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x311006_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
