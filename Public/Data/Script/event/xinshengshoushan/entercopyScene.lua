--新玄武岛入口对话脚本
--

x808121_g_scriptId = 808121

x808121_tipinbox = 1
x808121_g_limitMembers = 3        --人数限制
x808121_g_Low_Level = 85           --等级限制
x808121_g_Low_Level_xinfa = 50           --心法限制
x808121_g_NoUserTime = 3              --副本中没有人后可以继续保存的时间（单位：秒）,不知道这个值对不对？
x808121_g_tickDiffTime = 1              --回调脚本的时钟时间（单位：秒/次）
x808121_g_CopySceneType = FUBEN_XINSHENGSHOUSHAN        --副本类型，定义在ScriptGlobal.lua里面

x808121_g_FubenTbl =
{
	FubenName = "新玄武岛",
	MapFile = "petisland_3.nav",
	monsterId = 3290,
	bossId = 3893,  --护岛神兽
	AreaFile = "petisland_3_area.ini", 
	MonsterFile = "petisland_3_monster.ini",
	Fuben_start_x = 94,
	Fuben_start_z = 77,
}

x808121_monster_chufeng = {ID = 13281, Aitype = 0, AiscriptId = 0, scriptId = 808121, name = "成年雏凤"}     --雏凤
x808121_monster_leilin = {ID = 13280, Aitype = 0, AiscriptId = 0, scriptId = 808121, name = "成年雷麟"}      --雷麟
x808121_monster_xudaoshenshou = {ID = 13286, Aitype = 0, AiscriptId = 136, scriptId = 808121, name = "护岛神兽"}   --护岛神兽
x808121_monster_feitianmao = {ID = 13287, Aitype = 0, AiscriptId = 270, scriptId = 808121, name = "无敌飞天猫"}   --无敌飞天猫
x808121_monster_xiaozhuzhu = {ID = 13282, Aitype = 0, AiscriptId = 212, scriptId = 808121, name = "小猪猪"}   --小猪猪
x808121_monster_xiaohuhu = {ID = 13284, Aitype = 0, AiscriptId = 215, scriptId = 808121, name = "小虎虎"}   --小虎虎
x808121_monster_xiaoyingying = {ID = 13285, Aitype = 0, AiscriptId = 214, scriptId = 808121, name = "小鹰鹰"}   --小鹰鹰
x808121_monster_xiaogougou = {ID = 13283, Aitype = 0, AiscriptId = 213, scriptId = 808121, name = "小狗狗"}   --小狗狗
x808121_monster_groupId = 1

x808121_monster_First_num = 15
x808121_monster_Second_num = 15
x808121_monster_Third_num = 15
x808121_monster_Fourth_num = 15
x808121_monster_boss_num = 6
 
x808121_gFirst_MonstersTbl =   --第一批怪坐标
{
{x = 127, z = 85}, {x = 126, z = 90}, {x = 130, z = 90}, {x = 137, z = 77}, {x = 137, z = 81}, {x = 141, z = 80}, {x = 149, z = 86}, {x = 152, z = 82}, {x = 140, z = 101}, 
{x = 157, z = 101}, {x = 134, z = 107}, {x = 145, z = 103}, {x = 154, z = 106}, {x = 147, z = 108}, {x = 160, z = 88}
}
x808121_gSecond_MonstersTbl =   --第二批怪坐标
{
{x = 179, z = 86}, {x = 176, z = 89}, {x = 183, z = 100}, {x = 177, z = 95}, {x = 183, z = 92}, {x = 191, z = 122}, {x = 194, z = 128}, {x = 161, z = 108}, {x = 176, z = 116}, 
{x = 152, z = 119}, {x = 162, z = 124}, {x = 163, z = 132}, {x = 175, z = 135}, {x = 178, z = 128}, {x = 170, z = 127}
}
x808121_gThird_MonstersTbl =    --第三批怪坐标
{
{x = 193, z = 153}, {x = 188, z = 163}, {x = 195, z = 163}, {x = 201, z = 163}, {x = 200, z = 170}, {x = 194, z = 171}, {x = 171, z = 146}, {x = 174, z = 150}, {x = 159, z = 156}, 
{x = 162, z = 159}, {x = 157, z = 162}, {x = 149, z = 153}, {x = 147, z = 147}, {x = 152, z = 157}, {x = 161, z = 145}
}
x808121_gFourth_MonstersTbl =    --第四批怪坐标
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

