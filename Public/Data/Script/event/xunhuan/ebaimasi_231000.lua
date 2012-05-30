--��������
--ˮ��

--************************************************************************
--MisDescBegin

--�ű���
x231000_g_ScriptId = 231000

--��������
x231000_g_CopySceneName="ˮ��"

--�����
x231000_g_MissionId = 4012

--��һ�������ID
x231000_g_MissionIdPre = 4011

--Ŀ��NPC
x231000_g_Name = "���"

--�Ƿ��Ǿ�Ӣ����
x231000_g_IfMissionElite = 1

--����ȼ�
x231000_g_MissionLevel = 10000

--�������
x231000_g_MissionKind = 1

--�����ı�����
x231000_g_MissionName="ˮ��"
x231000_g_MissionInfo="ˮ������10������ͷĿ�����׺���ֻҪ������ͳͳɱ�������ܽ����з����Ʒ���"  --��������
x231000_g_MissionTarget="ɱ��10������ͷĿ"	--����Ŀ��
x231000_g_ContinueInfo="���Ѿ�ɱ��10������ͷĿ����"	--δ��������npc�Ի�
x231000_g_MissionComplete="ˮ��������ס�ˣ������Ժ�ǧ���ܵ������ġ�"	--�������npc˵���Ļ�

--������
x231000_g_MoneyBonus=5000

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--ѭ�����������������������������Ļ��� MD_SHUILAO_HUAN
--�����Ƿ��Ѿ����
--MissionRound =
--**********************************�����Ƕ�̬****************************
--��ɫMission����˵��
x231000_g_IsMissionOkFail	= 0	--0�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x231000_g_MissionRound		= 5	--Define MD_BAIMASI_HUAN from ScriptGlobal.lua
x231000_g_DemandKill			= { {id=367,num=10} }
x231000_g_Param_killcount	= 1	--1�ţ�ɱ������ֵ�����
x231000_g_Param_sceneid		= 2	--2�ţ���ǰ��������ĳ�����
x231000_g_Param_teamid		= 3	--3�ţ��Ӹ�������ʱ��Ķ����
x231000_g_Param_time			= 4	--4�ţ���ɸ�������ʱ��(��λ����)
--6�ţ����帱���¼��ű�ռ��
--7�ţ����帱���¼��ű�ռ��
--MisDescEnd
--************************************************************************

x231000_g_CopySceneType=FUBEN_SHUILAO	--�������ͣ�������ScriptGlobal.lua����
x231000_g_LimitMembers=1			--���Խ���������С��������
x231000_g_TickTime=5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x231000_g_LimitTotalHoldTime=360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x231000_g_LimitTimeSuccess=500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x231000_g_CloseTick=6				--�����ر�ǰ����ʱ����λ��������
x231000_g_NoUserTime=300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x231000_g_Fuben_X=95				--���븱����λ��X
x231000_g_Fuben_Z=89				--���븱����λ��Z
x231000_g_Back_X=234				--Դ����λ��X
x231000_g_Back_Z=69					--Դ����λ��Z
x231000_g_NeedMonsterGroupID=1		--��Ҫɱ����Boss��GroupID
x231000_g_TotalNeedKillBoss=10		--��Ҫɱ��Boss����

--**********************************
--������ں���
--**********************************
function x231000_OnDefaultEvent( sceneId, selfId, targetId )

	if GetName( sceneId, targetId ) ~= x231000_g_Name then						--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) > 0 then			--�������Ѿ������������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
		local bDone = x231000_CheckSubmit( sceneId, selfId )
		if bDone == 0 then												--����δ���
			BeginEvent( sceneId )
				AddText( sceneId, x231000_g_MissionName )
				AddText( sceneId, "׼��������" )
			EndEvent( )
			DispatchMissionInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId )
		elseif bDone == 1 then											--�����Ѿ����
			BeginEvent( sceneId )
				AddText( sceneId, x231000_g_MissionName )
				AddText( sceneId, x231000_g_ContinueInfo )
				AddMoneyBonus( sceneId, x231000_g_MoneyBonus )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId, bDone )
		end
