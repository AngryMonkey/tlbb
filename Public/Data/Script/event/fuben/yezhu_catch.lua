-- 402105
-- 副本内保护

--************************************************************************
--MisDescBegin
--脚本号
x402105_g_ScriptId = 402105

--MisDescEnd
--************************************************************************


--副本名称
x402105_g_CopySceneName = "镇压暴走活动"

x402105_g_CopySceneType = FUBEN_CATCH_PET	--副本类型，定义在ScriptGlobal.lua里面

x402105_g_CopySceneMap = "zhenshoulan.nav"
x402105_g_Exit = "zhenshoulan.ini"
x402105_g_LimitMembers = 1				--可以进副本的最小队伍人数
x402105_g_TickTime = 1						--回调脚本的时钟时间（单位：秒/次）
x402105_g_LimitTotalHoldTime = 360--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x402105_g_LimitTimeSuccess = 500	--副本时间限制（单位：次数），如果此时间到了，任务完成
x402105_g_CloseTick = 3						--副本关闭前倒计时（单位：次数）
x402105_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x402105_g_DeadTrans = 0						--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x402105_g_Fuben_X = 36						--进入副本的位置X
x402105_g_Fuben_Z = 97						--进入副本的位置Z
x402105_g_Back_X = 141							--源场景位置X
x402105_g_Back_Z = 114							--源场景位置Z
x402105_g_Back_SceneId = 158			--源场景Id
	
-- 任务物品
x402105_g_Item = 40004429

-- 圣兽山场景Id
x402105_g_PetSceneId = 158

-- 野猪的信息
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

--boss信息
x402105_g_BossInfo_1 = {id=3810,ai=16,aif=208,x=73,z=50,script=-1}
x402105_g_BossInfo_2 = {id=3820,ai=17,aif=209,x=73,z=50,script=501000}
x402105_g_BossRand_2 = 10

