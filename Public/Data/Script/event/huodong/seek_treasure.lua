--Creator 左春伟
--新棋局 楼兰寻宝

--脚本号
x808039_g_ScriptId = 808039;

--副本名称
x808039_g_CopySceneName = "楼兰寻宝"
x808039_g_activity_time = { 
	[1] = {startTime = 1930, endTime = 2200},
	[2] = {startTime = 1130, endTime = 1430},
};

x808039_g_impact_Id = 73;
x808039_g_TotalNeedKill = 200;
x808039_g_MonsterChangeTime = 90 * 1000; -- 怪物变身时间 90秒 (毫秒)

x808039_g_CopySceneType = FUBEN_SEEK_TREASURE	--副本类型，定义在ScriptGlobal.lua里面

x808039_g_LimitMembers = 1							--可以进副本的最小队伍人数
x808039_g_TickTime = 5									--回调脚本的时钟时间（单位：秒/次）
x808039_g_LimitTotalHoldTime = 720 			--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败 72*5 =60分钟
x808039_g_StartTickCount = 7  					--战斗开始提醒（单位：次数）
x808039_g_CloseTick = 6									--副本关闭前倒计时（单位：次数）
x808039_g_NoUserTime = 36								--副本中没有人后可以继续保存的时间（单位：秒） 3分钟
x808039_g_Fuben_X = 65									--进入副本的位置X need modify
x808039_g_Fuben_Z = 94									--进入副本的位置Z
x808039_g_Back_X = 163									--源场景位置X
x808039_g_Back_Z = 77										--源场景位置Z
x808039_g_Back_SceneId = 186						--源场景Id 楼兰

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

--x808039_g_NianShouCreatePos = --年兽刷出坐标
--{
--	{34,65},{38,49},{43,42},{73,35},{91,48},
--	{95,60},{92,78},{80,91},{48,91},{97,66},
--}
--x808039_g_NianShouId = --年兽ID
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
-- 上古宝箱	
x808039_g_SmallMonsterId = 
{
}	
x808039_g_SmallMonsterId[1] = {12102,12103,12104,12105,12106,12107,12108,12109,12110} --70,80,90...150 银色
x808039_g_SmallMonsterId[2] = {12111,12112,12113,12114,12115,12116,12117,12118,12119} --70,80,90...150 金色
-- 宝箱童子
x808039_g_MiddleMonsterId =
{
}
x808039_g_MiddleMonsterId[1] = {12120,12121,12122,12123,12124,12125,12126,12127,12128}
x808039_g_MiddleMonsterId[2] = {12129,12130,12131,12132,12133,12134,12135,12136,12137}
-- 镇宝龙王
x808039_g_BossMonsterId = {12138,12139,12140,12141,12142,12143,12144,12145,12146}

--**********************************
--任务入口函数
--**********************************
function x808039_OnDefaultEvent( sceneId, selfId, targetId )
	local id = GetNumText();
	local msg = "";
	if id == 1 then
		-- 是否开放
		if x808039_IsOpenNow() == 0 then	  
			BeginEvent(sceneId)
				AddText(sceneId, "    #{LLXB_8815_09}")
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId) 
			return
		end
		-- 检测失败
		local ret, msg = x808039_CheckEnterCondition(sceneId, selfId);
		if ret == 0 then
			x808039_RetDlg(sceneId, selfId, targetId, msg);
			return
		end
		if x808039_CheckMemberInfo(sceneId, selfId, targetId) ~= 1 then
			return
		end
		-- 检测通过
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
--列举事件
--**********************************
function x808039_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText(sceneId, x808039_g_ScriptId, "楼兰寻宝", 6, 1);
	AddNumText(sceneId, x808039_g_ScriptId, "楼兰寻宝活动帮助", 11, 2);
end

