-- ���˸���

-- ��������׷����ͽ
--MisDescBegin
-- �ű���
x600032_g_ScriptId = 600032

--�����
x600032_g_MissionId = 1109

--����Ŀ��npc
x600032_g_Name = "�����"

--�������
x600032_g_MissionKind = 50

--����ȼ�
x600032_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600032_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600032_g_IsMissionOkFail = 0							-- ������ɱ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���
--�����ı�����
x600032_g_MissionName = "׷����ͽ"
x600032_g_MissionInfo = ""													--��������
x600032_g_MissionTarget = "    �Ұ����%s%1s����ȡ�˱�����Ҫ�鱨������ȥ�ҵ�%2n������Э�����ǵ��ж��ġ�"	--����Ŀ��
x600032_g_ContinueInfo = "    �������û�����ô��"						--δ��������npc�Ի�
x600032_g_MissionComplete = "    �ɵò����������á�"						--�������npc˵���Ļ�

x600032_g_MissionRound = 79

-- ͨ�ó�������ű�
x600032_g_CityMissionScript = 600001
x600032_g_MilitaryScript = 600030

--��ʽ�ַ����е�����, ��ʾ��4��ʼ,�����λ��SetMissionByIndex(...)�Ķ��ٶ���
x600032_g_StrForePart=5
x600032_g_StrList = {[0] = "˾��",
										 [1] = "˾��", 
										 [2] = "ŷ��", 
										 [3] = "���", 
										 [4] = "����", 
										 [5] = "�׶�", 
										 [6] = "С��", 
										 [7] = "�Ҷ�", 
										 [8] = "С��", 
										 [9] = "����",
										 }

								 			
--MisDescEnd

x600032_g_EnterPos = {{x=28,z=52},{x=19,z=42},{x=45,z=47},
								 			{x=42,z=46},{x=26,z=46},{x=14,z=40},
								 			{x=45,z=48},{x=29,z=49},{x=42,z=47}}

-- �����Nav�ļ��ͳ���������Ҫ�ֶ���Ӧ
x600032_g_CopySceneMap = {"tongrenxiang_1.nav","guangmingdong_1.nav","jiujiao_1.nav",
											 "lingxingfeng_1.nav","taohuazhen_1.nav","wushendong_1.nav",
											 "tadi_1.nav","zhemeifeng_1.nav","gudi_1.nav"}
x600032_g_CopyName  = {"ͭ����","������","�ƽ�",
											 "���Է�","�һ���","����",
											 "����","��÷��","�ȵ�"}
x600032_g_CopyNpc		= {"tongrenxiang_1_monster","guangmingdong_1_monster","jiujiao_1_monster",
											 "lingxingfeng_1_monster","taohuazhen_1_monster","wushendong_1_monster",
											 "tadi_1_monster","zhemeifeng_1_monster","gudi_1_monster"}

x600032_g_CopyArea	= {"tongrenxiang_1_area.ini","guangmingdong_1_area.ini","jiujiao_1_area.ini",
											 "lingxingfeng_1_area.ini","taohuazhen_1_area.ini","wushendong_1_area.ini",
											 "tadi_1_area.ini","zhemeifeng_1_area.ini","gudi_1_area.ini"}
--��������
x600032_g_CopySceneName = "ͭ����"
x600032_g_CopySceneType = FUBEN_GUOFANG	--�������ͣ�������ScriptGlobal.lua����
--x600032_g_CopySceneMap = "tadi_1.nav"
x600032_g_LimitMembers = 1					--���Խ���������С��������
x600032_g_TickTime = 5							--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x600032_g_LimitTotalHoldTime = 480	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x600032_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x600032_g_CloseTick = 3							--�����ر�ǰ����ʱ����λ��������
x600032_g_NoUserTime = 10						--������û���˺���Լ��������ʱ�䣨��λ���룩
x600032_g_DeadTrans = 0							--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x600032_g_Fuben_X = 0								--���븱����λ��X
x600032_g_Fuben_Z = 0								--���븱����λ��Z
x600032_g_Back_X = 47								--Դ����λ��X
x600032_g_Back_Z = 92								--Դ����λ��Z
x600032_g_NeedMonsterGroupID = 1		--Boss �����
x600032_g_TotalNeedKillBoss = 11		--��Ҫɱ��Boss����


