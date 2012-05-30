--��������
--��������������

--************************************************************************
--MisDescBegin

--�ű���
x311004_g_ScriptId = 311004

--��������
x311004_g_CopySceneName="ͭ����"

--�����
x311004_g_MissionId = 4001

--Ŀ��NPC
x311004_g_Name = "������"

--�Ƿ��Ǿ�Ӣ����
x311004_g_IfMissionElite = 1

--�������
x311004_g_MissionKind = 1

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--ѭ�����������������������������Ļ��� MD_PINPAN_HUAN
x311004_g_MissionRound = 1
--**********************************�����Ƕ�̬****************************

--�����ı�����
x311004_g_MissionName="ƽ������"
x311004_g_MissionInfo="�����Ѿ���������̨ɽ�Ѿ���ȫ����ϸ����ȥ�ͳ�������ϵ��ɱ��ȫ���Ѿ���һ��������"  --��������
x311004_g_MissionTarget="�ڳ����ʵİ����½����Ѿ�Ӫ�أ�ɱ��1���Ѿ����죬13���Ѿ�������6���Ѿ�����"	--����Ŀ��
x311004_g_ContinueInfo="��Ҫ����Ŭ������"	--δ��������npc�Ի�
x311004_g_MissionComplete="лл�����������ڸҳ�����"	--�������npc˵���Ļ�


--������
x311004_g_MoneyBonus=909

--MisDescEnd
--************************************************************************

--��ɫMission����˵��
--0�ţ��Ѿ���ɵĻ������ڽ�������ʱ��ֵ
--1�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
--2�ţ���ǰ��������ĳ�����
--3�ţ��Ӹ�������ʱ��Ķ����
--4�ţ�δ��
--5�ţ�δ��
--6�ţ�δ��
--7�ţ�δ��

x311004_g_LimitMembers=1 --���Խ���������С��������
x311004_g_TickTime=5 --�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x311004_g_LimitTotalHoldTime=120 --�������Դ���ʱ�䣨��λ��������
x311004_g_CloseTick=6	--�����ر�ǰ����ʱ����λ��������
x311004_g_NoUserTime=300 --������û���˺���Լ��������ʱ�䣨��λ���룩
x311004_g_Fuben_X=57.6
x311004_g_Fuben_Z=107.3

--**********************************
--������ں���
--**********************************
function x311004_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x311004_g_MissionId) > 0)  then	--�������Ѿ������������
		misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
		bDone = x311004_CheckSubmit( sceneId, selfId )
		if GetName(sceneId,targetId) == x311004_g_Name then		--��Ŀ��NPC
			BeginEvent(sceneId)
				AddText(sceneId,x311004_g_MissionName)
				AddText(sceneId,"׼��������")
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x311004_g_ScriptId,x311004_g_MissionId)
		elseif bDone==1 then	--�����Ѿ���ɣ������ڽ������NPC�ϵ�����¼�
			BeginEvent(sceneId)
				AddText(sceneId,x311004_g_MissionName)
				AddText(sceneId,x311004_g_MissionComplete)
				AddText(sceneId,"�㽫�õ���")
				AddMoneyBonus(sceneId,x311004_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x311004_g_ScriptId,x311004_g_MissionId,bDone)
		end
    elseif x311004_CheckAccept(sceneId,selfId) > 0 then		--û���������������������
		if GetName(sceneId,targetId) ~= x311004_g_Name then
			--�����������ʱ��ʾ����Ϣ
			BeginEvent(sceneId)
				AddText(sceneId,x311004_g_MissionName)
				AddText(sceneId,x311004_g_MissionInfo)
				AddText(sceneId,"����Ŀ�꣺")
				AddText(sceneId,x311004_g_MissionTarget)
				AddText(sceneId,"�㽫�õ���")
				AddMoneyBonus(sceneId,x311004_g_MoneyBonus)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x311004_g_ScriptId,x311004_g_MissionId)
		end
    end
