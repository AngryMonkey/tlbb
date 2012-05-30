--��������
--ˮ��
--10������ͷĿ����ͳ��5ֻС��

--************************************************************************
--MisDescBegin
--�ű���
x232002_g_ScriptId	= 232002
--��������
x232002_g_CopySceneName	= "ˮ��"
--�����
x232002_g_MissionId			= 1213
--��һ�������ID
x232002_g_MissionIdPre	= 1212
--Ŀ��NPC
x232002_g_Name					= "������"
--�Ƿ��Ǿ�Ӣ����
x232002_g_IfMissionElite= 1
--����ȼ�
x232002_g_MissionLevel	= 10000
--�������
x232002_g_MissionKind		= 1
--�����ı�����
x232002_g_MissionName			= "ˮ��"
--��������
x232002_g_MissionInfo			= "#{event_xunhuan_0006}"
--����Ŀ��
x232002_g_MissionTarget		= "  ̫��ˮկ�ĺ�����#{_INFOAIM67,77,4,������}����ɱ��10������ͷĿ��50��С���"
--δ��������npc�Ի�
x232002_g_ContinueInfo		= "  ���Ƿ��Ѿ�ɱ��10���׺��ķ���ͷĿ���Լ����С���"
--�������npc˵���Ļ�
x232002_g_MissionComplete	= "  ˮ��������ס�ˣ������Ժ�ǧ���ܵ������ġ�"
--������
x232002_g_MoneyBonus			= 1000
--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--ѭ�����������������������������Ļ��� MD_SHUILAO_HUAN
--�����Ƿ��Ѿ����
--MissionRound =
--**********************************�����Ƕ�̬****************************
--��ɫMission����˵��
x232002_g_IsMissionOkFail	= 0	--0�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x232002_g_MissionRound		= 5	--Define MD_BAIMASI_HUAN from ScriptGlobal.lua
x232002_g_DemandKill			= { {id=367,num=60} }
x232002_g_Param_killcount	= 1	--1�ţ�ɱ������ֵ�����
x232002_g_Param_sceneid		= 2	--2�ţ���ǰ��������ĳ�����
x232002_g_Param_teamid		= 3	--3�ţ��Ӹ�������ʱ��Ķ����
x232002_g_Param_time			= 4	--4�ţ���ɸ�������ʱ��(��λ����)
--6�ţ����帱���¼��ű�ռ��
--7�ţ����帱���¼��ű�ռ��
--MisDescEnd
--************************************************************************

x232002_g_CopySceneType			= FUBEN_SHUILAO	--�������ͣ�������ScriptGlobal.lua����
x232002_g_LimitMembers			= 1		--���Խ���������С��������
x232002_g_TickTime					= 5		--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x232002_g_LimitTotalHoldTime= 360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x232002_g_CloseTick					= 6		--�����ر�ǰ����ʱ����λ��������
x232002_g_NoUserTime				= 300	--������û���˺���Լ��������ʱ�䣨��λ���룩
x232002_g_Fuben_X						= 95	--���븱����λ��X
x232002_g_Fuben_Z						= 89	--���븱����λ��Z
x232002_g_Back_X						= 52	--Դ����λ��X
x232002_g_Back_Z						= 96	--Դ����λ��Z
x232002_g_NeedMonsterGroupID= 1		--��Ҫɱ����Boss��GroupID
x232002_g_TotalNeedKillBoss	= 60	--��Ҫɱ��Boss����

--����������������
x232002_g_keySD					=
{
	["typ"]	= 0,	--���ø�������
	["spt"]	= 1,	--���ø��������¼��ű���
	["tim"]	= 2,	--���ö�ʱ�����ô���
	["scn"]	= 3,	--���ø�����ڳ�����, ��ʼ��
	["cls"]	= 4,	--���ø����رձ�־, 0���ţ�1�ر�
	["dwn"]	= 5,	--�����뿪����ʱ����
	["tem"]	= 6,	--��������
	["kil"]	= 7,	--ɱ��Boss������
	["lev"]	= 8,	--��������Ӧ�ȼ�
}

