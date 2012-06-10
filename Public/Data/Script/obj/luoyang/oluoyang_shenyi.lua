--����NPC
--��ҽ
--��ͨ

--�ű���
x000064_g_scriptId = 000064

--��ӵ�е��¼�ID�б�
x000064_g_eventList={701603}	

-- ��Ҫ��ŭ��������NPC
x000064_g_SpecialNPC = "������"
x000064_g_SpecialNPC2 = "��ݱ"
x000064_g_SpecialNPC3 = "���"

--������û������޵й��ܵ�����NPC
x000064_g_SpecialNPC_City = "¬����"

--�����趨
--����ҵĵȼ���10�����µ�ʱ�����Ʋ��շѣ�
--���ڵ���10��������ȡ�ķ���Ϊ��
--���Ʒ��ã�������������ֵ����ǰ����ֵ����a+����������ֵ����ǰ��ֵ����b
--a��b�ڲ�ͬ�ȼ��µ�ϵ���涨���£��ȼ���aϵ����bϵ��
x000064_g_rat	=	{
	{"0~9",0,0},	{"10~19",0.0079375,0.02480469},
	{"20~29",0.018375,0.05742188},	{"30~39",0.0313125,0.09785157},
	{"40~49",0.04675,0.14609376},		{"50~59",0.0646875,0.20214845},
	{"60~69",0.085125,0.26601564},	{"70~79",0.1080625,0.33769533},
	{"80~89",0.1335,0.41718752},	  {"90~99",0.162,0.50625},
	{"100~109",0.3,0.8},	          {"110~119",0.352,0.935}, 
	{"120~129",0.408,1.08},	      {"130~139",0.468,1.235}, 
	{"140~150",0.532,1.4}	
	}

--**********************************
--�¼��б�
--**********************************
function x000064_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0019}")
		if LuaFnGetName( sceneId, targetId ) ~= x000064_g_SpecialNPC_City then
		--AddNumText( sceneId, x000064_g_scriptId, "����޵�", 6, 10 )	--ȥ������޵�--del by Heanqi
		end
		AddNumText(sceneId,x000064_g_scriptId,"����",6,0)
	EndEvent(sceneId)
	for i, eventId in x000064_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x000064_OnDefaultEvent( sceneId, selfId,targetId )
	x000064_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000064_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 50, 0 )	--ȥ������޵�--del by Heanqi
			return
	end

	--����ָ�Ѫ��������
	local	gld	= x000064_CalcMoney_hpmp( sceneId, selfId )
	local	key	= GetNumText()

	if key == 1000 then	--��Ը������
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == 1001 then	--ȷ��Ҫ����
		--����ָ�Ѫ��������
		gld	= x000064_CalcMoney_hpmp( sceneId, selfId )
		
		-- �õ����Ӻͽ�Ǯ��Ŀ
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--�������Ƿ����㹻���ֽ�
		if (nMoneyJZ + nMoney >= gld) then
			--��Ǯ
			LuaFnCostMoneyWithPriority (sceneId, selfId, gld)
			--�ָ�Ѫ����
			x000064_Restore_hpmp( sceneId, selfId, targetId )			
			return
		
		--Ǯ����	
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
			 GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "  �����ںܽ���������Ҫ���ƣ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--ȡ��ָ��������ϵ����ежԿ���ɢפ��Ч��
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			x000064_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  ����Ҫ����#G#{_EXCHG"..gld.."}#W���ָ�Ѫ������ȷ��Ҫ������" )
				AddNumText( sceneId, x000064_g_scriptId, "��", -1, 1001 )
				AddNumText( sceneId, x000064_g_scriptId, "��", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x000064_g_eventList do
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
function x000064_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000064_g_eventList do
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
function x000064_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			x000064_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x000064_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x000064_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000064_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x000064_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ָ�Ѫ����
--**********************************
function x000064_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	
	local msg = ""
	-- �жϸ�npc�Ƿ���������
	if LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC 
		or LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC2
		or LuaFnGetName( sceneId, targetId ) == x000064_g_SpecialNPC3 then
		RestoreRage( sceneId, selfId )
		msg = "�����Ѫ��ŭ���Ѿ���ȫ�ָ���"
	else
		msg = "���Ѫ�����Ѿ��ָ���"
	end
	--ȡ��ָ��������ϵ����ежԿ���ɢפ��Ч��
	LuaFnDispelAllHostileImpacts( sceneId, selfId )
	
	BeginEvent( sceneId )
		AddText( sceneId, msg );
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--����ָ�Ѫ��������
--**********************************
--����ҵĵȼ���10�����µ�ʱ�����Ʋ��շѣ�
--���ڵ���10��������ȡ�ķ���Ϊ��
--���Ʒ��ã�������������ֵ����ǰ����ֵ����a+����������ֵ����ǰ��ֵ����b
function x000064_CalcMoney_hpmp( sceneId, selfId )
  
  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local	level	= GetLevel( sceneId, selfId )
	if level < 10 then	--�����ҵȼ�<10������ҪǮ
		return 0
	elseif level > PlayerMaxLevel then
		level	= PlayerMaxLevel
	end

	local	rat		= x000064_g_rat[ floor(level/10) + 1 ]
	local hp		= GetHp( sceneId, selfId )
	local maxhp	= GetMaxHp( sceneId, selfId )
	local mp		= GetMp( sceneId, selfId )
	local maxmp	= GetMaxMp( sceneId, selfId )
	local	gld		= floor( (maxhp-hp) * rat[2] + (maxmp-mp) * rat[3] )
	if gld < 1 then
		gld				= 100
	end
	return gld
end
