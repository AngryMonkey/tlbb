-- ������������
-- �ƽ�֮��

--************************************************************************
--MisDescBegin

-- �ű���
x050220_g_ScriptId = 050220

---- �����
x050220_g_MissionId = 1256					--1256 �ƽ�֮��--1257 ������--1258 ����֮��

---- ��һ������� ID
---- g_MissionIdPre = 1260

---- ����Ŀ�� NPC
x050220_g_Name = "����"

--�������
x050220_g_MissionKind = 8

--����ȼ�
x050220_g_MissionLevel = 10000

-- �����ı�����
x050220_g_MissionName = "�ƽ�֮��"
x050220_g_MissionInfo = "    "														-- ��������
x050220_g_MissionTarget = "    #{LLFBM_80918_1}"						-- ����Ŀ��
--x050220_g_ContinueInfo = "    ����׼�����˾���ǰȥ���������������"					-- δ��������npc�Ի�
x050220_g_SubmitInfo = "#{LLFB_80816_19}"										-- �ύʱ�Ĵ�
x050220_g_MissionComplete = "#{LLFB_80902_1}"	--�������npc˵�Ļ�

x050220_g_IsMissionOkFail = 0														-- 0����������ǰ�����Ƿ����(0δ��ɣ�1��ɣ�2ʧ��)
x050220_g_IsSmallMonster = 1														-- 1 ��������ɱ���������˵�����
x050220_g_IsBossNiuQu = 2																-- 2 ��������ɱţ��������
x050220_g_IsBossNiuQi = 3																-- 3 ��������ɱţ�������
x050220_g_IsBossWang = 4																-- 4 ��������ɱ���ֵ�����
x050220_g_IsFindGoods = 5																-- 5 ���������Ƿ��ҵ��ƽ�֮��
x050220_g_Param_sceneid = 6															-- 6����������ǰ�������ݵ�6λ������Ϊ����ID

-- ����������,���ݶ�̬ˢ��,����������ĵ�1λ��ʼ
x050220_g_Custom	= { {id="��ɱ����#r  ����������",num=60},{id="  ţ��",num=1},{id="  ţ��",num=1},{id="  ����",num=1},{id="���ҵ���#r  �ƽ�֮��",num=1} }

--MisDescEnd
--************************************************************************

x050220_g_huangjinzhilian = 40004453	--�ƽ�֮��
x050220_g_heyuanxin = 40004460	--���õ���

x050220_g_SmallMonster = "����������"			--С��
x050220_g_NiuQu = "ţ��"							--ţ��
x050220_g_NiuQi = "ţ��"							--ţ��
x050220_g_BossWang = "����"					-- boss����

SmallMonsterIDTbl = {13000,13001,13002,13003,13004,13005,13006,13007,13008,13009}			--С��
NiuQuIDTbl = {13020,13021,13022,13023,13024,13025,13026,13027,13028,13029}							--ţ��
NiuQiIDTbl = {13040,13041,13042,13043,13044,13045,13046,13047,13048,13049}							--ţ��
BossWangIDTbl = {13060,13061,13062,13063,13064,13065,13066,13067,13068,13069}					-- boss����

x050220_g_SmallMonsterAPos = { --A��С������
{124,	201},{128,	201},{136,	201},{142,	201},{148,	197},
{148,	193},{148,	189},{148,	186},{148,	181},{143,	174},
{138,	174},{132,	174},{126,	174},{159,	183},{159,	189}}

x050220_g_SmallMonsterBPos = { --B��С������
{55,	85},{64,	85},{75,	85},{86,	84},{97,	84},
{107,	84},{107,	70},{97,	71},{85,	69},{74,	68},
{64,	68},{55,	68},{53,	56},{75,	57},{85,	58},
{56,	45},{75,	46},{85,	46},{61,	37},{66,	37}}

x050220_g_SmallMonsterCPos = { --C��С������
{165,	43},{171,	43},{168,	45},{166,	49},{172,	49},
{157,	61},{164,	61},{160,	64},{157,	68},{164,	67},
{176,	60},{182,	61},{179,	63},{176,	66},{182,	66},
{173,	79},{178,	81},{175,	82},{171,	84},{177,	86},
{197,	68},{205,	70},{200,	72},{196,	74},{204,	76}
}

x050220_g_NumText_Main = 1					-- �������ѡ��
x050220_g_NumText_EnterCopyScene = 2		-- Ҫ����븱����ѡ��

