-- ��������
-- �͵�����

--************************************************************************
--MisDescBegin

--�ű���
x228903_g_ScriptId = 228903

--�����
x228903_g_MissionId = 947

-- ǰ������
x228903_g_PreMissionId = 946

-- Ŀ�� NPC
x228903_g_Position_X = 262
x228903_g_Position_Z = 46
x228903_g_SceneID = 18
x228903_g_AccomplishNPC_Name = "������"

--Ŀ��NPC
x228903_g_Name = "������"

--����ȼ�
x228903_g_MissionLevel = 30

--�������
x228903_g_MissionKind = 28

--�Ƿ��Ǿ�Ӣ����
x228903_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��
x228903_g_IsMissionOkFail			=0	--0 ������ɱ��
x228903_g_DemandKill				= { { id = 540, num = 1 }, { id = 541, num = 4 } }		--������1λ
x228903_g_Param_QinNumber			=1	--1 ��Ҫɱ���ز�������
x228903_g_Param_LubaNumber			=2	--2 ��Ҫ������ؼ�կ·������
x228903_g_MonsterList				= { [x228903_g_Param_QinNumber] = { "�ز���", 1 }, [x228903_g_Param_LubaNumber] = { "�ؼ�կ·��", 4 } }
x228903_g_Param_sceneid				=3	--3�ţ���ǰ��������ĳ�����
x228903_g_Param_teamid				=4	--4�ţ��Ӹ�������ʱ��Ķ����

--**********************************�����Ƕ�̬****************************

--�����ı�����
x228903_g_MissionName = "�͵�����"
x228903_g_MissionInfo = "#{TIANSHAN_SKILL_03}"													--��������
x228903_g_MissionTarget = "    #G���Ź�#W��#R������#W#{_INFOAIM263,46,18,������}Ҫ�������Ź�̫�ظ���ɱ���ز���������ؼ�կ·�ԡ�"		--����Ŀ��
x228903_g_ContinueInfo = "#{TIANSHAN_SKILL_04}"								--δ��������npc�Ի�
x228903_g_MissionComplete = "#{TIANSHAN_SKILL_05}"							--�������npc˵���Ļ�

--������
x228903_g_MoneyBonus = 1000
x228903_g_exp = 2000

--MisDescEnd
--************************************************************************

x228903_g_TransScript = 400900

--��������
x228903_g_CopySceneName = "���Ź�̫�ظ�"

x228903_g_CopySceneType = FUBEN_YMGTAISHOUFU	--�������ͣ�������ScriptGlobal.lua����

x228903_g_CopySceneMap = "yamen.nav"
x228903_g_Monster = "yamentianshanmis_monster.ini"
x228903_g_Exit = "yamentianshanmis_area.ini"
x228903_g_LimitMembers = 3				--���Խ���������С��������
x228903_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x228903_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x228903_g_NoUserTime = 10				--������û���˺���Լ��������ʱ�䣨��λ���룩
x228903_g_Fuben_X = 32					--���븱����λ��X
x228903_g_Fuben_Z = 48					--���븱����λ��Z
x228903_g_Back_X = 259					--Դ����λ��X
x228903_g_Back_Z = 49					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x228903_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		local bDone = x228903_CheckSubmit( sceneId, selfId )

		if bDone == 0 then												--����δ���
			if GetNumText() == 1 then
				x228903_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x228903_g_MissionName )
					x228903_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--�����Ѿ����
			BeginEvent( sceneId )
				AddText( sceneId, x228903_g_MissionName )
				AddText( sceneId, x228903_g_ContinueInfo )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId, bDone )
		end
	--���������������
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			AddText( sceneId, x228903_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228903_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228903_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x228903_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 3, -1 )
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_MissionName, 3, -1 )
	end
end

--**********************************
--����������
--**********************************
function x228903_CheckAccept( sceneId, selfId )
	if IsMissionHaveDone( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if IsMissionHaveDone( sceneId, selfId, x228903_g_PreMissionId ) <= 0 then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end

	return 1
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x228903_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then	-- û������
		return
	end

	AddText( sceneId, x228903_g_MissionInfo )
	AddText( sceneId, "#{M_MUBIAO}" )
	AddText( sceneId, x228903_g_MissionTarget )
	AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 10, 1 )
end

--**********************************
--����
--**********************************
function x228903_OnAccept( sceneId, selfId, targetId )
	if x228903_CheckAccept( sceneId, selfId ) == 1 then					--û������ſ���������
		--������������б�
		AddMission( sceneId, selfId, x228903_g_MissionId, x228903_g_ScriptId, 1, 0, 0 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then
			return
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		--��ʾ���ݸ�������Ѿ�����������
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			x228903_AskEnterCopyScene( sceneId, selfId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--��ʾ���ݸ�������Ѿ�����������
		x228903_NotifyFailTips( sceneId, selfId, "�����������" .. x228903_g_MissionName )
		Msg2Player( sceneId, selfId, "#Y��������" .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--���ͬ����븱��
--**********************************
function x228903_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then					--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "����Ҫ����һ֧���顣" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "������Ƕӳ���" )
			return
		end

		--ȡ����Ҹ����Ķ��������������Լ���
		local nearteammembercount = GetNearTeamCount( sceneId, selfId )
		if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
			x228903_NotifyFailTips( sceneId, selfId, "��Ķ�Ա�����ڸ���������Э���㡣" )
			return
		end

		if nearteammembercount < x228903_g_LimitMembers then
			x228903_NotifyFailTips( sceneId, selfId, "��������Ҫ 2 ����Ա�������㡣" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_Param_sceneid, -1 )		--������ĵ�3����������Ϊ-1, ���ڱ��渱���ĳ�����
		x228903_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--��������
--**********************************
function x228903_MakeCopyScene( sceneId, selfId )
	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x228903_g_CopySceneMap )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x228903_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x228903_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x228903_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x228903_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--��������
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--ɱ��Boss������
	LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							--ɱ��·�Ե�����

	LuaFnSetSceneLoad_Area( sceneId, x228903_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, x228903_g_Monster )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, 0 )			--����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x228903_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x228903_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end