--��ȡ�������͵ȼ�
x232002_g_minLevel			= 20
--��Ҫ����С����
x232002_g_namMonster		= "��ͨ����"
x232002_g_typMonster		= --��ͨ����10~100��
	{ 2490, 2491, 2492, 2493, 2494,
		2495, 2496, 2497, 2498, 2499 }

--1/20�ļ��ʸ��ڱ�ʯ����
x232002_g_gemList				= { 50101001, 50101002, 50111001, 50111002 }
x232002_g_gemRate				= 20
					
x232002_g_IsMissionOkFailPre	= 0	--0�ţ�ƽ�������Ƿ����(0δ��ɣ�1���)

x232002_g_MaxSameIPNum = 3
--**********************************
--������ں���
--**********************************
function x232002_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x232002_g_Name then
		return
	end

	--�������Ѿ������������
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) > 0 then

		local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
		local	bDone			= x232002_CheckSubmit( sceneId, selfId )
		--����δ���
		if bDone == 0 then
			BeginEvent( sceneId )
				AddText( sceneId, x232002_g_MissionName )
				AddText( sceneId, "  ׼��������" )
			EndEvent()
			DispatchMissionInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )
		--�����Ѿ����
		elseif bDone == 1 then
			BeginEvent( sceneId )
				AddText( sceneId, x232002_g_MissionName )
				AddText( sceneId, x232002_g_ContinueInfo )
				AddMoneyBonus( sceneId, x232002_g_MoneyBonus )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId, bDone )
		end

	else

		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x232002_g_MissionName )
			AddText( sceneId, x232002_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x232002_g_MissionTarget )
			AddText( sceneId, " " )
			AddMoneyBonus( sceneId, x232002_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )

	end

end

--**********************************
--�о��¼�
--**********************************
function x232002_OnEnumerate( sceneId, selfId, targetId )

	if IsHaveMission( sceneId, selfId, x232002_g_MissionIdPre ) == 0 then
		x232002_MsgBox( sceneId, selfId, targetId, "  �ҵ��ֵܺ��ӱ�ȥ���ݰ�ȱ�ȥ�ˣ��㿴��������" )
		return
	else
		if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) == 1 then
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
			local	misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
			if GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail ) == 1
				and GetMissionParam( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre ) == 1 then
					x232002_MsgBox( sceneId, selfId, targetId, "  ����Ի��������ҵ��ֵܺ��ӱ���ȡ�����ˣ�" )
					return
			end
			if GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail ) ~= 1
				and GetMissionParam( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre ) == 2 then
					x232002_MsgBox( sceneId, selfId, targetId, "  ���ź������ƽ������ʧ���ˣ�" )
					return
			end
		end
	end

	AddNumText( sceneId, x232002_g_ScriptId, x232002_g_MissionName, 4, -1 )

end