--掉落
 -- 随机因子
x808121_g_RandNum = 10000

 -- 宠物的存活时间，3分钟
x808121_g_Lifecycle = 180000

--**********************************
--任务入口函数....
--**********************************
function x808121_OnDefaultEvent( sceneId, selfId, targetId )

--**********************************
--NPC对话
--**********************************
	BeginEvent( sceneId )
		AddText(sceneId, "千年奇兽已经降临在神秘的玄武岛了，去一睹他们的风采吧！")
		AddNumText( sceneId, x808121_g_scriptId, "天降奇兽", 6, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end


function x808121_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	
	if GetNumText() == 1 then
		local nCheckRet = x808121_CheckCanEnterScene(sceneId, selfId, targetId, eventId)
		local strOutmsg = "";
		if (nCheckRet == 1) then
			strOutmsg = "想挑战奇兽，你需要一支3人或3人以上的队伍。";
		elseif (nCheckRet == 2) then
			strOutmsg = "你不是队长，请让你的队长来找我。";
		elseif (nCheckRet == 3) then
			strOutmsg = "想挑战奇兽，你需要一支3人或3人以上的队伍。"           --不够三人
		elseif (nCheckRet == 4) then
			strOutmsg = "你的队伍中有成员不在附近。";
		elseif (nCheckRet == 5 or nCheckRet == 6) then
			strOutmsg = "对不起，你的队伍中有成员不满足进入条件。\n"           --5,6一定是框显示
			
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
						strOutMsgTemp[i] = strOutMsgTemp[i]..":\n  等级要求"..tostring(x808121_g_Low_Level).."    #cff0000不满足#W\n"
					else
						strOutMsgTemp[i] = strOutMsgTemp[i]..":\n  等级要求"..tostring(x808121_g_Low_Level).."    #c00ff00满足#W\n"
					end
					if (0 == x808121_CheckAllXinfaLevel(sceneId, sceneMemId)) then
						strOutMsgTemp[i] = strOutMsgTemp[i].."  心法要求"..tostring(x808121_g_Low_Level_xinfa).."    #cff0000不满足#W\n"
					else
						strOutMsgTemp[i] = strOutMsgTemp[i].."  心法要求"..tostring(x808121_g_Low_Level_xinfa).."    #c00ff00满足#W\n"
					end
				else
					strOutMsgTemp[i] = strOutMsgTemp[i]..memName..":无法正确获取成员心法等级资料。"
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
		
		--可以进入副本了
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		x808121_MakeCopyScene(sceneId, selfId, targetId, nearMemberCount)	

	end

end


--**********************************
--检查是否满足进入副本的要求

--检查是否满足进入副本的要求
--返回值说明：1     没组队
--            2     不是队长
--            3     不够三人
--            4     队员不在附近
--            5     队长等级心法不够
--            6     队员等级心法不够
--            7
--            0       满足
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
	
	
	-- 检测队长的等级是否满足要求
	if (GetLevel(sceneId, selfId) < x808121_g_Low_Level or 0 == x808121_CheckAllXinfaLevel(sceneId, selfId)) then
		return 5
	end
	
	-- 统计是否有队员不满足等级心法要求
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
	 
--终于满足了~~~
	return 0;
end



--**********************************
--创建副本
--nearmembercount：队员个数
--**********************************
function x808121_MakeCopyScene(sceneId, selfId, targetId, nearmembercount)

	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	local leaderguid = LuaFnObjId2Guid(sceneId, selfId);
	LuaFnSetSceneLoad_Map(sceneId, x808121_g_FubenTbl.MapFile);										--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x808121_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x808121_g_tickDiffTime * 1000);
	
	--初始化所有副本参数
	for i=0, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	LuaFnSetCopySceneData_Param(sceneId, 0, x808121_g_CopySceneType);					--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x808121_g_scriptId);						--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);											--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);										--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, x);											--入口地址
	LuaFnSetCopySceneData_Param(sceneId, 5, z);											
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId, selfId));				--保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);											--杀死龙麟的数量
	LuaFnSetCopySceneData_Param(sceneId, 8, x808121_g_FubenTbl.monsterId )	--小怪ID....
	LuaFnSetCopySceneData_Param(sceneId, 9, x808121_g_FubenTbl.bossId )		--BOSSID....
	LuaFnSetCopySceneData_Param(sceneId, 11, 0 )				--杀凤雏怪数....
	LuaFnSetCopySceneData_Param(sceneId, 12, 0 )				--step....
	LuaFnSetCopySceneData_Param(sceneId, 13, 0 )				--杀boss数量
	
	LuaFnSetSceneLoad_Area( sceneId, x808121_g_FubenTbl.AreaFile )
	LuaFnSetSceneLoad_Monster( sceneId, x808121_g_FubenTbl.MonsterFile )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
			--删除NPC
			LuaFnDeleteMonster(sceneId, targetId)
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--玩家退出副本
--**********************************
function x808121_PlayerExit(sceneId, selfId)

	if selfId then
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--取得副本入口场景号
		local x = LuaFnGetCopySceneData_Param(sceneId, 4);
		local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		
		--将当前副本场景里的所有人传送回原来进入时候的场景
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
--副本事件
--**********************************
function x808121_OnCopySceneReady(sceneId, destsceneId)
	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);		--设置副本入口场景号
	local leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId);
	local leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);
	local day = GetDayTime();

	if LuaFnIsCanDoScriptLogic(sceneId, leaderObjId) ~= 1 then
		return 
	end

	--取得玩家附近的队友数量（包括自己）
	local nearMemberCount = GetNearTeamCount(sceneId, leaderObjId) ;
	local memId;
	for	i = 0, nearMemberCount - 1 do
		memId = GetNearTeamMember(sceneId, leaderObjId, i);
		if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
			NewWorld(sceneId, memId, destsceneId, x808121_g_FubenTbl.Fuben_start_x, x808121_g_FubenTbl.Fuben_start_z);
		end
		--活动统计现在还不需要
	end
	
	--统计，队长带了多少人进去(人数中包括队长)
	CreateCopySceneAudit(sceneId, leaderObjId, nearMemberCount)
