-- ���������������¼��ű�
-- �ű���
x600001_g_ScriptId = 600001

-- ��������
x600001_g_MaxRound = 10

-- �����������
x600001_g_IsMissionOkFail = 0						-- ������ɱ��
x600001_g_MissionParam_SubId = 1					-- ������ű��Ŵ��λ��
x600001_g_TransScript = 400900

-- ÿ��������������İ����������
x600001_g_CountLimiti = 50
x600001_TIME_2000_01_03_ = 946828868
x600001_g_SpecBonus = {
	1,
	1,
	1,
	2,
	2,
	3,
	3,
	4,
	4,
	5,
}

x600001_g_HighRate_Param = 0.8;			-- ��70����ҵ�10%����8%
x600001_g_LowRate_Param = 0.875;		-- ��70����ҵ�40%����35%
--�ͼ�������
x600001_g_GemMeltingLowRandTbl = {
  [50] = 3428,[51] = 3457,[52] = 3485,[53] = 3514,[54] = 3542,
  [55] = 3571,[56] = 3600,[57] = 3628,[58] = 3657,[59] = 3685,
  [60] = 3714,[61] = 3742,[62] = 3771,[63] = 3800,[64] = 3828,
  [65] = 3857,[66] = 3885,[67] = 3914,[68] = 3942,[69] = 3971,
  [70] = 4000,[71] = 4028,[72] = 4057,[73] = 4085,[74] = 4114,
  [75] = 4142,[76] = 4171,[77] = 4200,[78] = 4228,[79] = 4257,
  [80] = 4285,[81] = 4314,[82] = 4342,[83] = 4371,[84] = 4400,
  [85] = 4428,[86] = 4457,[87] = 4485,[88] = 4514,[89] = 4542,
  [90] = 4571,[91] = 4600,[92] = 4628,[93] = 4657,[94] = 4685,
  [95] = 4714,[96] = 4742,[97] = 4771,[98] = 4800,[99] = 4828,
  [100] = 4857,[101] = 4885,[102] = 4914,[103] = 4942,[104] = 4971,
  [105] = 5000,[106] = 5028,[107] = 5057,[108] = 5085,[109] = 5114,
  [110] = 5142,[111] = 5171,[112] = 5200,[113] = 5228,[114] = 5257,
  [115] = 5285,[116] = 5314,[117] = 5342,[118] = 5371,[119] = 5400,
  [120] = 5428,[121] = 5457,[122] = 5485,[123] = 5514,[124] = 5542,
  [125] = 5571,[126] = 5600,[127] = 5628,[128] = 5657,[129] = 5685,
  [130] = 5714,[131] = 5742,[132] = 5771,[133] = 5800,[134] = 5828,
  [135] = 5857,[136] = 5885,[137] = 5914,[138] = 5942,[139] = 5971,
  [140] = 6000,[141] = 6028,[142] = 6057,[143] = 6085,[144] = 6114,
  [145] = 6142,[146] = 6171,[147] = 6200,[148] = 6228,[149] = 6257,
  [150] = 6285,
}

--�߼�������
x600001_g_GemMeltingHighRandTbl = {
  [50] = 857,[51] = 864,[52] = 871,[53] = 878,[54] = 885,
  [55] = 892,[56] = 900,[57] = 907,[58] = 914,[59] = 921,
  [60] = 928,[61] = 935,[62] = 942,[63] = 950,[64] = 957,
  [65] = 964,[66] = 971,[67] = 978,[68] = 985,[69] = 992,
  [70] = 1000,[71] = 1007,[72] = 1014,[73] = 1021,[74] = 1028,
  [75] = 1035,[76] = 1042,[77] = 1050,[78] = 1057,[79] = 1064,
  [80] = 1071,[81] = 1078,[82] = 1085,[83] = 1092,[84] = 1100,
  [85] = 1107,[86] = 1114,[87] = 1121,[88] = 1128,[89] = 1135,
  [90] = 1142,[91] = 1150,[92] = 1157,[93] = 1164,[94] = 1171,
  [95] = 1178,[96] = 1185,[97] = 1192,[98] = 1200,[99] = 1207,
  [100] = 1214,[101] = 1221,[102] = 1228,[103] = 1235,[104] = 1242,
  [105] = 1250,[106] = 1257,[107] = 1264,[108] = 1271,[109] = 1278,
  [110] = 1285,[111] = 1292,[112] = 1300,[113] = 1307,[114] = 1314,
  [115] = 1321,[116] = 1328,[117] = 1335,[118] = 1342,[119] = 1350,
  [120] = 1357,[121] = 1364,[122] = 1371,[123] = 1378,[124] = 1385,
  [125] = 1392,[126] = 1400,[127] = 1407,[128] = 1414,[129] = 1421,
  [130] = 1428,[131] = 1435,[132] = 1442,[133] = 1450,[134] = 1457,
  [135] = 1464,[136] = 1471,[137] = 1478,[138] = 1485,[139] = 1492,
  [140] = 1500,[141] = 1507,[142] = 1514,[143] = 1521,[144] = 1528,
  [145] = 1535,[146] = 1542,[147] = 1550,[148] = 1557,[149] = 1564,
  [150] = 1571,
}



