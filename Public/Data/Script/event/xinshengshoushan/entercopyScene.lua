--�����䵺��ڶԻ��ű�
--

x808121_g_scriptId = 808121

x808121_tipinbox = 1
x808121_g_limitMembers = 3        --��������
x808121_g_Low_Level = 85           --�ȼ�����
x808121_g_Low_Level_xinfa = 50           --�ķ�����
x808121_g_NoUserTime = 3              --������û���˺���Լ��������ʱ�䣨��λ���룩,��֪�����ֵ�Բ��ԣ�
x808121_g_tickDiffTime = 1              --�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x808121_g_CopySceneType = FUBEN_XINSHENGSHOUSHAN        --�������ͣ�������ScriptGlobal.lua����

x808121_g_FubenTbl =
{
	FubenName = "�����䵺",
	MapFile = "petisland_3.nav",
	monsterId = 3290,
	bossId = 3893,  --��������
	AreaFile = "petisland_3_area.ini", 
	MonsterFile = "petisland_3_monster.ini",
	Fuben_start_x = 94,
	Fuben_start_z = 77,
}

x808121_monster_chufeng = {ID = 13281, Aitype = 0, AiscriptId = 0, scriptId = 808121, name = "�������"}     --����
x808121_monster_leilin = {ID = 13280, Aitype = 0, AiscriptId = 0, scriptId = 808121, name = "��������"}      --����
x808121_monster_xudaoshenshou = {ID = 13286, Aitype = 0, AiscriptId = 136, scriptId = 808121, name = "��������"}   --��������
x808121_monster_feitianmao = {ID = 13287, Aitype = 0, AiscriptId = 270, scriptId = 808121, name = "�޵з���è"}   --�޵з���è
x808121_monster_xiaozhuzhu = {ID = 13282, Aitype = 0, AiscriptId = 212, scriptId = 808121, name = "С����"}   --С����
x808121_monster_xiaohuhu = {ID = 13284, Aitype = 0, AiscriptId = 215, scriptId = 808121, name = "С����"}   --С����
x808121_monster_xiaoyingying = {ID = 13285, Aitype = 0, AiscriptId = 214, scriptId = 808121, name = "Сӥӥ"}   --Сӥӥ
x808121_monster_xiaogougou = {ID = 13283, Aitype = 0, AiscriptId = 213, scriptId = 808121, name = "С����"}   --С����
x808121_monster_groupId = 1

x808121_monster_First_num = 15
x808121_monster_Second_num = 15
x808121_monster_Third_num = 15
x808121_monster_Fourth_num = 15
x808121_monster_boss_num = 6
 
x808121_gFirst_MonstersTbl =   --��һ��������
{
{x = 127, z = 85}, {x = 126, z = 90}, {x = 130, z = 90}, {x = 137, z = 77}, {x = 137, z = 81}, {x = 141, z = 80}, {x = 149, z = 86}, {x = 152, z = 82}, {x = 140, z = 101}, 
{x = 157, z = 101}, {x = 134, z = 107}, {x = 145, z = 103}, {x = 154, z = 106}, {x = 147, z = 108}, {x = 160, z = 88}
}
x808121_gSecond_MonstersTbl =   --�ڶ���������
{
{x = 179, z = 86}, {x = 176, z = 89}, {x = 183, z = 100}, {x = 177, z = 95}, {x = 183, z = 92}, {x = 191, z = 122}, {x = 194, z = 128}, {x = 161, z = 108}, {x = 176, z = 116}, 
{x = 152, z = 119}, {x = 162, z = 124}, {x = 163, z = 132}, {x = 175, z = 135}, {x = 178, z = 128}, {x = 170, z = 127}
}
x808121_gThird_MonstersTbl =    --������������
{
{x = 193, z = 153}, {x = 188, z = 163}, {x = 195, z = 163}, {x = 201, z = 163}, {x = 200, z = 170}, {x = 194, z = 171}, {x = 171, z = 146}, {x = 174, z = 150}, {x = 159, z = 156}, 
{x = 162, z = 159}, {x = 157, z = 162}, {x = 149, z = 153}, {x = 147, z = 147}, {x = 152, z = 157}, {x = 161, z = 145}
}
x808121_gFourth_MonstersTbl =    --������������
{
{x = 137, z = 157}, {x = 130, z = 158}, {x = 140, z = 163}, {x = 124, z = 144}, {x = 121, z = 137}, {x = 126, z = 129}, {x = 141, z = 137}, {x = 138, z = 141}, {x = 101, z = 155}, 
{x = 108, z = 161}, {x = 111, z = 163}, {x = 109, z = 173}, {x = 107, z = 169}, {x = 133, z = 146}, {x = 128, z = 136}
}
x808121_gFourth_hudaoshenshouTbl =
{startx = 153, startz = 182, PatrolId = 0}