x050220_g_CopySceneMap = "xuanmuchang.nav"
x050220_g_CopySceneArea = "xuanmuchang_area.ini"
x050220_g_CopySceneMonsterIni = "xuanmuchang_monster.ini"

x050220_g_CopySceneType = FUBEN_HUANGJINZHILIAN		-- �������ͣ�������ScriptGlobal.lua����
x050220_g_LimitMembers = 1					-- ���Խ���������С��������
--x050220_g_LevelLimit = 30					-- ���Խ��븱������ͼ���
x050220_g_TickTime = 5						-- �ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x050220_g_LimitTotalHoldTime = 360			-- �������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x050220_g_CloseTick = 6						-- �����ر�ǰ����ʱ����λ��������
x050220_g_NoUserTime = 30					-- ������û���˺���Լ��������ʱ�䣨��λ���룩

x050220_g_Fuben_X = 38
x050220_g_Fuben_Z = 220
x050220_g_Back_X = 295
x050220_g_Back_Z = 68

x050220_g_TakeTimes = 10											-- ÿ�������ȡ����
--**********************************
-- ������ں���
--**********************************
function x050220_OnDefaultEvent( sceneId, selfId, targetId )	-- ����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		-- �жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) == 0 then
		if numText == x050220_g_NumText_Main then
			if x050220_CheckAccept( sceneId, selfId, targetId ) > 0 then
				--�����������ʱ��ʾ����Ϣ
				BeginEvent( sceneId )
					AddText( sceneId, "#{LLFB_80816_2}" )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
			end
		end
	else
		if numText == x050220_g_NumText_Main then
			local bDone = x050220_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				--AddText( sceneId, x050220_g_MissionName )
	
				if bDone == 1 then
					AddText( sceneId, x050220_g_SubmitInfo )
				else
						AddText( sceneId, "#{LLFB_80816_8}" )
						AddNumText( sceneId, x050220_g_ScriptId, "ǰ��������", 10, x050220_g_NumText_EnterCopyScene )
						EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			--DispatchMissionDemandInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId, bDone )
			DispatchMissionContinueInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
		elseif numText == x050220_g_NumText_EnterCopyScene then
			x050220_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- ����������������û�з��� 0���з��� 1
--**********************************
function x050220_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1256+1, 1258 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- �о��¼�
--**********************************
function x050220_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	-- ����������������
	if x050220_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050220_g_ScriptId, x050220_g_MissionName, 4, x050220_g_NumText_Main )
end

--**********************************
-- ����������
--**********************************
function x050220_CheckAccept( sceneId, selfId, targetId )
	-- �Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) > 0 then
		return 0
	end

	-- ����������������
	if x050220_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end
	
	-- һ��ֻ���� x050220_g_TakeTimes ��
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME, nowDate )
	end

	--5��
	if takenTimes >= x050220_g_TakeTimes then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_3}" )
		return 0
	end

	-- �������Ƿ���ϸշ�������
	local iTime = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_LAST )			-- ��һ�η��������ʱ��(��λ��һ����)
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()												-- ��ǰʱ��(��λ��һ����)
	local CurTime = GetQuarterTime()												-- ��ǰʱ��(��λ��һ����)
	--end modified by zhangguoxin 090208

	if iTime+1  >= CurTime then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_4}" )
		return 0
	end
	
	-- �ȼ��ﵽ75
	if GetLevel(sceneId, selfId) < 75 then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- �����ķ��ﵽ45
	if x050220_CheckAllXinfaLevel(sceneId, selfId, 45) == 0  then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- �������������Ƿ�ﵽ����20��
	if GetMissionCount( sceneId, selfId ) >= 20 then						
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_6}" )
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x050220_OnAccept( sceneId, selfId, targetId )
	-- ������������б�
	AddMission( sceneId, selfId, x050220_g_MissionId, x050220_g_ScriptId, 1, 0, 0 )			-- kill��area��item
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return
	end
	
	--��Ҫ�۳�һ���м�������Ʒ�ƽ�֮��
	local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian )
	if num > 0 then
		LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, num )
	end
	
	-- һ��ֻ���� x050220_g_TakeTimes ��
	local DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
	local takenTimes = floor( DayTimes/100000 )
	DayTimes = (takenTimes+1)*100000 + GetDayTime()
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME, DayTimes )