end

--**********************************
--�о��¼�
--**********************************
function x311004_OnEnumerate( sceneId, selfId, targetId )
	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId,x311004_g_MissionId) > 0 then
		bDone = x311004_CheckSubmit( sceneId, selfId )
		if GetName(sceneId,targetId) == x311004_g_Name	and	bDone==0 then --����NPC������û���
			AddNumText(sceneId, x311004_g_ScriptId,x311004_g_MissionName);
		elseif	GetName(sceneId,targetId) ~= x311004_g_Name	and	bDone==1 then --�������NPC, �������
			AddNumText(sceneId, x311004_g_ScriptId,x311004_g_MissionName);
		end
	--���������������
    elseif x311004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x311004_g_Name then
			AddNumText(sceneId,x311004_g_ScriptId,x311004_g_MissionName);
		end
    end
end

--**********************************
--����������
--**********************************
function x311004_CheckTeamLeader( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--�ж��Ƿ��ж���
		BeginEvent(sceneId)
	  		AddText(sceneId,"����Ҫ����һ֧���顣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	
	if	nearteammembercount<x311004_g_LimitMembers	then
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
function x311004_CheckAccept( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--�ж��Ƿ��ж���
		BeginEvent(sceneId)
	  		AddText(sceneId,"����Ҫ����һ֧���顣");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	
	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 

	if	nearteammembercount<x311004_g_LimitMembers	then
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
		elseif IsHaveMission(sceneId,mems[i],x311004_g_MissionId)>0 or IsHaveMission(sceneId,mems[i],4002)>0 then
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
function x311004_OnAccept( sceneId, selfId )
	
	local teamid = GetTeamId( sceneId, selfId)
	
	if( IsHaveMission(sceneId,selfId,x311004_g_MissionId) > 0)  then	--�Ѿ��������
		misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, 2)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, 3)
		
		if copysceneid<0 then --��û�н�������
			nearmembercount = x311004_CheckTeamLeader( sceneId, selfId )
			if nearmembercount>0 then --�ж��飬�����㹻��Ϊ�ӳ�, ����ֵΪ����
			--�ӳ�������������
				x311004_MakeCopyScene( sceneId, selfId, nearmembercount ) ;
			end
		elseif teamid==saveteamid then
			--���Լ����͵���������
			NewWorld( sceneId, selfId, copysceneid, x311004_g_Fuben_X, x311004_g_Fuben_Z) ;
		else
			BeginEvent(sceneId)
				AddText(sceneId,"����������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		--������������б�
		if x311004_CheckAccept(sceneId,selfId) <= 0 then	--�жϽ�������
			return 0
		end

		--ȡ����Ҹ����Ķ��������������Լ���
		local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, selfId, i)
			--��ÿ�������Ա��������
			AddMission( sceneId, mems[i], x311004_g_MissionId, x311004_g_ScriptId, 1, 0, 0 )
			
			misIndex = GetMissionIndexByID( sceneId, mems[i], x311004_g_MissionId )
			
			local huan = GetMissionData(sceneId,selfId,x311004_g_MissionRound)
			
			--������ĵ�0����������Ϊ�Ѿ���ɵ�
			SetMissionByIndex(sceneId,mems[i],misIndex,0,huan)
			
			--������ĵ�1����������Ϊ0,��ʾδ��ɵ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,1,0)
			
			--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
			SetMissionByIndex(sceneId,mems[i],misIndex,2,-1)

			--������ĵ�3�����ݶ����
			SetMissionByIndex(sceneId,mems[i],misIndex,3,teamid)
		end
	end
end

