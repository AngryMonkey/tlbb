-- ���˸���

-- �������� ��ɱ̰��
--MisDescBegin
-- �ű���
x600034_g_ScriptId = 600034

--�����
x600034_g_MissionId = 1109

--����Ŀ��npc
x600034_g_Name = "�����"

--�������
x600034_g_MissionKind = 50

--����ȼ�
x600034_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600034_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600034_g_IsMissionOkFail = 0							-- ������ɱ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���
--�����ı�����
x600034_g_MissionName = "��ɱ̰��"
x600034_g_MissionInfo = ""													--��������
x600034_g_MissionTarget = "    ̰��%s%s����%s������ѹ���գ�Թ���ص������Ѿ�������%n�˽⵽���鱨���д���������ͽ������ˡ�"	--����Ŀ��
x600034_g_ContinueInfo = "    �������û�����ô��"						--δ��������npc�Ի�
x600034_g_MissionComplete = "    �ɵò����������á�"						--�������npc˵���Ļ�
x600034_g_MissionRound = 79

-- ͨ�ó�������ű�
x600034_g_CityMissionScript = 600001
x600034_g_MilitaryScript = 600030

x600034_g_StrForePart=4

x600034_g_StrList = {[0]="��",
										 [1]="��",
										 [2]="��",
										 [3]="��",
										 [4]="��",
										 [5]="��",
										 [6]="��",
										 [7]="��",
										 [8]="��",
										 [9]="��",
										 [10]="����",
										 [11]="��������",
										 [12]="����Ժʹ",
										 [13]="����Ժ��ʹ",
										 [14]="��ʷ��ة",
								  	 [15]="��ʷ���",
								  	 [16]="��������",
								  	 [17]="��������",
								  	 [18]="��������",
										 }

--MisDescEnd

x600034_g_Pos = {{x=10,z=11},{x=31,z=13},{x=52,z=11},
								 {x=31,z=27},{x=14,z=34},{x=48,z=34},
								 {x=31,z=40},{x=14,z=49},{x=31,z=45},
								 {x=50,z=49}}

--��������
x600034_g_CopySceneName = "����"
x600034_g_CopySceneType = FUBEN_GUOFANG	--�������ͣ�������ScriptGlobal.lua����
x600034_g_CopySceneMap = "yamen.nav"
x600034_g_LimitMembers = 1					--���Խ���������С��������
x600034_g_TickTime = 5							--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x600034_g_LimitTotalHoldTime = 480	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x600034_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x600034_g_CloseTick = 3							--�����ر�ǰ����ʱ����λ��������
x600034_g_NoUserTime = 10						--������û���˺���Լ��������ʱ�䣨��λ���룩
x600034_g_DeadTrans = 0							--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x600034_g_Fuben_X = 50							--���븱����λ��X
x600034_g_Fuben_Z = 10							--���븱����λ��Z
x600034_g_Back_X = 47								--Դ����λ��X
x600034_g_Back_Z = 92								--Դ����λ��Z
x600034_g_NeedMonsterGroupID = 1		--Boss �����
x600034_g_TotalNeedKillBoss = 11		--��Ҫɱ��Boss����



--**********************************
--������ں���
--**********************************
function x600034_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		-- ��õ�ǰѡ�е�Npc������
		local szCurNpc = GetName(sceneId,targetId)
		
		-- �����м�¼��Npc������
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
		
		local szNpcName = ""
		if nNpcId > 0  then
			_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
			
			if szCurNpc == szNpcName   then  -- �Ҷ�����
				BeginEvent( sceneId )
					AddText( sceneId, "#Y��ɱ̰��" )
					AddText( sceneId, "  �ܺúܺ� �������ڽ����͵��������ţ�ϣ��������������࣡" )
				EndEvent()
				DispatchEventList( sceneId, selfId, targetId )
				
				-- ����������ɱ��
				x600034_AcceptEnterCopyScene( sceneId, selfId )
				return
			end
		end
	end

	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600034_g_MissionName )
			AddText( sceneId, x600034_g_ContinueInfo )
		EndEvent( )
		local bDone = x600034_CheckSubmit( sceneId, selfId )
		
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600034_g_ScriptId, x600034_g_MissionId, bDone )
	--���������������
	elseif x600034_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600034_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600034_OnAccept( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x600034_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end
   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		AddNumText( sceneId, x600034_g_ScriptId, x600034_g_MissionName, 2 )
	end
end

--**********************************
--����
--**********************************
function x600034_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end
	-- ȡ��һ������Ľ��������
	local nLevel = GetLevel(sceneId, selfId)
	local nNpcId = 0
	local szNpcName = ""
	local szScene = ""
	local nScene = 0
	local nPosX = 0
	local nPosZ = 0
	local szNpcDesc =""
	local nSex = 0
	
	--��MissionNpc_HashTable.txt�л��Npc���ݣ�
	nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex = GetOneMissionNpc(42)

	--������������б�
	AddMission( sceneId, selfId, x600034_g_MissionId, x600034_g_ScriptId, 1, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) <= 0 then
		return
	end

	-- �������ҵ���ŵ�
	local nPos  = random( getn(x600034_g_Pos) )

	-- �������ҵ�����
	local nXing = random( 0, 4 )
	local nMing = random( 5, 9 )
	local nZhi  = random( 10, 18 )

	-- �������������Ҫ��עNPC
	SetMissionEvent( sceneId,selfId, x600034_g_MissionId, 4)
	
	-- ��¼�����ѡ�е�NpcId
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 3, nPos)
	SetMissionByIndex(sceneId, selfId, misIndex, 4, nXing)
	SetMissionByIndex(sceneId, selfId, misIndex, 5, nMing)
	SetMissionByIndex(sceneId, selfId, misIndex, 6, nZhi)
	SetMissionByIndex(sceneId, selfId, misIndex, 7, nNpcId)

	CallScriptFunction( x600034_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600034_g_ScriptId )

	--��ʾ���ݸ�������Ѿ�����������
	local nTaSex
	if 	nSex == 0  then
		nTaSex = "��"
	else
		nTaSex = "��"
	end
	
	local missionInfo = "    ̰��" .. x600034_g_StrList[nXing] .. x600034_g_StrList[nMing] ..  
											"����" .. x600034_g_StrList[nZhi] .. "������ѹ���գ�Թ���ص������Ѿ�������"
											 .. szScene .. szNpcName .. "��" .. nPosX .. "��" .. nPosZ .. 
											 "���˽⵽���鱨���д���������ͽ������ˡ�"

	BeginEvent( sceneId )
		AddText( sceneId, "�����������" .. x600034_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����������
--**********************************
function x600034_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600034_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600034_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
	if  GetMissionParam(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail) == 1  then
		return 1
	end 
	return 0
end

--**********************************
--��������
--**********************************
function x600034_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600034_g_MilitaryScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--ɱ����������
--**********************************
function x600034_OnKillObject( sceneId, selfId, objdataId ,objId )

	local monsterName = GetName(sceneId, objId)
	
	-- ʹ�������м�¼�����ж��ǲ���ɱ������
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
	local nXing = GetMissionParam(sceneId, selfId, misIndex, 4)
	local nMing = GetMissionParam(sceneId, selfId, misIndex, 5)
	local szNpcName = x600034_g_StrList[nXing] .. x600034_g_StrList[nMing]

	if monsterName == szNpcName   then
		-- ����������ɱ��
		SetMissionByIndex(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail, 1)
		
		x600034_NotifyFailTips( sceneId, selfId, "��ɱ��" .. monsterName .. "��1/1"  )
		LuaFnSetCopySceneData_Param( sceneId, 11, 1 )
		LuaFnSetCopySceneData_Param( sceneId, 15, selfId )

	end
end

--**********************************
--����
--**********************************
function x600034_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600034_g_MissionName )
		AddText( sceneId, x600034_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600034_g_ScriptId, x600034_g_MissionId )
end

--**********************************
--�ύ
--**********************************
function x600034_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end
	
	if x600034_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600034_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
-- 
--**********************************
function x600034_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

	--�жϵ�ǰ�ĳ����ǲ��Ǹ������Ǹ����ͷ���
	if LuaFnGetSceneType(sceneId) == 1  then
		return
	end

	-- ��õ�ǰѡ�е�Npc������
	local szCurNpc = GetName(sceneId,targetId)
	
	-- �����м�¼��Npc������
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
	local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
	
	local szNpcName = ""
	_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
	
	if GetMissionParam(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail) ~= 1   then
		if szCurNpc == szNpcName   then  -- �Ҷ�����
			TAddNumText(sceneId, x600034_g_ScriptId, "����ȥ����", 10, -1,x600034_g_ScriptId); --[tx42329]
			TDispatchEventList(sceneId, selfId, targetId)
			return 1
		end
		return 0
	end