end

--**********************************
--有玩家进入副本事件
--**********************************
function x808121_OnPlayerEnter(sceneId, selfId)
	--设置死亡后复活点位置	
	SetPlayerDefaultReliveInfo(sceneId, selfId, "%10", -1, "0", sceneId, x808121_g_FubenTbl.Fuben_start_x, x808121_g_FubenTbl.Fuben_start_z);  --复活点设置在刚进入的地方
	local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, selfId);
	if teamLeaderFlag and teamLeaderFlag == 1 then
		LuaFnSetTeamExpAllotMode(sceneId, selfId, 0);      --平均分配模式
	end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x808121_OnHumanDie(sceneId, selfId, killerId)
end

--**********************************
--副本场景定时器事件
--**********************************
function x808121_OnCopySceneTimer(sceneId, nowTime)

	--副本时钟读取及设置
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 12 )
	local curTickCount = LuaFnGetCopySceneData_Param(sceneId, 2);		--取得已经执行的定时次数
	
	--阶段控制
	if (nStep == 0) then        --副本刚刚开始
		LuaFnSetCopySceneData_Param(sceneId, 12, 1 )	
		
		LuaFnSetSceneWeather(sceneId, 19, 39*60*1000 );   --下雨
		
		--提示信息
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, memId) == 1 then
 				x808121_NotifyFailTips(sceneId, memId, "千年奇兽：雷麟已经降临到神秘的玄武岛了。");
 			end
		end		
		
		--出现第一批怪
		for i, MonsterPos in x808121_gFirst_MonstersTbl do
			objId = LuaFnCreateMonster( sceneId, x808121_monster_leilin.ID, MonsterPos.x, MonsterPos.z, x808121_monster_leilin.Aitype, x808121_monster_leilin.AiscriptId , x808121_monster_leilin.scriptId )			
		end
		
		--建立大boss，护岛神兽，
		objId = LuaFnCreateMonster( sceneId, x808121_monster_xudaoshenshou.ID, x808121_gFourth_hudaoshenshouTbl.startx, x808121_gFourth_hudaoshenshouTbl.startz, x808121_monster_xudaoshenshou.Aitype, x808121_monster_xudaoshenshou.AiscriptId , x808121_monster_xudaoshenshou.scriptId )			
		SetPatrolId(sceneId, objId, x808121_gFourth_hudaoshenshouTbl.PatrolId )
		--无敌飞天猫
		objId = LuaFnCreateMonster( sceneId, x808121_monster_feitianmao.ID, x808121_gFourth_feitianmaoTbl.startx, x808121_gFourth_feitianmaoTbl.startz, x808121_monster_feitianmao.Aitype, x808121_monster_feitianmao.AiscriptId , x808121_monster_feitianmao.scriptId )			
		SetCharacterTitle(sceneId, objId, "玄武岛侦缉队长")
		SetMonsterGroupID(sceneId, objId, x808121_monster_groupId);	--每组怪物属于同一个GroupID，这样怪物们可以互相增援
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
		
	elseif (nStep == 4) then     --怪死光了
		curTickCount	= 2340
		LuaFnSetCopySceneData_Param(sceneId, 2, curTickCount);--设置新的定时器调用次数
		LuaFnSetCopySceneData_Param(sceneId, 12, 5 )   --进入倒计时了	
	end
	
	--时间控制
	local strOutMsg = ""
	--第二批怪逻辑
	if (curTickCount >=240 and curTickCount <= 300) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 240) then
			strOutMsg = "千年奇兽：雏凤将于60秒后降临。"
		elseif(curTickCount == 270) then
			strOutMsg = "千年奇兽：雏凤将于30秒后降临。"
		elseif(curTickCount == 290) then
			strOutMsg = "千年奇兽：雏凤将于10秒后降临。"
		elseif(curTickCount == 295) then
			strOutMsg = "千年奇兽：雏凤将于5秒后降临。"
		elseif(curTickCount == 300) then
			strOutMsg = "千年奇兽：雏凤已经降临到神秘的玄武岛了。"
			--出现第二批怪
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
	
		--第三批怪逻辑
	elseif (curTickCount >=540 and curTickCount <= 600) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 540) then
			strOutMsg = "千年奇兽：雷麟将于60秒后降临。"
		elseif(curTickCount == 570) then
			strOutMsg = "千年奇兽：雷麟将于30秒后降临。"
		elseif(curTickCount == 590) then
			strOutMsg = "千年奇兽：雷麟将于10秒后降临。"
		elseif(curTickCount == 595) then
			strOutMsg = "千年奇兽：雷麟将于5秒后降临。"
		elseif(curTickCount == 600) then
			strOutMsg = "千年奇兽：雷麟已经降临到神秘的玄武岛了。"
			--出现第三批怪
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

	
	--第四批怪逻辑
	elseif (curTickCount >=840 and curTickCount <= 900) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		
		if(curTickCount == 840) then
			strOutMsg = "千年奇兽：雏凤将于60秒后降临。"
		elseif(curTickCount == 870) then
			strOutMsg = "千年奇兽：雏凤将于30秒后降临。"
		elseif(curTickCount == 890) then
			strOutMsg = "千年奇兽：雏凤将于10秒后降临。"
		elseif(curTickCount == 895) then
			strOutMsg = "千年奇兽：雏凤将于5秒后降临。"
		elseif(curTickCount == 900) then
			strOutMsg = "千年奇兽：雏凤已经降临到神秘的玄武岛了。"
			--出现第四批怪
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

	--40分钟到了curTickCount == 2400)
	elseif (curTickCount >=2340) then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		if (curTickCount == 2340) then
			strOutMsg = "副本将在60秒后关闭。"
		elseif(curTickCount == 2370) then
			strOutMsg = "副本将在30秒后关闭。"
		elseif(curTickCount == 2380) then
			strOutMsg = "副本将在20秒后关闭。"
		elseif(curTickCount == 2390) then
			strOutMsg = "副本将在10秒后关闭。"
		elseif(curTickCount == 2395) then
			strOutMsg = "副本将在5秒后关闭。"
		elseif(curTickCount >= 2400) then
			local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--取得副本入口场景号,准备把玩家传出去
			local x = LuaFnGetCopySceneData_Param(sceneId, 4);
			local z = LuaFnGetCopySceneData_Param(sceneId, 5);
		
			--将当前副本场景里的所有人传送回原来进入时候的场景
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
	LuaFnSetCopySceneData_Param(sceneId, 2, curTickCount);--设置新的定时器调用次数
	