-- ������

--**********************************
-- ��������ں�������
--**********************************
function x600001_DoDefaultEvent( sceneId, selfId, targetId, missionId, subMissionScriptId )
	-- �������Ѿ����˸�����
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600001_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnDefaultEvent", sceneId, selfId, targetId )
	else
		-- �����ƣ��״̬
		local efsRet = LuaFnIsExceedingFatigueState( sceneId, selfId );
		if not efsRet or efsRet == 1 then
			x600001_NotifyFailTips( sceneId, selfId, "ƣ��״̬�²��ܽ�������" )
			return
		end

		-- ���δ�Ӹ�����
		if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
			x600001_NotifyFailTips( sceneId, selfId, "��������Ҫ����һ��������Ʒ�ռ�" )
			return
		end

		-- ȡ����Ҹ����Ķ��������������Լ���
		local i = 0
		local mems = { selfId }
		local nearteammembercount = 1

		-- if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
		--	if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then					-- �Ƕӳ�
		--		nearteammembercount = GetNearTeamCount( sceneId, selfId )
		--		for i=0, nearteammembercount-1 do
		--			mems[i+1] = GetNearTeamMember(sceneId, selfId, i)
		--		end
		--	end
		-- end

		for i=1, nearteammembercount do
			CallScriptFunction( subMissionScriptId, "OnDefaultEvent", sceneId, mems[i], targetId )
		end
	end
end

--**********************************
-- ������������������������
--**********************************
function x600001_DoCheckAccept( sceneId, selfId, missionId, timeParam )
	-- �Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		return 0
	end

	-- ����Ƿ������Ѿ��ﵽ 20 ����������ˣ����ܽ�
	if GetMissionCount( sceneId, selfId ) >= 20 then
		return -2
	end

	-- �������Ƿ���Ͻ������������
	--begin modified by zhangguoxin 090207
	local iTime = GetMissionData( sceneId, selfId, timeParam )					-- ��һ�η��������ʱ��(һ����)
	--local CurTime = GetHourTime()												-- ��ǰʱ��(һ����)
	local CurTime = GetQuarterTime()												-- ��ǰʱ��(һ����)
	--end modified by zhangguoxin 090207
	if iTime == CurTime then
		return -1
	end

	return 1
end

--**********************************
-- ���ܣ�����������������ù�������
--**********************************
function x600001_DoAccept( sceneId, selfId, scriptId, missionId, roundParam )
	--������������б�
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )				-- �õ���������к�
	SetMissionByIndex( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail, 0 )	-- �������кŰ���������ĵ�0λ��0 (����������)
	SetMissionByIndex( sceneId, selfId, misIndex, x600001_g_MissionParam_SubId, scriptId )	-- �������кŰ���������ĵ�1λ��Ϊ����ű���

	--�õ�����
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )
	--��������1
	MissionRound = mod( MissionRound, x600001_g_MaxRound )
	SetMissionData( sceneId, selfId, roundParam, MissionRound + 1 )
end

--**********************************
-- �������������������
--**********************************
function x600001_DoAbandon( sceneId, selfId, missionId, timeParam, roundParam )
	DelMission( sceneId, selfId, missionId )
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()													-- ��ǰʱ��
	local CurTime = GetQuarterTime()													-- ��ǰʱ��
	--begin modified by zhangguoxin 090207
	-- ���÷���ѭ�������ʱ��
	SetMissionData( sceneId, selfId, timeParam, CurTime )
	-- �廷��
	SetMissionData( sceneId, selfId, roundParam, 0 )
end

