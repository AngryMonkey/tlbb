--Creator ��ΰ
--����� ¥��Ѱ��

--�ű���
x808039_g_ScriptId = 808039;

--��������
x808039_g_CopySceneName = "¥��Ѱ��"
x808039_g_activity_time = { 
	[1] = {startTime = 1930, endTime = 2200},
	[2] = {startTime = 1130, endTime = 1430},
};

x808039_g_impact_Id = 73;
x808039_g_TotalNeedKill = 200;
x808039_g_MonsterChangeTime = 90 * 1000; -- �������ʱ�� 90�� (����)

x808039_g_CopySceneType = FUBEN_SEEK_TREASURE	--�������ͣ�������ScriptGlobal.lua����

x808039_g_LimitMembers = 1							--���Խ���������С��������
x808039_g_TickTime = 5									--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x808039_g_LimitTotalHoldTime = 720 			--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ�� 72*5 =60����
x808039_g_StartTickCount = 7  					--ս����ʼ���ѣ���λ��������
x808039_g_CloseTick = 6									--�����ر�ǰ����ʱ����λ��������
x808039_g_NoUserTime = 36								--������û���˺���Լ��������ʱ�䣨��λ���룩 3����
x808039_g_Fuben_X = 65									--���븱����λ��X need modify
x808039_g_Fuben_Z = 94									--���븱����λ��Z
x808039_g_Back_X = 163									--Դ����λ��X
x808039_g_Back_Z = 77										--Դ����λ��Z
x808039_g_Back_SceneId = 186						--Դ����Id ¥��

x808039_g_FuBen_Data = 
{
	MapFile = "loulanxunbao.nav", AreaFile = "loulanxunbao_area.ini", MonsterFile = "loulanxunbao_monster.ini",	
}
	
x808039_g_MonsterFlushSpeed =
{
	{ from = 1, to = 10, speed = 8 },
	{ from = 11, to = 20, speed = 7 },
	{ from = 21, to = 30, speed = 6 },
	{ from = 31, to = 40, speed = 5 },
	{ from = 41, to = 50, speed = 4 },
}

x808039_g_MonsterFlushPos =
{
		{{63,81},{66,83},{63,85},{66,87},},
		{{65,81},{63,83},{66,85},{63,87},},
		{{68,81},{71,82},{69,85},{72,87},},
		{{71,80},{68,83},{72,85},{69,87},},
		{{73,79},{77,80},{75,84},{81,85},},
		{{75,78},{74,81},{79,83},{77,87},},
		{{77,77},{82,76},{83,81},{89,80},},
		{{79,75},{80,79},{85,78},{86,84},},
		{{80,73},{84,72},{87,75},{93,74},},
		{{80,71},{83,74},{89,73},{91,77},},
		{{80,69},{85,67},{90,70},{94,67},},
		{{81,67},{85,69},{90,67},{94,70},},
		{{81,65},{85,62},{89,64},{93,62},},
		{{81,63},{85,64},{89,62},{94,65},},
		{{80,61},{84,57},{88,59},{91,55},},
		{{80,59},{84,60},{88,56},{92,58},},
		{{79,57},{81,53},{86,53},{88,49},},
		{{78,55},{82,55},{85,51},{89,52},},
		{{77,53},{78,48},{83,48},{82,43},},
		{{76,51},{79,51},{80,45},{86,46},},
		{{74,50},{72,45},{77,43},{76,39},},
		{{71,48},{75,46},{74,42},{79,40},},
		{{69,48},{68,44},{71,41},{68,36},},
		{{67,47},{70,45},{68,40},{72,37},},
		{{65,47},{62,44},{65,40},{61,36},},
		{{63,47},{65,43},{62,40},{65,36},},
		{{61,47},{58,45},{58,41},{54,39},},
		{{59,48},{60,44},{56,42},{57,38},},
		{{57,48},{53,47},{53,43},{48,42},},
		{{55,49},{56,46},{51,45},{51,41},},
		{{53,51},{49,51},{48,47},{43,47},},
		{{52,53},{51,49},{46,49},{46,44},},
		{{51,54},{46,55},{44,52},{39,54},},
		{{50,56},{47,53},{43,54},{41,50},},
		{{49,58},{45,59},{42,57},{37,59},},
		{{49,60},{46,57},{41,59},{38,57},},
		{{48,62},{44,64},{41,61},{37,64},},
		{{48,64},{44,62},{40,64},{37,62},},
		{{48,66},{45,68},{41,66},{38,69},},
		{{48,67},{44,66},{41,69},{37,67},},
		{{48,69},{46,72},{42,71},{40,74},},
		{{49,71},{45,70},{43,73},{39,72},},
		{{49,72},{48,76},{44,75},{42,79},},
		{{50,74},{47,74},{44,77},{41,76},},
		{{51,76},{51,80},{46,80},{46,84},},
		{{53,78},{49,78},{48,82},{43,82},},
		{{55,78},{56,82},{51,84},{54,87},},
		{{57,79},{53,81},{55,85},{50,86},},
		{{59,80},{60,83},{58,85},{60,87},},
		{{61,81},{58,83},{60,85},{57,87},},
}