x808121_gFourth_feitianmaoTbl =
{startx = 155, startz = 150, PatrolId = 1}

x808121_gFourth_xiaozuzuTbl =
{startx = 155, startz = 150, PatrolId = 2}
x808121_gFourth_xiaohuhuTbl =
{startx = 155, startz = 150, PatrolId = 3}
x808121_gFourth_xiaoyingyingTbl =
{startx = 155, startz = 150, PatrolId = 4}
x808121_gFourth_xiaogougouTbl =
{startx = 155, startz = 150, PatrolId = 5}

--����
 -- �������
x808121_g_RandNum = 10000

 -- ����Ĵ��ʱ�䣬3����
x808121_g_Lifecycle = 180000

--**********************************
--������ں���....
--**********************************
function x808121_OnDefaultEvent( sceneId, selfId, targetId )

--**********************************
--NPC�Ի�
--**********************************
	BeginEvent( sceneId )
		AddText(sceneId, "ǧ�������Ѿ����������ص����䵺�ˣ�ȥһ�����ǵķ�ɰɣ�")
		AddNumText( sceneId, x808121_g_scriptId, "�콵����", 6, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end


function x808121_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	
	if GetNumText() == 1 then
		local nCheckRet = x808121_CheckCanEnterScene(sceneId, selfId, targetId, eventId)
		local strOutmsg = "";
		if (nCheckRet == 1) then
			strOutmsg = "����ս���ޣ�����Ҫһ֧3�˻�3�����ϵĶ��顣";
		elseif (nCheckRet == 2) then
			strOutmsg = "�㲻�Ƕӳ���������Ķӳ������ҡ�";
		elseif (nCheckRet == 3) then
			strOutmsg = "����ս���ޣ�����Ҫһ֧3�˻�3�����ϵĶ��顣"           --��������
		elseif (nCheckRet == 4) then
			strOutmsg = "��Ķ������г�Ա���ڸ�����";
		elseif (nCheckRet == 5 or nCheckRet == 6) then
			strOutmsg = "�Բ�����Ķ������г�Ա���������������\n"           --5,6һ���ǿ���ʾ
			
			local nearMemberCount = GetNearTeamCount(sceneId, selfId);
			local sceneMemId = 0;
			local memName = "";
			
			local strOutMsgTemp = {}
			for i = 0, nearMemberCount - 1 do
				sceneMemId = GetNearTeamMember(sceneId, selfId, i)
				memName = GetName(sceneId, sceneMemId);
				strOutMsgTemp[i] = "#c3c3cff"..memName.."#W"
				if sceneMemId and sceneMemId >= 0 then			
					if (GetLevel(sceneId, sceneMemId) < x808121_g_Low_Level) then
						strOutMsgTemp[i] = strOutMsgTemp[i]..":\n  �ȼ�Ҫ��"..tostring(x808121_g_Low_Level).."    #cff0000������#W\n"
					else
						strOutMsgTemp[i] = strOutMsgTemp[i]..":\n  �ȼ�Ҫ��"..tostring(x808121_g_Low_Level).."    #c00ff00����#W\n"
					end
					if (0 == x808121_CheckAllXinfaLevel(sceneId, sceneMemId)) then
						strOutMsgTemp[i] = strOutMsgTemp[i].."  �ķ�Ҫ��"..tostring(x808121_g_Low_Level_xinfa).."    #cff0000������#W\n"
					else
						strOutMsgTemp[i] = strOutMsgTemp[i].."  �ķ�Ҫ��"..tostring(x808121_g_Low_Level_xinfa).."    #c00ff00����#W\n"
					end
				else
					strOutMsgTemp[i] = strOutMsgTemp[i]..memName..":�޷���ȷ��ȡ��Ա�ķ��ȼ����ϡ�"
				end
			end
			
			BeginEvent( sceneId )
				AddText(sceneId, strOutmsg)
				for i = 0, nearMemberCount - 1 do
					AddText(sceneId, strOutMsgTemp[i])
				end
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )	
			
			return
		end			

		if (nCheckRet > 0 and nCheckRet < 5) then
			if (x808121_tipinbox == 1) then
				BeginEvent( sceneId )
		   			AddText(sceneId, strOutmsg)
		   		EndEvent( sceneId )
		  		DispatchEventList( sceneId, selfId, targetId )	
			else
				x808121_NotifyFailTips(sceneId, selfId, strOutmsg);
			end
			return
		end
		
		--���Խ��븱����
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		x808121_MakeCopyScene(sceneId, selfId, targetId, nearMemberCount)	

	end