--elseif x231000_CheckAccept( sceneId, selfId ) > 0 then						--û���������������������
	else
		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x231000_g_MissionName )
			AddText( sceneId, x231000_g_MissionInfo )
			AddText( sceneId, "����Ŀ�꣺" )
			AddText( sceneId, x231000_g_MissionTarget )
			AddText( sceneId, " " )
			AddMoneyBonus( sceneId, x231000_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x231000_OnEnumerate( sceneId, selfId, targetId )
	--����ѽӴ�����������������������
--if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) > 0 or x231000_CheckAccept( sceneId, selfId ) > 0 then
	if IsHaveMission( sceneId, selfId, x231000_g_MissionIdPre ) == 0 then
		x231000_MsgBox( sceneId, selfId, targetId, "  �����µ������ʦ�ڵ��㣡" )
		return
	else
		local	misIndex	= GetMissionIndexByID( sceneId, selfId, x231000_g_MissionIdPre )
		if GetMissionParam( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail ) == 1 then
			x231000_MsgBox( sceneId, selfId, targetId, "  ����Իذ������������ʦ��ȡ�����ˣ�" )
			return
		end
	end
	
	AddNumText( sceneId, x231000_g_ScriptId, x231000_g_MissionName,4,-1 )
end

--**********************************
--����������
--**********************************
function x231000_CheckAccept( sceneId, selfId )
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x231000_NotifyFailTips( sceneId, selfId, "����Ҫ����һ֧���顣" )
		return 0
	end

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x231000_NotifyFailTips( sceneId, selfId, "�㲻�Ƕӳ���" )
		return 0
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x231000_NotifyFailTips( sceneId, selfId, "���ж�Ա�����Աߡ�" )
		return 0
	end

	if nearteammembercount < x231000_g_LimitMembers then
		x231000_NotifyFailTips( sceneId, selfId, "��Ķ����������㡣" )
		return 0
	end

	--���С�����Ƿ����������¼����, �����Ƿ��Ѿ��ӹ�������
	local member
	local i
	local misIndex

	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x231000_g_MissionIdPre ) <= 0 then
			x231000_NotifyFailTips( sceneId, selfId, "����������û�нӰ���������" )
			return 0
		end

		misIndex = GetMissionIndexByID( sceneId, member, x231000_g_MissionIdPre )
		if GetMissionParam( sceneId, member, misIndex, 6 ) ~= 1 then
			x231000_NotifyFailTips( sceneId, selfId, "���������˽��˱�İ���������" )
			return 0
		end

		if GetMissionParam( sceneId, member, misIndex, x231000_g_IsMissionOkFail ) == 1 then
			x231000_NotifyFailTips( sceneId, selfId, "�����������Ѿ�������������" )
			return 0
		end

		if GetMissionCount( sceneId, member ) >= 20 then						--�����������������Ƿ�ﵽ����20��
			x231000_NotifyFailTips( sceneId, selfId, "���������˵������¼������" )
			return 0
		end

		if IsHaveMission( sceneId, member, x231000_g_MissionId ) > 0 then
			--�����Ƿ��Ѿ��ӹ��������������һ������
			x231000_NotifyFailTips( sceneId, selfId, "�����������Ѿ����˴�����" )
			return 0
		end
	end

	return 1
end

--**********************************
--����
--**********************************
function x231000_OnAccept( sceneId, selfId )

	local teamid = GetTeamId( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) > 0 then					--�Ѿ��������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_sceneid )
		local saveteamid = GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_teamid )

		if copysceneid >= 0 and teamid == saveteamid then						--��������
			--���Լ����͵���������
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x231000_g_Fuben_X, x231000_g_Fuben_Z )
			else
				x231000_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ���������½�ȡ" )
				SetMissionByIndex( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail, 2 )
			end

			return
		end
	end

	--������������б�
	if x231000_CheckAccept( sceneId, selfId ) == 0 then									--�жϽ�������
		return
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		--��ÿ�������Ա��������
		AddMission( sceneId, member, x231000_g_MissionId, x231000_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x231000_g_MissionId )

		SetMissionByIndex( sceneId, member, misIndex, x231000_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex( sceneId, member, misIndex, x231000_g_Param_sceneid, -1 )		--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
		SetMissionByIndex( sceneId, member, misIndex, x231000_g_Param_teamid, teamid )	--������ĵ�3�����ݶ����
	end

	x231000_MakeCopyScene( sceneId, selfId, nearteammembercount )
end

--**********************************
--����
--**********************************
function x231000_OnAbandon( sceneId, selfId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_sceneid )

	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x231000_g_MissionId )

	if sceneId == copyscene then											--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		x231000_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
	end
