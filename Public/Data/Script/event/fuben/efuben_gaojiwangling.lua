-- 893009
-- ���긱��by���ľͺ�ԭ��  ���ɸ�����Ч�ʸ���
-- ��ҽ��븱���ᱻ�۳���ֵ��
-- �������������ڸ��������������

--************************************************************************
--MisDescBegin
--�ű���
x893009_g_ScriptId = 893009
x893009_g_Name = "����"

--x893009_TIME_2000_01_03_ = 946828868
--MisDescEnd
--************************************************************************

--x893009_g_Item = 40004426

--��������
x893009_g_CopySceneName = "����"

x893009_g_CopySceneType = FUBEN_WANGLING	--�������ͣ�������ScriptGlobal.lua����

x893009_g_CopySceneMap = "chengshiwangling.nav"
x893009_g_Exit = "chengshiwangling.ini"
x893009_g_LimitMembers = 1				--���Խ���������С��������
x893009_g_TickTime = 1						--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x893009_g_LimitTotalHoldTime = 360--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x893009_g_LimitTimeSuccess = 500	--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x893009_g_CloseTick = 3						--�����ر�ǰ����ʱ����λ��������
x893009_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x893009_g_DeadTrans = 0						--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x893009_g_Fuben_X = 48						--���븱����λ��X
x893009_g_Fuben_Z = 48						--���븱����λ��Z
x893009_g_Back_X = 375							--Դ����λ��X
x893009_g_Back_Z = 227							--Դ����λ��Z
x893009_g_Back_SceneId = 2				--Դ����Id

x893009_g_BossPoint={x=51, z=202}

x893009_g_MonsterPoint={
							{x=42, z=53},{x=51, z=45},{x=58, z=50},{x=57, z=60},
							{x=49, z=59},{x=168, z=34},{x=173, z=29},{x=178, z=35},
							{x=177, z=41},{x=167, z=39},{x=166, z=101},{x=172, z=96},
							{x=176, z=100},{x=175, z=104},{x=170, z=104},{x=186, z=195},
							{x=192, z=190},{x=196, z=193},{x=195, z=197},{x=187, z=199},
							{x=47, z=202},{x=52, z=198},{x=57, z=202},{x=55, z=207},
							{x=47, z=207},--{x=54, z=115},{x=48, z=110},{x=43, z=103},
--							{x=38, z=97},{x=36, z=89},{x=43, z=86},{x=48, z=87},
--							{x=51, z=92},{x=57, z=90},{x=64, z=93},{x=69, z=96},
--							{x=75, z=101},{x=82, z=105},{x=91, z=112},{x=97, z=117},
--							{x=101, z=121},{x=108, z=125},{x=112, z=129},{x=116, z=133},
--							{x=123, z=137},{x=131, z=143},{x=136, z=146},{x=139, z=150},
--							{x=146, z=153},{x=153, z=151},{x=157, z=144},{x=153, z=139},
--							{x=149, z=135},{x=149, z=130},{x=155, z=128},{x=159, z=124},
--							{x=159, z=118},{x=153, z=116},{x=151, z=111},{x=142, z=108},
--							{x=134, z=106},{x=126, z=104},{x=120, z=101},{x=114, z=96},
--							{x=106, z=91},{x=99, z=86},{x=92, z=81},{x=86, z=77},
--							{x=81, z=73},{x=76, z=71},{x=71, z=68},{x=65, z=66},
--							{x=62, z=64},{x=58, z=61},{x=53, z=59},{x=49, z=57},
--							{x=45, z=55},{x=42, z=49},{x=36, z=46},{x=38, z=38},
--							{x=45, z=35},{x=52, z=36},{x=61, z=35},{x=70, z=36},
--							{x=79, z=37},{x=87, z=44},{x=95, z=49},{x=101, z=53},
--							{x=111, z=56},{x=119, z=56},{x=128, z=55},{x=139, z=53},
--							{x=147, z=41},{x=153, z=47},{x=157, z=55},{x=156, z=63},
--							{x=151, z=64},{x=145, z=63},{x=140, z=63},{x=129, z=63},
							}