--**********************************
--����������
--**********************************
function x232002_CheckAccept( sceneId, selfId, targetId )

	if LuaFnGetLevel( sceneId, selfId ) < x232002_g_minLevel then
		x232002_NotifyTip( sceneId, selfId, "���µĵȼ�̫�ͣ����˱Ƚ�������" )
		x232002_NotifyTip( sceneId, selfId, "���ǵ��㵽��"..x232002_g_minLevel.."��֮���������Ұɡ�" )
		return 0
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x232002_NotifyTip( sceneId, selfId, "ˮ�����淸���ڶ࣬��һ�����Ƶ�������" )
		x232002_NotifyTip( sceneId, selfId, "���Ƕ�м������������ɡ�" )
		return 0
	end

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x232002_NotifyTip( sceneId, selfId, "�㲻�Ƕӳ���" )
		x232002_NotifyTip( sceneId, selfId, "ֻ�жӳ����ܾ����Ƿ�����ҵ�ί�С�" )
		return 0
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local	numMem	= GetNearTeamCount( sceneId, selfId )
	if numMem ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x232002_NotifyTip( sceneId, selfId, "���ж�Ա�����Աߡ�" )
		return 0
	end

	if numMem < x232002_g_LimitMembers then
		x232002_NotifyTip( sceneId, selfId, "ˮ�����淸���ڶ࣬" )
		x232002_NotifyTip( sceneId, selfId, "�������ǵ���"..x232002_g_LimitMembers.."λͬ���Ҳŷ���������ȥ��" )
		return 0
	end

	--���С�����Ƿ����������¼����, �����Ƿ��Ѿ��ӹ�������
	local member
	local i
	local misIndex
	--����IP�ж�
	local hostIp=""
	local IPList={}
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x232002_g_MissionIdPre ) <= 0 then
			x232002_NotifyTip( sceneId, selfId, "����������û�н�ˮ������" )
			return 0
		end

		misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionIdPre )
		if GetMissionParam( sceneId, member, misIndex, 6 ) ~= 1 then
			x232002_NotifyTip( sceneId, selfId, "���������˽��˱��ƽ������" )
			return 0
		end
		
		if GetMissionParam( sceneId, member, misIndex, x232002_g_IsMissionOkFailPre ) == 1 then
			x232002_NotifyTip( sceneId, selfId, "�������Ѿ����������ƽ������" )
			x232002_MsgBox( sceneId, selfId, targetId, "  �ǳ���л������ƽ����ˮ�ε����ң���ص��������ҵ��ֵ���ȡ�����ɣ�СС���ﲻ�ɾ��⡣" )
			return 0
		end

		if GetMissionParam( sceneId, member, misIndex, x232002_g_IsMissionOkFail ) == 1 then
			x232002_NotifyTip( sceneId, selfId, "�����������Ѿ�������������" )
			return 0
		end

		--�����������������Ƿ�ﵽ����20��
		if GetMissionCount( sceneId, member ) >= 20 then
			x232002_NotifyTip( sceneId, selfId, "���������˵������¼������" )
			return 0
		end

		if IsHaveMission( sceneId, member, x232002_g_MissionId ) > 0 then
			--�����Ƿ��Ѿ��ӹ��������������һ������
			x232002_NotifyTip( sceneId, selfId, "�����������Ѿ����˴�����" )
			return 0
		end
		
		hostIp = GetHostIP(sceneId, member)
		IPList[i]=hostIp
		
	end
	local sameIPNum = 1
	for	i=0, numMem-1 do
		local nTemp = 1
		for j=0,numMem-1 do
			if IPList[i] == IPList[j] and i ~= j then
				nTemp = nTemp + 1
			end
		end
		if sameIPNum < nTemp then
			sameIPNum = nTemp
		end			
	end

	if sameIPNum >= x232002_g_MaxSameIPNum then
		--x232002_NotifyTip( sceneId, selfId, "#{SLIP_090714_1}" )
		x232002_MsgBox( sceneId, selfId, targetId, "#{SLIP_090714_1}" )
		return 0
	end

	return 1
end

--**********************************
--����
--**********************************
function x232002_OnAccept( sceneId, selfId, targetId )

	local teamid = GetTeamId( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) > 0 then
		local misIndex 		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
		local misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
		local copysceneid	= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid )
		local saveteamid	= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_teamid )
		--��������
		if copysceneid >= 0 and teamid == saveteamid then
			--���Լ����͵���������
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x232002_g_Fuben_X, x232002_g_Fuben_Z )
			else
				x232002_NotifyTip( sceneId, selfId, "����ʧ�ܣ���������½�ȡ" )
				SetMissionByIndex( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail, 2 )
				SetMissionByIndex( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre, 2 )
			end
			return
		end
	end

	--�жϽ�������
	if x232002_CheckAccept( sceneId, selfId, targetId ) == 0 then
		return
	end

	--������������б�
	--ȡ����Ҹ����Ķ��������������Լ���
	local numMem	= GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		--��ÿ�������Ա��������
		AddMission( sceneId, member, x232002_g_MissionId, x232002_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionId )
		--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_IsMissionOkFail, 0 )
		--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_sceneid, -1 )
		--������ĵ�3�����ݶ����
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_teamid, teamid )
		
		misIndexPre = GetMissionIndexByID( sceneId, member, x232002_g_MissionIdPre )
		SetMissionByIndex( sceneId, member, misIndexPre, x232002_g_IsMissionOkFailPre, 1 )
	end

	x232002_MakeCopyScene( sceneId, selfId, numMem )