--**********************************
--������ں���
--**********************************
function x600032_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	if IsHaveMission( sceneId, selfId, x600032_g_MissionId ) > 0 then
		-- ��õ�ǰѡ�е�Npc������
		local szCurNpc = GetName(sceneId,targetId)
		
		-- �����м�¼��Npc������
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600032_g_MissionId)
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
		
		local szNpcName = ""
		if nNpcId > 0  then
			_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
			
			if szCurNpc == szNpcName   then  -- �Ҷ�����
				BeginEvent( sceneId )
					AddText( sceneId, "#Y׷����ͽ" )
					AddText( sceneId, "  �ܺúܺ� �������ڽ����͵��������ϣ��������������飡" )
				EndEvent()
				DispatchEventList( sceneId, selfId, targetId )
				
				-- ����������ɱ��
				local nCopyId = GetMissionParam(sceneId, selfId, misIndex, 4)
				x600032_AcceptEnterCopyScene( sceneId, selfId, nCopyId )
				return
			end
		end
		
	end

	if GetName( sceneId, targetId ) ~= x600032_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600032_g_MissionId ) > 0 then
		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600032_g_MissionName )
			AddText( sceneId, x600032_g_ContinueInfo )
		EndEvent( )
		local bDone = x600032_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600032_g_ScriptId, x600032_g_MissionId, bDone )
	--���������������
	elseif x600032_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600032_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600032_OnAccept( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x600032_OnEnumerate( sceneId, selfId, targetId )

	if GetName( sceneId, targetId ) ~= x600032_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600032_g_MissionId ) > 0 then
		AddNumText( sceneId, x600032_g_ScriptId, x600032_g_MissionName, 2 )
	end
	
end

--**********************************
--����
--**********************************
function x600032_OnAccept( sceneId, selfId, targetId )
	
	if GetName( sceneId, targetId ) ~= x600032_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
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

	nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex = GetOneMissionNpc(25)

	--������������б�
	AddMission( sceneId, selfId, x600032_g_MissionId, x600032_g_ScriptId, 1, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600032_g_MissionId ) <= 0 then
		return
	end

	-- �������ҵ�����
	local nXing = random( 0, 4 )
	local nMing = random( 5, 9 )
	
	-- �������������Ҫ��עNPC
	SetMissionEvent( sceneId,selfId, x600032_g_MissionId, 4)
	
	-- ��¼�����ѡ�е�NpcId
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600032_g_MissionId)
	SetMissionByIndex(sceneId, selfId, misIndex, 4, nScene)
	SetMissionByIndex(sceneId, selfId, misIndex, 5, nXing)
	SetMissionByIndex(sceneId, selfId, misIndex, 6, nMing)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 7, nNpcId)
	
	-- ���õ�3λΪ��ɱ�־
	SetMissionByIndex(sceneId, selfId, misIndex, 3, 0)

	CallScriptFunction( x600032_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600032_g_ScriptId )

	--��ʾ���ݸ�������Ѿ�����������
	local nTaSex
	if 	nSex == 0  then
		nTaSex = "��"
	else
		nTaSex = "��"
	end
	
	local missionInfo = "    �Ұ����" .. x600032_g_StrList[nXing] .. x600032_g_StrList[nMing] ..  ",��ȡ�˱�����Ҫ�鱨������ȥ�ҵ�" .. szScene .. szNpcName .. "��" .. nTaSex .. "��Э�����ǵ��ж��ġ�"
	BeginEvent( sceneId )
		AddText( sceneId, "�����������" .. x600032_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����������
--**********************************
function x600032_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600032_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600032_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600032_g_MissionId )
	if  GetMissionParam(sceneId, selfId, misIndex, 0) >0  then
		return 1
	end 
	return 0
end