--**********************************
--怪物死亡....
--**********************************
function x808039_OnDie( sceneId, objId, killerId )
	--是否是副本
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end 
	--是否是所需要的副本
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x808039_g_CopySceneType then
		return
	end
	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 12) ;
	if 	leaveFlag==1 then --如果副本已经被置成关闭状态，则杀怪无效
		return 
	end
	
	--取得当前场景里的人数
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	killednumber = LuaFnGetCopySceneData_Param(sceneId, 7) ;--杀死怪的数量
	killednumber = killednumber+1
	LuaFnSetCopySceneData_Param(sceneId, 7, killednumber) ;--设置杀死怪的数量

	if killednumber <= x808039_g_TotalNeedKill then
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取得当前场景里人的objId
			if LuaFnIsObjValid(sceneId, humanObjId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, humanObjId) == 1 then
				BeginEvent(sceneId)
					strText = format("已杀死怪物 %d/%d", killednumber, x808039_g_TotalNeedKill )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
		----
		if killednumber == x808039_g_TotalNeedKill then --15秒后出龙王
			LuaFnSetCopySceneData_Param(sceneId, 15, 1); --出龙王标志置位
			--给定身buff 73
			for i=0, num-1 do
				humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取得当前场景里人的objId
				if LuaFnIsObjValid(sceneId, humanObjId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, humanObjId) == 1 then 
					LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, humanObjId, x808039_g_impact_Id, 0); 
				end
			end
		end
	elseif killednumber > x808039_g_TotalNeedKill then --龙王都被干掉了
		--设置任务完成标志
		
		LuaFnSetCopySceneData_Param(sceneId, 12, 1);				
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--取得当前场景里人的objId
			if LuaFnIsObjValid(sceneId, humanObjId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, humanObjId) == 1 then
				BeginEvent(sceneId)
					strText = format("任务完成，将在%d秒后传送到入口位置", x808039_g_CloseTick*x808039_g_TickTime )
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
		-- boss 击杀公告
		x808039_playNotify(sceneId, killerId);
	end
end

--**********************************
--Boss击杀公告
--**********************************
function x808039_playNotify(sceneId, killerId)
	-- zchw 全球公告
	local	playerName	= GetName( sceneId, killerId )
	local msg = {};
	
	--杀死怪物的是宠物则获取其主人的名字....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了则获取队长的名字....
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
--有玩家在副本中死亡事件
--**********************************
function x808039_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x808039_OnCopySceneTimer( sceneId, nowTime )
	
	local msg = "";
	local leaveTickCount = "";
	local tickCount = LuaFnGetCopySceneData_Param(sceneId, 2); --副本经过的tick数
	tickCount = tickCount + 1;
	LuaFnSetCopySceneData_Param(sceneId, 2, tickCount);	
	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 12) ;	
	-- zchw 