--x808039_g_NianShouCreatePos = --����ˢ������
--{
--	{34,65},{38,49},{43,42},{73,35},{91,48},
--	{95,60},{92,78},{80,91},{48,91},{97,66},
--}
--x808039_g_NianShouId = --����ID
--{
--	12206, --70
--	12207,
--	12208,
--	12209,
--	12210, 
--	12210, --120
--}

x808039_g_BossPos =
{
	x = 64, z = 64,
}
-- �Ϲű���	
x808039_g_SmallMonsterId = 
{
}	
x808039_g_SmallMonsterId[1] = {12102,12103,12104,12105,12106,12107,12108,12109,12110} --70,80,90...150 ��ɫ
x808039_g_SmallMonsterId[2] = {12111,12112,12113,12114,12115,12116,12117,12118,12119} --70,80,90...150 ��ɫ
-- ����ͯ��
x808039_g_MiddleMonsterId =
{
}
x808039_g_MiddleMonsterId[1] = {12120,12121,12122,12123,12124,12125,12126,12127,12128}
x808039_g_MiddleMonsterId[2] = {12129,12130,12131,12132,12133,12134,12135,12136,12137}
-- ������
x808039_g_BossMonsterId = {12138,12139,12140,12141,12142,12143,12144,12145,12146}

--**********************************
--������ں���
--**********************************
function x808039_OnDefaultEvent( sceneId, selfId, targetId )
	local id = GetNumText();
	local msg = "";
	if id == 1 then
		-- �Ƿ񿪷�
		if x808039_IsOpenNow() == 0 then	  
			BeginEvent(sceneId)
				AddText(sceneId, "    #{LLXB_8815_09}")
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId) 
			return
		end
		-- ���ʧ��
		local ret, msg = x808039_CheckEnterCondition(sceneId, selfId);
		if ret == 0 then
			x808039_RetDlg(sceneId, selfId, targetId, msg);
			return
		end
		if x808039_CheckMemberInfo(sceneId, selfId, targetId) ~= 1 then
			return
		end
		-- ���ͨ��
		x808039_MakeCopyScene(sceneId, selfId)
	elseif id == 2 then
		BeginEvent(sceneId)
			msg = "#{LLXB_8815_08}";
			AddText(sceneId, msg);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--�о��¼�
--**********************************
function x808039_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText(sceneId, x808039_g_ScriptId, "¥��Ѱ��", 6, 1);
	AddNumText(sceneId, x808039_g_ScriptId, "¥��Ѱ�������", 11, 2);
end