--**********************************
--��������
--**********************************
function x600032_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������		
	CallScriptFunction( x600032_g_MilitaryScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--ɱ����������
--**********************************
function x600032_OnKillObject( sceneId, selfId, objdataId ,objId )

	local monsterName = GetName(sceneId, objId)
	
	-- ʹ�������м�¼�����ж��ǲ���ɱ������
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600032_g_MissionId )
	local nXing = GetMissionParam(sceneId, selfId, misIndex, 5)
	local nMing = GetMissionParam(sceneId, selfId, misIndex, 6)
	local szNpcName = x600032_g_StrList[nXing] .. x600032_g_StrList[nMing]

	if monsterName == szNpcName   then
		-- ����������ص�������Ʒ
		-- ����������ɱ��
		SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
		x600032_NotifyFailTips( sceneId, selfId, "��ɱ��" .. monsterName .. "��1/1"  )
		LuaFnSetCopySceneData_Param( sceneId, 11, 1 )
		LuaFnSetCopySceneData_Param( sceneId, 15, selfId )

	end
end

--**********************************
--����
--**********************************
function x600032_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600032_g_MissionName )
		AddText( sceneId, x600032_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600032_g_ScriptId, x600032_g_MissionId )
end

--**********************************
--�ύ
--**********************************
function x600032_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if GetName( sceneId, targetId ) ~= x600032_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end
	
	if x600032_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600032_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
-- 
--**********************************
function x600032_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

	--�жϵ�ǰ�ĳ����ǲ��Ǹ������Ǹ����ͷ���
	if LuaFnGetSceneType(sceneId) == 1  then
		return
	end
	
	-- ��õ�ǰѡ�е�Npc������
	local szCurNpc = GetName(sceneId,targetId)
	
	-- �����м�¼��Npc������
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600032_g_MissionId)
	local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
	
	local szNpcName = ""
	_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
	
	if GetMissionParam(sceneId, selfId, misIndex, x600032_g_IsMissionOkFail) ~= 1   then
		if szCurNpc == szNpcName   then  -- �Ҷ�����
			TAddNumText(sceneId, x600032_g_ScriptId, x600032_g_MissionName, 2, -1,x600032_g_ScriptId);
			TDispatchEventList(sceneId, selfId, targetId)
			return 1
		end
		return 0
	end
end

--**********************************
--���ͬ����븱��
--**********************************
function x600032_AcceptEnterCopyScene( sceneId, selfId, nCopyId )
	
	if IsHaveMission( sceneId, selfId, x600032_g_MissionId ) > 0 then					--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600032_g_MissionId )		
		SetMissionByIndex( sceneId, selfId, misIndex, x600032_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����		
						
		x600032_MakeCopyScene( sceneId, selfId, nCopyId )
	end

end

function x600032_MakeCopyScene( sceneId, selfId, nCopyId )

	-- �����ҵĸ����ĺ�
	local mylevel = GetLevel( sceneId, selfId )
	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	
	--������Ϸ���������ȷ��������������
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600032_g_MissionId)
	local nScene = GetMissionParam(sceneId, selfId, misIndex, 4);
	local nXing  = GetMissionParam(sceneId, selfId, misIndex, 5);
	local nMing  = GetMissionParam(sceneId, selfId, misIndex, 6);
	local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7);
	local nMenpai = -1;
	
	if     nScene == 9    then
		nMenpai = 1
	elseif nScene == 10   then
		nMenpai = 3
	elseif nScene == 11   then
		nMenpai = 2
	elseif nScene == 12   then
		nMenpai = 4
	elseif nScene == 13   then
		nMenpai = 7
	elseif nScene == 14   then
		nMenpai = 9
	elseif nScene == 15   then
		nMenpai = 5
	elseif nScene == 16   then
		nMenpai = 6
	elseif nScene == 17   then
		nMenpai = 8
	end
	
	if nMenpai<1 or nMenpai>9    then
		return
	end
	
	local nPox_X
	local nPos_Z
	nPox_X = GetHumanWorldX(sceneId,selfId)
	nPos_Z = GetHumanWorldZ(sceneId,selfId)

	LuaFnSetSceneLoad_Map( sceneId, x600032_g_CopySceneMap[nMenpai] )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600032_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600032_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600032_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600032_g_ScriptId )					--��1����������Ϊ���������¼��ű���
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

	LuaFnSetSceneLoad_Area( sceneId, x600032_g_CopyArea[nMenpai] )
	LuaFnSetSceneLoad_Monster( sceneId, x600032_g_CopyNpc[nMenpai] .. "_" .. tostring(iniLevel) .. ".ini")

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	
	if bRetSceneID > 0 then
		x600032_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x600032_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end