end

--**********************************
--�����¼�
--**********************************
function x228903_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsObjValid( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "����Ҫ����һ֧���顣" )
		return
	end

	if LuaFnIsTeamLeader( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "������Ƕӳ���" )
		return
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	if nearteammembercount < x228903_g_LimitMembers then
		x228903_NotifyFailTips( sceneId, leaderObjId, "��Ķ����������㡣" )
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x228903_g_MissionId ) > 0 then			--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x228903_g_MissionId )

		--������ĵ�2����������Ϊ�����ĳ�����
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x228903_g_Param_sceneid, destsceneId )

		local i = 0
		local member
		for i = 0, nearteammembercount - 1 do
			member = GetNearTeamMember( sceneId, leaderObjId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then			-- ���ڿ���ִ���߼���״̬
				NewWorld( sceneId, member, destsceneId, x228903_g_Fuben_X, x228903_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x228903_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--������ڸ����������¼�
--**********************************
function x228903_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����
--**********************************
function x228903_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then				--������ſ���������
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x228903_g_Param_sceneid )

	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x228903_g_MissionId )
	x228903_NotifyFailTips( sceneId, selfId, "����ʧ��" )
end

--**********************************
--����
--**********************************
function x228903_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x228903_g_MissionName )
		AddText( sceneId, x228903_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x228903_CheckSubmit( sceneId, selfId, selectRadioId )
	--�ж������Ƿ��Ѿ����
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228903_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )				-- �õ���������к�
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--�ύ
--**********************************
function x228903_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x228903_CheckSubmit( sceneId, selfId ) == 1 then
		--���������
		AddMoney( sceneId, selfId, x228903_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x228903_g_exp )

		DelMission( sceneId, selfId, x228903_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId, selfId, x228903_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y�������" .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--ɱ����������
--**********************************
function x228903_OnKillObject( sceneId, selfId, objdataId, objId )
	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x228903_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--��������Ѿ����óɹر�״̬����ɱ����Ч
		return
	end

	local paramIndex = 0
	local monsterName = GetMonsterNamebyDataId( objdataId )
	if monsterName == x228903_g_MonsterList[x228903_g_Param_QinNumber][1] then
		paramIndex = x228903_g_Param_QinNumber
	elseif monsterName == x228903_g_MonsterList[x228903_g_Param_LubaNumber][1] then
		paramIndex = x228903_g_Param_LubaNumber
	else
		return
	end

	local num = GetMonsterOwnerCount( sceneId, objId )
	local ownerid = -1
	local strText = "��ɱ��" .. monsterName .. "��%d/" .. x228903_g_MonsterList[paramIndex][2]
	local bFinished = 0

	for i = 0, num - 1 do
		ownerid = GetMonsterOwnerID( sceneId, objId, i )

		-- ����û���������
		if ownerid and ownerid > 0 and IsHaveMission( sceneId, ownerid, x228903_g_MissionId ) > 0 then
			local misIndex = GetMissionIndexByID( sceneId, ownerid, x228903_g_MissionId )
			local count = GetMissionParam( sceneId, ownerid, misIndex, paramIndex ) + 1
			SetMissionByIndex( sceneId, ownerid, misIndex, paramIndex, count )
			local strText1 = format( strText, count )
			x228903_NotifyFailTips( sceneId, ownerid, strText1 )

			if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_QinNumber ) >=
				x228903_g_MonsterList[x228903_g_Param_QinNumber][2] then
				if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_LubaNumber ) >=
					x228903_g_MonsterList[x228903_g_Param_LubaNumber][2] then
						SetMissionByIndex( sceneId, ownerid, misIndex, x228903_g_IsMissionOkFail, 1 )
						x228903_NotifyFailTips( sceneId, ownerid, "�������" )
						bFinished = 1
				end
			end
		end
	end

	if bFinished == 1 then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local member
		strText = format( "�㽫�� %d ����뿪����", x228903_g_CloseTick * x228903_g_TickTime )

		for i = 0, membercount - 1 do
			member = LuaFnGetCopyScene_HumanObjId( sceneId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then
				x228903_NotifyFailTips( sceneId, member, strText )
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x228903_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x228903_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x228903_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--�����µĶ�ʱ�����ô���

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	-- û���˵�ʱ��رո���
	if leaveFlag == 1 then															--��Ҫ�뿪
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x228903_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_OnEnterArea( sceneId, mems[i] )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", ( x228903_g_CloseTick - leaveTickCount ) * x228903_g_TickTime )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	else
		local monstercount = GetMonsterCount( sceneId )
		if monstercount <= 0 then
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", x228903_g_CloseTick * x228903_g_TickTime )
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end

			return
		end
	end
end

-- ��ҽ��봫�͵�
function x228903_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x228903_g_TransScript, "TransferFunc", sceneId, selfId, x228903_g_SceneID, x228903_g_Back_X, x228903_g_Back_Z )
end

-- ���ͣ���ڴ��͵�
function x228903_OnTimer( sceneId, selfId )
	return
end

-- ����뿪���͵�
function x228903_OnLeaveArea( sceneId, selfId )
	return
end

function x228903_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
