-- 402030
-- �˷˸���  ���ɸ�����Ч�ʸ���
-- ��ҽ��븱���ᱻ�۳���ֵ��
-- �������������ڸ��������������

--************************************************************************
--MisDescBegin
--�ű���
x402030_g_ScriptId = 402030
x402030_g_Name = "��ɷ��"

x402030_TIME_2000_01_03_ = 946828868
--MisDescEnd
--************************************************************************

x402030_g_Item = 40004426

--��������
x402030_g_CopySceneName = "����ˮկ"

x402030_g_CopySceneType = FUBEN_JIAOFEI	--�������ͣ�������ScriptGlobal.lua����

x402030_g_CopySceneMap = "jiaofei.nav"
x402030_g_Exit = "jiaofei.ini"
x402030_g_LimitMembers = 1				--���Խ���������С��������
x402030_g_TickTime = 1						--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x402030_g_LimitTotalHoldTime = 360--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x402030_g_LimitTimeSuccess = 500	--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x402030_g_CloseTick = 3						--�����ر�ǰ����ʱ����λ��������
x402030_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x402030_g_DeadTrans = 0						--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x402030_g_Fuben_X = 33						--���븱����λ��X
x402030_g_Fuben_Z = 168						--���븱����λ��Z
x402030_g_Back_X = 66							--Դ����λ��X
x402030_g_Back_Z = 56							--Դ����λ��Z
x402030_g_Back_SceneId = 5				--Դ����Id

x402030_g_BossPoint={x=137, z=41}

x402030_g_MonsterPoint={
							{x=31, z=165},{x=36, z=162},{x=37, z=158},{x=32, z=154},
							{x=31, z=148},{x=34, z=142},{x=41, z=142},{x=48, z=143},
							{x=56, z=147},{x=62, z=151},{x=68, z=154},{x=73, z=157},
							{x=80, z=161},{x=88, z=163},{x=95, z=162},{x=103, z=163},
							{x=114, z=163},{x=111, z=157},{x=104, z=152},{x=94, z=147},
							{x=87, z=142},{x=81, z=136},{x=74, z=133},{x=68, z=125},
							{x=62, z=122},{x=54, z=115},{x=48, z=110},{x=43, z=103},
							{x=38, z=97},{x=36, z=89},{x=43, z=86},{x=48, z=87},
							{x=51, z=92},{x=57, z=90},{x=64, z=93},{x=69, z=96},
							{x=75, z=101},{x=82, z=105},{x=91, z=112},{x=97, z=117},
							{x=101, z=121},{x=108, z=125},{x=112, z=129},{x=116, z=133},
							{x=123, z=137},{x=131, z=143},{x=136, z=146},{x=139, z=150},
							{x=146, z=153},{x=153, z=151},{x=157, z=144},{x=153, z=139},
							{x=149, z=135},{x=149, z=130},{x=155, z=128},{x=159, z=124},
							{x=159, z=118},{x=153, z=116},{x=151, z=111},{x=142, z=108},
							{x=134, z=106},{x=126, z=104},{x=120, z=101},{x=114, z=96},
							{x=106, z=91},{x=99, z=86},{x=92, z=81},{x=86, z=77},
							{x=81, z=73},{x=76, z=71},{x=71, z=68},{x=65, z=66},
							{x=62, z=64},{x=58, z=61},{x=53, z=59},{x=49, z=57},
							{x=45, z=55},{x=42, z=49},{x=36, z=46},{x=38, z=38},
							{x=45, z=35},{x=52, z=36},{x=61, z=35},{x=70, z=36},
							{x=79, z=37},{x=87, z=44},{x=95, z=49},{x=101, z=53},
							{x=111, z=56},{x=119, z=56},{x=128, z=55},{x=139, z=53},
							{x=147, z=41},{x=153, z=47},{x=157, z=55},{x=156, z=63},
							{x=151, z=64},{x=145, z=63},{x=140, z=63},{x=129, z=63},
							}