--	if tickCount == 2 then
--			--创建年兽 zchw
--			local iniLevel = LuaFnGetCopySceneData_Param(sceneId, 10);
--			local actLevel = LuaFnGetCopySceneData_Param(sceneId, 13)
--			--PrintStr("ID="..x808039_g_NianShouId[iniLevel]..pos[1]..","..pos[2]..actLevel);
--			for i ,pos in x808039_g_NianShouCreatePos do
--				local objId = LuaFnCreateMonster( sceneId, x808039_g_NianShouId[iniLevel], pos[1], pos[2], 1, 272, -1 )
--				SetLevel( sceneId, objId, actLevel )
--				LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--			end
--	end
	
	if leaveFlag == 1 then -- 需要离开		
		--离开倒计时间的读取和设置
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 16) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 16, leaveTickCount) ;
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;		--取得副本入口场景号
		if leaveTickCount >= x808039_g_CloseTick then 						--倒计时间到，大家都出去吧		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;	--取得副本入口场景号
			
			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i);
				if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x808039_g_Back_X, x808039_g_Back_Z )
				end
			end
			
		elseif leaveTickCount < x808039_g_CloseTick then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
	  			BeginEvent(sceneId)
	  				strText = format("你将在%d秒后离开场景!", (x808039_g_CloseTick-leaveTickCount)*x808039_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
	  		end
			end
		end	
	elseif tickCount >=  x808039_g_LimitTotalHoldTime then --副本最大存活时间到

		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do

			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
				BeginEvent(sceneId)
					AddText(sceneId,"任务失败，超时!");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,mems[i])
			end
		end
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 12, 1) ;
	elseif tickCount < x808039_g_StartTickCount then 
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		for i=0, membercount-1 do
			local objId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid(sceneId, objId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, objId) == 1 then
				local tm = (x808039_g_StartTickCount - tickCount)*x808039_g_TickTime;
				BeginEvent(sceneId)
					local	msg = format("%d秒之后将会开始战斗！", tm);
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
					AddText(sceneId, "战斗已开始");
				EndEvent()
				DispatchMissionTips(sceneId, objId);
			end
		end	
		--刷第一批怪
		local grade = LuaFnGetCopySceneData_Param(sceneId, 10); 		-- 怪类型 
		local mstColor = LuaFnGetCopySceneData_Param(sceneId, 11); 	-- 怪颜色
		local mstLvl = LuaFnGetCopySceneData_Param(sceneId, 13); 		-- 怪等级 
			
		local mstId = x808039_g_SmallMonsterId[1][grade];
		for i, pos in x808039_g_MonsterFlushPos[1] do
			local objId = LuaFnCreateMonster( sceneId, mstId, pos[1], pos[2], 7, -1, 808039 )
			SetLevel( sceneId, objId, mstLvl )
		end		
		--下一批刷金色
		LuaFnSetCopySceneData_Param(sceneId, 11, 2);	
		--设置刷怪时间
		LuaFnSetCopySceneData_Param(sceneId, 9, tickCount);
		--保存刷怪批次
		LuaFnSetCopySceneData_Param(sceneId, 8, 2);
	else	
		local bActive = x808039_IsOpenNow();
		if bActive and bActive == 1 then
		else
			--设置副本关闭标志
			LuaFnSetCopySceneData_Param(sceneId, 12, 1);
			return
		end	
		------------------------------------
		--变化怪物
		local monsterObjId = -1;
		local monsterCount = GetMonsterCount(sceneId);
		for i = 0, monsterCount - 1 do
			monsterObjId = GetMonsterObjID(sceneId, i);
			if LuaFnIsCharacterLiving(sceneId, monsterObjId) > 0 then				--活的怪物
				local monstertype = GetMonsterDataID(sceneId, monsterObjId);	--怪物类型
				local monsterLevel = GetLevel(sceneId, monsterObjId);
				local mcreatetime = GetObjCreateTime(sceneId, monsterObjId);	--怪物创建时间
				local PosX, PosZ = LuaFnGetWorldPos(sceneId, monsterObjId);
				PosX = floor(PosX);
				PosZ = floor(PosZ);
				--------
				for j=1, 2 do
					for i, record in x808039_g_SmallMonsterId[j] do
						if monstertype == record then
							if nowTime >= mcreatetime + x808039_g_MonsterChangeTime then
								LuaFnDeleteMonster(sceneId, monsterObjId);
								local extAi = 106; --银宝箱童子扩展AI 106
								if j == 2 then
									extAi = 105;     --金宝箱童子扩展AI 105
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
		--刷怪
		local grade = LuaFnGetCopySceneData_Param(sceneId, 10); -- 怪类型 
		local mstColor = LuaFnGetCopySceneData_Param(sceneId, 11); -- 怪颜色
		local mstLvl = LuaFnGetCopySceneData_Param(sceneId, 13); -- 怪等级 
		local oldFlushMonsterTime = LuaFnGetCopySceneData_Param(sceneId, 9);			
		local monsterBatch = LuaFnGetCopySceneData_Param(sceneId, 8);
		local ret = nil;
		--找到刷怪间隔时间
		for i, record in x808039_g_MonsterFlushSpeed do
			if monsterBatch >= record["from"] and monsterBatch <= record["to"] then
				ret = i;
				break
			end
		end
		-- 到时间，刷怪	
		if ret ~= nil then
			if oldFlushMonsterTime + x808039_g_MonsterFlushSpeed[ret]["speed"] <= tickCount then 
				LuaFnSetCopySceneData_Param( sceneId, 14, 0 ); --清中断标志
		
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
					LuaFnSetCopySceneData_Param(sceneId, 8, monsterBatch); -- 刷怪批数+1	
				end
				LuaFnSetCopySceneData_Param(sceneId, 9, tickCount); --记刷怪时间	
				-- 刷30批后歇歇
				if monsterBatch == 31 then
					LuaFnSetCopySceneData_Param( sceneId, 9, tickCount+18-5 ); --记刷怪时间	歇90秒
					LuaFnSetCopySceneData_Param( sceneId, 14, 1 ); --置中断标志
					--这洞中的宝箱已经被你砸碎了大半，你可以先小歇一会儿，稳稳阵脚。
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
		-- 中间间歇
		oldFlushMonsterTime = LuaFnGetCopySceneData_Param(sceneId, 9);	
		if LuaFnGetCopySceneData_Param( sceneId, 14 ) == 1 then
			local diffCount = oldFlushMonsterTime+5 - tickCount;
			if diffCount <= 6 and diffCount >= 1 then
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
				for i=0, membercount-1 do
					local objId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
					if LuaFnIsObjValid(sceneId, objId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, objId) == 1 then
						local tm = diffCount*x808039_g_TickTime;
						msg = format("%d秒之后将会重新开始战斗！", tm);
						x808039_ShowMsg(sceneId, objId, msg);
					end
				end
			end
		end
		
		local num = LuaFnGetCopySceneData_Param(sceneId, 15);
		if num > 0 then
			if num == 4 then -- 出龙王
				local grade = LuaFnGetCopySceneData_Param(sceneId, 10); 		-- 怪类型 
				local mstLvl = LuaFnGetCopySceneData_Param(sceneId, 13); -- 怪等级	
				local objId = LuaFnCreateMonster( sceneId, x808039_g_BossMonsterId[grade], x808039_g_BossPos.x, x808039_g_BossPos.z, 0, 271, 808039 )
				SetLevel( sceneId, objId, mstLvl )	
				--泡泡
				CallScriptFunction((200060), "Paopao", sceneId, "镇宝龙王", "楼兰藏宝洞", "世人熙熙，皆为利来；世人攘攘，皆为利往。有本事的就上来拿啊！")
				LuaFnSetCopySceneData_Param(sceneId, 15, 0);		
			else
				LuaFnSetCopySceneData_Param(sceneId, 15, num+1);
			end
		end

	end -- end else
