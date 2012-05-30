--��������
--ָ�㱾�ɵ���

--************************************************************************
--MisDescBegin

--�ű���
x600025_g_ScriptId = 600025

--�����
x600025_g_MissionId = 1110

--Ŀ��NPC
x600025_g_Name = "١ܽ��"

--����ȼ�
x600025_g_MissionLevel = 10000

--�������
x600025_g_MissionKind = 50

--�Ƿ��Ǿ�Ӣ����
x600025_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��
x600025_g_IsMissionOkFail			=0	--0 ������ɱ��[ֵ���ܱ�]
x600025_g_MissionParam_SubId		=1	--1 ������ű��Ŵ��λ��[ֵ���ܱ�]
x600025_g_MissionParam_KillNumber	=2	--2 ��Ҫ����Ĺ�������
x600025_g_Param_sceneid				=3	--3�ţ���ǰ��������ĳ�����
x600025_g_Param_teamid				=4	--4�ţ��Ӹ�������ʱ��Ķ����
x600025_g_Param_killcount			=5	--5�ţ�ɱ������ֵ�����
x600025_g_Param_time				=6	--6�ţ���ɸ�������ʱ��(��λ����)
--6�ţ�δ��
--7�ţ�δ��

--ѭ�����������������������������Ļ���
x600025_g_MissionRound = 55
--**********************************�����Ƕ�̬****************************

--�����ı�����
x600025_g_MissionName = "��������"
x600025_g_MissionInfo = ""													--��������
x600025_g_MissionTarget = "    ָ���ڳ������б�����ӡ�"					--����Ŀ��
x600025_g_ContinueInfo = "    �������û�����ô��"						--δ��������npc�Ի�
x600025_g_SubmitInfo = "    �����չ����Σ�"								--���δ�ύʱ��npc�Ի�
x600025_g_MissionComplete = "    �����Ǳ����������ӣ���������"			--�������npc˵���Ļ�

x600025_g_Parameter_Kill_CountRandom = { { id = 300469, numNeeded = 2, numKilled = 5 } }

-- ͨ�ó�������ű�
x600025_g_CityMissionScript = 600001
x600025_g_ExpandScript = 600023
x600025_g_TransScript = 400900

--������

--MisDescEnd
--************************************************************************

--��������
x600025_g_CopySceneName = "У��"

x600025_g_CopySceneType = FUBEN_JIAOCHANG	--�������ͣ�������ScriptGlobal.lua����

x600025_g_CopySceneMap = "jiaochang.nav"
x600025_g_Exit = "jiaochang_area.ini"
x600025_g_LimitMembers = 1				--���Խ���������С��������
x600025_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x600025_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x600025_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x600025_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x600025_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x600025_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x600025_g_MonsterCount = 10				--��������
x600025_g_Fuben_X = 31					--���븱����λ��X
x600025_g_Fuben_Z = 13					--���븱����λ��Z
x600025_g_Back_X = 146					--Դ����λ��X
x600025_g_Back_Z = 95					--Դ����λ��Z

--**********************************
--������ں���
--**********************************
function x600025_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600025_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) > 0 then
		local bDone = x600025_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600025_g_SubmitInfo
		else
			strText = x600025_g_ContinueInfo
		end

		if bDone == 0 then												--����δ���
			if GetNumText() == 1 then
				x600025_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x600025_g_MissionName )
					x600025_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--�����Ѿ����
			BeginEvent( sceneId )
				AddText( sceneId, x600025_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600025_g_ScriptId, x600025_g_MissionId, bDone )
		end
	--���������������
	elseif x600025_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600025_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600025_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600025_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600025_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) > 0 then
		AddNumText( sceneId, x600025_g_ScriptId, x600025_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600025_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600025_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x600025_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) <= 0 then	-- û������
		return
	end

	local missionInfo = format( "    У����Щ�µı�����ӣ���ȥָ��һ�����ǰɡ�" )

	AddText( sceneId, missionInfo )
	AddNumText( sceneId, x600025_g_ScriptId, "����У��", 10, 1 )
end

