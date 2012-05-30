--ˮ���������¼��ű�
--����
--�ű���
x232000_g_ScriptId	= 232000

--��ӵ�е��¼�ID�б�
x232000_g_EventList	= { 232001 }

--�����
x232000_g_MissionId			= 1212
--��һ�������ID
x232000_g_MissionIdNext	= 1213
--����Ŀ��npc
x232000_g_Name			= "���ӱ�"
--�����ı�����
x232000_g_MissionName			= "����ƽ��ˮ������"
x232000_g_MissionInfo			= "  ƽ��ˮ�����ҡ�"	--��������
x232000_g_MissionTarget		= "  ���ݵĺ��ӱ�#{_INFOAIM244,215,1,���ӱ�}����������ˮ��ƽ�ѵ�����"	--����Ŀ��
x232000_g_ContinueInfo		= "  ���������ô?"		--δ��������npc�Ի�
x232000_g_MissionComplete	= "  ̫��л���ˣ�"		--�������npc˵�Ļ�
--��������
--x232000_g_MaxRound	= 20

--�����޸� 20-29  1�� 30-49  2�� 50-69  4�� 70-89  7�� 90���� 10�� 120���� 20��
x232000_g_MaxRoundList = {{lev=20,rnd=1},{lev=30,rnd=2},{lev=50,rnd=4},{lev=70,rnd=7},{lev=90,rnd=10},{lev=120,rnd=20}}

--��ȡ�������͵ȼ�
x232000_g_minLevel	= 20


--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x232000_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x232000_g_Name then
		return
	end

	--�������Ѿ���������
	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) > 0 then

		local misIndex			= GetMissionIndexByID( sceneId, selfId, x232000_g_MissionId )
		local misRealScript	= GetMissionParam( sceneId, selfId, misIndex, 1 )
		CallScriptFunction( misRealScript, "OnDefaultEvent", sceneId, selfId, targetId )

	--���δ������
	else

		--���ȼ�
		if LuaFnGetLevel( sceneId, selfId ) < x232000_g_minLevel then
			x232000_NotifyTip( sceneId, selfId, "���µĵȼ�̫�ͣ����˱Ƚ�������" )
			x232000_NotifyTip( sceneId, selfId, "���ǵ��㵽��"..x232000_g_minLevel.."��֮���������Ұɡ�" )
			return 0
		end

		--ȡ����Ҹ����Ķ��������������Լ���
		local i				= 0
		--��Ա�б�
		local lstMem	= { selfId }
		--������Ա�ĸ���
		local numMem	= 1
		if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
			--����Ƕӳ�
			if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then
				numMem		= GetNearTeamCount( sceneId, selfId )
				for	i=0, numMem-1 do
					lstMem[i+1] = GetNearTeamMember( sceneId, selfId, i )
				end
			end
		end

		--���ѡһ������
--	local rand	= random( 230011, 230012 )
		local	rand	= x232000_g_EventList[1]
		for	i=1, numMem do
			CallScriptFunction( rand, "OnDefaultEvent", sceneId, lstMem[i], targetId )
		end

	end

end

--**********************************
--�о��¼�
--**********************************
function x232000_OnEnumerate( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x232000_g_Name then
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) > 0 or x232000_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x232000_g_ScriptId, x232000_g_MissionName,4,-1 )
	end

end

--**********************************
--������������Ҳ�����������
--**********************************
function x232000_CheckAccept( sceneId, selfId )

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) > 0 then
		return 0
	end

	-- [ QUFEI 2007-08-27 19:13 UPDATE BugID 23910 ]
	local iDayCount = GetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_TIME )	
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local nData  = (nMonth+1)*100+nDay							
	

	if iDayCount ~= nData then								--���ǽ���Ļ�����ܴ����� 0

		SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT, 0 )
	end

	--�������Ƿ���Ͻ������������

	local	iDayCount	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )

	local	iTime	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime	= floor( iTime/100 )				--��һ�ν�����������ʱ��(����)
	local iQuarterTime	= mod( iTime, 100 )			--��һ�ν�����������ʱ��(һ����)
	local iDayHuan	= iDayCount	--��������ɵ��������

	--------------------------------------------------------
	--local CurTime		= GetHourTime()								--��ǰʱ��
	local CurTime		= GetQuarterTime()								--��ǰʱ��
	local CurDaytime= floor(CurTime/100)					--��ǰʱ��(��)
	

	if iDayTime ~= CurDaytime then	
		iDayHuan	= 0
		iDayCount		= iDayHuan;
		--����ѭ�������ʱ��
		SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, CurTime )
		SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )

	end
	--------------------------------------------------------
	

	if iDayHuan >= x232000_GetMaxRound(sceneId,selfId) then

	--����Ƿ���������Ѵ�����
	--if iDayHuan >= x232000_g_MaxRound then
		x232000_NotifyTip( sceneId, selfId, "����������Ѿ����ܳ����˹涨����" )
		return 0
	end

	--����ò����û�õ� ע�� by zhangguoxin 090208
	--local CurTime				= GetHourTime()					--��ǰʱ��
	--local CurDaytime		= floor( CurTime/100 )	--��ǰʱ��(��)
	--local CurQuarterTime= mod( CurTime, 100 ) 	--��ǰʱ��(һ����)
	--end modified by zhangguoxin 090208
	--------------------------------------------------------