--	SetMissionEvent( sceneId, selfId, x050220_g_MissionId, 4 ) -- ע�� OnLockedTarget �¼�

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )

	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail, 0 )	-- ������������Ϊδ���
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsSmallMonster, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossNiuQu, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossNiuQi, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossWang, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsFindGoods, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_Param_sceneid, -1 )		-- ��������Ϊ -1

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80816_8}" )
		AddNumText( sceneId, x050220_g_ScriptId, "ǰ��������", 10, x050220_g_NumText_EnterCopyScene )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ������븱������
--**********************************
function x050220_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) > 0 then					-- ������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050220_g_Param_sceneid )
		if copysceneid >= 0 then												-- ��������
		-- ���Լ����͵���������
			if GetMissionParam( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail ) == 2 then
				x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_7}" )
			elseif IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050220_g_Fuben_X, x050220_g_Fuben_Z )
			else
				x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_7}" )
			end
			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_9}" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_10}" )
			return
		end
		
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		if not nearMemberCount or nearMemberCount < x050220_g_LimitMembers then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_11}" )
			return
		end

		if not teamMemberCount or teamMemberCount ~= nearMemberCount then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_12}" )
			return
		end
		
		local outmessage = "#{FB0}"
		local issatisfy = 1 --�Ƿ���������
		local memberID = 0
		local isAccept = 0 --�Ƿ������Ѿ���������
		local Acceptmessage = "" --�Ѿ������������ʾ������������ʾ��ͬ
		for	i = 0, nearMemberCount - 1 do
			memberID = GetNearTeamMember( sceneId, selfId, i )
			outmessage = outmessage.."#r#B��Ա  "..GetName(sceneId, memberID)
			if GetLevel(sceneId, memberID) >= 75 then
				outmessage = outmessage.."#{FB1}"
			else
				outmessage = outmessage.."#{FB2}"
				issatisfy = 0
			end
			
			if x050220_CheckAllXinfaLevel(sceneId, memberID, 45) == 1 then
				outmessage = outmessage.."#{FB3}"
			else
				outmessage = outmessage.."#{FB4}"
				issatisfy = 0
			end
			
			if IsHaveMission( sceneId, memberID, x050220_g_MissionId ) > 0 then --�Ƿ�������
				local misIndex = GetMissionIndexByID( sceneId, memberID, x050220_g_MissionId )

			 	if GetMissionParam( sceneId, memberID, misIndex, x050220_g_IsMissionOkFail ) == 0 then --�Ƿ���ʧ�ܵ�����
			 		if GetMissionParam( sceneId, memberID, misIndex, x050220_g_Param_sceneid ) == -1 then --�Ƿ����ѽӵ�����
						outmessage = outmessage.."#{FB5}"
					else
						outmessage = outmessage.."#{FB6}"
						issatisfy = 0
						
						if isAccept == 0 then
							Acceptmessage = "#G"..GetName(sceneId, memberID)
						else
							Acceptmessage = Acceptmessage.."#W��#G"..GetName(sceneId, memberID)
						end
						isAccept = 1
					end
				else
					outmessage = outmessage.."#{FB6}"
					issatisfy = 0
				end
			else
				outmessage = outmessage.."#{FB6}"
				issatisfy = 0
			end
		end

		if isAccept == 1 then
			Acceptmessage = "#{FB7}"..Acceptmessage.."#{FB8}"
			x050220_NotifyFailBox( sceneId, selfId, targetId, Acceptmessage)
			return
		end
		
		if issatisfy == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, outmessage)
			return
		end
		
		--���㸱���йֵĵȼ�....
		local mylevel = 0
		local memId
		local tempMemlevel = 0
		local level0 = 0
		local level1 = 0
	
		for	i = 0, nearMemberCount - 1 do
			memId = GetNearTeamMember(sceneId, selfId, i)
			tempMemlevel = GetLevel(sceneId, memId)
			level0 = level0 + (tempMemlevel ^ 4 )
			level1 = level1 + (tempMemlevel ^ 3 )
		end
	
		if level1 == 0 then
			mylevel = 0
		else
			mylevel = level0/level1
		end
	
		if nearMemberCount == -1 then
			mylevel = GetLevel(sceneId, selfId)
		end
	
		--����ȼ���....
		local PlayerMaxLevel = GetHumanMaxLevelLimit()
		local iniLevel
		if mylevel < 10 then
			iniLevel = 1
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor((mylevel-75)/5) + 1
			if iniLevel < 0 then
				iniLevel = 1
			elseif iniLevel > 10 then
				iniLevel = 10
			end
		else
			iniLevel = 10
		end
	
		local smallmonsterId = SmallMonsterIDTbl[1]
		if SmallMonsterIDTbl[iniLevel] then
			smallmonsterId = SmallMonsterIDTbl[iniLevel]
		end
		
		local NiuquId = NiuQuIDTbl[1]
		if NiuQuIDTbl[iniLevel] then
			NiuquId = NiuQuIDTbl[iniLevel]
		end
		
		local NiuqiId = NiuQiIDTbl[1]
		if NiuQiIDTbl[iniLevel] then
			NiuqiId = NiuQiIDTbl[iniLevel]
		end
		
		local BossWangID = BossWangIDTbl[1]
		if BossWangIDTbl[iniLevel] then
			BossWangID = BossWangIDTbl[iniLevel]
		end
		
		--PrintStr("smallmonsterId"..smallmonsterId.." NiuquId"..NiuquId.." NiuqiId"..NiuqiId.." BossWangID"..BossWangID.." mylevel"..mylevel.." iniLevel"..iniLevel)

		local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
		LuaFnSetSceneLoad_Map( sceneId, x050220_g_CopySceneMap )						-- ��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050220_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050220_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050220_g_CopySceneType )				-- ���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050220_g_ScriptId )					-- ��1����������Ϊ���������¼��ű���
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- ���ö�ʱ�����ô���
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- ���ø�����ڳ�����, ��ʼ��
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- ���ø����رձ�־, 0���ţ�1�ر�
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- �����뿪����ʱ����
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- ��������
		LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- ɱС�ֵ�����
		LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- �Ƿ�ɱ��ţ��
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- �Ƿ�ɱ��ţ��
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- �Ƿ�ˢ����boss��
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- ���Ҫ���ѵĻ����ϴ�����ʱ�䣨��Ϊÿ2������һ�Σ���Ҫ��¼һ���ϴ�����ʱ�䣩
		LuaFnSetCopySceneData_Param( sceneId, 12, smallmonsterId )-- 
		LuaFnSetCopySceneData_Param( sceneId, 13, NiuquId )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 14, NiuqiId )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 15, BossWangID )		-- 
		LuaFnSetCopySceneData_Param( sceneId, 16, mylevel )			-- 

		LuaFnSetSceneLoad_Area( sceneId, x050220_g_CopySceneArea )

		LuaFnSetSceneLoad_Monster( sceneId, x050220_g_CopySceneMonsterIni )

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- ��ʼ����ɺ���ô�����������
		if bRetSceneID > 0 then
			x050220_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
			AuditXinSanHuanCreateFuben( sceneId, selfId, 1 )
		else
			x050220_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x050220_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )				-- ���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then											-- �Ҳ��������
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then		-- �����޷�ִ���߼���״̬
		return
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local i, nearMemberCount, member
	local members = {}
	local validmembercount = 0

	nearMemberCount = GetNearTeamCount( sceneId, leaderObjId )
	for i = 0, nearMemberCount - 1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if IsHaveMission( sceneId, member, x050220_g_MissionId ) > 0 then		-- ������
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	local misIndex
	for i = 1, validmembercount do
		if IsHaveMission( sceneId, members[i], x050220_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, members[i], x050220_g_MissionId )

			if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- ���ڿ���ִ���߼���״̬
				--������ĵ�1����������Ϊ�����ĳ�����
				SetMissionByIndex( sceneId, members[i], misIndex, x050220_g_Param_sceneid, destsceneId )
		--		SetMissionEvent( sceneId, members[i], x050220_g_MissionId, 0 )			-- ����ɱ���¼�
				NewWorld( sceneId, members[i], destsceneId, x050220_g_Fuben_X, x050220_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x050220_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--obj����
--**********************************
function x050220_OnDie( sceneId, objId, selfId )--���selfId�����ǳ���
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --����ǳ���Ļ��������ID���ó�����ID
		selfId = GetPetCreator( sceneId, selfId )
	end
	
	if selfId == -1 then
		return
	end

	--if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
	--	return
	--end
	
	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050220_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- ��������Ѿ����óɹر�״̬����ɱ����Ч
		return
	end

	--ȡ�õ�ǰ�����������
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--ȡ��ɱ�������name
	local szName = GetName( sceneId, objId )
	if szName == x050220_g_SmallMonster then--С��Group
		local KilledMonsterNum = LuaFnGetCopySceneData_Param( sceneId, 7 )
		KilledMonsterNum = KilledMonsterNum + 1
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- ���ڳ����Ĳ����˲���
				x050220_NotifyFailTips( sceneId, mems[i], "��ɱ��"..szName.."�� "..KilledMonsterNum.."/60" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsSmallMonster, KilledMonsterNum )
			end
		end
		
		LuaFnSetCopySceneData_Param( sceneId, 7, KilledMonsterNum ) --����ɱС������
	elseif szName == x050220_g_NiuQu then--ţ��
		LuaFnSetCopySceneData_Param( sceneId, 8, 1 ) --����ţ����־
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- ���ڳ����Ĳ����˲���
				x050220_NotifyFailTips( sceneId, mems[i], "��ɱ��"..szName.."�� 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossNiuQu, 1 )
			end
		end
		
		local otherflag = LuaFnGetCopySceneData_Param( sceneId, 9 ) --ȡ����һ��boss��־
		local nMonsterNum = GetMonsterCount(sceneId)

		if otherflag == 0 then --��һ��bossû����
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnSendSpecificImpactToUnit(sceneId,MonsterId,MonsterId,MonsterId,5960,0)
				if GetName( sceneId, MonsterId ) == x050220_g_NiuQi then
					--CallScriptFunction((200060), "Paopao",sceneId, x050220_g_NiuQi, "������", "��磬�ֵ����㱨��")
					MonsterTalk(sceneId,MonsterId,"������", "��磬�ֵ����㱨��")
				end
			end
		else
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5959)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5960)
			end
		end
	elseif szName == x050220_g_NiuQi then--ţ��
		LuaFnSetCopySceneData_Param( sceneId, 9, 1 ) --����ţ���־
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- ���ڳ����Ĳ����˲���
				x050220_NotifyFailTips( sceneId, mems[i], "��ɱ��"..szName.."�� 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossNiuQi, 1 )
			end
		end
		
		local otherflag = LuaFnGetCopySceneData_Param( sceneId, 8 ) --ȡ����һ��boss��־
		local nMonsterNum = GetMonsterCount(sceneId)

		if otherflag == 0 then --��һ��bossû����
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnSendSpecificImpactToUnit(sceneId,MonsterId,MonsterId,MonsterId,5960,0)
				if GetName( sceneId, MonsterId ) == x050220_g_NiuQu then
					--CallScriptFunction((200060), "Paopao",sceneId, x050220_g_NiuQu, "������", "�ֵܣ�������㱨��")
					MonsterTalk(sceneId,MonsterId,"������", "�ֵܣ�������㱨��")
				end
			end
		else
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5959)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5960)
			end
		end
	elseif szName == x050220_g_BossWang then-- boss����
		local misIndex = 0
		
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- ���ڳ����Ĳ����˲���
				x050220_NotifyFailTips( sceneId, mems[i], "��ɱ��"..szName.."�� 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossWang, 1 )
				AddMonsterDropItem( sceneId, objId, mems[i], x050220_g_huangjinzhilian )
			end
		end
		
		local BroadcastMsg = "#{LLFB_80816_17}#W#{_INFOUSR$N}#{LLFB_80816_18}"
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )--�����뿪����
	end