--**********************************
--����
--**********************************
function x311004_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, 2)
	
	--ɾ����������б��ж�Ӧ������
    DelMission( sceneId, selfId, x311004_g_MissionId )
	
	if sceneId==copyscene then --����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		BeginEvent(sceneId)
			AddText(sceneId,"����ʧ�ܣ�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		
		NewWorld( sceneId, selfId, oldsceneId, 127, 28 )
	end
end

--**********************************
--��������
--**********************************
function x311004_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	mylevel = 0 
	for	i=0,nearmembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		mylevel = mylevel+GetLevel(sceneId,mems[i])
	end
	mylevel = mylevel/nearmembercount
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "_pingpan_1.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x311004_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x311004_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, 999);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x311004_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, 0);--ɱ�����Ѿ�1������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);--ɱ�����Ѿ�2������
	LuaFnSetCopySceneData_Param(sceneId, 8, 0);--ɱ�����Ѿ�3������
	
	if	mylevel<=40	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_1_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,536);--ɱ�����Ѿ�1�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,10,529);--ɱ�����Ѿ�2�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,11,538);--ɱ�����Ѿ�3�Ĺ�������
	elseif	mylevel<=55	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_40_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1825);--ɱ�����Ѿ�1�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,10,1835);--ɱ�����Ѿ�2�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,11,539);--ɱ�����Ѿ�3�Ĺ�������
	elseif	mylevel<=70	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_55_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1845);--ɱ�����Ѿ�1�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,10,1850);--ɱ�����Ѿ�2�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,11,540);--ɱ�����Ѿ�3�Ĺ�������
	elseif	mylevel<=85	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_70_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,517);--ɱ�����Ѿ�1�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,10,518);--ɱ�����Ѿ�2�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,11,541);--ɱ�����Ѿ�3�Ĺ�������
	else
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_85_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1955);--ɱ�����Ѿ�1�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,10,1950);--ɱ�����Ѿ�2�Ĺ�������
		LuaFnSetCopySceneData_Param(sceneId,11,542);--ɱ�����Ѿ�3�Ĺ�������
	end	
	
	LuaFnSetCopySceneData_Param(sceneId,12,GetTeamId(sceneId,selfId)); --��������

	local bRetSceneID = LuaFnCreateCopyScene(); --��ʼ����ɺ���ô�����������
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
function x311004_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, 2)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x311004_g_ScriptId, x311004_g_MissionId)
	end

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x311004_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x311004_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--�ж������Ƿ��Ѿ����
	misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, 1)>=1 then 
		return	1
	else
		return	0
	end
end

