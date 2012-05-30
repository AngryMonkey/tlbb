--��������
--ľ��

--************************************************************************
--MisDescBegin

--�ű���
x210222_g_ScriptId = 210222

--��������
x210222_g_CopySceneName="��԰"
x210222_g_CopySceneMap = "newbie_2.nav"
x210222_g_CopySceneMonster = "newbie_2_monster.ini"

--�����
x210222_g_MissionId = 702

--��һ�������ID
x210222_g_MissionIdPre = 701

--Ŀ��NPC
x210222_g_Name = "�ٷ�"

--�Ƿ��Ǿ�Ӣ����
x210222_g_IfMissionElite = 1

--�������
x210222_g_MissionKind = 13

--����ȼ�
x210222_g_MissionLevel = 7

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--ѭ�����������������������������Ļ��� MD_MURENXIANG_HUAN
--g_MissionRound = 9
--**********************************�����Ƕ�̬****************************

--�����ı�����
x210222_g_MissionName="��԰"
x210222_g_MissionInfo="#{event_dali_0032}"  --��������
x210222_g_MissionTarget="�����԰��"	--����Ŀ��
x210222_g_ContinueInfo="�����԰"	--δ��������npc�Ի�
x210222_g_MissionComplete="  �������"	--�������npc˵���Ļ�
x210222_g_SignPost = {x = 275, z = 50, tip = "��üɮ"}
x210222_g_PetDataID=558	--�������ı��

--��ɫMission����˵��
x210222_g_Param_huan		=0	--0�ţ��Ѿ���ɵĻ������ڽ�������ʱ��ֵ
x210222_g_IsMissionOkFail	=1	--1�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x210222_g_Param_sceneid		=2	--2�ţ���ǰ��������ĳ�����
x210222_g_Param_guid		=3	--3�ţ��Ӹ�������ʱ������GUID
x210222_g_Param_killcount	=4	--4�ţ�ɱ������ֵ�����
x210222_g_Param_time		=5	--5�ţ���ɸ�������ʱ��(��λ����)
--6�ţ�δ��
--7�ţ�δ��

--������
x210222_g_MoneyBonus=2

--MisDescEnd
--************************************************************************

x210222_g_CopySceneType=FUBEN_MURENXIANG_7	--�������ͣ�������ScriptGlobal.lua����
x210222_g_LimitMembers=1			--���Խ���������С��������
x210222_g_TickTime=5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x210222_g_LimitTotalHoldTime=360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x210222_g_LimitTimeSuccess=500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x210222_g_CloseTick=6				--�����ر�ǰ����ʱ����λ��������
x210222_g_NoUserTime=300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x210222_g_DeadTrans=0				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x210222_g_Fuben_X=44				--���븱����λ��X
x210222_g_Fuben_Z=54				--���븱����λ��Z
x210222_g_Back_X=275				--Դ����λ��X
x210222_g_Back_Z=50					--Դ����λ��Z
x210222_g_TotalNeedKill=0			--��Ҫɱ����������
x210222_g_MissionIdPre=701			--��Ҫ��ǰӵ�е�����

--**********************************
--������ں���
--**********************************
function x210222_OnDefaultEvent( sceneId, selfId, targetId )
	if IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0  then	--�������Ѿ������������
		misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
		bDone = x210222_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--����δ���
			BeginEvent(sceneId)
				AddText(sceneId,x210222_g_MissionName)
				AddText(sceneId,"׼��������")
				AddMoneyBonus( sceneId, x210222_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId)
		elseif bDone==1 then					--�����Ѿ����
			BeginEvent(sceneId)
				AddText(sceneId,x210222_g_MissionName)
				AddText(sceneId,x210222_g_MissionComplete)
				--AddText(sceneId,"�㽫�õ���")
				--AddMoneyBonus(sceneId,x210222_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId,bDone)
		end
    elseif x210222_CheckAccept(sceneId,selfId) > 0 then		--û���������������������
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210222_g_MissionName)
			AddText(sceneId,x210222_g_MissionInfo)
			--AddText(sceneId,"����Ŀ�꣺")
			--AddText(sceneId,x210222_g_MissionTarget)
			--AddText(sceneId,"�㽫�õ���")
			--AddMoneyBonus(sceneId,x210222_g_MoneyBonus)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x210222_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone(sceneId,selfId,x210222_g_MissionId) > 0 then
		return
	end
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0 then
		AddNumText(sceneId, x210222_g_ScriptId,x210222_g_MissionName,2,-1);
	--���������������
    elseif x210222_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210222_g_ScriptId,x210222_g_MissionName,1,-1);
    end
end

--**********************************
--����������
--**********************************
function x210222_CheckAccept( sceneId, selfId )
	if IsHaveMission(sceneId,selfId,x210222_g_MissionIdPre) <= 0    then
		return 0
	end

	local petcount = LuaFnGetPetCount(sceneId, selfId) --ȡ�ó�������
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --ȡ�ó�����
		if petdataid==x210222_g_PetDataID then
			return	0
		end
	end

	return 1