-- һ��С��		
x893009_g_SmallMonsterId={15001,15002,15003,15004,15005,15021,15022,15023,15024,15025,15066,15067,15068,15069,15070,15091,15092,15093,15094,15095}
-- ��Ӣ��
x893009_g_MiddleMonsterId={15006,15007,15008,15009,15010,15026,15027,15028,15029,15030,15031,15032,15033,15034,15035,15071,15072,15073,15074,15075}
-- BOSS��
x893009_g_BossMonsterId={15096,15097,15098,15099,15100}

x893009_g_SmallMonsterName 		= "��������"
x893009_g_MiddleMonsterName		= "����ˮ�˾�Ӣ"
x893009_g_BossMonsterName			= "����ˮ��ͷ��"
x893009_g_MinHumanCount = 1

--**********************************
--������ں���
--**********************************
function x893009_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_help_096}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x893009_g_Name  then
		return
	end

	-- ������ҵ������������͵���ͬ�ĸ���


	-- 2���������ǲ��������
	if GetTeamSize(sceneId,selfId) < x893009_g_MinHumanCount  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B����");
			AddText(sceneId,"  �����˶����ڣ����µ�ǹƥ��ʵ��̫Σ���ˣ���������3�������ǰ�����ɲμӡ�");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3���������ǲ��Ƕӳ�
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#B����");
			AddText(sceneId,"  ֻ�жӳ���������������");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 4������ǲ����˶���λ��
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B����");
			AddText(sceneId,"  �Բ������ж�Ա���ڸ������޷���ȡ����");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- �ȼ��ӳ��Լ��ǲ����㹻����������

	-- ���еļ��ͨ�������ڿ�ʼ����Ʒ
	x893009_MakeCopyScene(sceneId, selfId)
end

--**********************************
--�о��¼�
--**********************************
function x893009_OnEnumerate( sceneId, selfId, targetId )
	-- �����������һ�������ж�
	if GetName(sceneId, targetId) == x893009_g_Name  then
		AddNumText( sceneId, x893009_g_ScriptId, "����ȥ����",10 ,-1  )
		AddNumText( sceneId, x893009_g_ScriptId, "�������긱��",8 ,1  )
		
	end
	
end

--**********************************
--����������
--**********************************
function x893009_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x893009_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x893009_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x893009_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x893009_MakeCopyScene( sceneId, selfId )
	
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
	LuaFnSetSceneLoad_Map(sceneId, "chengshiwangling.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x893009_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x893009_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x893009_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x893009_g_ScriptId);--��1����������Ϊ���������¼��ű���
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
	LuaFnSetCopySceneData_Param(sceneId, 8, x893009_g_SmallMonsterId[iniLevel]) --С��ID
	LuaFnSetCopySceneData_Param(sceneId, 9, x893009_g_MiddleMonsterId[iniLevel])--��ӢID
	LuaFnSetCopySceneData_Param(sceneId,10, x893009_g_BossMonsterId[iniLevel]) 	--BossID
	
	-- ʹ�õ�11λ����¼����ʵ�ʵĵȼ�
	LuaFnSetCopySceneData_Param(sceneId,11, mylevel)
	
	--���ó����еĸ���Npc������
	LuaFnSetSceneLoad_Area( sceneId, "BattleField_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "BattleField_monster.ini" )

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
function x893009_OnCopySceneReady( sceneId, destsceneId )

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
		x893009_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x893009_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x893009_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x893009_GotoScene(sceneId, ObjId, destsceneId)
	-- ��¼����

	
	NewWorld( sceneId, ObjId, destsceneId, x893009_g_Fuben_X, x893009_g_Fuben_Z) ;
	
	-- ͳ����Ϣ
--	LuaFnAuditJiaoFei(sceneId, ObjId)

end


--**********************************
--����ҽ��븱���¼�
--**********************************
function x893009_OnPlayerEnter( sceneId, selfId )
	
	-- ���븱���ڵ���ң���Ҫ�������ǲ����Ѿ��۹���Ʒ
	local selfGuid = LuaFnObjId2Guid( sceneId, selfId )
	local nHumanCount = LuaFnGetCopySceneData_Param(sceneId, 27)
	if 	LuaFnGetCopySceneData_Param(sceneId, 21) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 22) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 23) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 24) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 25) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 26) ~= selfGuid  then
				
		if DelItem(sceneId, selfId, x893009_g_Item, 1) == 0  then
			NewWorld( sceneId, selfId, x893009_g_Back_SceneId, x893009_g_Back_X, x893009_g_Back_Z) ;
			return
		end
		
		LuaFnSetCopySceneData_Param(sceneId, 21+nHumanCount, selfGuid)
		LuaFnSetCopySceneData_Param(sceneId, 27, nHumanCount+1)
	end

	-- 3,���������¼�
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x893009_g_Fuben_X, x893009_g_Fuben_Z )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x893009_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x893009_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x893009_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x893009_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x893009_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x893009_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x893009_OnDie( sceneId, objId, killerId )
	