end


--**********************************
--����Ƿ�������븱����Ҫ��

--����Ƿ�������븱����Ҫ��
--����ֵ˵����1     û���
--            2     ���Ƕӳ�
--            3     ��������
--            4     ��Ա���ڸ���
--            5     �ӳ��ȼ��ķ�����
--            6     ��Ա�ȼ��ķ�����
--            7
--            0       ����
--**********************************
function x808121_CheckCanEnterScene(sceneId, selfId, targetId, eventId)
	
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		return 1
	end
	
	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
		return  2
	end
	
	local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
	if not teamMemberCount or teamMemberCount < x808121_g_limitMembers then
		return  3
	end
	
	local nearMemberCount = GetNearTeamCount(sceneId, selfId);
	if not nearMemberCount or teamMemberCount ~= nearMemberCount then
		return 4
	end
	
	
	-- ���ӳ��ĵȼ��Ƿ�����Ҫ��
	if (GetLevel(sceneId, selfId) < x808121_g_Low_Level or 0 == x808121_CheckAllXinfaLevel(sceneId, selfId)) then
		return 5
	end
	
	-- ͳ���Ƿ��ж�Ա������ȼ��ķ�Ҫ��
	local bHave = 0
	for i = 0, nearMemberCount - 1 do
		local sceneMemId = GetNearTeamMember(sceneId, selfId, i)
		if sceneMemId and sceneMemId >= 0 then			
			if (GetLevel(sceneId, sceneMemId) < x808121_g_Low_Level) then
				bHave = 1
			end
			if (0 == x808121_CheckAllXinfaLevel(sceneId, sceneMemId)) then
				bHave = 1
			end
		end
	end
	
	if(bHave == 1)then
		return 6;
	end
	 
--����������~~~
	return 0;
end