end

--**********************************
--ɱ����������
--**********************************
function x050220_OnKillObject( sceneId, selfId, objdataId, objId )						-- ������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--������ڸ����������¼�
--**********************************
function x050220_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--�뿪����
--**********************************
function x050220_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- ȡ�ø�����ڳ�����
	NewWorld( sceneId, selfId, oldsceneId, x050220_g_Back_X, x050220_g_Back_Z )
end

--**********************************
--����
--**********************************
function x050220_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050220_g_MissionName )
		AddText( sceneId, "good ����" )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
end

--**********************************
--����
--**********************************
function x050220_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050220_g_Param_sceneid )

	-- ���÷������������ʱ��
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()											-- ��ǰʱ��
	local CurTime = GetQuarterTime()											-- ��ǰʱ��
	--end modified by zhangguoxin 090208
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_LAST, CurTime )

	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x050220_g_MissionId )
	
	--��Ҫ�۳�һ���м�������Ʒ�ƽ�֮��
	local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian )
	if num > 0 then
		LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, num )
	end
	
	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050220_g_CopySceneType then											-- ����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		x050220_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x050220_g_Back_X, x050220_g_Back_Z )
	end
end

--**********************************
--����������ʱ���¼�
--**********************************
function x050220_OnCopySceneTimer( sceneId, nowTime )
	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						-- ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							-- �����µĶ�ʱ�����ô���

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