--**********************************
-- �������г�������
--**********************************
function x600001_AbandonCityMissions( sceneId, selfId )
	local missionList1 = { 1112 }	-- ���ȼ���ߵ�
	local missionList2 = { 1105, 1106, 1107, 1108, 1110, 1109, 1111, 1113, 1140, 1141, 1142 }	-- �����ȼ���

	local scriptId = -1

	for i, mission in missionList1 do
		scriptId = GetScriptIDByMissionID( sceneId, selfId, mission )
		if scriptId ~= -1 then
			CallScriptFunction( scriptId, "OnAbandon", sceneId, selfId )
		end
	end

	for i, mission in missionList2 do
		scriptId = GetScriptIDByMissionID( sceneId, selfId, mission )
		if scriptId ~= -1 then
			CallScriptFunction( scriptId, "OnAbandon", sceneId, selfId )
		end
	end
end

--**********************************
-- �����������ü���Ƿ�����ύ
--**********************************
function x600001_DoCheckSubmit( sceneId, selfId, missionId )
	if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )				-- �õ���������к�
	if GetMissionParam( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail ) == 1 then
		return 1
	end

	return  0
end

--**********************************
-- �ύ���������������
--**********************************
function x600001_DoSubmit( sceneId, selfId, missionId, roundParam )
	DelMission( sceneId, selfId, missionId )

	local MissionName = {}															-- �������Ʊ�
	MissionName[MD_CITY_ENGINEERING_ROUND] = "����"									-- ����
	MissionName[MD_CITY_DEVELOPMENT_ROUND] = "��չ"									-- ��չ
	MissionName[MD_CITY_SCITECH_ROUND] = "�Ƽ�"		   								-- �Ƽ�
	MissionName[MD_CITY_MARKET_ROUND] = "�м�"		   								-- �м�
	MissionName[MD_CITY_EXPAND_ROUND] = "����"		   								-- ����
	MissionName[MD_CITY_MILITARY_ROUND] = "����"									-- ����
	
	if MissionName[roundParam] then
		--�õ�����
		local MissionRound = GetMissionData( sceneId, selfId, roundParam )
		--������ܻ���
		local nCount = GetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY)+1
		local nNowTime = LuaFnGetCurrentTime()
		local nPreTime = GetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME)

		if (nNowTime-nPreTime > 60*60*24) or
		 				(floor((nNowTime-x600001_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x600001_TIME_2000_01_03_)/(3600*24)))   then
			nCount = 1
		end
		BeginEvent( sceneId )
			AddText( sceneId, "#{BHRW_081124_01}"..MissionName[roundParam].."����"..MissionRound.."#{BHRW_081124_02}"..nCount.."/"..x600001_g_CountLimiti.."#{BHRW_081124_03}")
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	end

	--�õ�����
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )
	if MissionName[roundParam] and x600001_g_MaxRound <= MissionRound then
		local str = format( "@*;SrvMsg;GLD:#Y����#{_INFOUSR%s}#Y�Ĳ�иŬ�����������������#R%d#Y��%s����",
			GetName( sceneId, selfId ), x600001_g_MaxRound, MissionName[roundParam] )

		BroadMsgByChatPipe( sceneId, selfId, str, 6 )
	end
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600001_BackToCity( sceneId, selfId, missionId, xPos, zPos )
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then							--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		if GetMissionParam( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail ) ~= 1 then
			x600001_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail, 2 )	--������������
		end
	end

	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--ȡ�ø�����ڳ�����
	CallScriptFunction( x600001_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, xPos, zPos )
end