end

--**********************************
--��ʾ���и��������
--**********************************
function x893009_TipAllHuman( sceneId, Str )
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
function x893009_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--���������¼�
--**********************************
function x893009_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x893009_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x893009_OnCopySceneTimer( sceneId, nowTime )
	
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
		local Point = x893009_g_MonsterPoint[nStep]
	
		-- ����ID
		if 	nStep==1 then
--		if 	nStep==10 or nStep==30 or nStep==50 or nStep==70 or nStep==90 or
--				nStep==20 or nStep==40 or nStep==60 or nStep==80 or nStep==100 then
			-- Сbossֻˢһ��
--			local nNpc1 = LuaFnCreateMonster(sceneId, MiddleMonsterId, Point.x+random(2), Point.z, 17, 0, 893009)
--			SetLevel(sceneId, nNpc1, nMonsterLevel)
--			SetNPCAIType(sceneId, nNpc1, 0)
--			SetCharacterTitle(sceneId, nNpc1, "ͷĿ")
			
			local nNpc1 = LuaFnCreateMonster(sceneId, 15001, 42, 53, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
			
			nNpc1 = LuaFnCreateMonster(sceneId, 15001, 51, 45, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15001, 58, 50, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
			
			nNpc1 = LuaFnCreateMonster(sceneId, 15001, 57, 60, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15001, 49, 59, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15006, 50, 53, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
---------------------------------------------------------------------------------------------------------
			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 168, 34, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 173, 29, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 178, 35, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 177, 41, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 167, 39, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15026, 173, 36, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
---------------------------------------------------------------------------------------------------------
			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 166, 101, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 172, 96, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 176, 100, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 175, 104, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15021, 170, 104, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15031, 173, 99, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
---------------------------------------------------------------------------------------------------------
			nNpc1 = LuaFnCreateMonster(sceneId, 15066, 186, 195, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15066, 192, 190, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15066, 196, 193, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15066, 195, 197, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15066, 187, 199, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15071, 192, 195, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
---------------------------------------------------------------------------------------------------------
			nNpc1 = LuaFnCreateMonster(sceneId, 15091, 47, 202, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15091, 52, 198, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15091, 57, 202, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15091, 55, 207, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15091, 47, 207, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)

			nNpc1 = LuaFnCreateMonster(sceneId, 15086, 52, 203, 17, 0, 893009)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
----------------------------------------------------------------------------------------------------------

		end
		
--		local nNpc1 = LuaFnCreateMonster(sceneId, SmallMonsterId, Point.x+random(2), Point.z, 17, 0, 893009)
--		SetLevel(sceneId, nNpc1, nMonsterLevel)
--		SetNPCAIType(sceneId, nNpc1, 0)
		
--		nNpc1 = LuaFnCreateMonster(sceneId, SmallMonsterId, Point.x, Point.z+random(2), 17, 0, 893009)
--		SetLevel(sceneId, nNpc1, nMonsterLevel)
--		SetNPCAIType(sceneId, nNpc1, 0)
	
	elseif nStep==101 then
		LuaFnSetCopySceneData_Param(sceneId, 12, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 13, nStep + 1)
		
		local nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x893009_g_BossPoint.x, x893009_g_BossPoint.z, 17, 123, 893009)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
--		SetCharacterTitle(sceneId, nNpc1, "������ˮ��Ư��")
		
--		nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x893009_g_BossPoint.x+2, x893009_g_BossPoint.z+1, 17, 123, 893009)
--		SetLevel(sceneId, nNpc1, nMonsterLevel)
--		SetNPCAIType(sceneId, nNpc1, 0)
--		SetCharacterTitle(sceneId, nNpc1, "������ˮ��Ư��")
		
	else
		return
	end
	
end

