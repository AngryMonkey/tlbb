--圣兽山怪物巡逻
--活动刷怪脚本
--普通

--脚本号
x808106_g_ScriptId = 808106;

--常量声明 和 私有数据表格
x808106_g_MonsterNumber = 5; --每组怪物数目
x808106_g_MonsterLifeTime = 3000000; --怪物存活时间50分钟
x808106_g_ActivitySceneId = 158; --圣兽山

x808106_g_BookThiefID = {13402, 13403} --宝书窃贼怪物ID 随机一个
x808106_g_BookThiefExtAI = {288, 289} --宝书窃贼扩展AI
x808106_g_BookThiefNPCID = 807003 --宝书窃贼NPCID
x808106_g_BookThiefLifeTime = 40*60000; --宝书窃贼存活时间
x808106_g_ExistBookThief = 10 --随机产生10个宝书窃贼出来

--私有函数声明
function x808106_BroadcastLocation(sceneId, level, x, z)
	local noticeMsg = format("#{ZSSFC_090211_02}%d#{ZSSFC_090211_03}(%d,%d)#{ZSSFC_090211_04}", level, x, z)
	--PrintStr(format("%d:%d:%d:%s",level, x, z, noticeMsg));
	if nil~=noticeMsg then
		AddGlobalCountNews(sceneId, noticeMsg);
	end
end

function x808106_BroadcastNotice(sceneId)
	local Notices = "#{ZSSFC_090211_01}"
	AddGlobalCountNews(sceneId, Notices);
end

function x808106_CreateMonstersByGroup(sceneId, groupId)
	local Group25 = {
		{DataId=13404, x=221.8390, z=129.7934, aiType=20, aiScript=285,aiLuaExtend=808106,patrolId=4},
		{DataId=13407, x=222.2473, z=128.2261, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=5},
		{DataId=13410, x=223.2509, z=129.5619, aiType=20, aiScript=-1,aiLuaExtend=-1,patrolId=6},
		{DataId=13413, x=220.3515, z=129.4081, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=7},
		{DataId=13416, x=221.3242, z=130.8726, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=8}
	};
	local Group45 = {
		{DataId=13405, x=158.7148, z=155.5938, aiType=20, aiScript=285,aiLuaExtend=808106,patrolId=9},
		{DataId=13408, x=158.9959, z=154.4017, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=10},
		{DataId=13411, x=159.8189, z=155.4866, aiType=20, aiScript=-1,aiLuaExtend=-1,patrolId=11},
		{DataId=13414, x=157.6915, z=155.4017, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=12},
		{DataId=13417, x=158.4503, z=156.3715, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=13}
	};
	local Group65 = {
		{DataId=13406, x=35.6149, z=151.7296, aiType=20, aiScript=285,aiLuaExtend=808106,patrolId=14},
		{DataId=13409, x=35.6754, z=150.6953, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=15},
		{DataId=13412, x=34.6520, z=151.6869, aiType=20, aiScript=-1,aiLuaExtend=-1,patrolId=16},
		{DataId=13415, x=36.5562, z=151.8499, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=17},
		{DataId=13418, x=35.5040, z=152.6140, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=18}
	};

	local MonsterGroup = {
		Group25,
		Group45,
		Group65
	};
	local LocationInfo = {
		{level=25, x=221, z=129},
		{level=45, x=158, z=155},
		{level=65, x=35, z=151}
	};
	local group = MonsterGroup[groupId];
	if nil~=group then
		local locationInfo = LocationInfo[groupId]
		
		for index=1, x808106_g_MonsterNumber do
			local monster = group[index];
			if nil~=monster then
				local monsterId = LuaFnCreateMonster(sceneId, monster.DataId, monster.x, monster.z, monster.aiType, monster.aiScript, monster.aiLuaExtend)
				SetMonsterGroupID(sceneId, monsterId, groupId);	--每组怪物属于同一个GroupID，这样怪物们可以互相增援
				SetPatrolId(sceneId, monsterId, monster.patrolId); --设置怪物的巡逻ID
				SetCharacterDieTime(sceneId, monsterId, x808106_g_MonsterLifeTime); --怪物只会存活到指定时间
				if (index == 1) then
					SetCharacterTitle(sceneId, monsterId, "圣兽山侦缉队长")
				end
				--PrintStr(format("%d:monsterDataID=%d",groupId,monster.DataId));
			else
				break;
			end
		end
		
		--PrintNum(sceneId)
		-- Broadcast the notice of this monster group
		x808106_BroadcastNotice(sceneId);
		-- Broadcast the level and location of this monster group
		if nil~=locationInfo then
			x808106_BroadcastLocation(sceneId, locationInfo.level, locationInfo.x, locationInfo.z);
		end 

	end
