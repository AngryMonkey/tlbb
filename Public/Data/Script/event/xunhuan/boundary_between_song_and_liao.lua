-- ������������
-- ���ɱ߽�

--************************************************************************
--MisDescBegin

-- �ű���
x050100_g_ScriptId = 050100

-- �����
x050100_g_MissionId = 1260					-- 1260 - 1269

-- ��һ������� ID
-- g_MissionIdPre = 1260

-- ����Ŀ�� NPC
x050100_g_Name = "Ǯ����"

--�������
x050100_g_MissionKind = 8

--����ȼ�
x050100_g_MissionLevel = 10000

-- �����ı�����
x050100_g_MissionName = "һ����������"
x050100_g_MissionInfo = "    "				-- ��������
x050100_g_MissionTarget = "    ���ݵ�Ǯ����#{_INFOAIM62,162,1,Ǯ����}������30������������ɱ���඾��#r    #{FQSH_090206_01}"						-- ����Ŀ��
x050100_g_ContinueInfo = "    �߾�һս��ϵ�ش�һ�����ɵ������ġ���׼����ǰ���߾�������ô��"	-- δ��������npc�Ի�
x050100_g_SubmitInfo = "    ����������ô���ˣ�"										-- �ύʱ�Ĵ�
x050100_g_MissionComplete = "    �����ĺü��ˣ����ǿ���ͨ����������ҵ�����ͽ��Ӫկ��ȥ�ھ��һ�����#{_INFOAIM251,109,1,������}�������Ը��������Ƶ�������"	--�������npc˵�Ļ�

x050100_g_IsMissionOkFail = 0				-- 0 �ţ���ǰ�����Ƿ����(0δ��ɣ�1��ɣ�2ʧ��)
x050100_g_DemandKill = { { id = 4060, num = 50 }, { id = 4070, num = 10 }, { id = 4080, num = 1 }, { id = 4090, num = 1 }, { id = 4100, num = 1 } }	-- 1 ~ 5 �ţ�������Ϣ
x050100_g_Param_sceneid = 6					-- 6 �ţ���ǰ��������ĳ�����

-- ������

--MisDescEnd
--************************************************************************

x050100_g_DemandKillGroup = { 4, 0, 1, 2, 3 }	-- 1 ~ 5 �Ź����Ӧ�� GroupID �ţ��� x050100_g_DemandKill һһ��Ӧ
x050100_g_DogfaceGroup = 0					-- ����С���� Group ID
x050100_g_LittleBossGroup = 2				-- С Boss Group ID
x050100_g_ViceBossGroup = 1					-- �ξ�����ͳ
x050100_g_BossGroup = 3						-- Boss Group ID
x050100_g_Token = 40004315					-- ���ƺ�

x050100_g_NumText_Main = 1					-- �������ѡ��
x050100_g_NumText_EnterCopyScene = 2		-- Ҫ����븱����ѡ��

x050100_g_CopySceneMap = "songliao.nav"
x050100_g_CopySceneArea = "songliao_area.ini"
x050100_g_CopySceneMonsterIni = "songliao_monster_%d.ini"

x050100_g_CopySceneType = FUBEN_SONGLIAO	-- �������ͣ�������ScriptGlobal.lua����
x050100_g_LimitMembers = 1					-- ���Խ���������С��������
x050100_g_LevelLimit = 30					-- ���Խ��븱������ͼ���
x050100_g_TickTime = 5						-- �ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x050100_g_LimitTotalHoldTime = 360			-- �������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x050100_g_CloseTick = 6						-- �����ر�ǰ����ʱ����λ��������
x050100_g_NoUserTime = 30					-- ������û���˺���Լ��������ʱ�䣨��λ���룩
x050100_g_LoadBossTick = 180				-- 15 ����ˢС Boss

x050100_g_LittleBoss = { 4080, 4081, 4082, 4083, 4084, 4085, 4086, 4087, 4088, 4089, 34080, 34081, 34082, 34083, 34084, 34085, 34086, 34087, 34088, 34089 }
x050100_g_Dogface = { 4070, 4071, 4072, 4073, 4074, 4075, 4076, 4077, 4078, 4079, 34070, 34071, 34072, 34073, 34074, 34075, 34076, 34077, 34078, 34079 }
x050100_g_DogfacePos = {
	{ 22, 70, 4 }, { 22, 70, 4 }, { 22, 70, 4 }, { 102, 67, 5 }, { 102, 67, 5 },
	{ 102, 67, 5 }, { 75, 83, 6 }, { 75, 83, 6 }, { 49, 84, 7 }, { 49, 84, 7 }
}
x050100_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }

x050100_g_Fuben_X = 60
x050100_g_Fuben_Z = 9
x050100_g_Back_X = 130
x050100_g_Back_Z = 260

x050100_g_Fuben_Relive_X = 60
x050100_g_Fuben_Relive_Z = 15


-- �㲥��Ϣ
x050100_g_BroadcastMsg = {
	"#Y"..x050100_g_Name.."��#{_BOSS45}#P�Ѿ����ˣ��������ǵ�Ӣ��#{_INFOUSR$N}#P�ɵ��ˣ���һ�������Ļ���˭��#{_BOSS46}������#{_BOSS47}��������",
	"#Y"..x050100_g_Name.."��#P���ǵ�Ӣ��#{_INFOUSR$N}#P����#G���ɱ߾�#P������������ĵ���Ϣ���Ǹ��޶��������#{_BOSS45}#P���Ѿ����ɵ��ˣ�",
	"#Y"..x050100_g_Name.."��#P��ҿ����������ǵ�Ӣ�ۣ�#{_INFOUSR$N}#P��һ�����ŵĴ��棬�����е�ս������ŶҮ��"
}

x050100_g_TakeTimes = 10											-- ÿ�������ȡ����

--**********************************
-- ������ں���
--**********************************
function x050100_OnDefaultEvent( sceneId, selfId, targetId )	-- ����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		-- �жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		if numText == x050100_g_NumText_Main then
			if x050100_CheckAccept( sceneId, selfId ) > 0 then
				--�����������ʱ��ʾ����Ϣ
				BeginEvent( sceneId )
					AddText( sceneId, x050100_g_MissionName )
					AddText( sceneId, "    ����������������Щ�����ˣ�" )
					AddText( sceneId, "    ����ͽ�ڱ߾�ʮ�ֲ�Ᵽ�ͷĿ��һ�������඾����ˡ�������ؤ����ͽ���书��ǿ�Ҽ����ö���ֻ�а�������αװ���α����ν�һ��ɱ������������֡�" .. GetName( sceneId, selfId ) .. "��Ϊ�˽���Щ��ͽ����������������������ٶȽ��������𣬲��Ҳ��ܷ���һ����ڣ�" )
					AddText( sceneId, "#{M_MUBIAO}" )
					AddText( sceneId, x050100_g_MissionTarget )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId )
			end
		end
	else
		if numText == x050100_g_NumText_Main then
			local bDone = x050100_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				AddText( sceneId, x050100_g_MissionName )

				if bDone == 1 then
					AddText( sceneId, x050100_g_SubmitInfo )
				else
					AddText( sceneId, x050100_g_ContinueInfo )
					x050100_AskEnterCopyScene( sceneId, selfId, targetId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId, bDone )
		elseif numText == x050100_g_NumText_EnterCopyScene then
			x050100_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- ����������������û�з��� 0���з��� 1
--**********************************
function x050100_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1260, x050100_g_MissionId - 1 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	for missionId = x050100_g_MissionId + 1, 1269 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- �о��¼�
--**********************************
function x050100_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	-- ����������������
	if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050100_g_ScriptId, x050100_g_MissionName, 4, x050100_g_NumText_Main )
end

--**********************************
-- ����������
--**********************************
function x050100_CheckAccept( sceneId, selfId )
	-- �Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) > 0 then
		return 0
	end

	-- ����������������
	if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end

	-- �������Ƿ���ϸշ�������
	local iTime = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1 )			-- ��һ�η��������ʱ��(��λ��һ����)
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()												-- ��ǰʱ��(��λ��һ����)
	local CurTime = GetQuarterTime()												-- ��ǰʱ��(��λ��һ����)
	--end modified by zhangguoxin 090207

	if iTime+1 >= CurTime then
		x050100_NotifyFailTips( sceneId, selfId, "��������30���Ӻ�����ٴν�ȡ" )
		return 0
	end

	-- һ��ֻ���� x050100_g_TakeTimes ��
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
	end

	if takenTimes >= x050100_g_TakeTimes then
		x050100_NotifyFailTips( sceneId, selfId, "��������ȡ����Ĵ����Ѿ�����" .. x050100_g_TakeTimes .. "�Σ�������������ȡ��" )
		return 0
	else
		DayTimes = nowDate + takenTimes * 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES, DayTimes )
	end

	return 1