--	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )

	if leaveFlag == 1 then															-- ��Ҫ�뿪
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050220_g_CloseTick then										-- ����ʱ�䵽����Ҷ���ȥ��
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050220_Exit( sceneId, mems[i] )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", ( x050220_g_CloseTick - leaveTickCount ) * x050220_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050220_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050220_g_LimitTotalHoldTime then									-- ������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		local misIndex = 0
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x050220_NotifyFailTips( sceneId, mems[i], "����ʱ���ѵ����뿪����...." )
				if IsHaveMission( sceneId, mems[i], x050220_g_MissionId ) > 0 then
					misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
					if GetMissionParam( sceneId, mems[i], misIndex, x050220_g_IsMissionOkFail ) ~= 1 then
						SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsMissionOkFail, 2 )	-- ���û����ɾ�����Ϊʧ��
					end
				end
				x050220_Exit( sceneId, mems[i] )
			end
		end
		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == 1 then									--��ʼ��ʱ��ˣ�֡��ص�A����15��С�ֺ�BOSS1ţ�����ص�B����20��С�ֺ�BOSS2ţ�棬�ص�C����25��С�֡�
	
		local smallmonsterId = LuaFnGetCopySceneData_Param( sceneId, 12 )
		local NiuquId = LuaFnGetCopySceneData_Param( sceneId, 13 )
		local NiuqiId = LuaFnGetCopySceneData_Param( sceneId, 14 )
		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 16 )
		
		for i = 1, getn( x050220_g_SmallMonsterAPos ) do
			if x050220_g_SmallMonsterAPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterAPos[i][1], x050220_g_SmallMonsterAPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		for i = 1, getn( x050220_g_SmallMonsterBPos ) do
			if x050220_g_SmallMonsterBPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterBPos[i][1], x050220_g_SmallMonsterBPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		for i = 1, getn( x050220_g_SmallMonsterCPos ) do
			if x050220_g_SmallMonsterCPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterCPos[i][1], x050220_g_SmallMonsterCPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		monsterID = LuaFnCreateMonster( sceneId, NiuquId, 168, 184, 14, -1, 050220 )
		SetLevel( sceneId, monsterID, mylevel+2 ) --�ȼ���һ��С�ָ�2��
		SetCharacterName( sceneId, monsterID, x050220_g_NiuQu )
		
		monsterID = LuaFnCreateMonster( sceneId, NiuqiId, 65, 34, 14, -1, 050220 )
		SetLevel( sceneId, monsterID, mylevel+2 )--�ȼ���һ��С�ָ�2��
		SetCharacterName( sceneId, monsterID, x050220_g_NiuQi )
	else
		--��ʱ�������Ա�Ķ���ţ���������ϣ����߳�����
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- ȡ�ñ���Ķ����
		local oldsceneId

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050220_NotifyFailTips( sceneId, mems[i], "�㲻����ȷ�Ķ����У��뿪����...." )
				x050220_Exit( sceneId, mems[i] )
			end
		end
		
		local monsternum = LuaFnGetCopySceneData_Param( sceneId, 7 )				-- ɱС�ֵ�����
		local iskillNiuQu = LuaFnGetCopySceneData_Param( sceneId, 8 )				-- �Ƿ�ɱ��ţ��
		local iskillNiuQi = LuaFnGetCopySceneData_Param( sceneId, 9 )				-- �Ƿ�ɱ��ţ��
		local isBossWang = LuaFnGetCopySceneData_Param( sceneId, 10 )				-- �Ƿ�ˢ����boss��
		local NotifyTime = LuaFnGetCopySceneData_Param( sceneId, 11 )				-- ���Ҫ���ѵĻ����ϴ�����ʱ�䣨��Ϊÿ2������һ�Σ���Ҫ��¼һ���ϴ�����ʱ�䣩
		
		--ÿ2������ʾһ�Σ�������ʱ
		local isPreNotify = 0
		if mod( TickCount*x050220_g_TickTime, 60 ) == 0 and mod( TickCount*x050220_g_TickTime+60, 120 ) == 0 then
			isPreNotify = 1
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					local Minute = floor( (360 - TickCount)*x050220_g_TickTime/60 )
					x050220_NotifyFailTips( sceneId, mems[i], "ʣ��"..Minute.."����" )
				end
			end	
		end

		--С��15���ӵ�ʱ����ɱ�ɾ������й֣���Ҫÿ2������һ��boss������ʱ��
		if TickCount < 180 and monsternum >= 60 and iskillNiuQu == 1 and iskillNiuQi == 1 then
			if NotifyTime == 0 then --�״�����
				for	i = 0, membercount - 1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						local Minute = 0
						if 180 - TickCount < 12 then--С��1���Ӱ�1������ʾ
							Minute = 1
						else
							Minute = floor( (180 - TickCount)*x050220_g_TickTime/60 )
						end
						x050220_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_3}"..Minute.."#{LLFB_80819_4}" )
					end
				end
				LuaFnSetCopySceneData_Param( sceneId, 11, TickCount )
