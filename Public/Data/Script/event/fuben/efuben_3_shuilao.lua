--��������
--ˮ��

--************************************************************************
--MisDescBegin

--�ű���
x401020_g_ScriptId = 401020

--��������
x401020_g_CopySceneName="ˮ��"

--�����
x401020_g_MissionId = 1055

--Ŀ��NPC
x401020_g_Name = "ˮ��"

--�Ƿ��Ǿ�Ӣ����
x401020_g_IfMissionElite = 1

--�������
x401020_g_MissionKind = 1

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--ѭ�����������������������������Ļ��� MD_SHUILAO_HUAN
x401020_g_MissionRound = 7
--**********************************�����Ƕ�̬****************************

--�����ı�����
x401020_g_MissionName="ˮ��"
x401020_g_MissionInfo="ɱ��ȫ�����һ��������"  --��������
x401020_g_MissionTarget="ɱ��ȫ������"	--����Ŀ��
x401020_g_ContinueInfo="��Ҫ����Ŭ������"	--δ��������npc�Ի�
x401020_g_MissionComplete="лл�����������ڸҳ�����"	--�������npc˵���Ļ�


--������
x401020_g_MoneyBonus=9999

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
x401020_g_Param_huan		=0	--0�ţ��Ѿ���ɵĻ������ڽ�������ʱ��ֵ
x401020_g_Param_ok			=1	--1�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x401020_g_Param_sceneid		=2	--2�ţ���ǰ��������ĳ�����
x401020_g_Param_teamid		=3	--3�ţ��Ӹ�������ʱ��Ķ����
x401020_g_Param_killcount	=4	--4�ţ�ɱ������ֵ�����
x401020_g_Param_time		=5	--5�ţ���ɸ�������ʱ��(��λ����)
--6�ţ�δ��
--7�ţ�δ��

x401020_g_CopySceneType=FUBEN_EXAMPLE	--�������ͣ�������ScriptGlobal.lua����
x401020_g_LimitMembers=1			--���Խ���������С��������
x401020_g_TickTime=5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x401020_g_LimitTotalHoldTime=360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x401020_g_LimitTimeSuccess=500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x401020_g_CloseTick=6				--�����ر�ǰ����ʱ����λ��������
x401020_g_NoUserTime=300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x401020_g_DeadTrans=1				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x401020_g_Fuben_X=64				--���븱����λ��X
x401020_g_Fuben_Z=64				--���븱����λ��Z
x401020_g_Back_X=234				--Դ����λ��X
x401020_g_Back_Z=69					--Դ����λ��Z
x401020_g_NeedMonsterGroupID=1		--��Ҫɱ����Boss��GroupID
x401020_g_TotalNeedKillBoss=10		--��Ҫɱ��Boss����

--**********************************
--������ں���
--**********************************
function x401020_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x401020_g_MissionId) > 0)  then	--�������Ѿ������������
		misIndex = GetMissionIndexByID(sceneId,selfId,x401020_g_MissionId)
		bDone = x401020_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--����δ���
			BeginEvent(sceneId)
				AddText(sceneId,x401020_g_MissionName)
				AddText(sceneId,"׼��������")
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x401020_g_ScriptId,x401020_g_MissionId)
		elseif bDone==1 then					--�����Ѿ����
			BeginEvent(sceneId)
				AddText(sceneId,x401020_g_MissionName)
				AddText(sceneId,x401020_g_MissionComplete)
				AddText(sceneId,"�㽫�õ���")
				AddMoneyBonus(sceneId,x401020_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x401020_g_ScriptId,x401020_g_MissionId,bDone)
		end
    elseif x401020_CheckAccept(sceneId,selfId) > 0 then		--û���������������������
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x401020_g_MissionName)
			AddText(sceneId,x401020_g_MissionInfo)
			AddText(sceneId,"����Ŀ�꣺")
			AddText(sceneId,x401020_g_MissionTarget)
			AddText(sceneId,"�㽫�õ���")
			AddMoneyBonus(sceneId,x401020_g_MoneyBonus)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x401020_g_ScriptId,x401020_g_MissionId)
    end
end

--**********************************
--�о��¼�
--**********************************
function x401020_OnEnumerate( sceneId, selfId, targetId )
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x401020_g_MissionId) > 0 then
		AddNumText(sceneId, x401020_g_ScriptId,x401020_g_MissionName,3,-1);
	--���������������
    elseif x401020_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x401020_g_ScriptId,x401020_g_MissionName,4,-1);
    end