--	if iDayTime == CurDaytime then
--		if CurQuarterTime == iQuarterTime then
--			x232000_NotifyTip( sceneId, selfId, "�����ڲ�����ȡ�������" )
--			return 0
--		end
--	end
	--------------------------------------------------------
	return 1
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x232000_OnAccept( sceneId, selfId, targetId, scriptId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x232000_g_Name then
		return
	end

	-- [ QUFEI 2007-08-27 19:13 UPDATE BugID 23910 ]
	local nMonth = LuaFnGetThisMonth()
	local nDay   = LuaFnGetDayOfThisMonth()
	local nData  = (nMonth+1)*100+nDay							
	SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_TIME, nData )
	-- PrintNum(nData)

	local	iDayCount	= GetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT )	--�����ڽ�������Ĵ���
		
	--����Ƿ���������Ѵ�����


	if iDayCount >= x232000_GetMaxRound(sceneId,selfId) then
	--if iDayCount >= x232000_g_MaxRound then
		x232000_NotifyTip( sceneId, selfId, "����������Ѿ����ܳ����˹涨����" )
		return
	else
		-- PrintStr("Succesy")
		iDayCount = iDayCount + 1
		-- PrintNum(iDayCount)
		SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT, iDayCount )
	end

	--������������б�
	AddMission( sceneId, selfId, x232000_g_MissionId, scriptId, 0, 0, 1 )
	--�õ���������к�
	local	misIndex		= GetMissionIndexByID( sceneId, selfId, x232000_g_MissionId )
	--�������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0 )
	--�������кŰ���������ĵ�1λ��Ϊ����ű���
	SetMissionByIndex( sceneId, selfId, misIndex, 1, scriptId )

	--�õ�����
	local	MissionRound= GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )
	--��������1
	MissionRound			= MissionRound + 1
	
	--if	MissionRound > x232000_g_MaxRound then
	if	MissionRound > x232000_GetMaxRound(sceneId,selfId) then
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 1 )
	else
		SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, MissionRound )
	end

end

--**********************************
--�������������������
--**********************************
function x232000_OnAbandon( sceneId, selfId )

  DelMission( sceneId, selfId, x232000_g_MissionId )
  --��������0���������ɷ���
	--SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, 0 )
	--begin modified by zhangguoxin 090208
	local	iDayCount	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
	--local iDayHuan	= floor( iDayCount/100000 )		--��������ɵ��������
	local iDayHuan	= iDayCount		--��������ɵ��������
	--local iTime			= mod(iDayCount,100000)
	local iTime			= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime	= floor(iTime/100)						--��һ�ν�����������ʱ��(����)
	
	--local CurTime		= GetHourTime()								--��ǰʱ��
	local CurTime		= GetQuarterTime()								--��ǰʱ��
	local CurDaytime= floor(CurTime/100)					--��ǰʱ��(��)

	if iDayTime ~= CurDaytime then								--���ǽ���Ļ�������0
		SetMissionData( sceneId, selfId, MD_SHUILAO_ACCEPT_COUNT, 0 )
		iDayHuan	= 0
	end

	--iDayCount		= iDayHuan * 100000 + CurTime
	iDayCount		= iDayHuan;
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, CurTime )
	--����ѭ�������ʱ��
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
	--end modified by zhangguoxin 090208
end

--**********************************
--����
--**********************************
function x232000_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x232000_CheckSubmit( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x232000_g_MissionId ) <= 0 then
		return 0
	end

	--�õ���������к�
	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232000_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, 0 ) == 1 then
		return 1
	end

	return  0
end

