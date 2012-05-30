--����NPC
--��ҽ
--��ͨ

--�ű���
x000129_g_scriptId = 000129

--��ӵ�е��¼�ID�б�
x000129_g_eventList={701603}				-- ���������ơ��ű�

--��ҽ�ű����
x000129_g_healScriptId = 000064

--�����趨 �μ��ű�000064

--**********************************
--�¼��б�
--**********************************
function x000129_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_BaTian}")
		AddNumText(sceneId,x000129_g_scriptId,"��ŭ����",6,0)
	EndEvent(sceneId)
	for i, eventId in x000129_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000129_OnDefaultEvent( sceneId, selfId,targetId )
	x000129_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000129_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- ���á�������ҽ���ű��м����Ǯ�ĺ���
	local	gld = CallScriptFunction( x000129_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1

	local	key	= GetNumText()

	if key == 1000 then	--��Ը������
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == 1001 then	--ȷ��Ҫ����
		-- ���á�������ҽ���ű��м����Ǯ�ĺ���
		gld = CallScriptFunction( x000129_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1

		-- �õ����Ӻͽ�Ǯ��Ŀ
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--�������Ƿ����㹻���ֽ�
		if (nMoneyJZ + nMoney >= gld) then
			--��Ǯ
			LuaFnCostMoneyWithPriority (sceneId, selfId, gld)
			-- ���á�������ҽ���ű�
			CallScriptFunction( x000129_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			RestoreStrikePoint( sceneId, selfId )			
			return
		
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  ��Ľ�Ǯ���㣡" )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	
	--��Ѫ
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
			 GetRage( sceneId, selfId ) == GetMaxRage( sceneId, selfId ) and
			 GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) and
			 IsStrikePointFull( sceneId, selfId ) == 1 then
			BeginEvent( sceneId )
				AddText( sceneId, "  �����ںܽ���������Ҫ���ƣ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--ȡ��ָ��������ϵ����ежԿ���ɢפ��Ч��
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			-- ���á�������ҽ���ű�
			CallScriptFunction( x000129_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			RestoreStrikePoint( sceneId, selfId )
			--x000129_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  ����Ի���#G#{_EXCHG"..gld.."}#W�����ָ���Ѫ��ŭ����ȷ��Ҫ������" )
				AddNumText( sceneId, x000129_g_scriptId, "��", -1, 1001 )
				AddNumText( sceneId, x000129_g_scriptId, "��", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x000129_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()��addnumtext�����ı���
				return
			end
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x000129_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000129_g_eventList do
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
function x000129_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000129_g_eventList do
		if missionScriptId == findId then
			x000129_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000129_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000129_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000129_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000129_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000129_OnDie( sceneId, selfId, killerId )
end