end

--**********************************
-- ������븱������
--**********************************
function x050100_AskEnterCopyScene( sceneId, selfId, targetId )
	AddNumText( sceneId, x050100_g_ScriptId, "ǰ���߾�", 10, x050100_g_NumText_EnterCopyScene )
end

--**********************************
--����
--**********************************
function x050100_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then					-- û������ſ���������
		if GetMissionCount( sceneId, selfId ) >= 20 then						-- �������������Ƿ�ﵽ����20��
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    �����¼�������޷���ȡ���������" )
			return
		end

		if GetLevel( sceneId, selfId ) < x050100_g_LevelLimit then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    ��ĵȼ�������30�����޷�ʤ�Ρ�" )
			return
		end

		-- ����������������
		if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
			return
		end

		-- ������������б�
		AddMission( sceneId, selfId, x050100_g_MissionId, x050100_g_ScriptId, 1, 0, 0 )			-- kill��area��item
		if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) <= 0 then
			return
		end

		-- һ��ֻ���� x050100_g_TakeTimes ��
		local DayTimes

		DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
		DayTimes = DayTimes + 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES, DayTimes )

--		SetMissionEvent( sceneId, selfId, x050100_g_MissionId, 4 ) -- ע�� OnLockedTarget �¼�

		local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )

		SetMissionByIndex( sceneId, selfId, misIndex, x050100_g_IsMissionOkFail, 0 )	-- ������������Ϊδ���
		SetMissionByIndex( sceneId, selfId, misIndex, x050100_g_Param_sceneid, -1 )		-- ��������Ϊ -1

		--��ʾ���ݸ�������Ѿ�����������
		BeginEvent( sceneId )
			AddText( sceneId, x050100_g_MissionName )
			AddText( sceneId, x050100_g_ContinueInfo )
			AddText( sceneId, "#r    �����������" .. x050100_g_MissionName )

			x050100_AskEnterCopyScene( sceneId, selfId, targetId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
-- ������븱������
--**********************************
function x050100_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) > 0 then					-- ������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050100_g_Param_sceneid )
		if copysceneid >= 0 then												-- ��������
			-- ���Լ����͵���������
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050100_g_Fuben_X, x050100_g_Fuben_Z )
			else
				x050100_NotifyFailBox( sceneId, selfId, targetId, "    �ܱ�Ǹ����������Ѿ�ʧ���ˡ�" )
			end

			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    ����һ�·�ͬС�ɣ�����Ҫ��һ֧ǿ��Ķ��顣" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    ����Ҫ�õ��ӳ���ȷ�ϲ��ܷ���������ǰ���߾���" )
			return
		end
		
		--bug27726��2007.11.15 by alan����ΪsceneMemberCount��һ��׼ȷ�����ø�����Ա������������ıȽ��ж�
		--��������ʾ���岻�ڸ����Ķ�Ա����
				
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);	
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);		
		if not teamMemberCount or not nearMemberCount or teamMemberCount ~= nearMemberCount then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    �㻹�ж�Ա���ڸ�����" )
			return
		end
		
		--bug27726 end
                                                               
		-- ȡ����Ҹ����Ķ��������������Լ���
		--local teamMemberCount = GetTeamMemberCount(sceneId, selfId);		
		--local sceneMemberCount = GetTeamSceneMemberCount(sceneId, selfId);
		--if not teamMemberCount or not sceneMemberCount or teamMemberCount ~= sceneMemberCount + 1 then
		--	x050100_NotifyFailBox( sceneId, selfId, targetId, "    �㻹�ж�Ա���ڸ�����" )
		--	return
		--end
		
		--local nearMemberCount = GetNearTeamCount(sceneId, selfId)
		--if nearMemberCount ~= sceneMemberCount + 1 then
		--	local strOutmsg = "���������г�Ա��";
		--	local checkNearCount = 0;
		--	for	i = 0, sceneMemberCount - 1 do
		--		local sceneMemId = LuaFnGetTeamSceneMember(sceneId, selfId, i);
		--		if sceneMemId and sceneMemId >= 0 then
		--			local findFlag = 0;
		--			for	j = 0, nearMemberCount - 1 do
		--				local nearMemId = GetNearTeamMember(sceneId, selfId, j);
		--				if nearMemId and nearMemId == sceneMemId then
		--					findFlag = 1;
		--					break;
		--				end
		--			end
					
		--			if findFlag == 0 then
		--				memName = GetName(sceneId, sceneMemId);
		--				if checkNearCount == 0 then
		--					strOutmsg = strOutmsg..memName;
		--				else
		--					strOutmsg = strOutmsg.."��"..memName;
		--				end
		--				checkNearCount = checkNearCount + 1;
		--			end
		--		end
		--	end
		--	if checkNearCount  > 0 then
		--		strOutmsg = strOutmsg.."�����ڸ������뼯�Ϻ������ҽ�����";
		--		x050100_NotifyFailBox( sceneId, selfId, targetId, strOutmsg)
		--	end
		--	return 
		--end

		if nearMemberCount < x050100_g_LimitMembers then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    ����һ�·�ͬС�ɣ�����ҪһЩ���������൱�İ����Ҳŷ��ġ���������������Ҫ����30�����Ͻ�ɫ��" )
			return
		end

		-- ���С�����Ƿ����������¼����, �����Ƿ��Ѿ��ӹ�������
		local member, mylevel, numerator, denominator = 0, 0, 0, 0
		local outNotAcceptMissionStr = "���������г�Ա��";
		local notAcceptMissionCount = 0;
		local outDoingMissionStr = "���������г�Ա��";
		local doingMissionCount = 0;
		for	i = 0, nearMemberCount - 1 do
			member = GetNearTeamMember( sceneId, selfId, i )

			if IsHaveMission( sceneId, member, x050100_g_MissionId ) <= 0 then
				if notAcceptMissionCount == 0 then
					outNotAcceptMissionStr = outNotAcceptMissionStr..GetName(sceneId, member);
				else
					outNotAcceptMissionStr = outNotAcceptMissionStr.."��"..GetName(sceneId, member);
				end
				notAcceptMissionCount = notAcceptMissionCount + 1;
			end

			if notAcceptMissionCount == 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x050100_g_MissionId )
				if GetMissionParam( sceneId, member, misIndex, x050100_g_Param_sceneid ) >= 0 then
					if doingMissionCount == 0 then
						outDoingMissionStr = outDoingMissionStr..GetName(sceneId, member);
					else
						outDoingMissionStr = outDoingMissionStr.."��"..GetName(sceneId, member);
					end
					doingMissionCount = doingMissionCount + 1;
				end
			end

			numerator = numerator + GetLevel( sceneId, member ) ^ 4
			denominator = denominator + GetLevel( sceneId, member ) ^ 3
		end
		
		if notAcceptMissionCount > 0 then
			outNotAcceptMissionStr = outNotAcceptMissionStr.."����û�н�����";
			x050100_NotifyFailBox( sceneId, selfId, targetId, outNotAcceptMissionStr);
			return
		end

		if doingMissionCount > 0 then
			outDoingMissionStr = outDoingMissionStr.."���Ѿ������������ˡ�";
			x050100_NotifyFailBox( sceneId, selfId, targetId, outDoingMissionStr);
			return
		end
		
		if denominator <= 0 then
			mylevel = 0
		else
			mylevel = numerator / denominator
		end

    local PlayerMaxLevel = GetHumanMaxLevelLimit()
		local iniLevel
		if mylevel < 10 then
			iniLevel = 10
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor( mylevel/10 ) * 10
		else
			iniLevel = PlayerMaxLevel
		end

		local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
		LuaFnSetSceneLoad_Map( sceneId, x050100_g_CopySceneMap )						-- ��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050100_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050100_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050100_g_CopySceneType )				-- ���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050100_g_ScriptId )					-- ��1����������Ϊ���������¼��ű���
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- ���ö�ʱ�����ô���
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- ���ø�����ڳ�����, ��ʼ��
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- ���ø����رձ�־, 0���ţ�1�ر�
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- �����뿪����ʱ����
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- ��������
		LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- ɱ��Boss1������
		LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- ɱ��Boss2������
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- ɱ��Boss3������
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- ɱ��Boss4������
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- ɱ��Boss5������
		LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- �Ƿ�ɱ��С Boss
		LuaFnSetCopySceneData_Param( sceneId, 13, iniLevel / 10 )				-- �洢����ǵļ��𵵴�
		LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- �Ƿ��Ѿ���С������
		LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- �Ƿ��Ѿ�ˢ���� Boss

		LuaFnSetSceneLoad_Area( sceneId, x050100_g_CopySceneArea )

		local monsterINI = format( x050100_g_CopySceneMonsterIni, iniLevel )
		LuaFnSetSceneLoad_Monster( sceneId, monsterINI )

		LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) -- ����CopyScene_LevelGap �� scene.lua �и�ֵ

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- ��ʼ����ɺ���ô�����������
		if bRetSceneID > 0 then
			x050100_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
		else
			x050100_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x050100_OnCopySceneReady( sceneId, destsceneId )
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
		if IsHaveMission( sceneId, member, x050100_g_MissionId ) > 0 then		-- ������
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	if validmembercount < x050100_g_LimitMembers then
		x050100_NotifyFailTips( sceneId, leaderObjId, "    ����һ�·�ͬС�ɣ�����ҪһЩ���������൱�İ����Ҳŷ��ġ���������������Ҫ����30�����Ͻ�ɫ��" )
		return
	end

	local misIndex
	for i = 1, validmembercount do
		misIndex = GetMissionIndexByID( sceneId, members[i], x050100_g_MissionId )

		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- ���ڿ���ִ���߼���״̬
			--������ĵ�1����������Ϊ�����ĳ�����
			SetMissionByIndex( sceneId, members[i], misIndex, x050100_g_Param_sceneid, destsceneId )
	--		SetMissionEvent( sceneId, members[i], x050100_g_MissionId, 0 )			-- ����ɱ���¼�
			NewWorld( sceneId, members[i], destsceneId, x050100_g_Fuben_X, x050100_g_Fuben_Z )
		end
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x050100_OnPlayerEnter( sceneId, selfId )
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x050100_g_Fuben_Relive_X, x050100_g_Fuben_Relive_Z )
end