--**********************************
--����
--**********************************
function x600025_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) == 0 then					--û������ſ���������
		if GetLevel( sceneId, selfId ) < 40 then
			CallScriptFunction( x600025_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
			return
		end

		--������������б�
		AddMission( sceneId, selfId, x600025_g_MissionId, x600025_g_ScriptId, 1, 0, 0 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) <= 0 then
			return
		end

		CallScriptFunction( x600025_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600025_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_MissionParam_KillNumber, x600025_g_MonsterCount )	--��Ҫɱ���Ĺ��������������ͻ���ʹ��

		--��ʾ���ݸ�������Ѿ�����������
		BeginEvent( sceneId )
			AddText( sceneId, x600025_g_MissionName )
			x600025_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#r    �����������" .. x600025_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--���ͬ����븱��
--**********************************
function x600025_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) > 0 then					--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600025_g_Param_sceneid )

		--changed by xindefeng
		--�����»���:����ʲôԭ��,��δ��������������,��������������ϵ��������κθĶ�(����ʧ�ܻ���ɾ������),������ٽ��ø���ʱ,��Ҫ���³�ʼ����������,���Ҹ�����Ҫ���´���
		--if copysceneid >= 0 then												--��������
		--	--���Լ����͵���������
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600025_g_Fuben_X, x600025_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_Param_sceneid, -1 )		--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
		
		--add by xindefeng
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_Param_killcount, 0 )	--������ĵ�5����������Ϊ0, �������ɱ����������Ϊ0
		
		x600025_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--��������
--**********************************
function x600025_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600025_g_CopySceneMap )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600025_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600025_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600025_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600025_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 7, x600025_g_MonsterCount )				--ʣ����ӵ�����

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
	
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x600025_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "jiaochang_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x600025_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x600025_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end

end

--**********************************
--�����¼�
--**********************************
function x600025_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600025_g_MissionId ) > 0 then			--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600025_g_MissionId )

		--������ĵ�3����������Ϊ�����ĳ�����
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600025_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600025_g_Fuben_X, x600025_g_Fuben_Z )
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x600025_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) == 0 then				--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		x600025_NotifyFailTips( sceneId, selfId, "�㵱ǰδ�Ӵ�����" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
		return
	end
end

--**********************************
--������ڸ����������¼�
--**********************************
function x600025_OnHumanDie( sceneId, selfId, killerId )
	if x600025_g_DeadTrans == 1 then														--��������Ҫ��ǿ���߳�����
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
	end
end

--**********************************
--����
--**********************************
function x600025_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600025_g_Param_sceneid )

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600025_g_ExpandScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		x600025_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
	end
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600025_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--ȡ�ø�����ڳ�����
	CallScriptFunction( x600025_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
end

--**********************************
--����
--**********************************
function x600025_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600025_g_MissionName )
		AddText( sceneId, x600025_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600025_g_ScriptId, x600025_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600025_CheckSubmit( sceneId, selfId, selectRadioId )
	--�ж������Ƿ��Ѿ����
	local ret = CallScriptFunction( x600025_g_ExpandScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600025_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600025_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600025_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600025_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600025_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600025_g_MissionId ) == 0 then
		return
	end

	--�Ƿ��Ǹ���
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600025_g_MissionId )

	--�Ƿ�������Ҫ�ĸ���
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600025_g_CopySceneType then
		return
	end

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--��������Ѿ����óɹر�״̬����ɱ����Ч
		return
	end

	local monstercount = LuaFnGetCopySceneData_Param( sceneId, 7 )
	monstercount = monstercount - 1
	LuaFnSetCopySceneData_Param( sceneId, 7, monstercount )						--ʣ����ӵ�����
	SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_Param_killcount, x600025_g_MonsterCount - monstercount )	--��ɱ���Ĺ��������������ͻ���ʹ��

	local strText

	if monstercount > 0 then
		strText = format( "ʣ�� %d ������", monstercount )
		x600025_NotifyFailTips( sceneId, selfId, strText )
	else
		--����������ɱ�־
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "������ɣ����� %d ����͵����λ��", x600025_g_CloseTick * x600025_g_TickTime )
		x600025_NotifyFailTips( sceneId, selfId, strText )

		--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600025_g_IsMissionOkFail, 1 )	--������������
	end
end

--**********************************
--���������¼�
--**********************************
function x600025_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600025_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x600025_OnCopySceneTimer( sceneId, nowTime )

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

		if leaveTickCount >= x600025_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--ȡ�ø�����ڳ�����

			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x600025_g_Back_X, x600025_g_Back_Z )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", ( x600025_g_CloseTick - leaveTickCount ) * x600025_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600025_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600025_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