--**********************************
--��������....
--**********************************
function x808039_OnDie( sceneId, objId, killerId )
	--�Ƿ��Ǹ���
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end 
	--�Ƿ�������Ҫ�ĸ���
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x808039_g_CopySceneType then
		return
	end
	--�����رձ�־
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 12) ;
	if 	leaveFlag==1 then --��������Ѿ����óɹر�״̬����ɱ����Ч
		return 
	end
	
	--ȡ�õ�ǰ�����������
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	killednumber = LuaFnGetCopySceneData_Param(sceneId, 7) ;--ɱ���ֵ�����
	killednumber = killednumber+1
	LuaFnSetCopySceneData_Param(sceneId, 7, killednumber) ;--����ɱ���ֵ�����

	if killednumber <= x808039_g_TotalNeedKill then
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--ȡ�õ�ǰ�������˵�objId
			if LuaFnIsObjValid(sceneId, humanObjId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, humanObjId) == 1 then
				BeginEvent(sceneId)
					strText = format("��ɱ������ %d/%d", killednumber, x808039_g_TotalNeedKill )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
		----
		if killednumber == x808039_g_TotalNeedKill then --15��������
			LuaFnSetCopySceneData_Param(sceneId, 15, 1); --��������־��λ
			--������buff 73
			for i=0, num-1 do
				humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--ȡ�õ�ǰ�������˵�objId
				if LuaFnIsObjValid(sceneId, humanObjId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, humanObjId) == 1 then 
					LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, humanObjId, x808039_g_impact_Id, 0); 
				end
			end
		end
	elseif killednumber > x808039_g_TotalNeedKill then --���������ɵ���
		--����������ɱ�־
		
		LuaFnSetCopySceneData_Param(sceneId, 12, 1);				
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--ȡ�õ�ǰ�������˵�objId
			if LuaFnIsObjValid(sceneId, humanObjId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, humanObjId) == 1 then
				BeginEvent(sceneId)
					strText = format("������ɣ�����%d����͵����λ��", x808039_g_CloseTick*x808039_g_TickTime )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
		-- boss ��ɱ����
		x808039_playNotify(sceneId, killerId);
	end
end

--**********************************
--Boss��ɱ����
--**********************************
function x808039_playNotify(sceneId, killerId)
	-- zchw ȫ�򹫸�
	local	playerName	= GetName( sceneId, killerId )
	local msg = {};
	
	--ɱ��������ǳ������ȡ�����˵�����....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--��������������ȡ�ӳ�������....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	local str = format("#{_INFOUSR%s}#{LLXB_8815_15}#{_BOSS94}#{LLXB_8815_16}", playerName);
	msg[1] = str;
	str = format("#{_BOSS94}#{LLXB_8815_17}#{_INFOUSR%s}#{LLXB_8815_18}", playerName);
	msg[2] = str;
	str = format("#{_INFOUSR%s}#{LLXB_8815_19}#{_BOSS94}#{LLXB_8815_20}", playerName);
	msg[3] = str;
	str = format("#{LLXB_8815_21}#{_INFOUSR%s}#{LLXB_8815_22}#{_BOSS94}#{LLXB_8815_23}", playerName);
	msg[4] = str;
	local rand = random(4);
	if playerName ~= nil then 
		AddGlobalCountNews( sceneId, msg[rand] );
	end	
end
--**********************************
--������ڸ����������¼�
--**********************************
function x808039_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--����������ʱ���¼�
--**********************************
function x808039_OnCopySceneTimer( sceneId, nowTime )
	
	local msg = "";
	local leaveTickCount = "";
	local tickCount = LuaFnGetCopySceneData_Param(sceneId, 2); --����������tick��
	tickCount = tickCount + 1;
	LuaFnSetCopySceneData_Param(sceneId, 2, tickCount);	
	--�����رձ�־
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 12) ;	
	-- zchw 
