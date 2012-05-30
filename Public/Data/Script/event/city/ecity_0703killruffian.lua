--��������
--ɱ�����蹤��Ѱ��ͷ��

--************************************************************************
--MisDescBegin

--�ű���
x600039_g_ScriptId = 600039

--�����
x600039_g_MissionId = 1111

--Ŀ��NPC
x600039_g_Name = "֣����"

--����ȼ�
x600039_g_MissionLevel = 10000

--�������
x600039_g_MissionKind = 50

--�Ƿ��Ǿ�Ӣ����
x600039_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��

x600039_g_IsMissionOkFail			=0	--0 ������ɱ��
x600039_g_MissionParam_SubId		=1	--1 ������ű��Ŵ��λ��
x600039_g_Param_sceneid				=2	--2 ��ǰ��������ĳ�����
x600039_g_MissionParam_BossIndex	=3	--3 ĳ Boss ����������
x600039_g_Param_Killed				=4	--4 ��ɱ��������
x600039_g_Param_Needed				=5	--5 ��ɱ��������

--ѭ�����������������������������Ļ���
x600039_g_MissionRound = 59
--**********************************�����Ƕ�̬****************************

--�����ı�����
x600039_g_MissionName = "��������"
x600039_g_MissionInfo = ""													--��������
x600039_g_MissionTarget = "    �ҵ������˳�%s��ͷ�����������Ѱ��С����ɱ�����ǡ�"				--����Ŀ��
x600039_g_ContinueInfo = "    �������û�����ô��"						--δ��������npc�Ի�
x600039_g_SubmitInfo = "    �����չ����Σ�"								--���δ�ύʱ��npc�Ի�
x600039_g_MissionComplete = "    ���ã����ã������Ľ����ּӿ��ˡ�"			--�������npc˵���Ļ�

x600039_g_Parameter_Kill_CountRandom = { { id = 300471, numNeeded = 5, numKilled = 4 } }

x600039_g_StrForePart = 3

x600039_g_StrList = {
	[0 ] = "",
	[1 ] = "С̫��",
	[2 ] = "��̫��",
	[3 ] = "��̫��",
	[4 ] = "��̫��",
	[5 ] = "��ֵ̫��",
	[6 ] = "����̫��",
	[7 ] = "Ѫ��̫��",
	[8 ] = "����̫��",
	[9 ] = "��������",
	[10] = "С����",
	[11] = "������",
	[12] = "������",
	[13] = "������",
	[14] = "��ͷ����",
	[15] = "��������",
	[16] = "���ư���",
	[17] = "��ȭ����",
	[18] = "�ð���",
	[19] = "������",
	[20] = "С����",
	[21] = "������",
	[22] = "�����",
}

-- ͨ�ó�������ű�
x600039_g_CityMissionScript = 600001
x600039_g_ConstructionScript = 600035

--������

--MisDescEnd
--************************************************************************

--��������
x600039_g_CopySceneName = "����"

x600039_g_CopySceneType = FUBEN_GONGDI	--�������ͣ�������ScriptGlobal.lua����

x600039_g_CopySceneMap = "gongdi.nav"
x600039_g_Exit = "gongdi_area.ini"

x600039_g_MonsterCount = 10				--��������

x600039_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x600039_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x600039_g_NoUserTime = 120				--������û���˺���Լ��������ʱ�䣨��λ���룩