end

--**********************************
--����
--**********************************
function x210222_OnAccept( sceneId, selfId )

	local selfguid = LuaFnGetGUID( sceneId, selfId)

	if( IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0)  then	--�Ѿ��������
		misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)
		saveguid = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_guid)

		if copysceneid>=0 and selfguid==saveguid then --��������
			--���Լ����͵���������
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x210222_g_Fuben_X, x210222_g_Fuben_Z )
			else
				x210222_NotifyFailTips( sceneId, selfId, "�����ѹرգ����������������½�ȡ" )
			end
		else
			x210222_NotifyFailTips( sceneId, selfId, "�����½Ӵ�����" )
		end
	else
		--������������б�
		if x210222_CheckAccept(sceneId,selfId) <= 0 then	--�жϽ�������
			return 0
		end

		--��ÿ�������Ա��������
		AddMission( sceneId, selfId, x210222_g_MissionId, x210222_g_ScriptId, 0, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, selfId, x210222_g_MissionId )

		--������ĵ�1����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_IsMissionOkFail,0)

		--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_Param_sceneid,-1)

		--������ĵ�3�����ݶ����
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_Param_guid,selfguid)
		Msg2Player( sceneId, selfId,"#Y�������񣺺�԰",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210222_g_SignPost.x, x210222_g_SignPost.z, x210222_g_SignPost.tip )
		x210222_MakeCopyScene( sceneId, selfId, 0 )
	end
end

--**********************************
--����
--**********************************
function x210222_OnAbandon( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x210222_g_MissionId )

	if sceneId==copyscene then --����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		BeginEvent(sceneId)
			AddText(sceneId,"������˺�԰��̽�գ����ش���ǣ�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

		NewWorld( sceneId, selfId, oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
	end
end

--**********************************
--��������
--**********************************
function x210222_MakeCopyScene( sceneId, selfId, nearmembercount )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, x210222_g_CopySceneMap); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x210222_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x210222_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x210222_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x210222_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, leaderguid); --������Һ�
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ��Boss������
	LuaFnSetSceneLoad_Monster(sceneId, x210222_g_CopySceneMonster)	--7����԰׽�踱��

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
			--ɾ����������б��ж�Ӧ������
			DelMission( sceneId, selfId, x210222_g_MissionId )
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--����
--**********************************
function x210222_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)>=1	then
		BeginEvent(sceneId)
			AddText(sceneId,x210222_g_MissionComplete);
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x210222_g_ScriptId, x210222_g_MissionId)
	end

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210222_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210222_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--�ж������Ƿ��Ѿ����
	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x210222_g_IsMissionOkFail)>=1 then
		return	1
	else
		return	0
	end
	return 0
end

--**********************************
--�ύ
--**********************************
function x210222_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x210222_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		-- �Ѿ����������
		--���������
		money = x210222_g_MoneyBonus									-- *iDayHuan
		AddMoney(sceneId,selfId,money );

		BeginEvent(sceneId)
	  		AddText(sceneId,"�������")
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)

		--���������Ѿ�����ɹ�
		DelMission( sceneId, selfId, x210222_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x210222_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x210222_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210222_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x210222_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) == 1 then			-- ���ڿ���ִ���߼���״̬
		if IsHaveMission( sceneId, leaderObjId, x210222_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, leaderObjId, x210222_g_MissionId )

			--������ĵ�2����������Ϊ�����ĳ�����
			SetMissionByIndex( sceneId, leaderObjId, misIndex, x210222_g_Param_sceneid, destsceneId )

			NewWorld( sceneId, leaderObjId, destsceneId, x210222_g_Fuben_X, x210222_g_Fuben_Z )
		else
			x210222_NotifyFailTips( sceneId, leaderObjId, "�㵱ǰδ�Ӵ�����" )
		end
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x210222_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x210222_g_MissionId ) == 0 then				--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		x210222_NotifyFailTips( sceneId, selfId, "�㵱ǰδ�Ӵ����񣬷��ش����" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
		return
	end

	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x210222_g_Fuben_X, x210222_g_Fuben_Z );
end

--**********************************
--������ڸ����������¼�
--**********************************
function x210222_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x210222_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--�����µĶ�ʱ�����ô���

	--�����رձ�־
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;

	if leaveFlag == 1 then --��Ҫ�뿪

		--�뿪����ʱ��Ķ�ȡ������
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;

		if leaveTickCount == x210222_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
			end

		elseif leaveTickCount<x210222_g_CloseTick then

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
	  		local strText = format("�㽫��%d����뿪����!", (x210222_g_CloseTick-leaveTickCount)*x210222_g_TickTime )
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x210222_g_LimitTotalHoldTime then --������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x210222_g_MissionId );--����ʧ��,ɾ��֮

  			BeginEvent(sceneId)
  				AddText(sceneId,"����ʧ�ܣ���ʱ!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
	end
end

function x210222_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
