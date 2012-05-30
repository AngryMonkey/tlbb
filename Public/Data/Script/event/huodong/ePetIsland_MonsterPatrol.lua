--玄武岛怪物巡逻
--活动刷怪脚本
--普通

--脚本号
x808068_g_ScriptId = 808068;

--常量声明 和 私有数据表格
x808068_g_MonsterNumber = 5; --每组怪物数目
x808068_g_MonsterLifeTime = 3000000; --怪物存活时间50分钟
x808068_g_ActivitySceneId = 39; --玄武岛
x808068_g_ActivityScendName = "玄武岛";

x808068_g_BookThiefID = {13400, 13401} --宝书窃贼怪物ID 随机一个
x808068_g_BookThiefExtAI = {286, 287} --宝书窃贼扩展AI
x808068_g_BookThiefNPCID = 807003 --宝书窃贼NPCID
x808068_g_BookThiefLifeTime = 40*60000; --宝书窃贼存活时间
x808068_g_ExistBookThief = 5 --随机产生5个宝书窃贼出来

--私有函数声明
function x808068_BroadcastLocation(sceneId, level, x, z)
	local noticeMsg = format("#P这支战队首领#{_BOSS3}#P等级高达#G%d级#P，据说有人在#G玄武岛(%d,%d)#P附近看到过他们。", level, x, z)
	--PrintStr(format("%d:%d:%d:%s",level, x, z, noticeMsg));
	if nil~=noticeMsg then
		AddGlobalCountNews(sceneId, noticeMsg);
	end
end

function x808068_BroadcastNotice(sceneId)
	local index = random(3);
	local Notices = {
		"#G玄武岛#P上宠物好，各路英雄本领高。高手之中谁最强，第一#{_BOSS3}#P。横行玄武宠物怕，作威作福常发彪。谁是好汉快来打，名利双收在今朝！",
		"#G玄武岛#P一级警报，一级警报，#{_BOSS3}#P已经在岛上出现，在岛上出现，请各路英雄注意安全，注意安全！",
		"#{_BOSS3}#P战斗小组已经在#G玄武岛#P着陆，该部队装备精良，训练有素，战斗力强悍。请天下英雄打得过就打，打不过就跑。"
	};
	local noticeMsg = Notices[index];
	--PrintStr(format("%d:%s",index,noticeMsg));
	if nil~=noticeMsg then
		AddGlobalCountNews(sceneId, noticeMsg);
	end
end

function x808068_CreateMonstersByGroup(sceneId, groupId)
	local Group25 = {
		{DataId=3830, x=212.517, z=181.2889, aiType=20, aiScript=211,aiLuaExtend=808068,patrolId=5},
		{DataId=3833, x=213.217, z=180.5889, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=6},
		{DataId=3836, x=213.917, z=179.8889, aiType=20, aiScript=213,aiLuaExtend=-1,patrolId=7},
		{DataId=3839, x=211.817, z=180.5889, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=8},
		{DataId=3842, x=211.117, z=179.8889, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=9}
	};
	local Group45 = {
		{DataId=3831, x=113.6972, z=219.7326, aiType=20, aiScript=211,aiLuaExtend=808068,patrolId=10},
		{DataId=3834, x=114.3972, z=219.0326, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=11},
		{DataId=3837, x=115.0972, z=218.3326, aiType=20, aiScript=213,aiLuaExtend=-1,patrolId=12},
		{DataId=3840, x=112.9972, z=219.0326, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=13},
		{DataId=3843, x=112.2972, z=218.3326, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=14}
	};
	local Group65 = {
		{DataId=3832, x=271.3059, z=63.2789, aiType=20, aiScript=211,aiLuaExtend=808068,patrolId=15},
		{DataId=3835, x=272.0059, z=62.5789, aiType=20, aiScript=212,aiLuaExtend=-1,patrolId=16},
		{DataId=3838, x=272.7059, z=61.8789, aiType=20, aiScript=213,aiLuaExtend=-1,patrolId=17},
		{DataId=3841, x=270.6059, z=62.5789, aiType=20, aiScript=214,aiLuaExtend=-1,patrolId=18},
		{DataId=3844, x=269.9059, z=61.8789, aiType=20, aiScript=215,aiLuaExtend=-1,patrolId=19}
	};

	local MonsterGroup = {
		Group25,
		Group45,
		Group65
	};
	local LocationInfo = {
		{level=25, x=212, z=181},
		{level=45, x=113, z=219},
		{level=65, x=271, z=63}
	};
	local group = MonsterGroup[groupId];
	if nil~=group then
		local locationInfo = LocationInfo[groupId];
		for index=1, x808068_g_MonsterNumber do
			monster = group[index];
			if nil~=monster then
				local monsterId = LuaFnCreateMonster(
										sceneId, 
										monster.DataId, 
										monster.x, 
										monster.z, 
										monster.aiType,
										monster.aiScript,
										monster.aiLuaExtend
										);
				SetMonsterGroupID(sceneId, monsterId, groupId);	--每组怪物属于同一个GroupID，这样怪物们可以互相增援
				SetPatrolId(sceneId, monsterId, monster.patrolId); --设置怪物的巡逻ID
				SetCharacterDieTime(sceneId, monsterId, x808068_g_MonsterLifeTime); --怪物只会存活到指定时间
				if (GetName(sceneId, monsterId) == "无敌飞天猫") then
					SetCharacterTitle(sceneId, monsterId, "玄武岛侦缉队长")
				end
				--PrintStr(format("%d:monsterDataID=%d",groupId,monster.DataId));
			else
				break;
			end
		end
		--PrintNum(sceneId)
		-- Broadcast the notice of this monster group
		x808068_BroadcastNotice(sceneId);
		-- Broadcast the level and location of this monster group
		if nil~=locationInfo then
			x808068_BroadcastLocation(sceneId, locationInfo.level, locationInfo.x, locationInfo.z);
		end 
	end
