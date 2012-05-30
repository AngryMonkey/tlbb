-- 402105
-- �����ڱ���

--************************************************************************
--MisDescBegin
--�ű���
x402105_g_ScriptId = 402105

--MisDescEnd
--************************************************************************


--��������
x402105_g_CopySceneName = "��ѹ���߻"

x402105_g_CopySceneType = FUBEN_CATCH_PET	--�������ͣ�������ScriptGlobal.lua����

x402105_g_CopySceneMap = "zhenshoulan.nav"
x402105_g_Exit = "zhenshoulan.ini"
x402105_g_LimitMembers = 1				--���Խ���������С��������
x402105_g_TickTime = 1						--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x402105_g_LimitTotalHoldTime = 360--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x402105_g_LimitTimeSuccess = 500	--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x402105_g_CloseTick = 3						--�����ر�ǰ����ʱ����λ��������
x402105_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x402105_g_DeadTrans = 0						--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x402105_g_Fuben_X = 36						--���븱����λ��X
x402105_g_Fuben_Z = 97						--���븱����λ��Z
x402105_g_Back_X = 141							--Դ����λ��X
x402105_g_Back_Z = 114							--Դ����λ��Z
x402105_g_Back_SceneId = 158			--Դ����Id
	
-- ������Ʒ
x402105_g_Item = 40004429

-- ʥ��ɽ����Id
x402105_g_PetSceneId = 158

-- Ұ�����Ϣ
x402105_g_MonsterInfo_1 = {id=3800,ai=17,aif=207}
x402105_g_MonsterPos = {
		{x=65.5176,z=	79.0207,},{x=69.8164,z=	88.1377,},{x=83.8354,z=	92.4449,},
		{x=77.5097,z=	74.2288,},{x=87.9545,z=	70.4181,},{x=74.7209,z=	60.9159,},
		{x=60.6836,z=	56.8568,},{x=71.8951,z=	46.935 ,},{x=86.682	,z= 44.4101,},
		{x=98.8462,z=	37.5822,},{x=60.1058,z=	35.1054,},{x=45.9477,z=	34.18  ,},
		{x=25.7361,z=	43.8625,},{x=34.4459,z=	55.7157,},{x=42.0419,z=	45.9647,},
		{x=48.4925,z=	58.1778,},{x=74.1362,z=	29.3186,},{x=89.6256,z=	29.2022,},
		{x=56.631	,z= 45.7225,},{x=94.1026,z=	57.7871,},{x=97.1927,z=	90.8149,},
		{x=52.1854,z=	84.1242,},{x=58.4518,z=	70.0597,},{x=66.7249,z=	100.087,},
		{x=29.7832,z=	25.596 ,},{x=34.8878,z=	35.452 ,},{x=80.2963,z=	37.4068,},
		{x=93.935	,z= 78.0536,},{x=83.9264,z=	54.9693,},{x=64.3749,z=	24.8037,},
}

--boss��Ϣ
x402105_g_BossInfo_1 = {id=3810,ai=16,aif=208,x=73,z=50,script=-1}
x402105_g_BossInfo_2 = {id=3820,ai=17,aif=209,x=73,z=50,script=501000}
x402105_g_BossRand_2 = 10