--**********************************
--��������
--nearmembercount����Ա����
--**********************************
function x808121_MakeCopyScene(sceneId, selfId, targetId, nearmembercount)

	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	local leaderguid = LuaFnObjId2Guid(sceneId, selfId);
	LuaFnSetSceneLoad_Map(sceneId, x808121_g_FubenTbl.MapFile);										--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x808121_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x808121_g_tickDiffTime * 1000);
	
	--��ʼ�����и�������
	for i=0, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	LuaFnSetCopySceneData_Param(sceneId, 0, x808121_g_CopySceneType);					--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param(sceneId, 1, x808121_g_scriptId);						--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);											--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);										--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param(sceneId, 4, x);											--��ڵ�ַ
	LuaFnSetCopySceneData_Param(sceneId, 5, z);											
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId, selfId));				--��������
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);											--ɱ�����������
	LuaFnSetCopySceneData_Param(sceneId, 8, x808121_g_FubenTbl.monsterId )	--С��ID....
	LuaFnSetCopySceneData_Param(sceneId, 9, x808121_g_FubenTbl.bossId )		--BOSSID....
	LuaFnSetCopySceneData_Param(sceneId, 11, 0 )				--ɱ�������....
	LuaFnSetCopySceneData_Param(sceneId, 12, 0 )				--step....
	LuaFnSetCopySceneData_Param(sceneId, 13, 0 )				--ɱboss����
	
	LuaFnSetSceneLoad_Area( sceneId, x808121_g_FubenTbl.AreaFile )
	LuaFnSetSceneLoad_Monster( sceneId, x808121_g_FubenTbl.MonsterFile )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"���������ɹ���");
			--ɾ��NPC
			LuaFnDeleteMonster(sceneId, targetId)
		else
			AddText(sceneId,"���������Ѵ����ޣ����Ժ����ԣ�");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--����˳�����
--**********************************
function x808121_PlayerExit(sceneId, selfId)

	if selfId then
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--ȡ�ø�����ڳ�����
		local x = LuaFnGetCopySceneData_Param(sceneId, 4);
		local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		
		--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
				if memId == selfId then
					NewWorld(sceneId, memId, oldsceneId, x, z);
				end
			end
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x808121_OnCopySceneReady(sceneId, destsceneId)
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);		--���ø�����ڳ�����
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId);
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	local day = GetDayTime();

	if LuaFnIsCanDoScriptLogic(sceneId, leaderObjId) ~= 1 then
		return 
	end

	--ȡ����Ҹ����Ķ��������������Լ���
	local nearMemberCount = GetNearTeamCount(sceneId, leaderObjId) ;
	local memId;
	for	i = 0, nearMemberCount - 1 do
		memId = GetNearTeamMember(sceneId, leaderObjId, i);
		if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
			NewWorld(sceneId, memId, destsceneId, x808121_g_FubenTbl.Fuben_start_x, x808121_g_FubenTbl.Fuben_start_z);
		end
		--�ͳ�����ڻ�����Ҫ
	end
	
	--ͳ�ƣ��ӳ����˶����˽�ȥ(�����а����ӳ�)
	CreateCopySceneAudit(sceneId, leaderObjId, nearMemberCount)
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x808121_OnPlayerEnter(sceneId, selfId)
	--���������󸴻��λ��	
	SetPlayerDefaultReliveInfo(sceneId, selfId, "%10", -1, "0", sceneId, x808121_g_FubenTbl.Fuben_start_x, x808121_g_FubenTbl.Fuben_start_z);  --����������ڸս���ĵط�
	local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, selfId);
	if teamLeaderFlag and teamLeaderFlag == 1 then
		LuaFnSetTeamExpAllotMode(sceneId, selfId, 0);      --ƽ������ģʽ
	end
end

--**********************************
--������ڸ����������¼�
--**********************************
function x808121_OnHumanDie(sceneId, selfId, killerId)
end