--	if tickCount == 2 then
--			--�������� zchw
--			local iniLevel = LuaFnGetCopySceneData_Param(sceneId, 10);
--			local actLevel = LuaFnGetCopySceneData_Param(sceneId, 13)
--			--PrintStr("ID="..x808039_g_NianShouId[iniLevel]..pos[1]..","..pos[2]..actLevel);
--			for i ,pos in x808039_g_NianShouCreatePos do
--				local objId = LuaFnCreateMonster( sceneId, x808039_g_NianShouId[iniLevel], pos[1], pos[2], 1, 272, -1 )
--				SetLevel( sceneId, objId, actLevel )
--				LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--			end
--	end
	
	if leaveFlag == 1 then -- ��Ҫ�뿪		
		--�뿪����ʱ��Ķ�ȡ������
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 16) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 16, leaveTickCount) ;
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;		--ȡ�ø�����ڳ�����
		if leaveTickCount >= x808039_g_CloseTick then 						--����ʱ�䵽����Ҷ���ȥ��		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;	--ȡ�ø�����ڳ�����
			
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i);
				if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x808039_g_Back_X, x808039_g_Back_Z )
				end
			end
			
		elseif leaveTickCount < x808039_g_CloseTick then
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
	  			BeginEvent(sceneId)
	  				strText = format("�㽫��%d����뿪����!", (x808039_g_CloseTick-leaveTickCount)*x808039_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
	  		end
			end
		end	
	elseif tickCount >=  x808039_g_LimitTotalHoldTime then --���������ʱ�䵽

		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do

			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
				BeginEvent(sceneId)
					AddText(sceneId,"����ʧ�ܣ���ʱ!");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,mems[i])
			end
		end
		--���ø����رձ�־
		LuaFnSetCopySceneData_Param(sceneId, 12, 1) ;
	elseif tickCount < x808039_g_StartTickCount then 
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		for i=0, membercount-1 do
			local objId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, objId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, objId) == 1 then
				local tm = (x808039_g_StartTickCount - tickCount)*x808039_g_TickTime;
				BeginEvent(sceneId)
					local	msg = format("%d��֮�󽫻Ὺʼս����", tm);
					AddText(sceneId, msg)
				EndEvent()
				DispatchMissionTips(sceneId, objId);
			end
		end
	elseif tickCount == x808039_g_StartTickCount then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		for i=0, membercount-1 do
			local objId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, objId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, objId) == 1 then
				BeginEvent(sceneId)
					AddText(sceneId, "ս���ѿ�ʼ");
				EndEvent()
				DispatchMissionTips(sceneId, objId);
			end
		end	
		--ˢ��һ����
		local grade = LuaFnGetCopySceneData_Param(sceneId, 10); 		-- ������ 
		local mstColor = LuaFnGetCopySceneData_Param(sceneId, 11); 	-- ����ɫ
		local mstLvl = LuaFnGetCopySceneData_Param(sceneId, 13); 		-- �ֵȼ� 
			
		local mstId = x808039_g_SmallMonsterId[1][grade];
		for i, pos in x808039_g_MonsterFlushPos[1] do
			local objId = LuaFnCreateMonster( sceneId, mstId, pos[1], pos[2], 7, -1, 808039 )
			SetLevel( sceneId, objId, mstLvl )
		end		
		--��һ��ˢ��ɫ
		LuaFnSetCopySceneData_Param(sceneId, 11, 2);	
		--����ˢ��ʱ��
		LuaFnSetCopySceneData_Param(sceneId, 9, tickCount);
		--����ˢ������
		LuaFnSetCopySceneData_Param(sceneId, 8, 2);
	else	
		local bActive = x808039_IsOpenNow();
		if bActive and bActive == 1 then
		else
			--���ø����رձ�־
			LuaFnSetCopySceneData_Param(sceneId, 12, 1);
			return
		end	
		------------------------------------
		--�仯����
		local monsterObjId = -1;
		local monsterCount = GetMonsterCount(sceneId);
		for i = 0, monsterCount - 1 do
			monsterObjId = GetMonsterObjID(sceneId, i);
			if LuaFnIsCharacterLiving(sceneId, monsterObjId) > 0 then				--��Ĺ���
				local monstertype = GetMonsterDataID(sceneId, monsterObjId);	--��������
				local monsterLevel = GetLevel(sceneId, monsterObjId);
				local mcreatetime = GetObjCreateTime(sceneId, monsterObjId);	--���ﴴ��ʱ��
				local PosX, PosZ = LuaFnGetWorldPos(sceneId, monsterObjId);
				PosX = floor(PosX);
				PosZ = floor(PosZ);
				--------
				for j=1, 2 do
					for i, record in x808039_g_SmallMonsterId[j] do
						if monstertype == record then
							if nowTime >= mcreatetime + x808039_g_MonsterChangeTime then
								LuaFnDeleteMonster(sceneId, monsterObjId);
								local extAi = 106; --������ͯ����չAI 106
								if j == 2 then
									extAi = 105;     --����ͯ����չAI 105
								end									 
								monsterObjId = LuaFnCreateMonster(sceneId, x808039_g_MiddleMonsterId[j][i], PosX, PosZ, 0, extAi, 808039);
								if monsterObjId and monsterObjId > -1 then
									SetLevel(sceneId, monsterObjId, monsterLevel);
								end
							end
						end
					end
				end 
				--------
			end
		end 
		-----------------------------------
		--ˢ��
		local grade = LuaFnGetCopySceneData_Param(sceneId, 10); -- ������ 
		local mstColor = LuaFnGetCopySceneData_Param(sceneId, 11); -- ����ɫ
		local mstLvl = LuaFnGetCopySceneData_Param(sceneId, 13); -- �ֵȼ� 
		local oldFlushMonsterTime = LuaFnGetCopySceneData_Param(sceneId, 9);			
		local monsterBatch = LuaFnGetCopySceneData_Param(sceneId, 8);
		local ret = nil;
		--�ҵ�ˢ�ּ��ʱ��
		for i, record in x808039_g_MonsterFlushSpeed do
			if monsterBatch >= record["from"] and monsterBatch <= record["to"] then
				ret = i;
				break
			end
		end
		-- ��ʱ�䣬ˢ��	
		if ret ~= nil then
			if oldFlushMonsterTime + x808039_g_MonsterFlushSpeed[ret]["speed"] <= tickCount then 
				LuaFnSetCopySceneData_Param( sceneId, 14, 0 ); --���жϱ�־
		
				if mstColor == 1 then
					LuaFnSetCopySceneData_Param(sceneId, 11, 2);
				elseif mstColor == 2 then
					LuaFnSetCopySceneData_Param(sceneId, 11, 1);
				end
				local mstId = x808039_g_SmallMonsterId[mstColor][grade];
				if monsterBatch <= 50 and monsterBatch >= 1 then
					for i, pos in x808039_g_MonsterFlushPos[monsterBatch] do
						local objId = LuaFnCreateMonster( sceneId, mstId, pos[1], pos[2], 7, -1, 808039 )
						SetLevel( sceneId, objId, mstLvl )
					end		
					monsterBatch = monsterBatch + 1;
					LuaFnSetCopySceneData_Param(sceneId, 8, monsterBatch); -- ˢ������+1	
				end
				LuaFnSetCopySceneData_Param(sceneId, 9, tickCount); --��ˢ��ʱ��	
				-- ˢ30����ЪЪ
				if monsterBatch == 31 then
					LuaFnSetCopySceneData_Param( sceneId, 9, tickCount+18-5 ); --��ˢ��ʱ��	Ъ90��
					LuaFnSetCopySceneData_Param( sceneId, 14, 1 ); --���жϱ�־
					--�ⶴ�еı����Ѿ����������˴�룬�������СЪһ�����������š�
					local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
					for i=0, membercount-1 do
						local objId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
						if LuaFnIsObjValid(sceneId, objId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, objId) == 1 then
							x808039_ShowMsg(sceneId, objId, "#{LLXB_8815_14}");
						end
					end
				end
			end
		end
		-- �м��Ъ
		oldFlushMonsterTime = LuaFnGetCopySceneData_Param(sceneId, 9);	
		if LuaFnGetCopySceneData_Param( sceneId, 14 ) == 1 then
			local diffCount = oldFlushMonsterTime+5 - tickCount;
			if diffCount <= 6 and diffCount >= 1 then
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
				for i=0, membercount-1 do
					local objId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
					if LuaFnIsObjValid(sceneId, objId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, objId) == 1 then
						local tm = diffCount*x808039_g_TickTime;
						msg = format("%d��֮�󽫻����¿�ʼս����", tm);
						x808039_ShowMsg(sceneId, objId, msg);
					end
				end
			end
		end
		
		local num = LuaFnGetCopySceneData_Param(sceneId, 15);
		if num > 0 then
			if num == 4 then -- ������
				local grade = LuaFnGetCopySceneData_Param(sceneId, 10); 		-- ������ 
				local mstLvl = LuaFnGetCopySceneData_Param(sceneId, 13); -- �ֵȼ�	
				local objId = LuaFnCreateMonster( sceneId, x808039_g_BossMonsterId[grade], x808039_g_BossPos.x, x808039_g_BossPos.z, 0, 271, 808039 )
				SetLevel( sceneId, objId, mstLvl )	
				--����
				CallScriptFunction((200060), "Paopao", sceneId, "������", "¥���ر���", "������������Ϊ������������������Ϊ�������б��µľ������ð���")
				LuaFnSetCopySceneData_Param(sceneId, 15, 0);		
			else
				LuaFnSetCopySceneData_Param(sceneId, 15, num+1);
			end
		end

	end -- end else
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x808039_OnPlayerEnter( sceneId, selfId )
	local tmDay = GetTime2Day();
	SetMissionData(sceneId, selfId, MD_SEEK_TREASURE, tmDay); --����ʱ��
	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x808039_g_Fuben_X, x808039_g_Fuben_Z );
