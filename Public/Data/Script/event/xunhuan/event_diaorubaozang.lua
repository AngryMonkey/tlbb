--���뱦��--���˸���
--

--************************************************************************
--MisDescBegin

--�ű���
x229021_g_ScriptId = 229021

--��������
x229021_g_CopySceneName="����"

--�����
x229021_g_MissionId = 702

--��һ�������ID
x229021_g_MissionIdPre = 701

--�Ƿ��Ǿ�Ӣ����
x229021_g_IfMissionElite = 1

--�������
x229021_g_MissionKind = 13

--����ȼ�
x229021_g_MissionLevel = 7

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--ѭ�����������������������������Ļ��� MD_MURENXIANG_HUAN
--g_MissionRound = 9
--**********************************�����Ƕ�̬****************************

--�����ı�����
x229021_g_MissionName=""
x229021_g_MissionInfo=""  --��������
x229021_g_MissionTarget=""	--����Ŀ��
x229021_g_ContinueInfo=""	--δ��������npc�Ի�
x229021_g_MissionComplete=""	--�������npc˵���Ļ�

--������
x229021_g_MoneyBonus=1

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
x229021_g_Param_huan		=0	--0�ţ��Ѿ���ɵĻ������ڽ�������ʱ��ֵ
x229021_g_Param_ok			=1	--1�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x229021_g_Param_sceneid		=2	--2�ţ���ǰ��������ĳ�����
x229021_g_Param_guid		=3	--3�ţ��Ӹ�������ʱ������GUID
x229021_g_Param_killcount	=4	--4�ţ�ɱ������ֵ�����
x229021_g_Param_time		=5	--5�ţ���ɸ�������ʱ��(��λ����)
--6�ţ�δ��
--7�ţ�δ��

x229021_g_CopySceneType=FUBEN_BAOZANG	--�������ͣ�������ScriptGlobal.lua����
x229021_g_LimitMembers=1			--���Խ���������С��������
x229021_g_TickTime=5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x229021_g_LimitTotalHoldTime=36000	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x229021_g_LimitTimeSuccess=50000		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x229021_g_CloseTick=210				--�����ر�ǰ����ʱ����λ��������
x229021_g_NoUserTime=300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x229021_g_DeadTrans=0				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x229021_g_Fuben_X=23				--���븱����λ��X
x229021_g_Fuben_Z=23				--���븱����λ��Z
x229021_g_Back_X=160				--Դ����λ��X
x229021_g_Back_Z=150				--Դ����λ��Z
x229021_g_TotalNeedKill=1000			--��Ҫɱ����������
x229021_g_MissionIdPre=701			--��Ҫ��ǰӵ�е�����
x229021_g_CopySceneTotalTime=6000

--**********************************
--������ں���
--**********************************
function x229021_OnDefaultEvent( sceneId, selfId, targetId )
end

--**********************************
--�о��¼�
--**********************************
function x229021_OnEnumerate( sceneId, selfId, targetId )
end

--**********************************
--�������������
--**********************************
function x229021_CheckTeamLeader( sceneId, selfId )
end

--**********************************
--����������
--**********************************
function x229021_CheckAccept( sceneId, selfId )
	--if IsHaveMission(sceneId,selfId,x229021_g_MissionIdPre) > 0 then
		return 1
	--end
end

--**********************************
--����
--**********************************
function x229021_OnAccept( sceneId, selfId )
	local selfguid = LuaFnGetGUID( sceneId, selfId)
	x229021_MakeCopyScene( sceneId, selfId, 0 ) ;
end

--**********************************
--����
--**********************************
function x229021_OnAbandon( sceneId, selfId )
end

--**********************************
--��������
--**********************************
function x229021_MakeCopyScene( sceneId, selfId, nearmembercount )

	--PrintStr("MakeCopyScene")
	local leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "muxue.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x229021_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x229021_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x229021_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x229021_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, leaderguid); --������Һ�
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ��Boss������
	--LuaFnSetSceneLoad_Monster(sceneId, "muxue_monster_10.ini")	--7��ľ����׽�踱��

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel = 0
	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel < 10 then
		iniLevel = 10
	elseif playerLevel < PlayerMaxLevel then
		iniLevel = floor( playerLevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Monster( sceneId, "muxue_monster_" .. tostring(iniLevel) .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, playerLevel - iniLevel) --����CopyScene_LevelGap �� scene.lua �и�ֵ

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"��������ʧ�ܣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--����
--**********************************
function x229021_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x229021_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x229021_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--�ж������Ƿ��Ѿ����

end

--**********************************
--�ύ
--**********************************
function x229021_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x229021_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--�����¼�
--**********************************
function x229021_OnCopySceneReady( sceneId, destsceneId )
	--PrintStr("OnCopySceneReady...")
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--ȡ����Ҹ����Ķ��������������Լ���
	--local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	--PrintNum(nearteammembercount)
	--local mems = {}
	--for	i=0,nearteammembercount-1 do
		--mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		--misIndex = GetMissionIndexByID(sceneId,leaderObjId,x229021_g_MissionId)
		
		--������ĵ�2����������Ϊ�����ĳ�����
		--SetMissionByIndex(sceneId,leaderObjId,misIndex,x229021_g_Param_sceneid,destsceneId)
	
		--PrintStr("OnCopySceneReady...NewWorld...")			
		NewWorld( sceneId, leaderObjId, destsceneId, x229021_g_Fuben_X, x229021_g_Fuben_Z) ;
	--end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x229021_OnPlayerEnter( sceneId, selfId )
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", 2, x229021_g_Fuben_X, x229021_g_Fuben_Z );
end

--**********************************
--������ڸ����������¼�
--**********************************
function x229021_OnHumanDie( sceneId, selfId, killerId )
	if x229021_g_DeadTrans==1 then --��������Ҫ��ǿ���߳�����
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x229021_g_Back_X, x229021_g_Back_Z )
	end
end

--**********************************
--����������ʱ���¼�
--**********************************
function x229021_OnCopySceneTimer( sceneId, nowTime )
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--�����µĶ�ʱ�����ô���
		
	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	
	--�뿪����ʱ��Ķ�ȡ������
	local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
	local leaveTickCount = leaveTickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;
	
	if leaveTickCount == x229021_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		
		--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			NewWorld( sceneId, mems[i], oldsceneId, x229021_g_Back_X, x229021_g_Back_Z )
		end
		
	elseif leaveTickCount>x229021_g_CloseTick-4 then
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

		--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
  			BeginEvent(sceneId)
  				local strText = format("�㽫��%d����뿪����!", (x229021_g_CloseTick-leaveTickCount)*x229021_g_TickTime )
  				AddText(sceneId,strText);
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end
	elseif TickCount == x229021_g_CopySceneTotalTime then
		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end

end