--**********************************
--�ύ���������������
--**********************************
function x232000_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x232000_CheckSubmit( sceneId, selfId ) ~= 1 then
		return
	end

	if DelMission( sceneId, selfId, x232000_g_MissionId ) <= 0 then
		return
	end
	--����к���������ɾ��
	if IsHaveMission( sceneId, selfId, x232000_g_MissionIdNext ) > 0 then
		DelMission( sceneId, selfId, x232000_g_MissionIdNext )
	end

	local	Level			= GetLevel( sceneId, selfId )
	--begin modified by zhangguoxin 090208
	local iDayCount	= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT )
	--local iTime			= mod( iDayCount, 100000 )
	local iTime			= GetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME )
	local iDayTime	= floor( iTime/100 )				--��һ�ν�����������ʱ��(����)
	local iQuarterTime	= mod( iTime, 100 )			--��һ�ν�����������ʱ��(��)
	--local iDayHuan	= floor( iDayCount/100000 )	--��������ɵ��������
	local iDayHuan	= iDayCount	--��������ɵ��������

	--local CurTime				= GetHourTime()					--��ǰʱ��
	local CurTime				= GetQuarterTime()					--��ǰʱ��
	local CurDaytime		= floor( CurTime/100 )	--��ǰʱ��(��)
	local CurQuarterTime= mod( CurTime, 100 )		--��ǰʱ��(��)

	--�ϴ����������ͬһ����
	if CurDaytime == iDayTime then
		iDayHuan			= iDayHuan + 1
	--�ϴ����������ͬһ�죬����
	else
		iDayTime			= CurDaytime
		iQuarterTime	= 0
		iDayHuan			= 1
	end

	local	Reward_Append	= 1
	
	if iDayHuan <= x232000_GetMaxRound(sceneId,selfId) then
	--if iDayHuan <= x232000_g_MaxRound then
		Reward_Append	= 2
	end
	
	--iDayCount	= iDayHuan * 100000 + iDayTime * 100 + iQuarterTime
	iDayCount	= iDayHuan;
	local newTime = iDayTime * 100 + iQuarterTime;
	--����ѭ������Ļ���
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYTIME, newTime )
	SetMissionData( sceneId, selfId, MD_BAIMASI_DAYCOUNT, iDayCount )
	--begin modified by zhangguoxin 090208
	local	MissionRound	= GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )

	--˥��ϵ��
	local l_Exp		= 0.75
	local l_Money	= (49+Level) / (160+40*Level)
	--���㽱�����������
	local Round		= mod( MissionRound, 10 )
	if Round == 0 then
		Round = 10
	end

	--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
	local Exp		= 2400 * (Level+4) * Round * l_Exp / 120
	--�ȼ�+�����������ܾ�����ڳ�����Ӱ��
	local Money	= 2400 * (Level+4) * Round * l_Money /120

	if MissionRound > 10 then
		--10�����ϣ�ÿ����������һ��������������Ǯû������
		Exp	= 2400 * (Level+4) * l_Exp / 120 + Exp
	end

	Exp		= Exp * Reward_Append
	Exp		= floor(Exp)
	Money	= floor(Money)

	--���Ӿ���ֵ��Ǯ
	--���������
--AddExp( sceneId, selfId, Exp )
	AddMoney( sceneId, selfId, Money )
	--��ʾ�Ի���
	BeginEvent( sceneId )
--	AddText( sceneId, "  ���ò���������" .. Exp .. "�㾭��ֵ��#{_MONEY"..Money.."}�����Ǹ���Ľ�����" )
		AddText( sceneId, "  ���ò���������#{_MONEY"..Money.."}�����Ǹ���Ľ�����" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	--��¼ͳ����Ϣ
	LuaFnAuditShuiLao(sceneId, selfId)
end

--**********************************
--ɱ����������
--**********************************
function x232000_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x232000_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x232000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x232000_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x232000_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--�����͵�����ʾ�Ľ���
--**********************************
function x232000_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x232000_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x232000_GetEventMissionId( sceneId, selfId )
	return x232000_g_MissionId
end

------------------------------
--ȡ�������ɴ���
------------------------------
function x232000_GetMaxRound(sceneId,selfId)
	
	local	level	= GetLevel( sceneId, selfId )
	local index = 5
	while level < x232000_g_MaxRoundList[index].lev do
		index = index - 1
		if index == 1 then
			break
		end
	end

	return x232000_g_MaxRoundList[index].rnd
  
end