--**********************************
--����������ʱ���¼�
--**********************************
function x808121_OnCopySceneTimer(sceneId, nowTime)

	--����ʱ�Ӷ�ȡ������
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 12 )
	local curTickCount = LuaFnGetCopySceneData_Param(sceneId, 2);		--ȡ���Ѿ�ִ�еĶ�ʱ����
	
	--�׶ο���
	if (nStep == 0) then        --�����ոտ�ʼ
		LuaFnSetCopySceneData_Param(sceneId, 12, 1 )	
		
		LuaFnSetSceneWeather(sceneId, 19, 39*60*1000 );   --����
		
		--��ʾ��Ϣ
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, "ǧ�����ޣ������Ѿ����ٵ����ص����䵺�ˡ�");
 			end
		end		
		
		--���ֵ�һ����
		for i, MonsterPos in x808121_gFirst_MonstersTbl do
			objId = LuaFnCreateMonster( sceneId, x808121_monster_leilin.ID, MonsterPos.x, MonsterPos.z, x808121_monster_leilin.Aitype, x808121_monster_leilin.AiscriptId , x808121_monster_leilin.scriptId )			
		end
		
		--������boss���������ޣ�
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xudaoshenshou.ID, x808121_gFourth_hudaoshenshouTbl.startx, x808121_gFourth_hudaoshenshouTbl.startz, x808121_monster_xudaoshenshou.Aitype, x808121_monster_xudaoshenshou.AiscriptId , x808121_monster_xudaoshenshou.scriptId )			
		SetPatrolId(sceneId, objId, x808121_gFourth_hudaoshenshouTbl.PatrolId )
		--�޵з���è
		objId = LuaFnCreateMonster( sceneId, x808121_monster_feitianmao.ID, x808121_gFourth_feitianmaoTbl.startx, x808121_gFourth_feitianmaoTbl.startz, x808121_monster_feitianmao.Aitype, x808121_monster_feitianmao.AiscriptId , x808121_monster_feitianmao.scriptId )			
		SetCharacterTitle(sceneId, objId, "���䵺�켩�ӳ�")
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);	--ÿ���������ͬһ��GroupID�����������ǿ��Ի�����Ԯ
		SetPatrolId(sceneId, objId, x808121_gFourth_feitianmaoTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaozhuzhu.ID, x808121_gFourth_xiaozuzuTbl.startx, x808121_gFourth_xiaozuzuTbl.startz, x808121_monster_xiaozhuzhu.Aitype, x808121_monster_xiaozhuzhu.AiscriptId , x808121_monster_xiaozhuzhu.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaozuzuTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaohuhu.ID, x808121_gFourth_xiaohuhuTbl.startx, x808121_gFourth_xiaohuhuTbl.startz, x808121_monster_xiaohuhu.Aitype, x808121_monster_xiaohuhu.AiscriptId , x808121_monster_xiaohuhu.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaohuhuTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaoyingying.ID, x808121_gFourth_xiaoyingyingTbl.startx, x808121_gFourth_xiaoyingyingTbl.startz, x808121_monster_xiaoyingying.Aitype, x808121_monster_xiaoyingying.AiscriptId , x808121_monster_xiaoyingying.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaoyingyingTbl.PatrolId )
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xiaogougou.ID, x808121_gFourth_xiaogougouTbl.startx, x808121_gFourth_xiaogougouTbl.startz, x808121_monster_xiaogougou.Aitype, x808121_monster_xiaogougou.AiscriptId , x808121_monster_xiaogougou.scriptId )			
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);
		SetPatrolId(sceneId, objId, x808121_gFourth_xiaogougouTbl.PatrolId )
		
	elseif (nStep == 4) then     --��������
		curTickCount	= 2340
		LuaFnSetCopySceneData_Param(sceneId, 2, curTickCount);--�����µĶ�ʱ�����ô���
		LuaFnSetCopySceneData_Param(sceneId, 12, 5 )   --���뵹��ʱ��	
	end
	
	--ʱ�����
	local strOutMsg = ""
	--�ڶ������߼�
	if (curTickCount >=240 and curTickCount <= 300) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 240) then
			strOutMsg = "ǧ�����ޣ����ｫ��60����١�"
		elseif(curTickCount == 270) then
			strOutMsg = "ǧ�����ޣ����ｫ��30����١�"
		elseif(curTickCount == 290) then
			strOutMsg = "ǧ�����ޣ����ｫ��10����١�"
		elseif(curTickCount == 295) then
			strOutMsg = "ǧ�����ޣ����ｫ��5����١�"
		elseif(curTickCount == 300) then
			strOutMsg = "ǧ�����ޣ������Ѿ����ٵ����ص����䵺�ˡ�"
			--���ֵڶ�����
			for i, MonsterPos in x808121_gSecond_MonstersTbl do
				objId = LuaFnCreateMonster( sceneId, x808121_monster_chufeng.ID, MonsterPos.x, MonsterPos.z, x808121_monster_chufeng.Aitype, x808121_monster_chufeng.AiscriptId , x808121_monster_chufeng.scriptId )			
			end
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		
	
		--���������߼�
	elseif (curTickCount >=540 and curTickCount <= 600) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 540) then
			strOutMsg = "ǧ�����ޣ����뽫��60����١�"
		elseif(curTickCount == 570) then
			strOutMsg = "ǧ�����ޣ����뽫��30����١�"
		elseif(curTickCount == 590) then
			strOutMsg = "ǧ�����ޣ����뽫��10����١�"
		elseif(curTickCount == 595) then
			strOutMsg = "ǧ�����ޣ����뽫��5����١�"
		elseif(curTickCount == 600) then
			strOutMsg = "ǧ�����ޣ������Ѿ����ٵ����ص����䵺�ˡ�"
			--���ֵ�������
			for i, MonsterPos in x808121_gThird_MonstersTbl do
				objId = LuaFnCreateMonster( sceneId, x808121_monster_leilin.ID, MonsterPos.x, MonsterPos.z, x808121_monster_leilin.Aitype, x808121_monster_leilin.AiscriptId , x808121_monster_leilin.scriptId )			
			end
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		

	
	--���������߼�
	elseif (curTickCount >=840 and curTickCount <= 900) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 840) then
			strOutMsg = "ǧ�����ޣ����ｫ��60����١�"
		elseif(curTickCount == 870) then
			strOutMsg = "ǧ�����ޣ����ｫ��30����١�"
		elseif(curTickCount == 890) then
			strOutMsg = "ǧ�����ޣ����ｫ��10����١�"
		elseif(curTickCount == 895) then
			strOutMsg = "ǧ�����ޣ����ｫ��5����١�"
		elseif(curTickCount == 900) then
			strOutMsg = "ǧ�����ޣ������Ѿ����ٵ����ص����䵺�ˡ�"
			--���ֵ�������
			for i, MonsterPos in x808121_gFourth_MonstersTbl do
				objId = LuaFnCreateMonster( sceneId, x808121_monster_chufeng.ID, MonsterPos.x, MonsterPos.z, x808121_monster_chufeng.Aitype, x808121_monster_chufeng.AiscriptId , x808121_monster_chufeng.scriptId )			
			end
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		

	--40���ӵ���curTickCount == 2400)
	elseif (curTickCount >=2340) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		if (curTickCount == 2340) then
			strOutMsg = "��������60���رա�"
		elseif(curTickCount == 2370) then
			strOutMsg = "��������30���رա�"
		elseif(curTickCount == 2380) then
			strOutMsg = "��������20���رա�"
		elseif(curTickCount == 2390) then
			strOutMsg = "��������10���رա�"
		elseif(curTickCount == 2395) then
			strOutMsg = "��������5���رա�"
		elseif(curTickCount >= 2400) then
			local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--ȡ�ø�����ڳ�����,׼������Ҵ���ȥ
			local x = LuaFnGetCopySceneData_Param(sceneId, 4);
			local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			
			local memId;
			for	i = 0, membercount - 1 do
				memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
					NewWorld(sceneId, memId, oldsceneId, x, z);
				end
			end
			return
		end
		
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 			end
		end		
	end
	
	curTickCount = curTickCount + 1;
	LuaFnSetCopySceneData_Param(sceneId, 2, curTickCount);--�����µĶ�ʱ�����ô���
	