end

--**********************************
--�����¼�
--**********************************
function x808039_OnCopySceneReady( sceneId, destsceneId )

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
		NewWorld( sceneId, leaderObjId, destsceneId, x808039_g_Fuben_X, x808039_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x808039_g_Fuben_X, x808039_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x808039_g_Fuben_X, x808039_g_Fuben_Z) ;
			end
		end		
	end

end

--**********************************
--��������
--**********************************
function x808039_MakeCopyScene(sceneId, selfId)
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
	
	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, x808039_g_FuBen_Data.MapFile); --��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x808039_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x808039_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x808039_g_CopySceneType);--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x808039_g_ScriptId);--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)	--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, x);				--���ø�������ڳ���λ��x
	LuaFnSetCopySceneData_Param(sceneId, 5, z);				--���ø�������ڳ���λ��Z
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);		--ɱ���ֵ�����
	LuaFnSetCopySceneData_Param(sceneId, 8, 1);		--ˢ���ڼ�����
	LuaFnSetCopySceneData_Param(sceneId, 9, 0);		--�ϴ�ˢ���ֵ�ʱ�� tickCount��ʾ
	
	for i=10, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 70 then
		iniLevel = 1;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) - 6;
	else
		iniLevel = PlayerMaxLevel/10;
	end
	
	-- ʹ�ø�������10��11��12�����������
	LuaFnSetCopySceneData_Param(sceneId, 10, iniLevel) --С�ּ���
	LuaFnSetCopySceneData_Param(sceneId, 11, 1)--��ɫ����ɫ��
	-- ʹ�õ�12λ����¼�����Ƿ�Ҫ�ر�
	LuaFnSetCopySceneData_Param(sceneId, 12, 0)
	-- ʹ�õ�13λ����¼����ʵ�ʵĵȼ�
	LuaFnSetCopySceneData_Param(sceneId, 13, mylevel)
	-- ʹ�õ�14λ����¼�Ƿ���Ҫˢ��30�����ж�
	LuaFnSetCopySceneData_Param(sceneId, 14, 0);
	-- ʹ�õ�15λ���������ֱ�־
	LuaFnSetCopySceneData_Param(sceneId, 15, 0);
	-- ʹ�õ�16λ���رյ���ʱ
	LuaFnSetCopySceneData_Param(sceneId, 16, 0);	
	--���ó����еĸ���Npc������
	LuaFnSetSceneLoad_Area( sceneId, x808039_g_FuBen_Data.AreaFile )
	LuaFnSetSceneLoad_Monster( sceneId, x808039_g_FuBen_Data.MonsterFile )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --��ʼ����ɺ���ô�����������
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
			--��־
			AuditSeekTreasureCreateTime(sceneId, selfId);
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)	
end
--**********************************
--��Ϣ��ʾ
--**********************************
function x808039_ShowMsg( sceneId, selfId, msg )
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
--���ضԻ�
--**********************************
function x808039_RetDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end
--**********************************
--�ʱ����֤ �ɹ�������1�� ʧ�ܣ�0
--**********************************
function x808039_IsOpenNow()
	local hour = GetHour();
	local minute = GetMinute();
	local time = hour*100 + minute;
	if (time > x808039_g_activity_time[1]["startTime"] and time < x808039_g_activity_time[1]["endTime"]) or
     (time > x808039_g_activity_time[2]["startTime"] and time < x808039_g_activity_time[2]["endTime"]) then			
		return 1;
	end
	return 0;