--**********************************
-- ���齱��ֵ����
-- �㷨����ǰ�����������*(��ҵȼ�^����)*����+����
--**********************************
function x600001_CalcExpBonus( sceneId, selfId, roundParam )
	local MissionTypeInfo = {}														-- ������������б�
	MissionTypeInfo[MD_CITY_ENGINEERING_ROUND] = 1									-- ����
	MissionTypeInfo[MD_CITY_DEVELOPMENT_ROUND] = 1									-- ��չ
	MissionTypeInfo[MD_CITY_SCITECH_ROUND] = 1      								-- �Ƽ�
	MissionTypeInfo[MD_CITY_MARKET_ROUND] = 1       								-- �м�
	MissionTypeInfo[MD_CITY_EXPAND_ROUND] = 1       								-- ����
	MissionTypeInfo[MD_CITY_CONSTRUCT_ROUND] = 1    								-- ����
	MissionTypeInfo[MD_CITY_RESEARCH_ROUND] = 1     								-- �о�
	MissionTypeInfo[MD_CITY_MILITARY_ROUND] = 1										-- ����

	local TypeScale = MissionTypeInfo[roundParam]									-- ��ǰ�����������
	if not TypeScale then															-- �Ƿ���������
		return 0
	end
	
	--�Ϸ��Լ��
	--����
	local MissionRound	= GetMissionData( sceneId, selfId, roundParam )
	local	LogInfo
	if MissionRound <= 0 or MissionRound > x600001_g_MaxRound then
		LogInfo	= format( "[CITY]: MissionRound error! sceneId=%d,GUID=%0X,rnd=%d,roundParam=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			MissionRound,
			roundParam )
		MissionLog( sceneId, LogInfo )
		return 0
	end

	local Level = GetLevel( sceneId, selfId )										-- ��ҵȼ�
	local l_Exp = 1.75																-- ����
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )				-- ����
	local BaseExp = 0																-- ����

	local Exp = TypeScale * ( Level ^ l_Exp ) * MissionRound + BaseExp				-- �ȼ� + �����������ܾ�����ڳ�����Ӱ��

--	local citySceneId = CityGetSelfCityID( sceneId, selfId )
--	if CityGetMaintainStatus( sceneId, selfId, citySceneId ) == 3 then				-- ��ά��״̬
--		Exp = Exp / 2
--	end

	Exp = floor(Exp)

	return Exp
end

--**********************************
-- ��ṱ�׼���
--**********************************
function x600001_CalcContribBonus( sceneId, selfId, roundParam )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound > 0 then
		--˥��ϵ��
		local l_ContribBonus = 1
		local ContribBonus = 0

		ContribBonus = x600001_g_SpecBonus[MissionRound] * l_ContribBonus
		ContribBonus = floor(ContribBonus)
		return ContribBonus
	end

	return 0
end

--**********************************
-- רҵ����ֵ����
--**********************************
function x600001_CalcSpecBonus( sceneId, selfId, roundParam )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound >= 5 then
		--˥��ϵ��
		local l_SpecBonus = 1
		local SpecBonus = 0

		if MissionRound < 8 then
			SpecBonus = 1 * l_SpecBonus
		elseif MissionRound < 10 then
			SpecBonus = 2 * l_SpecBonus
		else
			SpecBonus = 3 * l_SpecBonus
		end

		SpecBonus = floor(SpecBonus)
		return SpecBonus
	end

	return 0
end

--**********************************
-- ���������Ʒ
--**********************************
function x600001_RandomItemAward( sceneId, selfId, roundParam, missionItemIdx )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound >= x600001_g_MaxRound then												-- �����н���Ʒ����
		if random(100) > 2 then													-- ���� 2%
			return
		end

		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( missionItemIdx )
		if itemSN > -1 then
			local bagpos = TryRecieveItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
			if bagpos and bagpos ~= -1 then
				local MissionName = {}															-- �������Ʊ�
				MissionName[MD_CITY_ENGINEERING_ROUND] = "����"									-- ����
				MissionName[MD_CITY_DEVELOPMENT_ROUND] = "��չ"									-- ��չ
				MissionName[MD_CITY_SCITECH_ROUND] = "�Ƽ�"		   								-- �Ƽ�
				MissionName[MD_CITY_MARKET_ROUND] = "�м�"		   								-- �м�
				MissionName[MD_CITY_EXPAND_ROUND] = "����"		   								-- ����
				MissionName[MD_CITY_MILITARY_ROUND] = "����"									-- ����

				--�õ�����
				if MissionName[roundParam] then
					local PlayerGender = GetSex( sceneId, selfId )
					local rank

					if PlayerGender == 0 then
						rank = "��"
					else
						rank = "��"
					end

					local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )

					local str = format( "@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00ͨ����иŬ�������������10��%s������Ϊ����Ľ�����%s�����#{_INFOMSG%s}��",
						GetName( sceneId, selfId ), MissionName[roundParam], rank, itemInfo )

					BroadMsgByChatPipe( sceneId, selfId, str, 6 )
				end
			end
		end
	end
end