end

--**********************************
--����������ɱ�˹�
--**********************************
function x808121_OnDie(sceneId, selfId, killerId)						-- ����ID, ��ɱ��ObjId, ɱ��ObjId

	CallScriptFunction(501000, "OnDie", sceneId, selfId, killerId) 
	
	--������ͳ�ƹ���
	local szName = GetName(sceneId, selfId)

	local AllMonsterNum = 0;
	--�����ǵ�һ�����ڶ��������������������֣���6��boss(������boss���ĸ�С..)
--	AllMonsterNum = x808121_gFirst_MonstersTbl.size + x808121_gSecond_MonstersTbl.size + x808121_gThird_MonstersTbl.size + x808121_gFourth_MonstersTbl.size  
	AllMonsterNum = x808121_monster_First_num + x808121_monster_Second_num + x808121_monster_Third_num + x808121_monster_Fourth_num + x808121_monster_boss_num
	
	local nKilledMonsterNum_feng = LuaFnGetCopySceneData_Param(sceneId, 7);											--ɱ���������
	local nKilledMonsterNum_long = LuaFnGetCopySceneData_Param(sceneId, 11);											--ɱ����������
	local nKilledMonsterNum_boss = LuaFnGetCopySceneData_Param(sceneId, 13);											--ɱ��boss������
	
	local strOutMsg = ""
	local AuditType = 0
	if (szName == x808121_monster_chufeng.name) then
		nKilledMonsterNum_feng = nKilledMonsterNum_feng + 1
		LuaFnSetCopySceneData_Param(sceneId, 7, nKilledMonsterNum_feng);
		strOutMsg = strOutMsg.."����սǧ�����޳��"..tostring(nKilledMonsterNum_feng).."/"..tostring(x808121_monster_Second_num + x808121_monster_Fourth_num)
		AuditType = 1
	elseif (szName == x808121_monster_leilin.name) then
		nKilledMonsterNum_long = nKilledMonsterNum_long + 1
		LuaFnSetCopySceneData_Param(sceneId, 11, nKilledMonsterNum_long);
		strOutMsg = strOutMsg.."����սǧ���������룺"..tostring(nKilledMonsterNum_long).."/"..tostring(x808121_monster_Second_num + x808121_monster_Fourth_num)
		AuditType = 2
	elseif (szName == x808121_monster_xudaoshenshou.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ���������ޣ�1/1��"
		AuditType = 3
	elseif (szName == x808121_monster_feitianmao.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ���޵з���è��1/1��"
		AuditType = 4
	elseif (szName == x808121_monster_xiaozhuzhu.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��С����1/1��"
		AuditType = 5
	elseif (szName == x808121_monster_xiaohuhu.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��С������1/1��"
		AuditType = 5
	elseif (szName == x808121_monster_xiaoyingying.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��Сӥӥ��1/1��"
		AuditType = 5
	elseif (szName == x808121_monster_xiaogougou.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."��ɱ��С������1/1��"
		AuditType = 5
	end
	
	local nAllKilled = nKilledMonsterNum_feng + nKilledMonsterNum_long + nKilledMonsterNum_boss
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
	for	i = 0, membercount - 1 do
		memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		if LuaFnIsObjValid(sceneId, memId) == 1 then
 			x808121_NotifyFailTips(sceneId, memId, strOutMsg);
 		end
	end		

	if (nAllKilled >= AllMonsterNum) then
		LuaFnSetCopySceneData_Param(sceneId, 12, 4 )        --������
	end
end

--վ���뿪�����Ĺ�Ӱ���棬׼��ȥ��¥��
function x808121_OnEnterArea( sceneId, selfId )
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--ȡ�ø�����ڳ�����
		local x = LuaFnGetCopySceneData_Param(sceneId, 4);
		local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		NewWorld(sceneId, selfId, oldsceneId, x, z);
end

function x808121_OnLeaveArea( sceneId, selfId )
end

function x808121_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId);
		AddText(sceneId, Tip);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end


function x808121_CheckAllXinfaLevel(sceneId, memId)
	local nMenpai = GetMenPai(sceneId, memId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, memId, nMenpai*6 + i)
		if nXinfaLevel < x808121_g_Low_Level_xinfa    then
			return 0
		end
	end
	return 1
end