end
--**********************************
--�жϻ�����������
--�ɹ���1 ʧ�ܣ�0
--**********************************
function x808039_CheckEnterCondition(sceneId, selfId)
 	--��ӣ�
 	if LuaFnHasTeam(sceneId, selfId) == 0 then
		return 0, "#{LLXB_8815_10}";	
 	end
 	--�ӳ���
 	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
		return 0, "#{LLXB_8815_11}";	 
 	end
 	--����ﵽ����Ҫ��
 	local teamSize = GetTeamSize(sceneId, selfId);
 	if teamSize < x808039_g_LimitMembers then
		return 0, "#{LLXB_8815_12}";		
 	end
  --��Ա���ڸ�����
  if GetNearTeamCount(sceneId, selfId) < teamSize then
		return 0, "#{LLXB_8815_13}";	  
  end
  --��Ա��ɱ����
  for i=0, teamSize-1 do
  	local objId = GetNearTeamMember(sceneId, selfId, i);
  	if LuaFnGetHumanPKValue(sceneId, objId) > 0 then
  		local name = GetName(sceneId, objId);
  		local msg = format("��Ա%sɱ��̫�أ����ܽ���ر����ڣ�", name);
  		return 0, msg;
  	end  	
  end
  --ok
  return 1, "ok";