end


--**********************************
--事件交互入口
--**********************************
function x808106_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )
	if x808106_g_ActivitySceneId == sceneId then
		StartOneActivity( sceneId, actId, floor(300000));--Timer 周期：5分钟
	end
end

--**********************************
--心跳函数
--**********************************
function x808106_OnTimer( sceneId, actId, uTime )
	if x808106_g_ActivitySceneId == sceneId then
		local RegenesisTime ={
				{groupId = nil},--0点
				{groupId = nil},--1点
				{groupId = 1},--2点
				{groupId = nil},--3点
				{groupId = nil},--4点
				{groupId = nil},--5点
				{groupId = 2},--6点
				{groupId = nil},--7点
				{groupId = nil},--8点
				{groupId = nil},--9点
				{groupId = 3},--10点
				{groupId = nil},--11点
				{groupId = nil},--12点
				{groupId = nil},--13点
				{groupId = 1},--14点
				{groupId = nil},--15点
				{groupId = nil},--16点
				{groupId = nil},--17点
				{groupId = 2},--18点
				{groupId = nil},--19点
				{groupId = nil},--20点
				{groupId = nil},--21点
				{groupId = 3},--22点
				{groupId = nil},--23点
			};
			
		if 5>floor(GetMinute()) then --只有在每个小时的头5分钟内会刷新怪物
			local index = floor(GetHour()+1);
			local groupId = nil;
			local regenesisTime = RegenesisTime[index];
			if nil~=regenesisTime then
				groupId = regenesisTime.groupId;
			end
			if nil~=groupId then
				x808106_CreateMonstersByGroup(sceneId, groupId);
			end
		end
	end
end

--**********************************
--obj死亡
--**********************************
function x808106_OnDie( sceneId, objId, selfId )--这个selfId可能是宠物
	local killerID = selfId
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --如果是宠物的话，把这个ID设置成主人ID
		killerID = GetPetCreator( sceneId, selfId )
	end
	
	local postable = {{228,	193},{227,	125},{215,	66},{169,	29},{155,	83},{154,	127},{159,	167},{156,	224},{103,	211},{95,	121},
										{86,	36},{44,	28},{54,	126},{48,	207},{62,	159},{210,	214},{214,	168},{203,	139},{206,	81},{161,	64},
										{132,	89},{139,	115},{133,	122},{142,	186},{161,	190},{188,	217},{92,	208},{34,	141},{30,	177},{19,	62}}
	local size = getn(postable)
	for i=1, x808106_g_ExistBookThief do
		--PrintStr(size)
		local ram = random(size)
		local ThisPos = postable[ram]
		
		for j=ram, size do
			if j+1 <= size then
				postable[j] = postable[j+1]
			end
		end
		
		size = size -1
		
		--PrintStr("after size "..size.." this create pos "..ThisPos[1].." "..ThisPos[2].." ran "..ram)
		
		local monsterType = random(getn(x808106_g_BookThiefID))
		local MonsterId = LuaFnCreateMonster(sceneId, x808106_g_BookThiefID[monsterType], ThisPos[1], ThisPos[2], 0, x808106_g_BookThiefExtAI[monsterType], x808106_g_BookThiefNPCID)
		SetCharacterDieTime(sceneId, MonsterId, x808106_g_BookThiefLifeTime)
		SetCharacterTitle(sceneId, MonsterId, "宝书窃贼")
		--设置对怪为友好的 目前是0号是友好的，如果有人改变了相应的势力声望那我就惨了！！:-(((
		SetUnitReputationID(sceneId, killerID, MonsterId, 0)
		
	end
	
	-- #P传闻在#{_BOSS115}#P大军溃败之前，透露了惊人的消息：一些贪婪的#G宝书窃贼：#{_BOSS116}、#{_BOSS117}#P在#G圣兽山#P开始了他们的秘密活动！各路英雄快快去看个究竟吧。
	local strText = "#{ZSSFC_090211_06}"
	BroadMsgByChatPipe(sceneId, killerID, strText, 4)
	
end