--**********************************
--ɱ����������
--**********************************
function x050100_OnKillObject( sceneId, selfId, objdataId, objId )						-- ������˼�������š����objId�������λ�úš�����objId
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		return
	end

	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050100_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- ��������Ѿ����óɹر�״̬����ɱ����Ч
		return
	end

	--ȡ��ɱ�������GroupID
	local GroupID = GetMonsterGroupID( sceneId, objId )
	local killedMonsterIndex, killedCount = 0, 0
	for i = 1, getn( x050100_g_DemandKillGroup ) do
		if GroupID == x050100_g_DemandKillGroup[i] then
			killedMonsterIndex = i
			killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
			LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- ɱ��Bossi������
			break
		end
	end

	if killedMonsterIndex == 0 then													-- ɱ����һ������ع�
		return
	end

	if x050100_g_BossGroup == GroupID then
		local BroadcastMsg = x050100_g_BroadcastMsg[ random( getn(x050100_g_BroadcastMsg) ) ]
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
	end

	local maxKilledCount = x050100_g_DemandKill[killedMonsterIndex].num

	--ȡ�õ�ǰ�����������
	local i, humanObjId, misIndex
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local strText = format( "��ɱ��%s�� %d/%d", GetName( sceneId, objId ), killedCount, maxKilledCount )
	for i = 0, num - 1 do
		humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- ȡ�õ�ǰ�������˵�objId

		if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then						-- ���ڳ����Ĳ����˲���
			x050100_NotifyFailTips( sceneId, humanObjId, strText )
			Msg2Player( sceneId, humanObjId, strText, MSG2PLAYER_PARA )
			misIndex = GetMissionIndexByID( sceneId, humanObjId, x050100_g_MissionId )
			SetMissionByIndex( sceneId, humanObjId, misIndex, killedMonsterIndex, killedCount )	-- ˢ��ɱ������

			-- ɱ�����й�û�з���һ�����������Ӫǰˢ��boss[�඾],ɱ���󸱱�������ɡ�(�඾���ϱص�������ߡ��඾�����ơ�)
			if x050100_g_BossGroup == GroupID then
				-- ɱ����Ҳ���رո�������ΪҪ�������˶������ơ���
				AddMonsterDropItem( sceneId, objId, humanObjId, x050100_g_Token )

				SetMissionByIndex( sceneId, humanObjId, misIndex, x050100_g_IsMissionOkFail, 1 )	-- �������
			end
		end
	end

	-- ɱ����ͼ�����Сboss[αװ���α���ͳ]5����ڵ�ͼ�·�ˢ��10ֻ��·���Ӵܵ�С��
	if x050100_g_LittleBossGroup == GroupID then									-- ɱ����С Boss
		LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- �Ƿ�ɱ��С Boss
	end

	-- ɱ�����й�û�з���һ�����������Ӫǰˢ��boss[�඾]
	local bigBossFlag = 1
	for i = 1, 4 do
		if LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) < x050100_g_DemandKill[i].num then
			bigBossFlag = 0
			break
		end
	end

	if bigBossFlag == 1 then
		if LuaFnGetCopySceneData_Param( sceneId, 15 ) > 0 then					-- ����Ҫ��ˢ Boss ��
			return
		end

		local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
		if not x050100_g_Boss[bossGrade] then
			return
		end

		local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
		local bossId = LuaFnCreateMonster( sceneId, x050100_g_Boss[bossGrade], 55, 67, 14, 126, -1 )
		SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
		SetCharacterTitle(sceneId, bossId, "�߾�����")
		SetMonsterGroupID( sceneId, bossId, x050100_g_BossGroup )
		LuaFnSetCopySceneData_Param( sceneId, 15, 1 )
	end