end

--**********************************
--�����¼�
--**********************************
function x600032_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600032_g_MissionId ) > 0 then			--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600032_g_MissionId )

		-- Ѱ�Ҹ������ֵ���ŵ�
		local misIndex = GetMissionIndexByID(sceneId,leaderObjId,x600032_g_MissionId)
		local nScene = GetMissionParam(sceneId, leaderObjId, misIndex, 4)
		
		if     nScene == 9    then
			nMenpai = 1
		elseif nScene == 10   then
			nMenpai = 3
		elseif nScene == 11   then
			nMenpai = 2
		elseif nScene == 12   then
			nMenpai = 4
		elseif nScene == 13   then
			nMenpai = 7
		elseif nScene == 14   then
			nMenpai = 9
		elseif nScene == 15   then
			nMenpai = 5
		elseif nScene == 16   then
			nMenpai = 6
		elseif nScene == 17   then
			nMenpai = 8
		end
		
		local nFuben_X = x600032_g_EnterPos[nMenpai].x
		local nFuben_Z = x600032_g_EnterPos[nMenpai].z
		
		NewWorld( sceneId, leaderObjId, destsceneId, nFuben_X, nFuben_Z )
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x600032_OnPlayerEnter( sceneId, selfId )

	LuaFnSetCopySceneData_Param( sceneId, 8, LuaFnGetCopySceneData_Param( sceneId, 8 ) + 1 )
	
	-- ��Ҫ��������������һЩ�ص�
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do

		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == "�����ͽ"  then
		
		-- ������������������Ϊ��Ҫ�����֣��Ǻ�
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600032_g_MissionId)
		local nXing = GetMissionParam(sceneId, selfId, misIndex, 5)
		local nMing = GetMissionParam(sceneId, selfId, misIndex, 6)
		SetCharacterName(sceneId, nMonsterId, x600032_g_StrList[nXing] .. x600032_g_StrList[nMing] )
		end
	end

end

--**********************************
--������ڸ����������¼�
--**********************************
function x600032_OnHumanDie( sceneId, selfId, killerId )
	-- �����������ɾ������

	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )

end

function x600032_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x600032_OnCopySceneTimer( sceneId, nowTime )
	-- ��������������񣬾Ϳ�ʼ����ʱ��֮����ҳ�ȥ
	if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 3  then
		return
	end
	
	local HumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	
	if HumanCount < 1  then
		return
	end
	
	local HumanId = LuaFnGetCopyScene_HumanObjId(sceneId, 0)

	if LuaFnGetCopySceneData_Param( sceneId, 11 ) == 1   then
	
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 0  then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )
			LuaFnSetCopySceneData_Param( sceneId, 13, nowTime )
			x600032_NotifyFailTips(sceneId, HumanId,"������ɣ��㽫��10��󱻴��ͳ�����")
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 1  then
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 5000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 2 )
				x600032_NotifyFailTips(sceneId, HumanId,"�㽫��5��󱻴��ͳ�����")
			end
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 2  then   
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 10000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 3 )
				x600032_BackToCity( sceneId, HumanId )
			end
		end
		
	end
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600032_BackToCity( sceneId, selfId )

	local nMonsterScene = LuaFnGetCopySceneData_Param( sceneId, 6 )
	local nPos_X = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local nPos_Z = LuaFnGetCopySceneData_Param( sceneId, 8 )

	-- ������ҵ����λ��ȥ
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nMonsterScene, nPos_X, nPos_Z)
end