-- һ��С��		
x402030_g_SmallMonsterId={2510,2511,2512,2513,2514,2515,2516,2517,2518,2519,32510,32511,32512,32513,32514,32515,32516,32517,32518,32519}
-- ��Ӣ��
x402030_g_MiddleMonsterId={2520,2521,2522,2523,2524,2525,2526,2527,2528,2529,32520,32521,32522,32523,32524,32525,32526,32527,32528,32529}
-- BOSS��
x402030_g_BossMonsterId={2530,2531,2532,2533,2534,2535,2536,2537,2538,2539,32530,32531,32532,32533,32534,32535,32536,32537,32538,32539}

x402030_g_SmallMonsterName 		= "����ˮ��"
x402030_g_MiddleMonsterName		= "����ˮ�˾�Ӣ"
x402030_g_BossMonsterName			= "����ˮ��ͷ��"
x402030_g_MinHumanCount = 3

--**********************************
--������ں���
--**********************************
function x402030_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_help_096}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x402030_g_Name  then
		return
	end

	-- ������ҵ������������͵���ͬ�ĸ���
	-- 1�����ʱ�� ��ÿ����������1��00��10��00֮�䣩
	local nWeek = GetTodayWeek()
	if nWeek~=6  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  �˷�ֻ����ÿ����������13��00��22��00֮����У��뵽ʱ�������μӡ�");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	--begin modified by zhangguoxin 090207
	--local nHour = GetHourTime()
	--local temp = floor(nHour/100)*100
	--if nHour - temp < 52  or nHour - temp >= 88   then
	local nQuarter = mod(GetQuarterTime(),100);
	if nQuarter < 52 or nQuarter >= 88 then
	--end modified by zhangguoxin 090207
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  �˷�ֻ����ÿ����������13��00��22��00֮����У��뵽ʱ�������μӡ�");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end

	-- 2���������ǲ��������
	if GetTeamSize(sceneId,selfId) < x402030_g_MinHumanCount  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  ����ˮ���˶����ڣ����µ�ǹƥ��ʵ��̫Σ���ˣ���������3�������ǰ�����ɲμӡ�");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3���������ǲ��Ƕӳ�
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  ֻ�жӳ�������ȡ�˷�����");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 4������ǲ����˶���λ��
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  �Բ������ж�Ա���ڸ������޷���ȡ����");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- �ȼ��ӳ��Լ��ǲ����㹻����������
	--  ������ӳ��ĸ��˼��֮���ټ���Ա�ǲ��ǹ�����
	if LuaFnGetAvailableItemCount(sceneId, selfId, x402030_g_Item) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  �Բ���������û��Я�����������޷�����˴ν˷��ж���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	local nTimes = GetMissionData(sceneId,selfId, MD_JIAOFEI_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_JIAOFEI_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	if (nCurTime - nPreTime  >= 3600*24)  or
		 (floor((nCurTime-x402030_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x402030_TIME_2000_01_03_)/(3600*24)))   then
		nTimes = 0
		nPreTime = nCurTime
		SetMissionData(sceneId, selfId, MD_JIAOFEI_TIMES, nTimes)
		SetMissionData(sceneId, selfId, MD_JIAOFEI_PRE_TIME, nPreTime)
	end
	if nTimes >= 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  �������Ѿ��μӹ��˷��ж��ˣ������������μӡ�");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5����������ͷ��ÿ������ǲ������϶��������Ʒ��
	local ret = 1
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""
	
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		if LuaFnGetAvailableItemCount(sceneId,nPlayerId,x402030_g_Item) < 1  then
			ret = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
	end
	
	local nCount = 0
	if ret == 0  then
		local szAllName = ""
		for i=1, 6  do
			if strName[i] ~= ""  then
				if nCount == 0  then
					szAllName = strName[i]
				else
					szAllName = szAllName .. "��" .. strName[i]
				end
				nCount = nCount+1
			end
		end
		
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  ���������г�Ա��" .. szAllName .. "������û��Я����������");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""

	--6,�����ҽ������ǲ��ǽ��й�3�ν˷�
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		nTimes = GetMissionData(sceneId,nPlayerId, MD_JIAOFEI_TIMES) 
		nPreTime = GetMissionData(sceneId,nPlayerId, MD_JIAOFEI_PRE_TIME)
		
		-- ��ʱ���ǲ��ǹ���һ�죬���˾��ȸ���
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x402030_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x402030_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_JIAOFEI_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_JIAOFEI_PRE_TIME, nPreTime)
		end

		if nTimes >= 1   then
			ret = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
	end
	
	nCount = 0
	if ret == 0  then
		local szAllName = ""
		for i=1, 6  do
			if strName[i] ~= ""  then
				if nCount == 0  then
					szAllName = strName[i]
				else
					szAllName = szAllName .. "��" .. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#B�����˷�");
			AddText(sceneId,"  ���������г�Ա��" .. szAllName .. "�������Ѿ��μӹ��˷��ж���");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- ���еļ��ͨ�������ڿ�ʼ����Ʒ
	x402030_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x402030_OnEnumerate( sceneId, selfId, targetId )
	-- �����������һ�������ж�
	if GetName(sceneId, targetId) == x402030_g_Name  then
		AddNumText( sceneId, x402030_g_ScriptId, "����ȥ����ˮկ",10 ,-1  )
		AddNumText( sceneId, x402030_g_ScriptId, "���ھ����˷�",8 ,1  )
		
	end
	