end

--**********************************
--����������
--**********************************
function x401020_CheckTeamLeader( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--�ж��Ƿ��ж���
		BeginEvent(sceneId)
	  		AddText(sceneId,"����Ҫ����һ֧���顣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	
	if	nearteammembercount<x401020_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"��Ķ����������㡣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--ֻ�жӳ����ܽ�����
		BeginEvent(sceneId)
	  		AddText(sceneId,"�㲻�Ƕӳ���");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	return nearteammembercount
end

--**********************************
--����������
--**********************************
function x401020_CheckAccept( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--�ж��Ƿ��ж���
		BeginEvent(sceneId)
	  		AddText(sceneId,"����Ҫ����һ֧���顣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	
	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 

	if	nearteammembercount<x401020_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"��Ķ����������㡣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--ֻ�жӳ����ܽ�����
		BeginEvent(sceneId)
	  		AddText(sceneId,"�㲻�Ƕӳ���");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	--���С�����Ƿ����������¼����, �����Ƿ��Ѿ��ӹ�������
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		if GetMissionCount( sceneId, mems[i]) >= 20 then	--�����������������Ƿ�ﵽ����20��
			BeginEvent(sceneId)
				AddText(sceneId,"���������˵������¼������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		elseif IsHaveMission(sceneId,mems[i],x401020_g_MissionId)>0 then
			--�����Ƿ��Ѿ��ӹ��������������һ������
			BeginEvent(sceneId)
				AddText(sceneId,"�����������Ѿ����˴�����");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	return	1
end

--**********************************
--����
--**********************************
function x401020_OnAccept( sceneId, selfId )
	
	local teamid = GetTeamId( sceneId, selfId)
	
	if( IsHaveMission(sceneId,selfId,x401020_g_MissionId) > 0)  then	--�Ѿ��������
		misIndex = GetMissionIndexByID(sceneId,selfId,x401020_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x401020_g_Param_sceneid)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, x401020_g_Param_teamid)
		
		if copysceneid>=0 and teamid==saveteamid then --��������
			--���Լ����͵���������
			NewWorld( sceneId, selfId, copysceneid, x401020_g_Fuben_X, x401020_g_Fuben_Z) ;
		else
			BeginEvent(sceneId)
				AddText(sceneId,"����������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		--������������б�
		if x401020_CheckAccept(sceneId,selfId) <= 0 then	--�жϽ�������
			return 0
		end

		--ȡ����Ҹ����Ķ��������������Լ���
		local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, selfId, i)
			--��ÿ�������Ա��������
			AddMission( sceneId, mems[i], x401020_g_MissionId, x401020_g_ScriptId, 1, 0, 0 )
			
			misIndex = GetMissionIndexByID( sceneId, mems[i], x401020_g_MissionId )
			
			local huan = GetMissionData(sceneId,selfId,x401020_g_MissionRound)
			
			--������ĵ�0����������Ϊ�Ѿ���ɵ�
			SetMissionByIndex(sceneId,mems[i],misIndex,x401020_g_Param_huan,huan)
			
			--������ĵ�1����������Ϊ0,��ʾδ��ɵ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,x401020_g_Param_ok,0)
			
			--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,x401020_g_Param_sceneid,-1)

			--������ĵ�3�����ݶ����
			SetMissionByIndex(sceneId,mems[i],misIndex,x401020_g_Param_teamid,teamid)
		end
		
		x401020_MakeCopyScene( sceneId, selfId, nearteammembercount ) ;
	end
end

--**********************************
--����
--**********************************
function x401020_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x401020_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x401020_g_Param_sceneid)
	
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x401020_g_MissionId )
	
	if sceneId==copyscene then --����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		BeginEvent(sceneId)
			AddText(sceneId,"����ʧ�ܣ�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		
		NewWorld( sceneId, selfId, oldsceneId, x401020_g_Back_X, x401020_g_Back_Z )
	end
end

--**********************************
--��������
--**********************************
function x401020_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	mylevel = 0 
	for	i=0,nearmembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		mylevel = mylevel+GetLevel(sceneId,mems[i])
	end
	mylevel = mylevel/nearmembercount
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "shuilao.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401020_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401020_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401020_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401020_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--ɱ��Boss������
	
	if	mylevel<=10	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_10.ini")
	elseif	mylevel<=15	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_15.ini")
	elseif	mylevel<=20	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_20.ini")
	elseif	mylevel<=25	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_25.ini")
	elseif	mylevel<=30	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_30.ini")
	elseif	mylevel<=35	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_35.ini")
	elseif	mylevel<=40	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_40.ini")
	elseif	mylevel<=45	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_45.ini")
	elseif	mylevel<=50	 then
		LuaFnSetSceneLoad_Monster(sceneId, "shuilao_monster_50.ini")
	end	
	

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
			--ɾ����������б��ж�Ӧ������
			DelMission( sceneId, selfId, x401020_g_MissionId )
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--����
--**********************************
function x401020_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x401020_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x401020_g_Param_sceneid)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x401020_g_ScriptId, x401020_g_MissionId)
	end

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x401020_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x401020_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--�ж������Ƿ��Ѿ����
	misIndex = GetMissionIndexByID(sceneId,selfId,x401020_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x401020_g_Param_ok)>=1 then 
		return	1
	else
		return	0
	end
