--����������

--MisDescBegin
--�ű���
x229023_g_scriptId = 229023

x229023_g_MissionId = 1202
--�����Ƕ�̬**************************************************************
--MisDescEnd

--��ɫMission����˵��
x229023_g_Param_huan		=0	--0�ţ��Ѿ���ɵĻ������ڽ�������ʱ��ֵ
x229023_g_Param_ok			=1	--1�ţ���ǰ�����Ƿ����(0δ��ɣ�1���)
x229023_g_Param_sceneid		=2	--2�ţ���ǰ��������ĳ�����
x229023_g_Param_guid		=3	--3�ţ��Ӹ�������ʱ������GUID
x229023_g_Param_killcount	=4	--4�ţ�ɱ������ֵ�����
x229023_g_Param_time		=5	--5�ţ���ɸ�������ʱ��(��λ����)
--6�ţ�δ��
--7�ţ�δ��

x229023_g_CopySceneType=FUBEN_RENWULIAN	--�������ͣ�������ScriptGlobal.lua����
x229023_g_LimitMembers=1			--���Խ���������С��������
x229023_g_TickTime=5				--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x229023_g_LimitTotalHoldTime=36000	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x229023_g_LimitTimeSuccess=50000		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x229023_g_CloseTick=210				--�����ر�ǰ����ʱ����λ��������
x229023_g_NoUserTime=300			--������û���˺���Լ��������ʱ�䣨��λ���룩
x229023_g_DeadTrans=0				--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x229023_g_Fuben_X=23				--���븱����λ��X
x229023_g_Fuben_Z=23				--���븱����λ��Z
x229023_g_Back_X=160				--Դ����λ��X
x229023_g_Back_Z=150				--Դ����λ��Z
x229023_g_TotalNeedKill=1000			--��Ҫɱ����������
x229023_g_MissionIdPre=701			--��Ҫ��ǰӵ�е�����
x229023_g_CopySceneTotalTime=6000


x229023_g_TitleOfMonster = {"�Ҷ�","С����","С���","С����","����","���","����","С����","����","�ҽ�"}
x229023_g_TitleOfBoss = {"������","��������","�󻤷�","�����","һ������","�����","�󻤷�","�һ���","����ʦү","�����ͷ"}

x229023_g_NameOfMonster = {
				{part1="��", part2="С��"},
				{part1="��", part2="С��"},
				{part1="��", part2="С��"},
				{part1="��", part2="С��"},
				{part1="��", part2="С��"},
				{part1="��", part2="���"},
				{part1="��", part2="����"},
				{part1="��", part2="�Ҷ�"},
				{part1="��", part2="�׶�"},
				{part1="��", part2="����"},
}

x229023_g_NameOfBoss = {
				{part1="ŷ��", part2="��", part3="Х"},
				{part1="��ľ", part2="��", part3="��"},
				{part1="˾��", part2="��", part3="��"},
				{part1="½��", part2="��", part3="ĺ"},
				{part1="����", part2="��", part3="��"},
				{part1="��Ұ", part2="��", part3="��"},
				{part1="����", part2="��", part3="��"},
				{part1="Ľ��", part2="��", part3="�"},
				{part1="�ĺ�", part2="��", part3="��"},
				{part1="�ʸ�", part2="��", part3="��"},
}

x229023_g_MonsterPosList = {
				BossPos = {id=1880, x=28, z=30},
				MonsterPos = {
											{id=1890, x=29, z=24},
											{id=1890, x=36, z=28},
											{id=1890, x=34, z=36},
											{id=1890, x=25, z=36},
											{id=1890, x=22, z=27},
										 }
}

--///////////////////////////////////////////////////////
--�Ƿ�Ҫ��ɱ�Ĺ�
--///////////////////////////////////////////////////////
function x229023_IsMonsterOfDemanded(sceneId, humanObjId, dataId)
	--PrintStr("IsMonsterOfDemanded...")
	if IsHaveMission(sceneId, humanObjId, x229023_g_MissionId) > 0 then
		local fubenNpcId = LuaFnGetCopySceneData_Param(sceneId, 14)
		local misIndex = GetMissionIndexByID(sceneId,humanObjId,x229023_g_MissionId)
		local demandNpcId = GetMissionParam(sceneId, humanObjId, misIndex, 5)
		if fubenNpcId == demandNpcId then
	local monsterLevel = LuaFnGetCopySceneData_Param(sceneId, 9)
	if dataId == x229023_g_MonsterPosList.BossPos.id + floor(monsterLevel/10) then
		return 1
	end
	
	local monsterCount = getn(x229023_g_MonsterPosList.MonsterPos)
	for i=1, monsterCount do
		if x229023_g_MonsterPosList.MonsterPos[i].id + floor(monsterLevel/10) == dataId then
			return 1
		end	
	end
		end --endif
	end --endif
	return 0