end

--**********************************
--��������
--**********************************
function x231000_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

	for	i=0, nearmembercount-1 do
		mems[i] = GetNearTeamMember( sceneId, selfId, i )
		mylevel = mylevel + GetLevel( sceneId, mems[i] )
	end

	mylevel = mylevel/nearmembercount

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, "shuilao.nav" )							--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x231000_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x231000_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x231000_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x231000_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--��������
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--ɱ��Boss������

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Monster( sceneId, "shuilao_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x231000_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x231000_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )

		--ɾ����������б��ж�Ӧ������
		for	i=0, nearmembercount-1 do
			DelMission( sceneId, mems[i], x231000_g_MissionId )
		end
	end

end

--**********************************
--����
--**********************************
function x231000_OnContinue( sceneId, selfId, targetId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x231000_g_Param_sceneid ) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "��ϲ���㽫�õ�#{_MONEY"..x231000_g_MoneyBonus.."}�Ľ�����" )
		EndEvent( sceneId )
		DispatchMissionContinueInfo( sceneId, selfId, targetId, x231000_g_ScriptId, x231000_g_MissionId )
	end
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x231000_CheckSubmit( sceneId, selfId, selectRadioId )
	--�ж������Ƿ��Ѿ����
	local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionId )
	local	ret	= GetMissionParam( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail )
	if ret == 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x231000_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if GetName( sceneId, targetId ) ~= x231000_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x231000_CheckSubmit( sceneId, selfId, selectRadioId ) > 0 then					--�Ѿ����������
		--local iHuan = GetMissionData( sceneId, selfId, 10 )					--ȡ���ܹ������Ļ���
		--���������
		local money = x231000_g_MoneyBonus
		AddMoney( sceneId, selfId, money )
		BeginEvent( sceneId )
			AddText( sceneId, x231000_g_MissionComplete )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		--���������Ѿ�����ɹ�
		DelMission( sceneId, selfId, x231000_g_MissionId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231000_g_MissionIdPre )	--�õ���������к�
		SetMissionByIndex( sceneId, selfId, misIndex, x231000_g_IsMissionOkFail, 1 )	--�������кŰ���������ĵ�1λ��1 (����������)
	end
end