end

--**********************************
--����
--**********************************
function x232002_OnAbandon( sceneId, selfId )

	local misIndex		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	local copyscene		= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid )

	x232002_NotifyTip( sceneId, selfId, "����ʧ�ܣ�" )
	x232002_MissionFailExe( sceneId, selfId )

	--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
	if sceneId == copyscene then
		--ȡ�ø�����ڳ�����
		local	oldsceneId	= LuaFnGetCopySceneData_Param( sceneId, 3 )
		NewWorld( sceneId, selfId, oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
	end

end

--**********************************
--��������
--**********************************
function x232002_MakeCopyScene( sceneId, selfId, nearmembercount )

	--ָ������
	local	param0	= 4;
	local	param1	= 3;

	--���ս��
	local	mylevel	= 0;

	--��ʱ����
	local mems		= {};
	local	tempMemlevel = 0;
	local	level0 = 0;
	local	level1 = 0;
	for	i = 0, nearmembercount - 1 do
		mems[i]	= GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, mems[i]);
		level0	= level0 + (tempMemlevel ^ param0);
		level1	= level1 + (tempMemlevel ^ param1);
	end

	if level1 == 0 then
		mylevel = x232002_g_minLevel;
	else
		mylevel = level0/level1;
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetSceneLoad_Map( sceneId, "shuilao.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x232002_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x232002_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["typ"], x232002_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["spt"], x232002_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["kil"], 0 )

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 10;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) * 10;
	else
		iniLevel = PlayerMaxLevel;
	end
	LuaFnSetSceneLoad_Monster( sceneId, "shuilao_monster_" .. iniLevel .. ".ini" )
	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel )	--����CopyScene_LevelGap �� scene.lua �и�ֵ
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["lev"], mylevel )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )	--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x232002_NotifyTip( sceneId, selfId, "���������ɹ���" )
	else
		--x232002_NotifyTip( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )

		--ɾ����������б��ж�Ӧ������
		for	i=0, nearmembercount-1 do
			x232002_NotifyTip( sceneId, mems[i], "���������Ѵ����ޣ����Ժ����ԣ�" )
			DelMission( sceneId, mems[i], x232002_g_MissionId )
			
			misIndexPre	= GetMissionIndexByID( sceneId, mems[i], x232002_g_MissionIdPre )
			SetMissionByIndex( sceneId, mems[i], misIndexPre, x232002_g_IsMissionOkFailPre, 0 )
		end
	end

end

--**********************************
--����
--**********************************
function x232002_OnContinue( sceneId, selfId, targetId )

	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid ) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  ��ϲ���㽫�õ�#{_MONEY"..x232002_g_MoneyBonus.."}�Ľ�����" )
		EndEvent( sceneId )
		DispatchMissionContinueInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )
	end

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x232002_CheckSubmit( sceneId, selfId, selectRadioId )

	--�ж������Ƿ��Ѿ����
	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	local	ret				= GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail )
	if ret == 1 then
		return 1
	else
		return 0
	end

end

--**********************************
--�ύ
--**********************************
function x232002_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x232002_g_Name then
		return
	end

	--�Ѿ����������
	if x232002_CheckSubmit( sceneId, selfId, selectRadioId ) > 0 then
		--ȡ���ܹ������Ļ���
		--local iHuan	= GetMissionData( sceneId, selfId, 10 )

		--������
		AddMoney( sceneId, selfId, x232002_g_MoneyBonus )
		nSeed	= random( getn( x232002_g_gemList ) )
		sName	= GetName( sceneId, selfId )
		if random( x232002_g_gemRate ) == 1 then
			nPos		= LuaFnTryRecieveItem( sceneId, selfId, x232002_g_gemList[ nSeed ], 1 )
			if nPos ~= -1 then
				sTran	= GetBagItemTransfer( sceneId, selfId, nPos )
				if random( 2 ) == 1 then
					AddGlobalCountNews( sceneId, "#{_INFOUSR"..sName.."}��ƽ��ˮ�������й����ر�����#{_INFOMSG"..sTran.."}һ�š�" )
				else
					AddGlobalCountNews( sceneId, "#{_INFOUSR"..sName.."}ƽ��ˮ��֮����ˮ�εĽ������淢����һ��#{_INFOMSG"..sTran.."}��" )
				end
			end
		end

		BeginEvent( sceneId )
			AddText( sceneId, x232002_g_MissionComplete )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		--���������Ѿ�����ɹ�
		DelMission( sceneId, selfId, x232002_g_MissionId )
		--�õ���������к�
		local	misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
		--�������кŰ���������ĵ�1λ��1 (����������)
		SetMissionByIndex( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre, 1 )
	end