end

--**********************************
--有玩家进入副本事件
--**********************************
function x808039_OnPlayerEnter( sceneId, selfId )
	local tmDay = GetTime2Day();
	SetMissionData(sceneId, selfId, MD_SEEK_TREASURE, tmDay); --参与时间
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x808039_g_Fuben_X, x808039_g_Fuben_Z );
end

--**********************************
--副本事件
--**********************************
function x808039_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个文件没有组队，就传送这个玩家自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个玩家是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end
	
	-- 检测玩家是不是有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
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
--创建副本
--**********************************
function x808039_MakeCopyScene(sceneId, selfId)
	-- 使用队员的等级来算出怪物的等级
	local param0 = 4;
	local param1 = 3;

	--最终结果
	local mylevel = 0;

	--临时变量
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
	
	if nearmembercount == -1  then  --没有队伍
		mylevel = GetLevel(sceneId, selfId)
	end
	
	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, x808039_g_FuBen_Data.MapFile); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x808039_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x808039_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x808039_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x808039_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, x);				--设置副本的入口场景位置x
	LuaFnSetCopySceneData_Param(sceneId, 5, z);				--设置副本的入口场景位置Z
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);		--杀死怪的数量
	LuaFnSetCopySceneData_Param(sceneId, 8, 1);		--刷出第几批怪
	LuaFnSetCopySceneData_Param(sceneId, 9, 0);		--上次刷出怪的时间 tickCount表示
	
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
	
	-- 使用副本变量10，11，12来保存怪物编号
	LuaFnSetCopySceneData_Param(sceneId, 10, iniLevel) --小怪级别
	LuaFnSetCopySceneData_Param(sceneId, 11, 1)--银色？金色？
	-- 使用第12位，记录场景是否要关闭
	LuaFnSetCopySceneData_Param(sceneId, 12, 0)
	-- 使用第13位，记录怪物实际的等级
	LuaFnSetCopySceneData_Param(sceneId, 13, mylevel)
	-- 使用第14位，记录是否需要刷怪30批后中断
	LuaFnSetCopySceneData_Param(sceneId, 14, 0);
	-- 使用第15位，龙王出现标志
	LuaFnSetCopySceneData_Param(sceneId, 15, 0);
	-- 使用第16位，关闭倒计时
	LuaFnSetCopySceneData_Param(sceneId, 16, 0);	
	--设置场景中的各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, x808039_g_FuBen_Data.AreaFile )
	LuaFnSetSceneLoad_Monster( sceneId, x808039_g_FuBen_Data.MonsterFile )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
			--日志
			AuditSeekTreasureCreateTime(sceneId, selfId);
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)	
end
--**********************************
--信息提示
--**********************************
function x808039_ShowMsg( sceneId, selfId, msg )
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
--返回对话
--**********************************
function x808039_RetDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end
--**********************************
--活动时间验证 成功：返回1； 失败：0
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
--判断基本进入条件
--成功：1 失败：0
--**********************************
function x808039_CheckEnterCondition(sceneId, selfId)
 	--组队？
 	if LuaFnHasTeam(sceneId, selfId) == 0 then
		return 0, "#{LLXB_8815_10}";	
 	end
 	--队长？
 	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
		return 0, "#{LLXB_8815_11}";	 
 	end
 	--队伍达到人数要求？
 	local teamSize = GetTeamSize(sceneId, selfId);
 	if teamSize < x808039_g_LimitMembers then
		return 0, "#{LLXB_8815_12}";		
 	end
  --队员都在附近？
  if GetNearTeamCount(sceneId, selfId) < teamSize then
		return 0, "#{LLXB_8815_13}";	  
  end
  --队员有杀气？
  for i=0, teamSize-1 do
  	local objId = GetNearTeamMember(sceneId, selfId, i);
  	if LuaFnGetHumanPKValue(sceneId, objId) > 0 then
  		local name = GetName(sceneId, objId);
  		local msg = format("队员%s杀气太重，不能进入藏宝洞内！", name);
  		return 0, msg;
  	end  	
  end
  --ok
  return 1, "ok";