end


--**********************************
--事件交互入口
--**********************************
function x808068_OnDefaultEvent( sceneId, actId, param1, param2, param3, param4, param5 )
	if x808068_g_ActivitySceneId == sceneId then
		StartOneActivity( sceneId, actId, floor(300000));--Timer 周期：5分钟
	end
end

--**********************************
--心跳函数
--**********************************
function x808068_OnTimer( sceneId, actId, uTime )
	if x808068_g_ActivitySceneId == sceneId then
		local RegenesisTime ={
				{groupId = 3},--0点
				{groupId = 1},--1点
				{groupId = 2},--2点
				{groupId = 3},--3点
				{groupId = 1},--4点
				{groupId = 2},--5点
				{groupId = 3},--6点
				{groupId = nil},--7点
				{groupId = nil},--8点
				{groupId = nil},--9点
				{groupId = 1},--10点
				{groupId = 2},--11点
				{groupId = 3},--12点
				{groupId = 1},--13点
				{groupId = 2},--14点
				{groupId = 3},--15点
				{groupId = 1},--16点
				{groupId = 2},--17点
				{groupId = 3},--18点
				{groupId = 1},--19点
				{groupId = 2},--20点
				{groupId = 3},--21点
				{groupId = 1},--22点
				{groupId = 2},--23点
			};
		if 5>floor(GetMinute()) then --只有在每个小时的头5分钟内会刷新怪物
			local index = floor(GetHour()+1);
			local groupId = nil;
			local regenesisTime = RegenesisTime[index];
			if nil~=regenesisTime then
				groupId = regenesisTime.groupId;
			end
			if nil~=groupId then
				x808068_CreateMonstersByGroup(sceneId, groupId);
			end
		end
	end
end

--**********************************
--obj死亡
--**********************************
function x808068_OnDie( sceneId, objId, selfId )--这个selfId可能是宠物
	local killerID = selfId
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --如果是宠物的话，把这个ID设置成主人ID
		killerID = GetPetCreator( sceneId, selfId )
	end
	
	local postable = {{87,	108},{173,	58},{234,	53},{259,	80},{243,	150},{152,	145},{75,	191},{136,	206},{184,	209},{256,	215},
										{219,	252},{176,	231},{129,	274},{74,	275},{127,	199},{44,	90},{46,	126},{45,	167},{39,	219},{75,	279},
										{103,	74},{110,	126},{112,	170},{116,	216},{145,	235},{182,	278},{180,	238},{159,	136},{222,	98},{283,	176}}
	local size = getn(postable)
	for i=1, x808068_g_ExistBookThief do
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
		
		local monsterType = random(getn(x808068_g_BookThiefID))
		local MonsterId = LuaFnCreateMonster(sceneId, x808068_g_BookThiefID[monsterType], ThisPos[1], ThisPos[2], 0, x808068_g_BookThiefExtAI[monsterType], x808068_g_BookThiefNPCID)
		SetCharacterDieTime(sceneId, MonsterId, x808068_g_BookThiefLifeTime)
		SetCharacterTitle(sceneId, MonsterId, "宝书窃贼")
		--设置对怪为友好的 目前是0号是友好的，如果有人改变了相应的势力声望那我就惨了！！:-(((
		SetUnitReputationID(sceneId, killerID, MonsterId, 0)
		
	end
	
	-- #P传闻在#{_BOSS3}#P大军溃败之前，透露了惊人的消息：一些贪婪的#G宝书窃贼：#{_BOSS113}、#{_BOSS114}#P在#G玄武岛#P开始了他们的秘密活动！各路英雄快快去看个究竟吧。
	local strText = "#{ZSSFC_090211_05}"
	BroadMsgByChatPipe(sceneId, killerID, strText, 4)
	
end