end

--**********************************
--����������
--**********************************
function x402030_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x402030_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x402030_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x402030_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x402030_MakeCopyScene( sceneId, selfId )
	
	-- ʹ�ö�Ա�ĵȼ����������ĵȼ�
	local param0 = 4;
	local param1 = 3;

	--���ս��
	local mylevel = 0;

	--��ʱ����
	local memId;
	local tempMemlevel = 0;
	local level0 = 0;
	local level1 = 0;
	local i;
	
	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end
	
	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1;
	end
	
	if nearmembercount == -1  then  --û�ж���
		mylevel = GetLevel(sceneId, selfId)
	end
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "jiaofei.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402030_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x402030_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x402030_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402030_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);	--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);		--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);		--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--ɱ��Boss������
	
	-- �����õ��ı������
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = PlayerMaxLevel/10;
	end

	-- ʹ�ø�������8��9��10�����������
	LuaFnSetCopySceneData_Param(sceneId, 8, x402030_g_SmallMonsterId[iniLevel]) --С��ID
	LuaFnSetCopySceneData_Param(sceneId, 9, x402030_g_MiddleMonsterId[iniLevel])--��ӢID
	LuaFnSetCopySceneData_Param(sceneId,10, x402030_g_BossMonsterId[iniLevel]) 	--BossID
	
	-- ʹ�õ�11λ����¼����ʵ�ʵĵȼ�
	LuaFnSetCopySceneData_Param(sceneId,11, mylevel)
	
	--���ó����еĸ���Npc������
	LuaFnSetSceneLoad_Area( sceneId, "jiaofei_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "jiaofei_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--�����¼�
--**********************************
function x402030_OnCopySceneReady( sceneId, destsceneId )

	--���븱���Ĺ���
	-- 1���������ļ�û����ӣ��ʹ����������Լ����븱��
	-- 2, �������ж��飬������Ҳ��Ƕӳ����ʹ����Լ����븱��
	-- 3���������ж��飬�����������Ƕӳ����ʹ����Լ��͸�������һ���ȥ

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --���ø�����ڳ�����
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end
	
	-- �������ǲ����ж���
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- û�ж���
		x402030_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x402030_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x402030_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x402030_GotoScene(sceneId, ObjId, destsceneId)
	-- ��¼����
	local nTimes = GetMissionData(sceneId,ObjId, MD_JIAOFEI_TIMES) 
	local nPreTime = GetMissionData(sceneId,ObjId, MD_JIAOFEI_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	-- ��ʱ���ǲ��ǹ���һ�죬���˾��ȸ���
	if (nCurTime - nPreTime  >= 3600*24)  or
		 (floor((nCurTime-x402030_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x402030_TIME_2000_01_03_)/(3600*24)))   then
		nTimes = 0
		nPreTime = nCurTime
	end
	SetMissionData(sceneId, ObjId, MD_JIAOFEI_TIMES, nTimes+1)
	SetMissionData(sceneId, ObjId, MD_JIAOFEI_PRE_TIME, nPreTime)
	
	NewWorld( sceneId, ObjId, destsceneId, x402030_g_Fuben_X, x402030_g_Fuben_Z) ;
	
	-- ͳ����Ϣ
	LuaFnAuditJiaoFei(sceneId, ObjId)

end


--**********************************
--����ҽ��븱���¼�
--**********************************
function x402030_OnPlayerEnter( sceneId, selfId )
	
	-- ���븱���ڵ���ң���Ҫ�������ǲ����Ѿ��۹���Ʒ
	local selfGuid = LuaFnObjId2Guid( sceneId, selfId )
	local nHumanCount = LuaFnGetCopySceneData_Param(sceneId, 27)
	if 	LuaFnGetCopySceneData_Param(sceneId, 21) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 22) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 23) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 24) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 25) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 26) ~= selfGuid  then
				
		if DelItem(sceneId, selfId, x402030_g_Item, 1) == 0  then
			NewWorld( sceneId, selfId, x402030_g_Back_SceneId, x402030_g_Back_X, x402030_g_Back_Z) ;
			return
		end
		
		LuaFnSetCopySceneData_Param(sceneId, 21+nHumanCount, selfGuid)
		LuaFnSetCopySceneData_Param(sceneId, 27, nHumanCount+1)
	end

	-- 3,���������¼�
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x402030_g_Fuben_X, x402030_g_Fuben_Z )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x402030_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x402030_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x402030_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x402030_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x402030_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x402030_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x402030_OnDie( sceneId, objId, killerId )
	
	local nMonster1 = LuaFnGetCopySceneData_Param(sceneId, 17)
	local nMonster2 = LuaFnGetCopySceneData_Param(sceneId, 18)
	local nMonster3 = LuaFnGetCopySceneData_Param(sceneId, 19)
	
	if GetName(sceneId, objId) == x402030_g_SmallMonsterName  then
		nMonster1 = nMonster1 + 1
		LuaFnSetCopySceneData_Param(sceneId, 17, nMonster1)
		x402030_TipAllHuman( sceneId, "��ɱ��" .. x402030_g_SmallMonsterName .. "��" .. tostring(nMonster1) .. "/200")
		
	elseif GetName(sceneId, objId) == x402030_g_MiddleMonsterName  then
		nMonster2 = nMonster2 + 1
		LuaFnSetCopySceneData_Param(sceneId, 18, nMonster2)
		x402030_TipAllHuman( sceneId, "��ɱ��" .. x402030_g_MiddleMonsterName .. "��" .. tostring(nMonster2) .. "/10")
		
	elseif GetName(sceneId, objId) == x402030_g_BossMonsterName  then
		nMonster3 = nMonster3 + 1
		LuaFnSetCopySceneData_Param(sceneId, 19, nMonster3)
		x402030_TipAllHuman( sceneId, "��ɱ��" .. x402030_g_BossMonsterName .. "��" .. tostring(nMonster3) .. "/2")
		
		-- ����������Ϣ
		
			--ɱ��������ǳ������ȡ�����˵�ID....
		local playerID = killerId
		local objType = GetCharacterType( sceneId, killerId )
		if objType == 3 then
			playerID = GetPetCreator( sceneId, killerId )
		end
			--������˶����ȡ�ӳ���ID....
		local nLeaderId = GetTeamLeader(sceneId, playerID)
		if nLeaderId < 1   then
			nLeaderId = playerID
		end
		
		local str = ""
		str = format("#{_INFOUSR%s}#P�ʶ���#G������կ#P��ս#Y%s#P������һ�ߣ�ħ��һ�ɣ�˫����ս��ʱ��#W#{_INFOUSR%s}#P������������#Y%s#Pն�ڷ�կ֮�У�", GetName(sceneId,nLeaderId), "#{_BOSS43}", GetName(sceneId,nLeaderId), "#{_BOSS43}")
		BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
		
		-- Ϊÿ���ڸ����ڵ���Ҷ���һ��ɱboss�ļ�¼
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1  do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			SetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME,
											GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME)+1 )

			if GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 6  then
				AwardTitle(sceneId, nHumanId, 13, 237)
				SetCurTitle(sceneId, nHumanId, 13, 237)
				DispatchAllTitle(sceneId, nHumanId)
				
			elseif GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 18  then
				AwardTitle(sceneId, nHumanId, 13, 238)
				SetCurTitle(sceneId, nHumanId, 13, 238)
				DispatchAllTitle(sceneId, nHumanId)
				
			elseif GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 50  then
				AwardTitle(sceneId, nHumanId, 13, 239)
				SetCurTitle(sceneId, nHumanId, 13, 239)
				DispatchAllTitle(sceneId, nHumanId)
				
			elseif GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 100  then
				AwardTitle(sceneId, nHumanId, 13, 240)
				SetCurTitle(sceneId, nHumanId, 13, 240)
				DispatchAllTitle(sceneId, nHumanId)
			end

		end
	end