end
--**********************************
--�ж�ÿ����Ա����
--�ɹ���1 ʧ�ܣ�0
--**********************************
function x808039_CheckMemberInfo(sceneId, selfId, targetId)
  --���ÿһ����Ա��Ϣ
  local bSucc = 1;
  local teamSize = GetTeamSize(sceneId, selfId);
  local msg = "";
  local x808039_member_info = {
		{ name = "", levelReq = "#G����", xinfaReq = "#G����", taskCount = "#G����" },
		{ name = "", levelReq = "#G����", xinfaReq = "#G����", taskCount = "#G����" },
		{ name = "", levelReq = "#G����", xinfaReq = "#G����", taskCount = "#G����" },
		{ name = "", levelReq = "#G����", xinfaReq = "#G����", taskCount = "#G����" },
		{ name = "", levelReq = "#G����", xinfaReq = "#G����", taskCount = "#G����" },
		{ name = "", levelReq = "#G����", xinfaReq = "#G����", taskCount = "#G����" },
	}
  -----------------------
  for i=0, teamSize-1 do
  	local objId = GetNearTeamMember(sceneId, selfId, i);
  	local level = LuaFnGetLevel(sceneId, objId);
  	local bXinfaOK = x808039_CheckXinfaLevel(sceneId, objId, 40) --�ķ��ﵽ40����
  	local joinDate = GetMissionData(sceneId, objId, MD_SEEK_TREASURE);

  	x808039_member_info[i+1]["name"] = GetName(sceneId, objId);
  	if GetTime2Day() == joinDate then
  		x808039_member_info[i+1]["taskCount"] = "#cff0000������";
  		bSucc = 0;  		
  	end
  	if level < 75 then
  		x808039_member_info[i+1]["levelReq"] = "#cff0000������";
  		bSucc = 0;
  	end
  	if bXinfaOK == 0 then
  		x808039_member_info[i+1]["xinfaReq"] = "#cff0000������";
  		bSucc = 0;
  	end
  end
  ---------------------
	if bSucc == 0 then
		BeginEvent(sceneId, selfId)
		AddText(sceneId, "  �����Ա��Ѷ��");
		for i, mem in x808039_member_info do
			if i > teamSize then
				break
			end	
			msg = format("  #B��Ա%s��", mem["name"]);
			if x808039_member_info[i]["levelReq"] == "#cff0000������" then
				msg = msg.."#r  #cff0000����ȼ�75             ������";
			else
				msg = msg.."#r  #G����ȼ�75             ����";
			end
			---------------
			if x808039_member_info[i]["xinfaReq"] == "#cff0000������" then
				msg = msg.."#r  #cff0000�ķ��ȼ�40             ������" ;
			else
				msg = msg.."#r  #G�ķ��ȼ�40             ����";
			end
			---------------
			if x808039_member_info[i]["taskCount"] == "#cff0000������" then
				msg = msg.."#r  #cff0000�������               ������";
			else
				msg = msg.."#r  #G�������               ����";
			end
			AddText(sceneId, msg); 
		end	 -- end of for
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
		return 0;
	end
  --ok
  return 1;
end

--**********************************
--�ж��ķ��ȼ��Ƿ����
--�ɹ���1 ʧ�ܣ�0
--**********************************
function x808039_CheckXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end