end
--**********************************
--判断每个队员条件
--成功：1 失败：0
--**********************************
function x808039_CheckMemberInfo(sceneId, selfId, targetId)
  --检查每一个成员信息
  local bSucc = 1;
  local teamSize = GetTeamSize(sceneId, selfId);
  local msg = "";
  local x808039_member_info = {
		{ name = "", levelReq = "#G满足", xinfaReq = "#G满足", taskCount = "#G满足" },
		{ name = "", levelReq = "#G满足", xinfaReq = "#G满足", taskCount = "#G满足" },
		{ name = "", levelReq = "#G满足", xinfaReq = "#G满足", taskCount = "#G满足" },
		{ name = "", levelReq = "#G满足", xinfaReq = "#G满足", taskCount = "#G满足" },
		{ name = "", levelReq = "#G满足", xinfaReq = "#G满足", taskCount = "#G满足" },
		{ name = "", levelReq = "#G满足", xinfaReq = "#G满足", taskCount = "#G满足" },
	}
  -----------------------
  for i=0, teamSize-1 do
  	local objId = GetNearTeamMember(sceneId, selfId, i);
  	local level = LuaFnGetLevel(sceneId, objId);
  	local bXinfaOK = x808039_CheckXinfaLevel(sceneId, objId, 40) --心法达到40级？
  	local joinDate = GetMissionData(sceneId, objId, MD_SEEK_TREASURE);

  	x808039_member_info[i+1]["name"] = GetName(sceneId, objId);
  	if GetTime2Day() == joinDate then
  		x808039_member_info[i+1]["taskCount"] = "#cff0000不满足";
  		bSucc = 0;  		
  	end
  	if level < 75 then
  		x808039_member_info[i+1]["levelReq"] = "#cff0000不满足";
  		bSucc = 0;
  	end
  	if bXinfaOK == 0 then
  		x808039_member_info[i+1]["xinfaReq"] = "#cff0000不满足";
  		bSucc = 0;
  	end
  end
  ---------------------
	if bSucc == 0 then
		BeginEvent(sceneId, selfId)
		AddText(sceneId, "  队伍成员资讯：");
		for i, mem in x808039_member_info do
			if i > teamSize then
				break
			end	
			msg = format("  #B队员%s：", mem["name"]);
			if x808039_member_info[i]["levelReq"] == "#cff0000不满足" then
				msg = msg.."#r  #cff0000任务等级75             不满足";
			else
				msg = msg.."#r  #G任务等级75             满足";
			end
			---------------
			if x808039_member_info[i]["xinfaReq"] == "#cff0000不满足" then
				msg = msg.."#r  #cff0000心法等级40             不满足" ;
			else
				msg = msg.."#r  #G心法等级40             满足";
			end
			---------------
			if x808039_member_info[i]["taskCount"] == "#cff0000不满足" then
				msg = msg.."#r  #cff0000任务次数               不满足";
			else
				msg = msg.."#r  #G任务次数               满足";
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
--判断心法等级是否符合
--成功：1 失败：0
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