end

--**********************************
--��ʾ���и��������
--**********************************
function x402030_TipAllHuman( sceneId, Str )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end

--**********************************
--ɱ����������
--**********************************
function x402030_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--���������¼�
--**********************************
function x402030_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x402030_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x402030_OnCopySceneTimer( sceneId, nowTime )
	
	-- ��ʱ����ҪҪ����ʱ��������ˢ��
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 12)
	local nCurTime = LuaFnGetCurrentTime()
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 13)

	local SmallMonsterId	= LuaFnGetCopySceneData_Param(sceneId, 8)
	local MiddleMonsterId	= LuaFnGetCopySceneData_Param(sceneId, 9)
	local BossMonsterId		= LuaFnGetCopySceneData_Param(sceneId,10)
	
	local nMonsterLevel = LuaFnGetCopySceneData_Param(sceneId,11)

	-- ��һ��ִ�м�ʱ��	
	if nPreTime == 0 then
		LuaFnSetCopySceneData_Param(sceneId, 12, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 13, 1)
		return
	end
	
	-- �ְ��ռ򵥵�ÿ10��ˢһ�ι�
	if 	(nStep<20  	and nStep>  0 and nCurTime-nPreTime >= 9) or
			(nStep<40 	and nStep>=20 and nCurTime-nPreTime >= 8) or
			(nStep<60 	and nStep>=40 and nCurTime-nPreTime >= 7) or
			(nStep<=100 and nStep>=60	and nCurTime-nPreTime >= 6) then
			
		LuaFnSetCopySceneData_Param(sceneId, 12, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 13, nStep + 1)
		
		-- �������ɵ�
		local Point = x402030_g_MonsterPoint[nStep]
	
		-- ����ID
		if 	nStep==10 or nStep==30 or nStep==50 or nStep==70 or nStep==90 or
				nStep==20 or nStep==40 or nStep==60 or nStep==80 or nStep==100 then
			-- Сbossֻˢһ��
			local nNpc1 = LuaFnCreateMonster(sceneId, MiddleMonsterId, Point.x+random(2), Point.z, 17, 0, 402030)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
			SetCharacterTitle(sceneId, nNpc1, "ͷĿ")
		end
		
		local nNpc1 = LuaFnCreateMonster(sceneId, SmallMonsterId, Point.x+random(2), Point.z, 17, 0, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		
		nNpc1 = LuaFnCreateMonster(sceneId, SmallMonsterId, Point.x, Point.z+random(2), 17, 0, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
	
	elseif nStep==101 then
		LuaFnSetCopySceneData_Param(sceneId, 12, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 13, nStep + 1)
		
		local nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x402030_g_BossPoint.x, x402030_g_BossPoint.z, 17, 123, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		SetCharacterTitle(sceneId, nNpc1, "������ˮ��Ư��")
		
		nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x402030_g_BossPoint.x+2, x402030_g_BossPoint.z+1, 17, 123, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		SetCharacterTitle(sceneId, nNpc1, "������ˮ��Ư��")
		
	else
		return
	end
	
end