end

--**********************************
--������ڸ����������¼�
--**********************************
function x050100_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--�뿪����
--**********************************
function x050100_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- ȡ�ø�����ڳ�����
	NewWorld( sceneId, selfId, oldsceneId, x050100_g_Back_X, x050100_g_Back_Z )
end

--**********************************
--����
--**********************************
function x050100_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050100_g_Param_sceneid )


	-- ���÷������������ʱ��
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()											-- ��ǰʱ��
	local CurTime = GetQuarterTime()											-- ��ǰʱ��
	--end modified by zhangguoxin 090207
	SetMissionData( sceneId, selfId, MD_ROUNDMISSION1, CurTime )

	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x050100_g_MissionId )
	
	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050100_g_CopySceneType then											-- ����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		x050100_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x050100_g_Back_X, x050100_g_Back_Z )
	end
end


--**********************************
--����������ʱ���¼�
--**********************************
function x050100_OnCopySceneTimer( sceneId, nowTime )
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

	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )

	if leaveFlag == 1 then															-- ��Ҫ�뿪
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050100_g_CloseTick then										-- ����ʱ�䵽����Ҷ���ȥ��
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_Exit( sceneId, mems[i] )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", ( x050100_g_CloseTick - leaveTickCount ) * x050100_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050100_g_LimitTotalHoldTime then									-- ������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050100_NotifyFailTips( sceneId, mems[i], "����ʱ���ѵ����뿪����...." )
				x050100_Exit( sceneId, mems[i] )
			end
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--��ʱ�������Ա�Ķ���ţ���������ϣ����߳�����
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- ȡ�ñ���Ķ����
		local oldsceneId

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050100_NotifyFailTips( sceneId, mems[i], "�㲻����ȷ�Ķ����У��뿪����...." )
				x050100_Exit( sceneId, mems[i] )
			end
		end

		-- ÿ������ʾ���ʣ��ʱ��
		if mod( x050100_g_TickTime * TickCount, 60 ) < x050100_g_TickTime and TickCount < x050100_g_LimitTotalHoldTime then
			local str = "ʣ�� " .. ( x050100_g_LimitTotalHoldTime - TickCount ) * x050100_g_TickTime / 60 .. " ����..."
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_NotifyFailTips( sceneId, mems[i], str )
				end
			end
		end

		-- ��������15����ʱ���ڶӳ�������ˢ��Сboss��αװ���α�����ͳ
		if TickCount == x050100_g_LoadBossTick then
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			if not x050100_g_LittleBoss[bossGrade] then
				return
			end

			local PosX, PosZ = 55, 66												-- ������ֶ����Ա����Ⱑ�����
			for	i = 0, membercount - 1 do
				PosX, PosZ = LuaFnGetWorldPos( sceneId, mems[i] )					-- �������δ�ҵ��ӳ�������
				if LuaFnIsTeamLeader( sceneId, mems[i] ) == 1 then
					break
				end
			end

			local bossId = LuaFnCreateMonster( sceneId, x050100_g_LittleBoss[bossGrade], PosX, PosZ, 14, 124, -1 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetMonsterGroupID( sceneId, bossId, x050100_g_ViceBossGroup )
		end

		-- ɱ����ͼ�����Сboss[αװ���α���ͳ]5����ڵ�ͼ�·�ˢ��10ֻ��·���Ӵܵ�С��
		local flag = LuaFnGetCopySceneData_Param( sceneId, 12 )
		if flag > 0 then
			if flag == 1 then
				LuaFnSetCopySceneData_Param( sceneId, 12, 2 )						-- ��һ���ٳ�С��
			elseif flag == 2 then
				LuaFnSetCopySceneData_Param( sceneId, 12, 0 )

				local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
				if not x050100_g_Dogface[bossGrade] then
					return
				end

				local dogfaceId = -1
				for i = 1, getn( x050100_g_DogfacePos ) do
					if x050100_g_DogfacePos[i] then
						dogfaceId = LuaFnCreateMonster( sceneId, x050100_g_Dogface[bossGrade], x050100_g_DogfacePos[i][1], x050100_g_DogfacePos[i][2], 1, 4, -1 )
						SetLevel( sceneId, dogfaceId, GetLevel( sceneId, dogfaceId ) + LevelGap )
						SetMonsterGroupID( sceneId, dogfaceId, x050100_g_DogfaceGroup )
						SetPatrolId( sceneId, dogfaceId, x050100_g_DogfacePos[i][3] )		-- ����Ѳ��·��
					end
				end
			end
		end

		-- С����·�ߵ���ָ����������ʧ
		-- ����һ��С�����ߺ�����Ļ�Ϸ���ʾ��ң����Ӵܷ����ӳ�������ͷĿ�ŷ���䣬����ʧ�ܡ���
		local monstercount = GetMonsterCount( sceneId )
		local monsterId, GroupID, DogX, DogZ, misIndex
		local x, z = GetLastPatrolPoint( sceneId, 5 )

		for i = 0, monstercount - 1 do
			monsterId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, monsterId )

			if GroupID == x050100_g_DogfaceGroup
			 and LuaFnIsCharacterLiving( sceneId, monsterId ) == 1 then			-- �жϻ��ŵ�С���Ƿ����ܳɹ�
				DogX, DogZ = GetWorldPos( sceneId, monsterId )

				if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 25 then	-- ���յ㲻�� 5 ��
					if LuaFnGetCopySceneData_Param( sceneId, 14 ) < 1 then		-- ��һ��С������
						LuaFnSetCopySceneData_Param( sceneId, 14, 1 )			-- �Ƿ��Ѿ���С������

						for	i = 0, membercount - 1 do
							if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
								misIndex = GetMissionIndexByID( sceneId, mems[i], x050100_g_MissionId )
								SetMissionByIndex( sceneId, mems[i], misIndex, x050100_g_IsMissionOkFail, 2 )	-- ����ʧ��
								x050100_NotifyFailTips( sceneId, mems[i], "�Ӵܷ����ӳ�������ͷĿ�ŷ���䣬����ʧ�ܡ�" )
							end
						end
					end

					LuaFnDeleteMonster( sceneId, monsterId )
				end
			end
		end

--		if GetMonsterCount( sceneId ) < 1 then
--			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
--		end
	end
end

--**********************************
--����
--**********************************
function x050100_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050100_g_MissionName )
		AddText( sceneId, x050100_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x050100_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )				-- �õ���������к�
	if GetMissionParam( sceneId, selfId, misIndex, x050100_g_IsMissionOkFail ) ~= 1 then
		return 0
	end

	local nItemNum = GetItemCount( sceneId, selfId, x050100_g_Token )
	if nItemNum < 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x050100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x050100_CheckSubmit( sceneId, selfId ) == 1 then
		-- ���۶�����ֱ�����
		x050100_NotifyFailBox( sceneId, selfId, targetId, x050100_g_MissionComplete )
		DelMission( sceneId, selfId, x050100_g_MissionId )
		-- �����ͳ��
		LuaFnAuditQuest(sceneId, selfId, "���ɱ߽�")
		local strText = x050100_g_MissionName .. "��������ɡ�"
		x050100_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	end
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x050100_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x050100_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

