--��ɽҽ��NPC
--��ҽ
--��ͨ

--�ű���
x125004_g_scriptId = 125004

--��ӵ�е��¼�ID�б�
x125004_g_eventList={701603}			-- ���������ơ��ű�

--��ҽ�ű����
x125004_g_healScriptId = 000064

--�����趨
--����ҵĵȼ���10�����µ�ʱ�����Ʋ��շѣ�
--���ڵ���10��������ȡ�ķ���Ϊ��
--���Ʒ��ã�������������ֵ����ǰ����ֵ����a+����������ֵ����ǰ��ֵ����b
--a��b�ڲ�ͬ�ȼ��µ�ϵ���涨���£��ȼ���aϵ����bϵ��
--x125004_g_rat	=	{
--	{"0~9",0,0},	{"10~19",0.0079375,0.02480469},
--	{"20~29",0.018375,0.05742188},	{"30~39",0.0313125,0.09785157},
--	{"40~49",0.04675,0.14609376},		{"50~59",0.0646875,0.20214845},
--	{"60~69",0.085125,0.26601564},	{"70~79",0.1080625,0.33769533},
--	{"80~89",0.1335,0.41718752},	  {"90~99",0.162,0.50625}, 
--	{"100~109",0.2,0.6},	          {"110~119",0.2354,0.704}, 
--	{"120~129",0.2736,0.816},	      {"130~139",0.3146,0.936}, 
--	{"140~149",0.3584,1.064}	 
--	}
--�ĳ���У���۸�һ�� TT:45070

--**********************************
--�¼��б�
--**********************************
function x125004_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0019}")
		-- AddNumText( sceneId, x125004_g_scriptId, "����޵�", 6, 10 )
		AddNumText(sceneId,x125004_g_scriptId,"����",6,0)
	EndEvent(sceneId)
	for i, eventId in x125004_g_eventList do
		-- ���á��������ơ��ű�
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x125004_OnDefaultEvent( sceneId, selfId,targetId )
	x125004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x125004_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 50, 0 )
			return
	end

	--����ָ�Ѫ��������
	--local	gld	= x125004_CalcMoney_hpmp( sceneId, selfId )
	local	gld = CallScriptFunction( x125004_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
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
		--gld	= x125004_CalcMoney_hpmp( sceneId, selfId )
		gld = CallScriptFunction( x125004_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1

		-- �õ����Ӻͽ�Ǯ��Ŀ
		local nMoneyJZ = GetMoneyJZ ( sceneId, selfId )
		local nMoney = GetMoney ( sceneId, selfId )
		
		--�������Ƿ����㹻���ֽ�
		if (nMoneyJZ + nMoney >= gld) then
			--��Ǯ
			LuaFnCostMoneyWithPriority (sceneId, selfId, gld)
			--�ָ�Ѫ����		
			x125004_Restore_hpmp ( sceneId, selfId, targetId )			
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
			x125004_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
				AddText( sceneId, "  ����Ҫ����#G#{_EXCHG"..gld.."}#W���ָ�Ѫ������ȷ��Ҫ������" )
				AddNumText( sceneId, x125004_g_scriptId, "��", -1, 1001 )
				AddNumText( sceneId, x125004_g_scriptId, "��", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x125004_g_eventList do
			if eventId == findId then
				-- ���á��������ơ��ű�
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()��addnumtext�����ı���
				return
			end
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x125004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				-- ���á��������ơ��ű�
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x125004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			x125004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x125004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			-- ���á��������ơ��ű�
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x125004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x125004_g_eventList do
		if missionScriptId == findId then
			-- ���á��������ơ��ű�
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x125004_OnDie( sceneId, selfId, killerId )
end

--**********************************
--�ָ�Ѫ����
--**********************************
function x125004_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	--ȡ��ָ��������ϵ����ежԿ���ɢפ��Ч��
	LuaFnDispelAllHostileImpacts( sceneId, selfId )
	
	BeginEvent( sceneId )
		AddText( sceneId, "���Ѫ�����Ѿ��ָ�" );
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
--function x125004_CalcMoney_hpmp( sceneId, selfId )
--	
--	local PlayerMaxLevel = GetHumanMaxLevelLimit()
--	local	level	= GetLevel( sceneId, selfId )
--	if level < 10 then	--�����ҵȼ�<10������ҪǮ
--		return 0
--	elseif level > PlayerMaxLevel then
--		level	= PlayerMaxLevel
--	end
--
--	local	rat		= x125004_g_rat[ floor(level/10) + 1 ]
--	local hp		= GetHp( sceneId, selfId )
--	local maxhp	= GetMaxHp( sceneId, selfId )
--	local mp		= GetMp( sceneId, selfId )
--	local maxmp	= GetMaxMp( sceneId, selfId )
--	local	gld		= floor( (maxhp-hp) * rat[2] + (maxmp-mp) * rat[3] )
--	if gld < 1 then
--		gld				= 1
--	end
--	return gld
--end
