--��������
--ָ�㱾�ɵ���

--************************************************************************
--MisDescBegin

--�ű���
x600037_g_ScriptId = 600037

--�����
x600037_g_MissionId = 1112

--�������
x600037_g_UpMissionId = 1111

--����ȼ�
x600037_g_MissionLevel = 10000

--�������
x600037_g_MissionKind = 50

--�Ƿ��Ǿ�Ӣ����
x600037_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��
x600037_g_IsMissionOkFail			=0	--0 ������ɱ��[ֵ���ܱ�]
x600037_g_MissionParam_SubId		=1	--1 ������ű��Ŵ��λ��[ֵ���ܱ�]
x600037_g_MissionParam_KillNumber	=2	--2 ��Ҫ����Ĺ�������
x600037_g_Param_sceneid				=3	--3�ţ���ǰ��������ĳ�����
x600037_g_Param_killcount			=4	--4�ţ�ɱ������ֵ�����
--6�ţ�δ��
--7�ţ�δ��

--**********************************�����Ƕ�̬****************************

--�����ı�����
x600037_g_MissionName = "���˳�ͷ"
x600037_g_MissionInfo = ""													--��������
x600037_g_MissionTarget = "    ���������ߡ�"								--����Ŀ��

x600037_g_Parameter_Kill_CountRandom = { { id = 300470, numNeeded = 2, numKilled = 4 } }

-- ͨ�ó�������ű�
x600037_g_CityMissionScript = 600001
x600037_g_ConstructionScript = 600035
x600037_g_TransScript = 400900

--������

--MisDescEnd
--************************************************************************

--��������
x600037_g_CopySceneName = "�м�"

x600037_g_CopySceneType = FUBEN_SHIJI2	--�������ͣ�������ScriptGlobal.lua����

x600037_g_CopySceneMap = "shiji_2.nav"
x600037_g_Exit = "shiji_2_area.ini"
x600037_g_LimitMembers = 1				--���Խ���������С��������
x600037_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x600037_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x600037_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x600037_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x600037_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x600037_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x600037_g_MonsterCount = 10				--��������
x600037_g_Fuben_X = 43					--���븱����λ��X
x600037_g_Fuben_Z = 45					--���븱����λ��Z

x600037_g_MonsterGroupId = 1			--��ͨ��
x600037_g_BossGroupId = 2				--boss��

--**********************************
--������ں���
--**********************************
function x600037_OnDefaultEvent( sceneId, selfId, targetId )
	--ֻ�н��˴���������߽������������ʱ���Զ�ɾ����Ҳ�����ߵ�����
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) > 0 then
		x600037_AcceptEnterCopyScene( sceneId, selfId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x600037_OnEnumerate( sceneId, selfId, targetId )
	TAddText( sceneId, x600037_g_MissionName )
	x600037_AskEnterCopyScene( sceneId, selfId )
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x600037_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) <= 0 then	-- û������
		return
	end

	local PlayerGender = GetSex( sceneId, selfId )
	local rank

	if PlayerGender == 0 then
		rank = "��Ů"
	elseif PlayerGender == 1 then
		rank = "����"
	else
		rank = "����"
	end

	local missionInfo = format( "    �趫�����ǲ��ѣ�������������Ҫ�����鷳������" .. rank .. "���ҳ�ͷ��" )

	TAddText( sceneId, missionInfo )
	TAddNumText( sceneId, x600037_g_ScriptId, "�����м�", 10, 1, x600037_g_ScriptId )
end

--**********************************
--���ͬ����븱��
--**********************************
function x600037_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) > 0 then					--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600037_g_Param_sceneid )

		if copysceneid >= 0 then												--��������
			--���Լ����͵���������
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x600037_g_Fuben_X, x600037_g_Fuben_Z )
				return
			end
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_Param_sceneid, -1 )		--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
		x600037_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--��������
--**********************************
function x600037_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600037_g_CopySceneMap )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600037_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600037_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600037_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600037_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 6, x600037_g_MonsterCount )				--ʣ����������

	local x, z = LuaFnGetWorldPos( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, 7, x )							--��ҳ���ʱ���λ��
	LuaFnSetCopySceneData_Param( sceneId, 8, z )							--��ҳ���ʱ���λ��

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x600037_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "shiji_2_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x600037_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x600037_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end

end

--**********************************
--�����¼�
--**********************************
function x600037_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600037_g_MissionId ) > 0 then			--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600037_g_MissionId )

		--������ĵ�3����������Ϊ�����ĳ�����
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600037_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600037_g_Fuben_X, x600037_g_Fuben_Z )
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x600037_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--������ڸ����������¼�
--**********************************
function x600037_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����
--**********************************
function x600037_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600037_g_Param_sceneid )

	if IsHaveMission( sceneId, selfId, x600037_g_UpMissionId ) > 0 then				--���������ó�ʧ��
		misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_UpMissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_IsMissionOkFail, 2 )
		ResetMissionEvent( sceneId, selfId, x600037_g_UpMissionId, 4 )
	end

	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x600037_g_MissionId )

	if sceneId == copyscene then											--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		x600037_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		x600037_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600037_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--ȡ�ø�����ڳ�����
	local x = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local z = LuaFnGetCopySceneData_Param( sceneId, 8 )
	CallScriptFunction( x600037_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--ɱ����������
--**********************************
function x600037_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) == 0 then
		return
	end

	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600037_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--��������Ѿ����óɹر�״̬����ɱ����Ч
		return
	end

	local monstercount = LuaFnGetCopySceneData_Param( sceneId, 6 )
	monstercount = monstercount - 1
	LuaFnSetCopySceneData_Param( sceneId, 6, monstercount )						--ʣ����ӵ�����
	SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_Param_killcount, x600037_g_MonsterCount - monstercount )	--��ɱ���Ĺ��������������ͻ���ʹ��

	local strText

	if monstercount > 0 then
		strText = format( "ʣ�� %d ��������", monstercount )
		x600037_NotifyFailTips( sceneId, selfId, strText )
	else
		--����������ɱ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "������ɣ����� %d ����͵����λ��", x600037_g_CloseTick * x600037_g_TickTime )
		x600037_NotifyFailTips( sceneId, selfId, strText )

		if IsHaveMission( sceneId, selfId, x600037_g_UpMissionId ) > 0 then				--�����������½׶�
			misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_UpMissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, 2, 4 )
		end

		--ɾ����������б��ж�Ӧ������
		DelMission( sceneId, selfId, x600037_g_MissionId )
	end
end

--**********************************
--���������¼�
--**********************************
function x600037_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600037_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x600037_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--�����µĶ�ʱ�����ô���

	-- �� Boss ��ǿ
	if TickCount == 1 then
		local monstercount = GetMonsterCount( sceneId )
		local monsterId
		for i = 0, monstercount - 1 do
			-- �ҵ� Boss = monsterId
			monsterId = GetMonsterObjID( sceneId, i )
			local GroupID = GetMonsterGroupID( sceneId, monsterId )
			if GroupID == x600037_g_BossGroupId then
				local maxHP = LuaFnGetMaxBaseHp( sceneId, monsterId )
				maxHP = floor( maxHP * 0.3 )
				maxHP = maxHP + LuaFnGetLifeTimeAttrRefix_MaxHP( sceneId, monsterId )
				LuaFnSetLifeTimeAttrRefix_MaxHP( sceneId, monsterId, maxHP )
				RestoreHp( sceneId, monsterId )
				break
			end
		end
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--��Ҫ�뿪
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x600037_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600037_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", ( x600037_g_CloseTick - leaveTickCount ) * x600037_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600037_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600037_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