--**********************************
--ɱ����������
--**********************************
function x231000_OnKillObject( sceneId, selfId, objdataId, objId )

	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x231000_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--��������Ѿ����óɹر�״̬����ɱ����Ч
		return
	end

	--ȡ�õ�ǰ�����������
	local num = LuaFnGetCopyScene_HumanCount( sceneId )

	--ȡ��ɱ�������GroupID,�����ж��Ƿ�������Ҫɱ����Boss
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID ~= x231000_g_NeedMonsterGroupID then										--��������Ҫ��Boss
		return
	end

	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, 7 )			--ɱ��Boss������
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, 7, killedbossnumber )					--����ɱ��Boss������

	local i
	local misIndex
	local humanObjId
	--local killedcount

	if killedbossnumber < x231000_g_TotalNeedKillBoss then

		local strText = format( "��ɱ�������� %d/%d", killedbossnumber, x231000_g_TotalNeedKillBoss )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--ȡ�õ�ǰ�������˵�objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then					--���ڳ����Ĳ����˲���
				x231000_NotifyFailTips( sceneId, humanObjId, strText )

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x231000_g_MissionId )					--ȡ��������������ֵ
				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231000_g_Param_killcount )	--ȡ���Ѿ�ɱ�˵Ĺ�����
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_Param_killcount, killedbossnumber )	--������������
			end
		end
	elseif killedbossnumber >= x231000_g_TotalNeedKillBoss then
		--����������ɱ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		--ȡ���Ѿ�ִ�еĶ�ʱ����
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "��ɱ�������� %d/%d", x231000_g_TotalNeedKillBoss, x231000_g_TotalNeedKillBoss )
		local strText2 = format( "������ɣ�����%d����͵����λ��", x231000_g_CloseTick * x231000_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--ȡ�õ�ǰ�������˵�objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then										--���ڳ����Ĳ����˲���
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x231000_g_MissionId)					--ȡ��������������ֵ

				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231000_g_Param_killcount )	--ȡ���Ѿ�ɱ�˵Ĺ�����
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_Param_killcount, x231000_g_TotalNeedKillBoss )	--������������

				--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_IsMissionOkFail, 1 )					--������������
				--��ɸ�������ʱ��
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231000_g_Param_time, TickCount * x231000_g_TickTime )	--������������

				x231000_NotifyFailTips( sceneId, humanObjId, strText )
				x231000_NotifyFailTips( sceneId, humanObjId, strText2 )
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x231000_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x231000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x231000_OnCopySceneReady( sceneId, destsceneId )

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
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )

	if nearteammembercount < x231000_g_LimitMembers then
		x231000_NotifyFailTips( sceneId, leaderObjId, "��Ķ����������㡣" )
		return
	end

	local member
	local misIndex
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- ���ڿ���ִ���߼���״̬
			if IsHaveMission( sceneId, member, x231000_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x231000_g_MissionId )

				--������ĵ�2����������Ϊ�����ĳ�����
				SetMissionByIndex( sceneId, member, misIndex, x231000_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x231000_g_Fuben_X, x231000_g_Fuben_Z )
			else
				x231000_NotifyFailTips( sceneId, member, "�㵱ǰδ�Ӵ�����" )
			end
		end
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x231000_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x231000_g_MissionId ) == 0 then				--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		x231000_NotifyFailTips( sceneId, selfId, "�㵱ǰδ�Ӵ�����" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
		return
	end

	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x231000_g_Fuben_X, x231000_g_Fuben_Z )
end

--**********************************
--������ڸ����������¼�
--**********************************
function x231000_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x231000_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--�����µĶ�ʱ�����ô���

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--��Ҫ�뿪
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x231000_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--ȡ�ø�����ڳ�����

			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
				end
			end
		elseif leaveTickCount < x231000_g_CloseTick then
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫��%d����뿪����!", (x231000_g_CloseTick-leaveTickCount) * x231000_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x231000_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x231000_g_LimitTimeSuccess then
		--�˴�������ʱ�����Ƶ�������ɴ���
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x231000_NotifyFailTips( sceneId, mems[i], "����ʱ�䵽�����!" )

				misIndex = GetMissionIndexByID( sceneId, mems[i], x231000_g_MissionId )		--ȡ��������������ֵ
				--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
				SetMissionByIndex( sceneId, mems[i], misIndex, x231000_g_IsMissionOkFail, 1 )		--������������
				--��ɸ�������ʱ��
				SetMissionByIndex( sceneId, mems[i], misIndex, x231000_g_Param_time, TickCount * x231000_g_TickTime )	--������������
			end
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == x231000_g_LimitTotalHoldTime then									--������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x231000_g_MissionId )							--����ʧ��,ɾ��֮
				x231000_NotifyFailTips( sceneId, mems[i], "����ʧ�ܣ���ʱ!" )
			end
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--��ʱ�������Ա�Ķ���ţ���������ϣ����߳�����
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					--ȡ�ñ���Ķ����
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x231000_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					DelMission( sceneId, mems[i], x231000_g_MissionId )						--����ʧ��,ɾ��֮
					x231000_NotifyFailTips( sceneId, mems[i], "����ʧ�ܣ��㲻����ȷ�Ķ�����!" )

					oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--ȡ�ø�����ڳ�����
					NewWorld( sceneId, mems[i], oldsceneId, x231000_g_Back_X, x231000_g_Back_Z )
				end
			end
		end

	end
end

function x231000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x231000_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