--**********************************
--�ύ
--**********************************
function x311004_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x311004_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--�Ѿ����������
	
		--���������Ѿ�����ɹ�
		DelMission( sceneId,selfId,  x311004_g_MissionId )
		
		local	i=GetMissionData(sceneId,selfId,x311004_g_MissionRound)
		if	i>=10	then
			i=1
		else
			i=i+1
		end
		
		--���������
		money = 100*i+x311004_g_MoneyBonus
		AddMoney(sceneId,selfId,money );
		
		--����ѭ������Ļ���
		SetMissionData(sceneId,selfId,x311004_g_MissionRound,i)
		
		BeginEvent(sceneId)
			strText_M = format("��õ�%d��Ǯ",money)
	  		strText = format("ƽ��������ɣ���ǰΪ��%d��",i)
	  		AddText(sceneId,strText);
	  		AddText(sceneId,strText_M);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x311004_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	--ȡ�õ�ǰ�����������
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	killednumber_1 = LuaFnGetCopySceneData_Param(sceneId, 6) ;--ɱ���Ѿ�������
	killednumber_2 = LuaFnGetCopySceneData_Param(sceneId, 7) ;--ɱ���Ѿ�������
	killednumber_3 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--ɱ���Ѿ�������
	killednumber = killednumber_1+killednumber_2+killednumber_3
	IsKillOK=0		
	if killednumber<20 then
		needkilled_1 = LuaFnGetCopySceneData_Param(sceneId, 9) ;--ɱ���Ѿ��Ĺ�������
		needkilled_2 = LuaFnGetCopySceneData_Param(sceneId,10) ;--ɱ���Ѿ��Ĺ�������
		needkilled_3 = LuaFnGetCopySceneData_Param(sceneId,11) ;--ɱ���Ѿ��Ĺ�������

		BeginEvent(sceneId)
		if objdataId==needkilled_1 then
			killednumber_1 = killednumber_1+1
			strText = format("��ɱ���Ѿ�����%d/6", killednumber_1 )
			AddText(sceneId,strText);
			IsKillOK=1
		elseif objdataId==needkilled_2 then
			killednumber_2 = killednumber_2+1
			BeginEvent(sceneId)
			strText = format("��ɱ���Ѿ�����%d/13", killednumber_2 )
			AddText(sceneId,strText);
			IsKillOK=1
		elseif objdataId==needkilled_3 then
			killednumber_3 = killednumber_3+1
			strText = format("��ɱ���Ѿ�����%d/1", killednumber_3 )
			AddText(sceneId,strText);
			IsKillOK=1
		end
		EndEvent(sceneId)

		if IsKillOK==1 then
			for i=0,num-1 do
				humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--ȡ�õ�ǰ�������˵�objId
				DispatchMissionTips(sceneId,humanObjId)
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 6, killednumber_1);--����ɱ�����Ѿ�������
			LuaFnSetCopySceneData_Param(sceneId, 7, killednumber_2);--����ɱ�����Ѿ�������
			LuaFnSetCopySceneData_Param(sceneId, 8, killednumber_3);--����ɱ�����Ѿ�������
		end
	end
	
	killednumber = killednumber_1+killednumber_2+killednumber_3
	if killednumber>=20 and IsKillOK==1 then
	
		--����������ɱ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)
		
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--ȡ�õ�ǰ�������˵�objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x311004_g_MissionId)--ȡ��������������ֵ

			--������ĵ�1����������Ϊ1,��ʾ��ɵ�����
			SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)--������������

			BeginEvent(sceneId)
				strText = format("������ɣ�����%d����͵����λ��", x311004_g_CloseTick*x311004_g_TickTime )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x311004_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x311004_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--�����¼�
--**********************************
function x311004_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--ȡ����Ҹ����Ķ��������������Լ���
	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		misIndex = GetMissionIndexByID(sceneId,mems[i],x311004_g_MissionId)
		
		--������ĵ�2����������Ϊ�����ĳ�����
		SetMissionByIndex(sceneId,mems[i],misIndex,2,destsceneId)
				
		NewWorld( sceneId, mems[i], destsceneId, x311004_g_Fuben_X, x311004_g_Fuben_Z) ;
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x311004_OnPlayerEnter( sceneId, selfId )
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x311004_g_Fuben_X, x311004_g_Fuben_Z );
end

--**********************************
--������ڸ����������¼�
--**********************************
function x311004_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x311004_OnCopySceneTimer( sceneId, nowTime )
	
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
		
		if leaveTickCount == x311004_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
			
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, 127, 28 )
			end
			
		elseif leaveTickCount<x311004_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("�㽫��%d����뿪����!", (x311004_g_CloseTick-leaveTickCount)*x311004_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x311004_g_LimitTotalHoldTime then --������ʱ�����Ƶ���
		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x311004_g_MissionId );--����ʧ��,ɾ��֮

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
			if IsHaveMission(sceneId,mems[i],x311004_g_MissionId) > 0 then
				oldteamid = LuaFnGetCopySceneData_Param(sceneId, 12) ; --ȡ�ñ���Ķ����
				if oldteamid ~= GetTeamId(sceneId,mems[i]) then
				
					DelMission( sceneId, mems[i], x311004_g_MissionId );--����ʧ��,ɾ��֮

  					BeginEvent(sceneId)
  						AddText(sceneId,"����ʧ�ܣ��㲻����ȷ�Ķ�����!");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
  					
 					oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
					NewWorld( sceneId, mems[i], oldsceneId, 127, 28 )
  				end
  			end
		end
		
	end
end