end

--**********************************
--ɱ����������
--**********************************
function x232002_OnKillObject( sceneId, selfId, objdataId, objId )

	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x232002_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	--��������Ѿ����óɹر�״̬����ɱ����Ч
	if leaveFlag == 1 then
		return
	end

	--ȡ�õ�ǰ�����������
	local num = LuaFnGetCopyScene_HumanCount( sceneId )

	--ȡ��ɱ�������GroupID,�����ж��Ƿ�������Ҫɱ����Boss
	local GroupID = GetMonsterGroupID( sceneId, objId )
	--��������Ҫ��Boss
	if GetMonsterNamebyDataId( objdataId ) ~= x232002_g_namMonster and GroupID ~= x232002_g_NeedMonsterGroupID then
		return
	end

	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, 7 )			--ɱ��Boss������
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, 7, killedbossnumber )					--����ɱ��Boss������

	local i
	local misIndex
	local humanObjId
	--local killedcount

	if killedbossnumber < x232002_g_TotalNeedKillBoss then

		local strText = format( "��ɱ�������� %d/%d", killedbossnumber, x232002_g_TotalNeedKillBoss )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--ȡ�õ�ǰ�������˵�objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then					--���ڳ����Ĳ����˲���
				x232002_NotifyTip( sceneId, humanObjId, strText )

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x232002_g_MissionId )					--ȡ��������������ֵ
				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x232002_g_Param_killcount )	--ȡ���Ѿ�ɱ�˵Ĺ�����
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_killcount, killedbossnumber )	--������������
			end
		end
	elseif killedbossnumber >= x232002_g_TotalNeedKillBoss then
		--����������ɱ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		--ȡ���Ѿ�ִ�еĶ�ʱ����
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "��ɱ�������� %d/%d", x232002_g_TotalNeedKillBoss, x232002_g_TotalNeedKillBoss )
		local strText2 = format( "������ɣ�����%d����͵����λ��", x232002_g_CloseTick * x232002_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--ȡ�õ�ǰ�������˵�objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then										--���ڳ����Ĳ����˲���
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x232002_g_MissionId)					--ȡ��������������ֵ

				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x232002_g_Param_killcount )	--ȡ���Ѿ�ɱ�˵Ĺ�����
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_killcount, x232002_g_TotalNeedKillBoss )	--������������

				--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_IsMissionOkFail, 1 )					--������������
				--��ɸ�������ʱ��
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_time, TickCount * x232002_g_TickTime )	--������������

				x232002_NotifyTip( sceneId, humanObjId, strText )
				x232002_NotifyTip( sceneId, humanObjId, strText2 )
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x232002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x232002_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x232002_OnCopySceneReady( sceneId, destsceneId )

	--���ø�����ڳ�����
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )

	local leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )
	--�Ҳ��������
	if leaderObjId == -1 then
		return
	end

	--�����޷�ִ���߼���״̬
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )

	if numMem < x232002_g_LimitMembers then
		x232002_NotifyTip( sceneId, leaderObjId, "��Ķ����������㡣" )
		return
	end

	local member
	local misIndex
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- ���ڿ���ִ���߼���״̬
			if IsHaveMission( sceneId, member, x232002_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionId )

				--������ĵ�2����������Ϊ�����ĳ�����
				SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x232002_g_Fuben_X, x232002_g_Fuben_Z )
			else
				x232002_NotifyTip( sceneId, member, "�㵱ǰδ�Ӵ�����" )
			end
		end
	end

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x232002_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) == 0 then				--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		x232002_NotifyTip( sceneId, selfId, "�㵱ǰδ�Ӵ�����" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
		return
	end

	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x232002_g_Fuben_X, x232002_g_Fuben_Z )