x600039_g_BossGroupId = 51				--boss��
x600039_g_Fuben_X = 32					--���븱����λ��X
x600039_g_Fuben_Z = 50					--���븱����λ��Z
x600039_g_Back_X = 100					--Դ����λ��X
x600039_g_Back_Z = 57					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x600039_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then
		local bDone = x600039_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600039_g_SubmitInfo
		else
			strText = x600039_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

		if bDone == 0 then				--����δ���
			if GetNumText() == 1 then	-- �����ǵ�����븱��
				x600039_AcceptEnterCopyScene( sceneId, selfId )
				return
			end

			BeginEvent( sceneId )		-- ��ʾ�����ȡ����
				AddText( sceneId, x600039_g_MissionName )
				x600039_AskEnterCopyScene( sceneId, selfId )
			EndEvent( )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600039_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600039_g_ScriptId, x600039_g_MissionId, bDone )

	--���������������
	elseif x600039_CheckAccept( sceneId, selfId ) > 0 then
		x600039_OnAccept( sceneId, selfId, targetId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x600039_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then
		AddNumText( sceneId, x600039_g_ScriptId, x600039_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600039_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600039_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x600039_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) <= 0 then	-- û������
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	local BossIndex = GetMissionParam( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex )
	local missionInfo = format( "    ���������ɣ����ʱ�佨���ֳ�����һ����Ѱ�����£�Ϊ�׵Ľ����˳�%s����������ǽ�Ѱ����ͳͳ���ɵ���%s����Ҫ���Ͱ���",
		x600039_g_StrList[BossIndex], GetName( sceneId, selfId ) )

	AddText( sceneId, missionInfo )

	AddNumText( sceneId, x600039_g_ScriptId, "���빤��", 10, 1 )
end

--**********************************
--����
--**********************************
function x600039_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then					--û������ſ���������
		if GetLevel( sceneId, selfId ) < 10 then
			CallScriptFunction( x600039_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
			return
		end

		--������������б�
		AddMission( sceneId, selfId, x600039_g_MissionId, x600039_g_ScriptId, 1, 0, 0 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) <= 0 then
			return
		end

		CallScriptFunction( x600039_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600039_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

		--PrintStr( "The count of x600039_g_StrList should be 22, the actual value is " .. getn(x600039_g_StrList) )
		-- ���һ������
		local BossIndex = random( getn(x600039_g_StrList) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex, BossIndex )
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Needed, x600039_g_MonsterCount )		-- �����ͻ���ʹ��

		--��ʾ���ݸ�������Ѿ�����������
		BeginEvent( sceneId )
			AddText( sceneId, x600039_g_MissionName )
			x600039_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#r    �����������" .. x600039_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--���ͬ����븱��
--**********************************
function x600039_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then					--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
		--local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_sceneid )

		--if copysceneid >= 0 and GetMissionParam( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail ) == 0 then												--��������
		--	--���Լ����͵���������
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600039_g_Fuben_X, x600039_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_sceneid, -1 )		--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
		x600039_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--��������
--**********************************
function x600039_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600039_g_CopySceneMap )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600039_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600039_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600039_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600039_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 6, 0 )							--�Ƿ��Ѿ�ɱ����boss
	LuaFnSetCopySceneData_Param( sceneId, 7, x600039_g_MonsterCount )				--ʣ����ӵ�����

 local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
 
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x600039_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "gongdi_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x600039_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x600039_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end

end

--**********************************
--�����¼�
--**********************************
function x600039_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600039_g_MissionId ) > 0 then			--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600039_g_MissionId )

		--������ĵ�2����������Ϊ�����ĳ�����
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600039_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600039_g_Fuben_X, x600039_g_Fuben_Z )
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x600039_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then				--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		x600039_NotifyFailTips( sceneId, selfId, "�㵱ǰδ�Ӵ�����" )
		x600039_BackToCity( sceneId, selfId )
		return
	end

	local monstercount = GetMonsterCount( sceneId )
	local monsterId, i
	for i = 0, monstercount - 1 do
		-- �ҵ� Boss = monsterId
		monsterId = GetMonsterObjID( sceneId, i )
		local GroupID = GetMonsterGroupID( sceneId, monsterId )
		if GroupID == x600039_g_BossGroupId then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
			local BossIndex = GetMissionParam( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex )
			SetCharacterName( sceneId, monsterId, x600039_g_StrList[BossIndex] )
			break
		end
	end
	
	-- hongyu
	-- ����ҽ��볡����ʱ�򣬰���ҵ��������ɱ��������Ϊ 1
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Killed, 0 )	--������������
	-- end
end

--**********************************
--������ڸ����������¼�
--**********************************
function x600039_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����
--**********************************
function x600039_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_sceneid )

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600039_g_ConstructionScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		x600039_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		x600039_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600039_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--ȡ�ø�����ڳ�����
	NewWorld( sceneId, selfId, oldsceneId, x600039_g_Back_X, x600039_g_Back_Z )
end

--**********************************
--����
--**********************************
function x600039_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600039_g_MissionName )
		AddText( sceneId, x600039_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600039_g_ScriptId, x600039_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600039_CheckSubmit( sceneId, selfId, selectRadioId )
	--�ж������Ƿ��Ѿ����
	local ret = CallScriptFunction( x600039_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600039_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600039_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600039_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600039_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then
		return
	end

	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600039_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--��������Ѿ����óɹر�״̬����ɱ����Ч
		return
	end

	local monstercount = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_Killed )
	monstercount = monstercount + 1
	SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Killed, monstercount )	--������������

	local strText = format( "��ɱ��Ѱ���ߣ�%d/%d", monstercount, x600039_g_MonsterCount )
	x600039_NotifyFailTips( sceneId, selfId, strText )

	if monstercount >= x600039_g_MonsterCount then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "������ɣ����� %d ����͵����λ��", x600039_g_CloseTick * x600039_g_TickTime )

		--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail, 1 )	--������������

		x600039_NotifyFailTips( sceneId, selfId, strText )
	end
end

--**********************************
--���������¼�
--**********************************
function x600039_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600039_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x600039_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--�����µĶ�ʱ�����ô���

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

		if leaveTickCount >= x600039_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600039_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", ( x600039_g_CloseTick - leaveTickCount ) * x600039_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600039_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600039_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