end

function x229023_CreateTitleAndName_Monster()			
	
	--����monster�ĳƺ�
	local ct = getn(x229023_g_TitleOfMonster)
	local ret = random(ct)
	local strTitle = x229023_g_TitleOfMonster[ret]
	--����monster��name
	ct = getn(x229023_g_NameOfMonster)
	ret = random(ct)
	local part1 = x229023_g_NameOfMonster[ret].part1
	ret = random(ct)
	local part2 = x229023_g_NameOfMonster[ret].part2
	ret = random(ct)
	local strName = format("%s%s", part1, part2)
	
	return strTitle, strName

end

function x229023_CreateTitleAndName_Boss(sceneId)
	local npcId = LuaFnGetCopySceneData_Param(sceneId, 14)
	local _, npcName = GetNpcInfoByNpcId(sceneId,npcId)
	--����monster�ĳƺ�
	local ct = getn(x229023_g_TitleOfBoss)
	local ret = random(ct)
	local strTitle = x229023_g_TitleOfBoss[ret]
	strTitle = npcName .. "��" .. strTitle
	--����monster��name
	ct = getn(x229023_g_NameOfBoss)
	ret = random(ct)
	local part1 = x229023_g_NameOfBoss[ret].part1
	ret = random(ct)
	local part2 = x229023_g_NameOfBoss[ret].part2
	ret = random(ct)
	local part3 = x229023_g_NameOfBoss[ret].part3
	local strName = format("%s%s%s", part1, part2, part3)
	
	return strTitle, strName

end