end

--**********************************
--������ڸ����������¼�
--**********************************
function x232002_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x232002_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	--ȡ���Ѿ�ִ�еĶ�ʱ����
	local TickCount	= LuaFnGetCopySceneData_Param( sceneId, x232002_g_keySD["tim"] )
	TickCount = TickCount + 1
	--�����µĶ�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tim"], TickCount )

	if TickCount == 1 then
		--�ոտ�������ʱ����ÿ��Boss��Χˢ����ֻС��
		local	iniLevel= LuaFnGetCopySceneData_Param( sceneId, x232002_g_keySD["lev"] )
		x232002_RefreshMonster( sceneId, iniLevel )
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--��Ҫ�뿪
	if leaveFlag == 1 then
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x232002_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--ȡ�ø�����ڳ�����

			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
				end
			end
		elseif leaveTickCount < x232002_g_CloseTick then
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫��%d����뿪����!", (x232002_g_CloseTick-leaveTickCount) * x232002_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x232002_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == 1 then
		local	CloseMin	= floor( x232002_g_LimitTotalHoldTime * x232002_g_TickTime / 60 )
		if CloseMin > 0 then
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x232002_NotifyTip( sceneId, mems[i], "��������"..CloseMin.."���Ӻ�ر�!" )
				end
			end
		end
	elseif TickCount >= x232002_g_LimitTotalHoldTime then						--������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x232002_NotifyTip( sceneId, mems[i], "����ʧ�ܣ���ʱ!" )
				--����ʧ��,ɾ��֮
				x232002_MissionFailExe( sceneId, mems[i] )
			end
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--��ʱ�������Ա�Ķ���ţ���������ϣ����߳�����
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )		--ȡ�ñ���Ķ����
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x232002_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					--����ʧ��,ɾ��֮
					x232002_NotifyTip( sceneId, mems[i], "����ʧ�ܣ��㲻����ȷ�Ķ�����!" )
					x232002_MissionFailExe( sceneId, mems[i] )

					oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--ȡ�ø�����ڳ�����
					NewWorld( sceneId, mems[i], oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
				end
			end
		end

	end
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x232002_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x232002_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--��ÿ��Boss��Χˢ����ֻС��
--**********************************
function x232002_RefreshMonster( sceneId, iniLevel )

	local	ini		= floor( iniLevel / 10 )
	if ini <= 0 then
		ini	= 1
	elseif ini > 10 then
		ini	= 10
	end
	local	typ		= x232002_g_typMonster[ini]	--������
	local	nai		= 0													--���ܱ��
	local	px, py														--����λ��

	--ȡ�ô˳����еĹ�������
	local	numMon= GetMonsterCount( sceneId )
	--�����ObjId
	local idMon
	--����ֲ�
	local	lstLay	= { {-1,-1}, {1,-1}, {-1,1}, {1,1}, {0,0} }
	for i=0, numMon-1 do
		idMon				= GetMonsterObjID( sceneId, i )
		local	x, y
		x, y				= LuaFnGetWorldPos( sceneId, idMon )
		
		--�����ܱ�С��
		local	objId
		local	untLay
		for _, untLay in lstLay do
			px	= floor( x ) + untLay[1]
			py	= floor( y ) + untLay[2]
			objId = LuaFnCreateMonster( sceneId, typ, px, py, nai, -1, -1 )
			SetLevel( sceneId, objId, iniLevel )
		end
	end

end

--**********************************
--����ʧ��
--**********************************
function x232002_MissionFailExe( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x232002_g_MissionId )
	DelMission( sceneId, selfId, x232002_g_MissionIdPre )

	x232002_NotifyTip( sceneId, selfId, "����ϵͳ�Զ�ɾ����" )
	
	--�õ�����
	local	MissionRound= GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )
	--��������1
	-- SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, MissionRound + 1 )

end