--			elseif TickCount - NotifyTime >= 24 then --���������
--				for	i = 0, membercount - 1 do
--					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
--						local Minute = 0
--						if 180 - TickCount < 12 then--С��1���Ӱ�1������ʾ
--							Minute = 1
--						else
--							Minute = floor( (180 - TickCount)*x050220_g_TickTime/60 )
--						end
--						x050220_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_3}"..Minute.."#{LLFB_80819_4}" )
--					end
--				end
--				LuaFnSetCopySceneData_Param( sceneId, 11, TickCount )
			end
		--���ڵ���15�����Ժ���Ҫ�ж����й��Ƿ�ɱ�ɾ���ɱ�ɾ����û�г�boss����ˢ����
		elseif TickCount >= 180 and monsternum >= 60 and iskillNiuQu == 1 and iskillNiuQi == 1 and isBossWang == 0 then
			local BossWangId = LuaFnGetCopySceneData_Param( sceneId, 15 )
			local mylevel = LuaFnGetCopySceneData_Param( sceneId, 16 )
		
			monsterID = LuaFnCreateMonster( sceneId, BossWangId, 200, 48, 14, 262, 050220 )
			SetLevel( sceneId, monsterID, mylevel+3 )--�ȼ���һ��С�ָ�3��
			SetCharacterName( sceneId, monsterID, x050220_g_BossWang )
			MonsterTalk(sceneId,monsterID,"������","��ѽѽ�����˸Ҵ��������£�������������")
			
			LuaFnSetCopySceneData_Param( sceneId, 10, 1 )
		end
		
	end
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x050220_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )				-- �õ���������к�
	if GetMissionParam( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail ) ~= 1 then
		return 0
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian ) < 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x050220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x050220_CheckSubmit( sceneId, selfId ) == 1 then
		x050220_NotifyFailBox( sceneId, selfId, targetId, x050220_g_MissionComplete )
		if LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, 1 ) > 0 then
			BeginAddItem( sceneId )
			AddItem( sceneId, x050220_g_heyuanxin, 1 )
			local ret = EndAddItem( sceneId, selfId )

			if ret > 0 then
				AddItemListToHuman(sceneId, selfId)
				
				DelMission( sceneId, selfId, x050220_g_MissionId )
				-- �����ͳ��
				LuaFnAuditQuest(sceneId, selfId, "¥����������ƽ�֮��")
			else
				x050220_NotifyFailTips( sceneId, selfId, "��ı������ˡ�")
			end
		end
	end
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x050220_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x050220_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--����ķ��ǲ���������
--**********************************
function x050220_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end

--**********************************
-- ʰȡ���� scene.lua��x888888_OnPlayerPickupItemFromDropBox���õ�����
--**********************************
function x050220_PickupItem(sceneId, selfId, itemId, bagidx )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return
	end
	
	if itemId ~= x050220_g_huangjinzhilian then
		return
	end
	
	x050220_NotifyFailTips( sceneId, selfId, "���ҵ��ƽ�֮���� 1/1" )
	x050220_NotifyFailTips( sceneId, selfId, "����Ŀ�����" )
	misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsFindGoods, 1 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail, 1 )	-- �������
end