--**********************************
--��������
--**********************************
function x229023_MakeCopyScene( sceneId, selfId, nearmembercount )
	--PrintStr("MakeCopyScene .. ")
	--local mems = {}
	local mylevel = GetLevel(sceneId, selfId)
	--local i

	--for	i=0, nearmembercount-1 do
	--	mems[i] = GetNearTeamMember( sceneId, selfId, i )
	--	mylevel = mylevel + GetLevel( sceneId, mems[i] )
	--end

	--mylevel = mylevel/nearmembercount
	local round = GetMissionData(sceneId,selfId,MD_RENWULIAN_HUAN)

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, "shiji.nav" )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x229023_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x229023_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x229023_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x229023_g_scriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--��������
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--reserve0
	LuaFnSetCopySceneData_Param( sceneId, 8, nearmembercount)	--Ҫ������monster����
	LuaFnSetCopySceneData_Param( sceneId, 9, mylevel )				--����Ӧ�����õĵȼ�
	LuaFnSetCopySceneData_Param( sceneId, 10, round )				--����Ӧ�����õĵȼ�

	if IsHaveMission(sceneId,selfId,1202) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,1202)
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == 3 then
			local npcId = GetMissionParam(sceneId, selfId, misIndex, 5)
			local _, npcName, _, x, z, _, sId, _ = GetNpcInfoByNpcId(sceneId,npcId)
			
			LuaFnSetCopySceneData_Param( sceneId, 11, sId )	
			LuaFnSetCopySceneData_Param( sceneId, 12, x )	
			LuaFnSetCopySceneData_Param( sceneId, 13, z )	
			LuaFnSetCopySceneData_Param( sceneId, 14, npcId )	
		end
	end

	LuaFnSetSceneLoad_Monster( sceneId, "shiji_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
	if bRetSceneID > 0 then
			AddText( sceneId, "���������ɹ���" )
	else
			AddText( sceneId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--ɱ����������
--**********************************
function x229023_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--�����¼�
--**********************************
function x229023_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )							--���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--ȡ����Ҹ����Ķ��������������Լ���
	local misIndex
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	if nearteammembercount > 0 then
	local member
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		misIndex = GetMissionIndexByID( sceneId, member, x229023_g_MissionId )

		NewWorld( sceneId, member, destsceneId, x229023_g_Fuben_X, x229023_g_Fuben_Z )
	end
	else
			NewWorld( sceneId, leaderObjId, destsceneId, x229023_g_Fuben_X, x229023_g_Fuben_Z )
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x229023_OnPlayerEnter( sceneId, selfId )
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", 2, x229023_g_Fuben_X, x229023_g_Fuben_Z );
end

--**********************************
--������ڸ����������¼�
--**********************************
function x229023_OnHumanDie( sceneId, selfId, killerId )
	if x229023_g_DeadTrans==1 then --��������Ҫ��ǿ���߳�����
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
		local x = LuaFnGetCopySceneData_Param(sceneId, 12)
		local z = LuaFnGetCopySceneData_Param(sceneId, 13)
		
		NewWorld( sceneId, selfId, sId, x, z )
	end
end

--**********************************
--����������ʱ���¼�
--**********************************
function x229023_OnCopySceneTimer( sceneId, nowTime )
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(sceneId) ;	
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	if leaderObjId == -1 then
		return
	end
	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--ȡ���Ѿ�ִ�еĶ�ʱ����
	
	--////////////////////////////////////////////////////////////////////
	if TickCount == 0 then
		x229023_CreateMonster(sceneId) --����ǵ�һ��ʱ���򴴽���Ӧ��monster
	end
	--////////////////////////////////////////////////////////////////////
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--�����µĶ�ʱ�����ô���
		
	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	
	--�뿪����ʱ��Ķ�ȡ������
	local leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
	local leaveTickCount = leaveTickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;
	
	--===============================================================
	--��������Ƿ����
	local misIndex = GetMissionIndexByID(sceneId,leaderObjId,1202)
	local missionType = GetMissionParam(sceneId, leaderObjId, misIndex, 1)
	if (missionType == 3 or missionType == 4) then
		if GetMissionParam(sceneId, leaderObjId, misIndex, 0) == 1 then
			--����ս��ʤ�������侭��
			local exp = CallScriptFunction(229022, "GetExpBonus", sceneId, leaderObjId)
			--PrintStr("exp=" .. exp)
			local humancount = LuaFnGetCopyScene_HumanCount( sceneId )
			humancount = humancount-1
			--PrintStr("nearhumancount=" .. nearhumancount)
			local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
			local x = LuaFnGetCopySceneData_Param(sceneId, 12)
			local z = LuaFnGetCopySceneData_Param(sceneId, 13)
			if humancount > 0 then
				exp = exp / humancount
				local member
				for	i=0, humancount-1 do
					member = LuaFnGetCopyScene_HumanObjId( sceneId, i )
					if member ~= leaderObjId then
						AddExp(sceneId, member, exp)
						Msg2Player(  sceneId, member, "��ʹ������츣�����������" .. exp .. "���齱����", MSG2PLAYER_PARA )
						--�����Ѵ�������
						NewWorld( sceneId, member, sId, x, z )
					end
				end
			end
			--���Լ���������
			NewWorld(sceneId, leaderObjId, sId, x, z)
			return
		end	
	end
	--===============================================================
		
	if leaveTickCount == x229023_g_CloseTick then --����ʱ�䵽����Ҷ���ȥ��
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����
		
		--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
			local x = LuaFnGetCopySceneData_Param(sceneId, 12)
			local z = LuaFnGetCopySceneData_Param(sceneId, 13)
			--print( sceneId, mems[i], sId, x, z )
			NewWorld( sceneId, mems[i], sId, x, z )
		end
		
	elseif leaveTickCount>x229023_g_CloseTick-4 then
	
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--ȡ�ø�����ڳ�����

		--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
  			BeginEvent(sceneId)
  				local strText = format("�㽫��%d����뿪����!", (x229023_g_CloseTick-leaveTickCount)*x229023_g_TickTime )
  				AddText(sceneId,strText);
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end
	elseif TickCount == x229023_g_CopySceneTotalTime then
		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end

end

function x229023_RefixSomeAttr(sceneId, monsterId, refixRate)
	--������˺��� maxhp�� ��ɱ������
	LuaFnSetLifeTimeAttrRefix_MaxHP(sceneId, monsterId, 
			LuaFnGetMaxBaseHp(sceneId, monsterId) * refixRate)
			
	LuaFnSetLifeTimeAttrRefix_CriticalAttack(sceneId, monsterId,
			LuaFnGetBaseCriticalAttack(sceneId, monsterId) * refixRate)

	LuaFnSetLifeTimeAttrRefix_CriticalDefence(sceneId, monsterId,
			LuaFnGetBaseCriticalDefence(sceneId, monsterId) * refixRate)
			
	LuaFnSetLifeTimeAttrRefix_AttackPhysics(sceneId, monsterId, 
			LuaFnGetBaseAttackPhysics(sceneId, monsterId) * refixRate)
	
end

function x229023_CreateMonster(sceneId)
	
	local aifile
	local MonsterId
	local monsterDataId
	
	local demandMonsterCount = LuaFnGetCopySceneData_Param(sceneId, 8)
	local monsterLevel = LuaFnGetCopySceneData_Param(sceneId, 9)
	--�����������������Ӧ�����Ĺ���
	local monsterCount = getn(x229023_g_MonsterPosList.MonsterPos)
	for i=1, demandMonsterCount-1 do
		if i > monsterCount then
			break
		end	
		aifile = random(10)
		monsterDataId= x229023_g_MonsterPosList.MonsterPos[i].id + monsterLevel / 10
		MonsterId = LuaFnCreateMonster(sceneId, monsterDataId, x229023_g_MonsterPosList.MonsterPos[i].x, 
									x229023_g_MonsterPosList.MonsterPos[i].z, 0, aifile, -1)
		SetLevel(sceneId, MonsterId, monsterLevel+3)
	
		SetCharacterDieTime(sceneId, MonsterId, 30*60000)
		--���ù�������֣��ƺ�
		local strTitle, strName = x229023_CreateTitleAndName_Monster()
		SetCharacterTitle(sceneId, MonsterId, strTitle)
		SetCharacterName(sceneId, MonsterId, strName)			
				
		local currRound = LuaFnGetCopySceneData_Param(sceneId, 10) ;--ȡ���������ĵ�ǰ����		
		--1~10���������˺��������ɱ�ʣ�����HPΪԭֵ��
		if currRound >= 1 and currRound <= 10 then  
		--11��~20��������ֵ*1.1
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 0.4)
		--21��~30��������ֵ*1.2
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 0.6)
		--31��~40��������ֵ*1.3
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 0.8)
		--41��~50��������ֵ*1.4
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1)
		--51��~60��������ֵ*1.5
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1.2)
		--61��~70��������ֵ*1.6
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1.4)
		--71��~80��������ֵ*1.7
		elseif currRound >= 1 and currRound <= 10 then
			x229023_RefixSomeAttr(sceneId, MonsterId, 1.6)
		end
		
	end
		
	aifile = random(10)
	monsterDataId= x229023_g_MonsterPosList.BossPos.id + monsterLevel / 10
	MonsterId = LuaFnCreateMonster(sceneId, monsterDataId, x229023_g_MonsterPosList.BossPos.x, 
								x229023_g_MonsterPosList.BossPos.z, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, monsterLevel+5)
							
	SetCharacterDieTime(sceneId, MonsterId, 30*60000)
	--���ù�������֣��ƺ�
	local strTitle, strName = x229023_CreateTitleAndName_Boss(sceneId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			
	--�������ı����𣬵磬�����ԣ�����������ֵ
	local attr = random(4)
	if attr == 1 then --��
		LuaFnSetLifeTimeAttrRefix_ResistCold(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistCold(sceneId, MonsterId)*0.5 )
	elseif attr == 2 then --��
		LuaFnSetLifeTimeAttrRefix_AttackFire(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistFire(sceneId, MonsterId)*0.5 )
	elseif attr == 3 then --��
		LuaFnSetLifeTimeAttrRefix_ResistLight(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistLight(sceneId, MonsterId)*0.5 )
	else --��
		LuaFnSetLifeTimeAttrRefix_ResistPoison(sceneId, MonsterId, 
				LuaFnGetLifeTimeAttrRefix_ResistPoison(sceneId, MonsterId)*0.5 )
	end
		
end