end

--**********************************
--副本场景中杀了怪
--**********************************
function x808121_OnDie(sceneId, selfId, killerId)						-- 场景ID, 被杀的ObjId, 杀手ObjId

	CallScriptFunction(501000, "OnDie", sceneId, selfId, killerId) 
	
	--下面是统计功能
	local szName = GetName(sceneId, selfId)

	local AllMonsterNum = 0;
	--下面是第一批，第二批，第三批，第四批怪，和6个boss(两个大boss，四个小..)
--	AllMonsterNum = x808121_gFirst_MonstersTbl.size + x808121_gSecond_MonstersTbl.size + x808121_gThird_MonstersTbl.size + x808121_gFourth_MonstersTbl.size  
	AllMonsterNum = x808121_monster_First_num + x808121_monster_Second_num + x808121_monster_Third_num + x808121_monster_Fourth_num + x808121_monster_boss_num
	
	local nKilledMonsterNum_feng = LuaFnGetCopySceneData_Param(sceneId, 7);											--杀死凤的数量
	local nKilledMonsterNum_long = LuaFnGetCopySceneData_Param(sceneId, 11);											--杀死龙的数量
	local nKilledMonsterNum_boss = LuaFnGetCopySceneData_Param(sceneId, 13);											--杀死boss的数量
	
	local strOutMsg = ""
	local AuditType = 0
	if (szName == x808121_monster_chufeng.name) then
		nKilledMonsterNum_feng = nKilledMonsterNum_feng + 1
		LuaFnSetCopySceneData_Param(sceneId, 7, nKilledMonsterNum_feng);
		strOutMsg = strOutMsg.."已挑战千年奇兽雏凤："..tostring(nKilledMonsterNum_feng).."/"..tostring(x808121_monster_Second_num + x808121_monster_Fourth_num)
		AuditType = 1
	elseif (szName == x808121_monster_leilin.name) then
		nKilledMonsterNum_long = nKilledMonsterNum_long + 1
		LuaFnSetCopySceneData_Param(sceneId, 11, nKilledMonsterNum_long);
		strOutMsg = strOutMsg.."已挑战千年奇兽雷麟："..tostring(nKilledMonsterNum_long).."/"..tostring(x808121_monster_Second_num + x808121_monster_Fourth_num)
		AuditType = 2
	elseif (szName == x808121_monster_xudaoshenshou.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."已杀死护岛神兽：1/1。"
		AuditType = 3
	elseif (szName == x808121_monster_feitianmao.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."已杀死无敌飞天猫：1/1。"
		AuditType = 4
	elseif (szName == x808121_monster_xiaozhuzhu.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."已杀死小猪猪：1/1。"
		AuditType = 5
	elseif (szName == x808121_monster_xiaohuhu.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."已杀死小虎虎：1/1。"
		AuditType = 5
	elseif (szName == x808121_monster_xiaoyingying.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."已杀死小鹰鹰：1/1。"
		AuditType = 5
	elseif (szName == x808121_monster_xiaogougou.name) then
		nKilledMonsterNum_boss = nKilledMonsterNum_boss + 1
		LuaFnSetCopySceneData_Param(sceneId, 13, nKilledMonsterNum_boss);
		strOutMsg = strOutMsg.."已杀死小狗狗：1/1。"
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
		LuaFnSetCopySceneData_Param(sceneId, 12, 4 )        --该走了
	end
end

--站在离开场景的光影里面，准备去往楼兰
function x808121_OnEnterArea( sceneId, selfId )
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--取得副本入口场景号
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