end

--**********************************
--�ύ
--**********************************
function x401020_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x401020_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--�Ѿ����������
	
		local	iHuan=GetMissionData(sceneId,selfId,MD_SHUILAO_HUAN)	--ȡ���ܹ������Ļ���
		iHuan=iHuan+1
		--begin modified by zhangguoxin 090207
		local iDayCount=GetMissionData(sceneId,selfId,MD_SHUILAO_DAYCOUNT)
		local iTime = mod(iDayCount,100000)
		--local iDayTime = floor(iTime/100)	--��һ�ν������ʱ��(����)
		local iDayTime = iTime							--��һ�ν������ʱ��(����)
		--local iHourTime = mod(iTime,100)	--��һ�ν������ʱ��(Сʱ)
		local iDayHuan = floor(iDayCount/100000) --��������ɵ��������
		
		--local CurTime = GetHourTime()		--��ǰʱ��
		local CurDaytime = GetDayTime()	--��ǰʱ��(��)
		--local CurHourTime = mod(CurTime,100)	--��ǰʱ��(Сʱ)
		
		if CurDaytime==iDayTime then 	--�ϴ����������ͬһ����
			iDayHuan = iDayHuan+1
		else				--�ϴ����������ͬһ�죬����
			iDayTime = CurDaytime
			iDayHuan = 1
		end
		
		--iDayCount = iDayHuan*100000+iDayTime*100+CurHourTime
		iDayCount = iDayHuan*100000 + CurDaytime;
		
		--���������
		money = 100*iDayHuan
		AddMoney(sceneId,selfId,money );
		
		--����ѭ������Ļ���
		SetMissionData(sceneId,selfId,MD_SHUILAO_HUAN,iHuan)
		SetMissionData(sceneId,selfId,MD_SHUILAO_DAYCOUNT,iDayCount)
		--end modified by zhangguoxin 090207
		
		BeginEvent(sceneId)
			strText_M = format("��õ�%d��Ǯ",money)
	  		strText = format("������ɣ���ǰΪ��%d��",iDayHuan)
	  		AddText(sceneId,strText);
	  		AddText(sceneId,strText_M);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	  	
		--���������Ѿ�����ɹ�
		DelMission( sceneId,selfId,  x401020_g_MissionId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x401020_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	--�Ƿ��Ǹ���
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end 
	--�Ƿ�������Ҫ�ĸ���
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x401020_g_CopySceneType then
		return
	end
	--�����رձ�־
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	if 	leaveFlag==1 then --��������Ѿ����óɹر�״̬����ɱ����Ч
		return 
	end
	
	--ȡ�õ�ǰ�����������
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	--ȡ��ɱ�������GroupID,�����ж��Ƿ�������Ҫɱ����Boss
	GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID ~= x401020_g_NeedMonsterGroupID then
		return --��������Ҫ��Boss
	end
	
	killedbossnumber = LuaFnGetCopySceneData_Param(sceneId, 7) ;--ɱ��Boss������
	killedbossnumber = killedbossnumber+1
	LuaFnSetCopySceneData_Param(sceneId, 7, killedbossnumber) ;--����ɱ��Boss������
	
	if killedbossnumber<x401020_g_TotalNeedKillBoss then

		BeginEvent(sceneId)
			strText = format("��ɱBoss %d/%d", killedbossnumber, x401020_g_TotalNeedKillBoss )
			AddText(sceneId,strText);
		EndEvent(sceneId)

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--ȡ�õ�ǰ�������˵�objId
			DispatchMissionTips(sceneId,humanObjId)

			misIndex = GetMissionIndexByID(sceneId,humanObjId,x401020_g_MissionId) --ȡ��������������ֵ
			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x401020_g_Param_killcount) --ȡ���Ѿ�ɱ�˵Ĺ�����
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401020_g_Param_killcount,killedcount) --������������
		end
	elseif killedbossnumber>=x401020_g_TotalNeedKillBoss then
		--����������ɱ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)
		
		--ȡ���Ѿ�ִ�еĶ�ʱ����
		TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;
		
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--ȡ�õ�ǰ�������˵�objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x401020_g_MissionId)--ȡ��������������ֵ

			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x401020_g_Param_killcount) --ȡ���Ѿ�ɱ�˵Ĺ�����
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401020_g_Param_killcount,killedcount) --������������

			--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401020_g_Param_ok,1)--������������
			--��ɸ�������ʱ��
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401020_g_Param_time,TickCount*x401020_g_TickTime)--������������

			BeginEvent(sceneId)
				strText = format("������ɣ�����%d����͵����λ��", x401020_g_CloseTick*x401020_g_TickTime )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x401020_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x401020_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x401020_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		misIndex = GetMissionIndexByID(sceneId,mems[i],x401020_g_MissionId)
		
		--������ĵ�2����������Ϊ�����ĳ�����
		SetMissionByIndex(sceneId,mems[i],misIndex,x401020_g_Param_sceneid,destsceneId)
				
		NewWorld( sceneId, mems[i], destsceneId, x401020_g_Fuben_X, x401020_g_Fuben_Z) ;
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x401020_OnPlayerEnter( sceneId, selfId )
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x401020_g_Fuben_X, x401020_g_Fuben_Z );
end