end

--**********************************
--���ͬ����븱��
--**********************************
function x600034_AcceptEnterCopyScene( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then					--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600034_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
				
		x600034_MakeCopyScene( sceneId, selfId )		
		
	end
	
end

function x600034_MakeCopyScene( sceneId, selfId )

	local mylevel = GetLevel( sceneId, selfId )

	local nPox_X
	local nPos_Z
	nPox_X = GetHumanWorldX(sceneId,selfId)
	nPos_Z = GetHumanWorldZ(sceneId,selfId)

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600034_g_CopySceneMap )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600034_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600034_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600034_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600034_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 6, sceneId )				--��������
	LuaFnSetCopySceneData_Param( sceneId, 7, nPox_X )					--���浱ǰ�������
	LuaFnSetCopySceneData_Param( sceneId, 8, nPos_Z )					--������˴�

	-- ��ո�������
	for k=9, 15  do
		LuaFnSetCopySceneData_Param( sceneId, k, 0 )
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
	
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, "yamen_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yamen_monster_" .. tostring(iniLevel) .. ".ini" )
	--LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --����CopyScene_LevelGap �� scene.lua �и�ֵ
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	
	if bRetSceneID > 0 then
		x600034_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x600034_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end
end

--**********************************
--�����¼�
--**********************************
function x600034_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600034_g_MissionId ) > 0 then			--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600034_g_MissionId )

		-- ��ý��븱����λ��
		local misIndex = GetMissionIndexByID(sceneId,leaderObjId,x600034_g_MissionId)
		local nPos = GetMissionParam(sceneId, leaderObjId, misIndex, 3)
		
		local nFuben_X = x600034_g_Pos[nPos].x
		local nFuben_Z = x600034_g_Pos[nPos].z
		
		NewWorld( sceneId, leaderObjId, destsceneId, nFuben_X, nFuben_Z )

	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x600034_OnPlayerEnter( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, 8, LuaFnGetCopySceneData_Param( sceneId, 8 ) + 1 )

	-- ��Ҫ��������������һЩ�ص�
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "��Ա"  then
		-- ������������������Ϊ��Ҫ�����֣��Ǻ�
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
		local nXing = GetMissionParam(sceneId, selfId, misIndex, 4)
		local nMing = GetMissionParam(sceneId, selfId, misIndex, 5)
		SetCharacterName(sceneId, nMonsterId, x600034_g_StrList[nXing] .. x600034_g_StrList[nMing] )
		end
	end

end

--**********************************
--������ڸ����������¼�
--**********************************
function x600034_OnHumanDie( sceneId, selfId, killerId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )
end

function x600034_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x600034_OnCopySceneTimer( sceneId, nowTime )
	-- ��������������񣬾Ϳ�ʼ����ʱ��֮����ҳ�ȥ
	if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 3  then
		return
	end
	
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1    then
		return
	end
	
	local selfId1 = LuaFnGetCopyScene_HumanObjId(sceneId, 0)
	
	if LuaFnGetCopySceneData_Param( sceneId, 11 ) == 1   then
	
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 0  then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )
			LuaFnSetCopySceneData_Param( sceneId, 13, nowTime )
			if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
				x600034_NotifyFailTips(sceneId, selfId1,"������ɣ��㽫��10��󱻴��ͳ�����")
			end
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 1  then
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 5000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 2 )
				if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
					x600034_NotifyFailTips(sceneId, selfId1,"�㽫��5��󱻴��ͳ�����")
				end
			end
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 2  then   
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 10000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 3 )
				if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
					x600034_BackToCity( sceneId, selfId1 )
				end
			end
		end
		
	end
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600034_BackToCity( sceneId, selfId )

	local nMonsterScene = LuaFnGetCopySceneData_Param( sceneId, 6 )
	local nPos_X = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local nPos_Z = LuaFnGetCopySceneData_Param( sceneId, 8 )

	-- ������ҵ����λ��ȥ
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nMonsterScene, nPos_X, nPos_Z)
end
