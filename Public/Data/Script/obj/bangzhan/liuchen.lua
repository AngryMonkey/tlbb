--��ս����NPC B��
--��ҽ ���
--��ͨ

--�ű���
x402299_g_scriptId = 402299

--��ӵ�е��¼�ID�б�
x402299_g_eventList={701603}

--��ҽ�ű����
x402299_g_healScriptId = 000064

--�����趨 �μ��ű�000064

--**********************************
--�¼��б�
--**********************************
function x402299_UpdateEventList( sceneId, selfId, targetId )
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_23}")
			AddNumText(sceneId,x402299_g_scriptId,"����",6,0)
		EndEvent(sceneId)
		for i, eventId in x402299_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--�¼��������
--**********************************
function x402299_OnDefaultEvent( sceneId, selfId,targetId )
	x402299_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402299_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	gld =CallScriptFunction( x402299_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
	
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 0 then
		return
	end

	local	key	= GetNumText()

	if key == 1000 then	--��Ը������
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == 1001 then	--ȷ��Ҫ����
		gld =CallScriptFunction( x402299_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
		local money = GetMoney( sceneId, selfId )
		local JiaoZi = GetMoneyJZ( sceneId, selfId )
		gld = floor(gld)

		if money+JiaoZi < gld then
			BeginEvent( sceneId )
				AddText( sceneId, "#{BHXZ_081103_85}" )
				EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		else
			local jz, jb = LuaFnCostMoneyWithPriority(sceneId, selfId, gld);
			if jz ~= -1 then
				CallScriptFunction( x402299_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			end
		end
		return
	end
	
	--��Ѫ
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
		GetRage( sceneId, selfId ) == GetMaxRage( sceneId, selfId ) and
		GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_86}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--ȡ��ָ��������ϵ����ежԿ���ɢפ��Ч��
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			CallScriptFunction( x402299_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			--x402299_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_87}#{_EXCHG"..gld.."}#{BHXZ_081103_88}" )
			AddNumText( sceneId, x402299_g_scriptId, "��", -1, 1001 )
			AddNumText( sceneId, x402299_g_scriptId, "��", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x402299_g_eventList do
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
function x402299_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402299_g_eventList do
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
function x402299_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			x402299_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x402299_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x402299_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x402299_OnDie( sceneId, selfId, killerId )
end