--**********************************
--������ڸ����������¼�
--**********************************
function x401020_OnHumanDie( sceneId, selfId, killerId )
	if x401020_g_DeadTrans==1 then --��������Ҫ��ǿ���߳�����
	
		misIndex = GetMissionIndexByID(sceneId,selfId,x401020_g_MissionId)--ȡ��������������ֵ
		
		--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
		SetMissionByIndex(sceneId,selfId,misIndex,x401020_g_Param_ok,1)--������������
		local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--ȡ���Ѿ�ִ�еĶ�ʱ����
		--��ɸ�������ʱ��
		SetMissionByIndex(sceneId,selfId,misIndex,x401020_g_Param_time,TickCount*x401020_g_TickTime)--������������

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x401020_g_Back_X, x401020_g_Back_Z )
	end
end

--**********************************
--����������ʱ���¼�
--**********************************
function x401020_OnCopySceneTimer( sceneId, nowTime )
	
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
		
		if leaveTickCount == x401020_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
			
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x401020_g_Back_X, x401020_g_Back_Z )
			end
			
		elseif leaveTickCount<x401020_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("�㽫��%d����뿪����!", (x401020_g_CloseTick-leaveTickCount)*x401020_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x401020_g_LimitTimeSuccess then
		--�˴�������ʱ�����Ƶ�������ɴ���
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			
  			BeginEvent(sceneId)
  				AddText(sceneId,"����ʱ�䵽�����!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  			
			misIndex = GetMissionIndexByID(sceneId,mems[i],x401020_g_MissionId)--ȡ��������������ֵ
			--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,x401020_g_Param_ok,1)--������������
			--��ɸ�������ʱ��
			SetMissionByIndex(sceneId,mems[i],misIndex,x401020_g_Param_time,TickCount*x401020_g_TickTime)--������������
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	elseif TickCount == x401020_g_LimitTotalHoldTime then --������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x401020_g_MissionId );--����ʧ��,ɾ��֮

  			BeginEvent(sceneId)
  				AddText(sceneId,"����ʧ�ܣ���ʱ!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	else 
		--��ʱ�������Ա�Ķ���ţ���������ϣ����߳�����
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if IsHaveMission(sceneId,mems[i],x401020_g_MissionId) > 0 then
				oldteamid = LuaFnGetCopySceneData_Param(sceneId, 6) ; --ȡ�ñ���Ķ����
				if oldteamid ~= GetTeamId(sceneId,mems[i]) then
				
					DelMission( sceneId, mems[i], x401020_g_MissionId );--����ʧ��,ɾ��֮

  					BeginEvent(sceneId)
  						AddText(sceneId,"����ʧ�ܣ��㲻����ȷ�Ķ�����!");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
  					
 					oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
					NewWorld( sceneId, mems[i], oldsceneId, x401020_g_Back_X, x401020_g_Back_Z )
  				end
  			end
		end
		
	end
end