--**********************************
--������ں���
--**********************************
function x402105_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText()==1010 then
		BeginEvent(sceneId)
				AddText(sceneId,"#{YZBZ_20070930_004}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if LuaFnHasTeam(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B׷��Ұ����");
			AddText(sceneId,"  �˶����������Ǵ��������ٳ�����#R(��Ҫ�Ƕӳ������Ҷ�������������)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 2���������ǲ��������
	if GetTeamSize(sceneId,selfId) < x402105_g_LimitMembers  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B׷��Ұ����");
			AddText(sceneId,"  �˶����������Ǵ��������ٳ�����#R(��Ҫ�Ƕӳ������Ҷ�������������)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3���������ǲ��Ƕӳ�
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#B׷��Ұ����");
			AddText(sceneId,"  �˶����������Ǵ��������ٳ�����#R(��Ҫ�Ƕӳ������Ҷ�������������)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4������ǲ����˶���λ��
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B׷��Ұ����");
			AddText(sceneId,"  �˶����������Ǵ��������ٳ�����#R(��Ҫ�Ƕӳ������Ҷ�������������)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- ֻ��Ҫ�ӳ���������Ʒ�Ϳ���,���ӳ������ǲ����������Ʒ
	if LuaFnGetAvailableItemCount(sceneId,selfId,x402105_g_Item) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B׷��Ұ����");
			AddText(sceneId,"  Ҫ���ҵ�Ұ���������ǵ����㹻���������С�#R(��ҪЯ������#GҰ�������ټ�#R)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 1����ҵȼ�
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""
	local ret = 1
 	
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		if GetLevel(sceneId, nPlayerId) < 40  then
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
			AddText(sceneId,"#B׷��Ұ����");
			AddText(sceneId,"  Ҫ����Ұ�������ȼ�̫�Ϳɲ��С�#r#R���������г�Ա��" .. szAllName .. "���ȼ�����40��");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	
	-- ���еļ��ͨ��,����������ɾ���Ի�����
	-- ��һ����ȫ���
	if sceneId==x402105_g_PetSceneId  then
		x402105_MakeCopyScene(sceneId, selfId, targetId)
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x402105_OnEnumerate( sceneId, selfId, targetId )
	-- �����������һ�������ж�
	AddNumText( sceneId, x402105_g_ScriptId, "׷��Ұ����",10 ,-1  )
	AddNumText( sceneId, x402105_g_ScriptId, "#{YZBZ_20070930_003}",11 ,1010  )	
	
end

--**********************************
--����������
--**********************************
function x402105_CheckAccept( sceneId, selfId )
	
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x402105_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x402105_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x402105_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--��������
--**********************************
function x402105_MakeCopyScene( sceneId, selfId, targetId )
	
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
	LuaFnSetSceneLoad_Map(sceneId, "zhenshoulan.nav"); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402105_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x402105_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x402105_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402105_g_ScriptId);--��1����������Ϊ���������¼��ű���
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
		iniLevel = floor(PlayerMaxLevel/10);
	end
	
	-- ʹ�õ�8λ����¼����ʵ�ʵĵȼ�
	LuaFnSetCopySceneData_Param(sceneId,8, mylevel)
	LuaFnSetCopySceneData_Param(sceneId,9, iniLevel)
	
	-- ԭ����ģʽ ��ĺ����û�� -1 ��¼Ҫ���ȵĹ���Ļ���Id
	--LuaFnSetCopySceneData_Param(sceneId,10, GetMonsterDataID(sceneId, targetId)+iniLevel)
	
	local nMonterID = 0
	if iniLevel >= 11 then
	   nMonterID = GetMonsterDataID(sceneId, targetId)+iniLevel - 10 + 30000
	else
	   nMonterID = GetMonsterDataID(sceneId, targetId)+iniLevel
	end
	-- ��¼Ҫ���ȵĹ���Ļ���Id
	LuaFnSetCopySceneData_Param(sceneId,10, nMonterID)
	
	--���ó����еĸ���Npc������
	--LuaFnSetSceneLoad_Area( sceneId, "zhenshoulan_area.ini" )
	--LuaFnSetSceneLoad_Monster( sceneId, "zhenshoulan_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)

	if bRetSceneID>0 then			
		-- �������Ƕӳ����۳��������							modify by WTT		20090225
		if IsCaptain(sceneId,selfId) == 1    then
			if DelItem(sceneId, selfId, x402105_g_Item, 1) == 0  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 3)
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"���������ɹ���")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		BeginEvent(sceneId)
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end

end

--**********************************
--�����¼�
--**********************************
function x402105_OnCopySceneReady( sceneId, destsceneId )
	
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
		x402105_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x402105_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x402105_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x402105_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld( sceneId, ObjId, destsceneId, x402105_g_Fuben_X, x402105_g_Fuben_Z) ;
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x402105_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--������ڸ����������¼�
--**********************************
function x402105_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--����
--**********************************
function x402105_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x402105_BackToCity( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x402105_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x402105_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x402105_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--��ʾ���и��������
--**********************************
function x402105_TipAllHuman( sceneId, Str )
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
function x402105_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--ɱ����������
--**********************************
function x402105_OnDie( sceneId, objId, killerId )
	local nKillCount = LuaFnGetCopySceneData_Param(sceneId,20)
	if GetName(sceneId, objId) == "����Ұ��"  then
		LuaFnSetCopySceneData_Param(sceneId,20,nKillCount+1)
		x402105_TipAllHuman(sceneId, "��ɱ������Ұ��" .. tostring(nKillCount+1) .. "/30")
	end
end
--**********************************
--���������¼�
--**********************************
function x402105_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--���߸ı�
--**********************************
function x402105_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x402105_OnCopySceneTimer( sceneId, nowTime )
	local nStep =	LuaFnGetCopySceneData_Param(sceneId, 11)
	if nStep == 0  then
		x402105_CreateMonster_1(sceneId)
		LuaFnSetCopySceneData_Param(sceneId, 11, 1)
	end

	if nStep == 1  then
		local nCount = GetMonsterCount(sceneId)
		local nHaveMonster = 0
		
		for i=0, nCount-1  do
			local nMonterId = GetMonsterObjID(sceneId, i)
			if GetName(sceneId, nMonterId) == "����Ұ��"  then
				nHaveMonster = 1
			end
		end
		
		if nHaveMonster == 0  then
			x402105_CreateMonster_2(sceneId)
			LuaFnSetCopySceneData_Param(sceneId, 11, 2)
		end
	end

	-- �������ȫ��ɱ���������һ���ֺ������
	if nStep == 2  then
		local nCount = GetMonsterCount(sceneId)
		local nHaveMonster = 0
		
		for i=0, nCount-1  do
			local nMonterId = GetMonsterObjID(sceneId, i)
			if GetName(sceneId, nMonterId) == "����Ұ��" 
					or GetName(sceneId, nMonterId) == "����Ұ����"  
					or GetName(sceneId, nMonterId) == "����"  then
				nHaveMonster = 1
			end
		end
		
		if nHaveMonster == 0  then
			LuaFnSetCopySceneData_Param(sceneId, 11, 3)
			--��¼ʱ��
			LuaFnSetCopySceneData_Param(sceneId, 13, LuaFnGetCurrentTime())
		
			local nType = LuaFnGetCopySceneData_Param(sceneId,12)
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			if nHumanNum < 1 then
				return
			end
			local nLeaderId = 0
			for i=0, nHumanNum-1  do
				local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				if GetTeamLeader(sceneId, nPlayerId) == nPlayerId  then
					nLeaderId = nPlayerId
				end
			end
			if nLeaderId == 0  then
				return
			end
			
			local szLeaderName = GetName(sceneId, nLeaderId)
			local str = ""
			-- �����繫��
			if nType == 0  then
				str = format("#{_INFOUSR%s}#P������Ӣ����#GҰ��ũ��#P�����˱���Ұ�������#{_BOSS20}#P��ȴû���ҳ���ֻа������ޡ�",szLeaderName)
			else
				str = format("#{_INFOUSR%s}#P������Ӣ����#GҰ��ũ��#P�����������#{_BOSS21}#P������ƽϢ���ⳡ�粨��",szLeaderName)
			end
			BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
			x402105_TipAllHuman(sceneId,"��������180���رա�")
		end
	end
	
	if nStep == 3  then
		local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 13)
		if LuaFnGetCurrentTime()-nPreTime >= 165  then
			x402105_TipAllHuman(sceneId,"��������15���رա�")
			LuaFnSetCopySceneData_Param(sceneId, 11, 4)
		end
	end
	if nStep == 4  then
		local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 13)
		if LuaFnGetCurrentTime()-nPreTime >= 175  then
			x402105_TipAllHuman(sceneId,"��������5���رա�")
			LuaFnSetCopySceneData_Param(sceneId, 11, 5)
		end
	end
	
	if nStep == 5  then
		local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 13)
		if LuaFnGetCurrentTime()-nPreTime >= 30  then
			-- ���������뿪����
			local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
			if nHumanNum < 1 then
				return
			end
			local PlayerId = 0
			for i=0, nHumanNum-1  do
				PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
				NewWorld( sceneId, PlayerId, x402105_g_Back_SceneId, x402105_g_Back_X, x402105_g_Back_Z)
			end
			LuaFnSetCopySceneData_Param(sceneId, 11, 7)
		end
	end
	
end

--**********************************
--x402105_CreateMonster_1
--**********************************
function x402105_CreateMonster_1(sceneId)
	local mylevel = LuaFnGetCopySceneData_Param(sceneId,8)
	local nInilevel = LuaFnGetCopySceneData_Param(sceneId,9)
	
	local nMonterID = 0
	if nInilevel >= 11 then
	   nMonterID = x402105_g_MonsterInfo_1.id + nInilevel - 11 + 30000
	else
	   nMonterID = x402105_g_MonsterInfo_1.id + nInilevel - 1
	end
	
	for i, Npc in x402105_g_MonsterPos  do
		local nNpcId = LuaFnCreateMonster(sceneId, 
																		 nMonterID, 
																		 Npc.x, 
																		 Npc.z,	
																		 x402105_g_MonsterInfo_1.ai, 
																		 x402105_g_MonsterInfo_1.aif, 
																		 402105)
	end
end

--**********************************
--x402105_CreateMonster_2
--**********************************
function x402105_CreateMonster_2(sceneId)
	local mylevel = LuaFnGetCopySceneData_Param(sceneId,8)
	local nInilevel = LuaFnGetCopySceneData_Param(sceneId,9)
	
	local nMonterID = 0
	if nInilevel >= 11 then
	   nMonterID = x402105_g_BossInfo_1.id + nInilevel - 11 + 30000
	else
	   nMonterID = x402105_g_BossInfo_1.id + nInilevel - 1
	end
	
	local nNpcId = LuaFnCreateMonster( sceneId, 
																		nMonterID, 
																		x402105_g_BossInfo_1.x, 
																		x402105_g_BossInfo_1.z,	
																		x402105_g_BossInfo_1.ai, 
																		x402105_g_BossInfo_1.aif, 
																		x402105_g_BossInfo_1.script)
	SetCharacterTitle(sceneId, nNpcId, "�����")
	x402105_TipAllHuman(sceneId, "���ּ���Ұ������")
																		
	-- һ���������ˢ����boss
	local nRand = random(100)
	if nRand <= x402105_g_BossRand_2   then
		LuaFnSetCopySceneData_Param(sceneId,12,1)
		
		nMonterID = 0
	  if nInilevel >= 11 then
	    nMonterID = x402105_g_BossInfo_2.id + nInilevel - 11 + 30000
	  else
	    nMonterID = x402105_g_BossInfo_2.id + nInilevel - 1
	  end
	
		local nNpcId = LuaFnCreateMonster( sceneId, 
																			nMonterID, 
																			x402105_g_BossInfo_2.x, 
																			x402105_g_BossInfo_2.z,	
																			x402105_g_BossInfo_2.ai, 
																			x402105_g_BossInfo_2.aif, 
																			x402105_g_BossInfo_2.script)
		SetCharacterTitle(sceneId, nNpcId, "ǧ����ʥ��")
		-- ���ˢ��������boss���ͷ����繫��
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		if nHumanNum < 1 then
			return
		end
		
		local nLeaderId = 0
		for i=0, nHumanNum-1  do
			local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if GetTeamLeader(sceneId, nPlayerId) == nPlayerId  then
				nLeaderId = nPlayerId
			end
		end
		if nLeaderId == 0  then
			return
		end
	
		local szLeaderName = GetName(sceneId, nLeaderId)
		local str = ""
		
		str = format("#P��#{_INFOUSR%s}#P�����£���Ӣ����ʥ��ɽ��ѹȺ��ʤ������ȴͻȻ����һֻ#{_BOSS21}��",szLeaderName)
		BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)

	end
	
end