--**********************************
--任务入口函数
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
			AddText(sceneId,"#B追捕野猪王");
			AddText(sceneId,"  人多力量大，我们凑齐人手再出发！#R(需要是队长，并且队伍中至少三人)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 2，检测玩家是不是组队了
	if GetTeamSize(sceneId,selfId) < x402105_g_LimitMembers  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B追捕野猪王");
			AddText(sceneId,"  人多力量大，我们凑齐人手再出发！#R(需要是队长，并且队伍中至少三人)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3，检测玩家是不是队长
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#B追捕野猪王");
			AddText(sceneId,"  人多力量大，我们凑齐人手再出发！#R(需要是队长，并且队伍中至少三人)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4，检测是不是人都到位了
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B追捕野猪王");
			AddText(sceneId,"  人多力量大，我们凑齐人手再出发！#R(需要是队长，并且队伍中至少三人)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 只需要队长有任务物品就可以,检测队长身上是不是有这个物品
	if LuaFnGetAvailableItemCount(sceneId,selfId,x402105_g_Item) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B追捕野猪王");
			AddText(sceneId,"  要想找到野猪王，我们得有足够的线索才行。#R(需要携带道具#G野猪王的踪迹#R)");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 1，玩家等级
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
					szAllName = szAllName .. "、" .. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#B追捕野猪王");
			AddText(sceneId,"  要想打败野猪王，等级太低可不行。#r#R您队伍中有成员（" .. szAllName .. "）等级不足40。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	
	-- 所有的检测通过,创建场景，删除对话珍兽
	-- 做一个安全检查
	if sceneId==x402105_g_PetSceneId  then
		x402105_MakeCopyScene(sceneId, selfId, targetId)
	end
	
end

--**********************************
--列举事件
--**********************************
function x402105_OnEnumerate( sceneId, selfId, targetId )
	-- 最好在这里做一个名字判定
	AddNumText( sceneId, x402105_g_ScriptId, "追捕野猪王",10 ,-1  )
	AddNumText( sceneId, x402105_g_ScriptId, "#{YZBZ_20070930_003}",11 ,1010  )	
	
end

--**********************************
--检测接受条件
--**********************************
function x402105_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x402105_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x402105_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x402105_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x402105_MakeCopyScene( sceneId, selfId, targetId )
	
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
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "zhenshoulan.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402105_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x402105_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x402105_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402105_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);		--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);		--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--杀死Boss的数量
	
	-- 剧情用到的变量清空
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
	
	-- 使用第8位，记录怪物实际的等级
	LuaFnSetCopySceneData_Param(sceneId,8, mylevel)
	LuaFnSetCopySceneData_Param(sceneId,9, iniLevel)
	
	-- 原来的模式 真的很奇怪没有 -1 记录要拯救的怪物的基础Id
	--LuaFnSetCopySceneData_Param(sceneId,10, GetMonsterDataID(sceneId, targetId)+iniLevel)
	
	local nMonterID = 0
	if iniLevel >= 11 then
	   nMonterID = GetMonsterDataID(sceneId, targetId)+iniLevel - 10 + 30000
	else
	   nMonterID = GetMonsterDataID(sceneId, targetId)+iniLevel
	end
	-- 记录要拯救的怪物的基础Id
	LuaFnSetCopySceneData_Param(sceneId,10, nMonterID)
	
	--设置场景中的各种Npc和区域
	--LuaFnSetSceneLoad_Area( sceneId, "zhenshoulan_area.ini" )
	--LuaFnSetSceneLoad_Monster( sceneId, "zhenshoulan_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)

	if bRetSceneID>0 then			
		-- 如果玩家是队长，扣除任务道具							modify by WTT		20090225
		if IsCaptain(sceneId,selfId) == 1    then
			if DelItem(sceneId, selfId, x402105_g_Item, 1) == 0  then
				LuaFnSetCopySceneData_Param(sceneId, 11, 3)
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"副本创建成功！")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		BeginEvent(sceneId)
			AddText(sceneId,"副本数量已达上限，请稍候再试！")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end

end

--**********************************
--副本事件
--**********************************
function x402105_OnCopySceneReady( sceneId, destsceneId )
	
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
--有玩家进入副本事件
--**********************************
function x402105_OnPlayerEnter( sceneId, selfId )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x402105_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x402105_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x402105_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x402105_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x402105_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x402105_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--提示所有副本内玩家
--**********************************
function x402105_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
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
--杀死怪物或玩家
--**********************************
function x402105_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x402105_OnDie( sceneId, objId, killerId )
	local nKillCount = LuaFnGetCopySceneData_Param(sceneId,20)
	if GetName(sceneId, objId) == "尖牙野猪"  then
		LuaFnSetCopySceneData_Param(sceneId,20,nKillCount+1)
		x402105_TipAllHuman(sceneId, "已杀死尖牙野猪" .. tostring(nKillCount+1) .. "/30")
	end
end
--**********************************
--进入区域事件
--**********************************
function x402105_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x402105_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
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
			if GetName(sceneId, nMonterId) == "尖牙野猪"  then
				nHaveMonster = 1
			end
		end
		
		if nHaveMonster == 0  then
			x402105_CreateMonster_2(sceneId)
			LuaFnSetCopySceneData_Param(sceneId, 11, 2)
		end
	end

	-- 如果怪物全部杀死，让玩家一分种后出副本
	if nStep == 2  then
		local nCount = GetMonsterCount(sceneId)
		local nHaveMonster = 0
		
		for i=0, nCount-1  do
			local nMonterId = GetMonsterObjID(sceneId, i)
			if GetName(sceneId, nMonterId) == "尖牙野猪" 
					or GetName(sceneId, nMonterId) == "尖牙野猪王"  
					or GetName(sceneId, nMonterId) == "狂暴龙"  then
				nHaveMonster = 1
			end
		end
		
		if nHaveMonster == 0  then
			LuaFnSetCopySceneData_Param(sceneId, 11, 3)
			--记录时间
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
			-- 发世界公告
			if nType == 0  then
				str = format("#{_INFOUSR%s}#P带领众英豪在#G野猪农场#P消灭了暴走野猪的首领#{_BOSS20}#P，却没能找出那只邪恶的凶兽。",szLeaderName)
			else
				str = format("#{_INFOUSR%s}#P带领众英豪在#G野猪农场#P铲除罪魁祸首#{_BOSS21}#P，终于平息了这场风波。",szLeaderName)
			end
			BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
			x402105_TipAllHuman(sceneId,"副本将在180秒后关闭。")
		end
	end
	
	if nStep == 3  then
		local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 13)
		if LuaFnGetCurrentTime()-nPreTime >= 165  then
			x402105_TipAllHuman(sceneId,"副本将在15秒后关闭。")
			LuaFnSetCopySceneData_Param(sceneId, 11, 4)
		end
	end
	if nStep == 4  then
		local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 13)
		if LuaFnGetCurrentTime()-nPreTime >= 175  then
			x402105_TipAllHuman(sceneId,"副本将在5秒后关闭。")
			LuaFnSetCopySceneData_Param(sceneId, 11, 5)
		end
	end
	
	if nStep == 5  then
		local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 13)
		if LuaFnGetCurrentTime()-nPreTime >= 30  then
			-- 让所有人离开场景
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
	SetCharacterTitle(sceneId, nNpcId, "獠牙王")
	x402105_TipAllHuman(sceneId, "发现尖牙野猪王！")
																		
	-- 一个可能随机刷出的boss
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
		SetCharacterTitle(sceneId, nNpcId, "千年天圣兽")
		-- 如果刷出这个随机boss，就发世界公告
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
		
		str = format("#P在#{_INFOUSR%s}#P带领下，众英豪在圣兽山力压群猪，胜利在望却突然跳出一只#{_BOSS21}！",szLeaderName)
		BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)

	end
	
end