--**********************************
-- ������������
--**********************************
function x600001_RandomItemMeltingAward( sceneId, selfId, roundParam )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound >= x600001_g_MaxRound then												-- �����н���Ʒ����
	
		local iPlayerLv = GetLevel(sceneId,selfId)											-- �ж���ҵȼ�
		if (iPlayerLv < 50) or (iPlayerLv > 150) then
			return
		end
		
		local rand = random(10000)
		local rateHigh = x600001_g_GemMeltingHighRandTbl[iPlayerLv] * x600001_g_HighRate_Param;
		local rateLow = x600001_g_GemMeltingLowRandTbl[iPlayerLv] * x600001_g_LowRate_Param;
		local itemSN = -1
			
		if (rand < rateHigh) then																				-- ������߼�������
				itemSN = 30900057
		else
				if (rand < rateLow) then																		-- ������ͼ�������
					itemSN = 30900056 
				else
					return																										-- ɶ��û�����
				end
		end
		
		if itemSN > -1 then
			local bagpos = TryRecieveItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
			if bagpos and bagpos ~= -1 then
				local MissionName = {}															-- �������Ʊ�
				MissionName[MD_CITY_ENGINEERING_ROUND] = "��������"									-- ����
				MissionName[MD_CITY_DEVELOPMENT_ROUND] = "��չ����"									-- ��չ
				MissionName[MD_CITY_SCITECH_ROUND] = "�Ƽ�����"		   								-- �Ƽ�
				MissionName[MD_CITY_MARKET_ROUND] = "�м�����"		   								-- �м�
				MissionName[MD_CITY_EXPAND_ROUND] = "��������"		   								-- ����
				MissionName[MD_CITY_MILITARY_ROUND] = "��������"									-- ����

				--�õ�����
				if MissionName[roundParam] then
					local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
					
					if (itemSN == 30900057) then	--�߼�����
						x600001_NotifyFailTips(sceneId, selfId,"#{JKBS_081021_025}" )
						
						local str = format( "#{_INFOUSR%s}#{JKBS_081021_026}#G%s#{JKBS_081021_027}#{_INFOMSG%s}#{JKBS_081021_028}",
						GetName( sceneId, selfId ), MissionName[roundParam], itemInfo )

						BroadMsgByChatPipe( sceneId, selfId, str, 4 )
					end
					
					if (itemSN == 30900056) then	--�ͼ�����
						x600001_NotifyFailTips(sceneId, selfId,"#{JKBS_081021_024}" )
						
						local str = format( "@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#{JKBS_081027_029}#G%s#{JKBS_081027_030}#{_INFOMSG%s}#{JKBS_081027_031}",
						GetName( sceneId, selfId ), MissionName[roundParam],itemInfo )

						BroadMsgByChatPipe( sceneId, selfId, str, 6 )
					end
				end
			end
		end
	end
end

function x600001_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- ���������Ʒ
--**********************************
function x600001_CanDoMisToDay(sceneId, selfId)
	local nCount = GetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY)
	local nNowTime = LuaFnGetCurrentTime()
	local nPreTime = GetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME)

	-- ����Ѿ�������1��
	if (nNowTime-nPreTime > 60*60*24) or
	 				(floor((nNowTime-x600001_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x600001_TIME_2000_01_03_)/(3600*24)))   then
		nCount = 0
		nPreTime = nNowTime
		SetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY, nCount)
		SetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME, nPreTime)
	end

	if nCount >= x600001_g_CountLimiti  then
		BeginEvent( sceneId )
			AddText( sceneId, "  �Բ���������������Ѿ��ۼ������50�Σ����һ�������ˣ�����ȥ��Ϣһ��������������Ұɡ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, selfId )
		return 0
	end

	return 1
end

--**********************************
-- ������һ������󣬶���¼һ�´�����ʱ��
--**********************************
function x600001_MissionComplete(sceneId, selfId)
	local nCount = GetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY)
	local nNowTime = LuaFnGetCurrentTime()
	local nPreTime = GetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME)

	if (nNowTime-nPreTime > 60*60*24) or
	 				(floor((nNowTime-x600001_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x600001_TIME_2000_01_03_)/(3600*24)))   then
		nCount = 0
	end

	SetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY, nCount+1)
	SetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME, nNowTime)
	
	if (nCount+1 == 50) then		--50�����񹫸�
			local str = format( "@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#{BHRW_081029_01}",GetName( sceneId, selfId ))
			BroadMsgByChatPipe( sceneId, selfId, str, 6 )
	end

end

