--珍珑棋局副本
--添加带新手棋局模式[ QUFEI 2008-06-06 22:01 UPDATE BugID 35309 ]

x401001_g_ScriptId = 401001;			--脚本号
x401001_g_CopySceneName="珍珑棋局";		--副本名称

x401001_g_beginTime1 = 11 * 60 + 30;
x401001_g_endTime1 = 14 * 60 + 30;

x401001_g_beginTime2 = 20 * 60 + 30;
x401001_g_endTime2 = 22 * 60;

x401001_g_CopySceneType = FUBEN_ZHENGLONG;	--副本类型，定义在ScriptGlobal.lua里面
x401001_g_limitMembers = 1;					--可以进副本的最小队伍人数
x401001_g_tickDiffTime = 1;					--回调脚本的时钟时间（单位：秒/次）
x401001_g_closeTickCount = 30;				--副本关闭前倒计时（单位：次）
x401001_g_startTickCount = 30;				--开始出怪的时间（单位：次）
x401001_g_tipsIntervalTickCount = 5;		--提示信息的间隔时间

x401001_g_NoUserTime = 300;					--副本中没有人后可以继续保存的时间（单位：秒）
x401001_g_Fuben_X = 40;						--进入副本的位置X
x401001_g_Fuben_Z = 40;						--进入副本的位置Z
x401001_g_Relive_X = 45;					--副本复活的位置X
x401001_g_Relive_Z = 40;					--副本复活的位置Z
x401001_g_Back_X_Ly = 359;						--洛阳源场景位置X
x401001_g_Back_Z_Ly = 229;						--洛阳源场景位置Z
x401001_g_Back_X_Sz = 272;						--苏州源场景位置X
x401001_g_Back_Z_Sz = 239;						--苏州源场景位置Z
x401001_g_Back_X_Dl = 435;						--大理源场景位置X
x401001_g_Back_Z_Dl = 233;						--大理源场景位置Z

x401001_g_aToBInterval = 7 * 1000;			--由不可攻击状态变成可攻击状态的时间(单位：毫秒)
x401001_g_bToCInterval = 60 * 1000;			--由可攻击状态变成人形怪物的时间(单位：毫秒)
x401001_g_MoTypeCount = 20;					--怪物组数量
x401001_g_Black_A = {701, 701, 701, 701,701, 701, 701, 701, 701, 701,701, 701, 701, 701,701, 701, 701, 701, 701, 701};
x401001_g_Black_B = {1780, 1781, 1782, 1783, 1784, 1785, 1786, 1787, 1788, 1789,31780, 31781, 31782, 31783, 31784, 31785, 31786, 31787, 31788, 31789};
x401001_g_Black_C = {1800, 1801, 1802, 1803, 1804, 1805, 1806, 1807, 1808, 1809,31800, 31801, 31802, 31803, 31804, 31805, 31806, 31807, 31808, 31809};
x401001_g_Black_XinShou3_B = {12010, 12011, 12012, 12013, 12014, 12015, 12016, 12017, 12018, 12019, 42010, 42011, 42012, 42013, 42014, 42015, 42016, 42017, 42018, 42019};
x401001_g_Black_XinShou3_C = {12030, 12031, 12032, 12033, 12034, 12035, 12036, 12037, 12038, 12039, 42030, 42031, 42032, 42033, 42034, 42035, 42036, 42037, 42038, 42039};
x401001_g_Black_XinShou6_B = {12060, 12061, 12062, 12063, 12064, 12065, 12066, 12067, 12068, 12069, 42060, 42061, 42062, 42063, 42064, 42065, 42066, 42067, 42068, 42069};
x401001_g_Black_XinShou6_C = {12080, 12081, 12082, 12083, 12084, 12085, 12086, 12087, 12088, 12089, 42080, 42081, 42082, 42083, 42084, 42085, 42086, 42087, 42088, 42089};
x401001_g_White_A = {700, 700, 700, 700, 700, 700, 700, 700, 700, 700,700, 700, 700, 700, 700, 700, 700, 700, 700, 700};
x401001_g_White_B = {1770, 1771, 1772, 1773, 1774, 1775, 1776, 1777, 1778, 1779,31770, 31771, 31772, 31773, 31774, 31775, 31776, 31777, 31778, 31779};
x401001_g_White_C = {1790, 1791, 1792, 1793, 1794, 1795, 1796, 1797, 1798, 1799,31790, 31791, 31792, 31793, 31794, 31795, 31796, 31797, 31798, 31799};
x401001_g_White_XinShou3_B = {12000, 12001, 12002, 12003, 12004, 12005, 12006, 12007, 12008, 12009, 42000, 42001, 42002, 42003, 42004, 42005, 42006, 42007, 42008, 42009};
x401001_g_White_XinShou3_C = {12020, 12021, 12022, 12023, 12024, 12025, 12026, 12027, 12028, 12029, 42020, 42021, 42022, 42023, 42024, 42025, 42026, 42027, 42028, 42029};
x401001_g_White_XinShou6_B = {12050, 12051, 12052, 12053, 12054, 12055, 12056, 12057, 12058, 12059, 42050, 42051, 42052, 42053, 42054, 42055, 42056, 42057, 42058, 42059};
x401001_g_White_XinShou6_C = {12070, 12071, 12072, 12073, 12074, 12075, 12076, 12077, 12078, 12079, 42070, 42071, 42072, 42073, 42074, 42075, 42076, 42077, 42078, 42079};
x401001_g_LastBoss = {1850, 1851, 1852, 1853, 1854, 1855, 1856, 1857, 1858, 1859,31850, 31851, 31852, 31853, 31854, 31855, 31856, 31857, 31858, 31859};
x401001_g_LastBoss_XinShou3 = {12040, 12041, 12042, 12043, 12044, 12045, 12046, 12047, 12048, 12049, 42040, 42041, 42042, 42043, 42044, 42045, 42046, 42047, 42048, 42049};
x401001_g_LastBoss_XinShou6 = {12090, 12091, 12092, 12093, 12094, 12095, 12096, 12097, 12098, 12099, 42090, 42091, 42092, 42093, 42094, 42095, 42096, 42097, 42098, 42099};
--x401001_g_Nianshous= {12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211};  -- add by cuiyinjie 2008-11-6 年兽编号

--创建怪物的节奏
x401001_g_createMonsterIntervalInfoList = {
										{topPressStep=40, intervalTickCount=9},
										{topPressStep=80, intervalTickCount=8},
										{topPressStep=120, intervalTickCount=7},
										{topPressStep=160, intervalTickCount=6},
										{topPressStep=200, intervalTickCount=5}
										};

--棋谱数据
x401001_g_mStepPosListCount = 1;	--可以用于选择的棋谱数量
x401001_g_mStepPosListSize = 201;	--每个棋谱拥有的步数
x401001_g_mStepPosLists = {};
x401001_g_mStepPosLists[1] = {{x=55, z=39}, {x=60, z=43}, {x=57, z=43}, {x=54, z=46}, {x=64, z=39},
								{x=58, z=49}, {x=64, z=45}, {x=64, z=52}, {x=66, z=49}, {x=70, z=42},
								{x=69, z=37}, {x=66, z=43}, {x=72, z=46}, {x=72, z=39}, {x=79, z=42},
								{x=78, z=36}, {x=75, z=42}, {x=78, z=49}, {x=82, z=45}, {x=85, z=39},
								{x=88, z=49}, {x=90, z=42}, {x=90, z=37}, {x=84, z=52}, {x=90, z=55},
								{x=82, z=57}, {x=87, z=61}, {x=84, z=55}, {x=87, z=57}, {x=90, z=61},
								{x=81, z=67}, {x=84, z=64}, {x=87, z=67}, {x=81, z=63}, {x=90, z=70},
								{x=84, z=73}, {x=88, z=70}, {x=78, z=73}, {x=45, z=81}, {x=54, z=85},
								{x=39, z=87}, {x=45, z=90}, {x=39, z=79}, {x=37, z=84}, {x=37, z=91},
								{x=42, z=91}, {x=45, z=85}, {x=52, z=82}, {x=51, z=90}, {x=48, z=85},
								{x=43, z=87}, {x=48, z=88}, {x=54, z=91}, {x=51, z=85}, {x=49, z=79},
								{x=42, z=79}, {x=39, z=84}, {x=37, z=79}, {x=42, z=81}, {x=63, z=81},
								{x=66, z=88}, {x=69, z=79}, {x=69, z=85}, {x=61, z=88}, {x=57, z=81},
								{x=63, z=91}, {x=70, z=90}, {x=63, z=85}, {x=66, z=81}, {x=73, z=85},
								{x=76, z=90}, {x=75, z=82}, {x=72, z=88}, {x=69, z=82}, {x=75, z=79},
								{x=78, z=85}, {x=84, z=82}, {x=81, z=81}, {x=84, z=88}, {x=90, z=85},
								{x=88, z=79}, {x=81, z=79}, {x=78, z=82}, {x=81, z=88}, {x=88, z=91},
								{x=84, z=85}, {x=81, z=91}, {x=75, z=87}, {x=81, z=85}, {x=78, z=91},
								{x=87, z=85}, {x=90, z=91}, {x=84, z=91}, {x=90, z=88}, {x=88, z=82},
								{x=90, z=76}, {x=84, z=79}, {x=78, z=76}, {x=81, z=70}, {x=75, z=73},
								{x=72, z=79}, {x=69, z=73}, {x=66, z=78}, {x=64, z=73}, {x=69, z=76},
								{x=72, z=73}, {x=75, z=76}, {x=72, z=82}, {x=46, z=64}, {x=49, z=70},
								{x=40, z=70}, {x=46, z=73}, {x=43, z=67}, {x=40, z=73}, {x=45, z=70},
								{x=48, z=76}, {x=54, z=73}, {x=52, z=79}, {x=45, z=76}, {x=51, z=73},
								{x=54, z=78}, {x=64, z=64}, {x=70, z=67}, {x=69, z=61}, {x=67, z=69},
								{x=60, z=67}, {x=57, z=73}, {x=55, z=67}, {x=61, z=70}, {x=57, z=76},
								{x=63, z=78}, {x=66, z=76}, {x=61, z=73}, {x=57, z=67}, {x=64, z=70},
								{x=67, z=64}, {x=70, z=70}, {x=63, z=67}, {x=69, z=64}, {x=75, z=67},
								{x=81, z=73}, {x=78, z=67}, {x=72, z=69}, {x=78, z=63}, {x=84, z=67},
								{x=88, z=73}, {x=81, z=76}, {x=84, z=70}, {x=87, z=76}, {x=75, z=70},
								{x=87, z=88}, {x=78, z=79}, {x=73, z=76}, {x=75, z=70}, {x=75, z=63},
								{x=73, z=66}, {x=78, z=70}, {x=81, z=61}, {x=72, z=63}, {x=75, z=58},
								{x=81, z=54}, {x=78, z=60}, {x=75, z=52}, {x=78, z=54}, {x=72, z=57},
								{x=69, z=52}, {x=66, z=58}, {x=61, z=61}, {x=58, z=55}, {x=64, z=57},
								{x=67, z=51}, {x=73, z=49}, {x=76, z=55}, {x=70, z=58}, {x=64, z=61},
								{x=67, z=55}, {x=61, z=52}, {x=57, z=46}, {x=64, z=48}, {x=61, z=55},
								{x=58, z=60}, {x=52, z=64}, {x=55, z=58}, {x=51, z=52}, {x=48, z=57},
								{x=42, z=60}, {x=37, z=57}, {x=42, z=54}, {x=39, z=60}, {x=37, z=66},
								{x=42, z=63}, {x=45, z=58}, {x=48, z=52}, {x=51, z=58}, {x=54, z=52},
								{x=51, z=46}, {x=45, z=52}, {x=52, z=55}, {x=49, z=63}, {x=57, z=70},
								{x=63, z=63}};	--BOSS点

--x401001_CheckAndEnterScene所用到的参数
x401001_enumerate = 0;		--x401001_OnEnumerate中调用
x401001_defaultEvent = 1;	--x401001_OnDefaultEvent中调用

-- 活动最低等级限制
x401001_g_Low_Level = 10

-- 带新手模式棋局
-- 高手和新手的等级范围
x401001_g_Highlvl_Limit	=	50
x401001_g_Lowlvl_Limit	=	{ from=10, to=49 }
-- 等级差
x401001_g_LvLCur = 20
-- 给予队长的善恶值
x401001_g_High_GoodBadParam	=	5
-- 给予队员的善恶值
x401001_g_Low_GoodBadParam	=	3
-- 带新手模式经验系数加成
x401001_g_XinShou_Exp_Mod01 = 1.1
x401001_g_XinShou_Exp_Mod02 = 2.2
-- 新手模式额外经验奖励
x401001_g_XinShou_ExpAtu = { { mBengin01 = 12010, mEnd01 = 12019, mBengin02 = 42010, mEnd02 = 42019, ExpList = {262, 528, 857, 1248, 1703, 2218, 2799, 3444, 3943, 4427, 7824, 8509, 9199, 9885, 10503, 10503, 10503, 10503, 10503, 10503} },                        
														 { mBengin01 = 12030, mEnd01 = 12039, mBengin02 = 42030, mEnd02 = 42039, ExpList = {105, 211, 342, 499, 681, 887, 1119, 1377, 1577, 1770, 1956, 2127, 2299, 2471, 2625, 2625, 2625, 2625, 2625, 2625} },                                 
														 { mBengin01 = 12060, mEnd01 = 12069, mBengin02 = 42060, mEnd02 = 42069, ExpList = {262, 528, 857, 1248, 1703, 2218, 2799, 3444, 3943, 4427, 7824, 8509, 9199, 9885, 10503, 10503, 10503, 10503, 10503, 10503} },                        
														 { mBengin01 = 12080, mEnd01 = 12089, mBengin02 = 42080, mEnd02 = 42089, ExpList = {105, 211, 342, 499, 681, 887, 1119, 1377, 1577, 1770, 1956, 2127, 2299, 2471, 2625, 2625, 2625, 2625, 2625, 2625} },                                 
														 { mBengin01 = 12000, mEnd01 = 12009, mBengin02 = 42000, mEnd02 = 42009, ExpList = {262, 528, 857, 1248, 1703, 2218, 2799, 3444, 3943, 4427, 7824, 8509, 9199, 9885, 10503, 10503, 10503, 10503, 10503, 10503} },                        
														 { mBengin01 = 12020, mEnd01 = 12029, mBengin02 = 42020, mEnd02 = 42029, ExpList = {105, 211, 342, 499, 681, 887, 1119, 1377, 1577, 1770, 1956, 2127, 2299, 2471, 2625, 2625, 2625, 2625, 2625, 2625} },                                 
														 { mBengin01 = 12050, mEnd01 = 12059, mBengin02 = 42050, mEnd02 = 42059, ExpList = {262, 528, 857, 1248, 1703, 2218, 2799, 3444, 3943, 4427, 7824, 8509, 9199, 9885, 10503, 10503, 10503, 10503, 10503, 10503} },                        
														 { mBengin01 = 12070, mEnd01 = 12079, mBengin02 = 42070, mEnd02 = 42079, ExpList = {105, 211, 342, 499, 681, 887, 1119, 1377, 1577, 1770, 1956, 2127, 2299, 2471, 2625, 2625, 2625, 2625, 2625, 2625} },                                 
														 { mBengin01 = 12040, mEnd01 = 12049, mBengin02 = 42040, mEnd02 = 42049, ExpList = {5769, 10509, 16278, 23165, 31126, 40115, 50222, 61357, 69944, 78217, 86133, 93422, 100712, 108002, 111669, 111669, 111669, 111669, 111669, 111669} },
														 { mBengin01 = 12090, mEnd01 = 12099, mBengin02 = 42090, mEnd02 = 42099, ExpList = {5769, 10509, 16278, 23165, 31126, 40115, 50222, 61357, 69944, 78217, 86133, 93422, 100712, 108002, 111669, 111669, 111669, 111669, 111669, 111669} },
														 }
														 
-- 可以提高玩家经验的Buffer
x401001_g_DoubleExpList	=	{ {BuffId = 60, ExpPre = 2.75},
														{BuffId = 62, ExpPre = 1.65} }
-- 玩家组队经验衰减系数
x401001_g_ExpTeamPre	=	3.2

--**********************************
--任务入口函数
--**********************************
function x401001_OnDefaultEvent(sceneId, selfId, targetId)
	x401001_CheckAndEnterScene(sceneId, selfId, targetId, x401001_defaultEvent);
end

--**********************************
--列举事件
--**********************************
function x401001_OnEnumerate(sceneId, selfId, targetId)
	x401001_CheckAndEnterScene(sceneId, selfId, targetId, x401001_enumerate);
end

--**********************************
--进入副本的判断和执行
--**********************************
function x401001_CheckAndEnterScene(sceneId, selfId, targetId, eventId)
	local strOutmsg = "#{QJXXS_081211_01}";  --"现在不是棋局活动开始的时间，等活动开始之后再来找我。";
	local bActive = x401001_IsActivityOpen(sceneId);
	if bActive == 0 then
		if x401001_enumerate == eventId then
			AddText(sceneId, strOutmsg);
		else
			x401001_NotifyFailTips(sceneId, selfId, strOutmsg);
		end
		return
	end

	strOutmsg = "#{ZLQJ_80926_01}";
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		if x401001_enumerate == eventId then
			AddText(sceneId, strOutmsg);
		else
			x401001_NotifyFailTips(sceneId, selfId, strOutmsg);
		end
		return
	end

	strOutmsg = "您不是队长，只有队长才能选择是否参加活动。";
	if LuaFnIsTeamLeader(sceneId, selfId) == 0 then
		if x401001_enumerate == eventId then
			AddText(sceneId, strOutmsg);
		else
			x401001_NotifyFailTips(sceneId, selfId, strOutmsg);
		end
		return 
	end

	--取得玩家附近的队友数量（包括自己）
	strOutmsg = "参加棋局活动必须要求"..x401001_g_limitMembers.."人或者"..x401001_g_limitMembers.."人以上组队才能进入，您的队伍人数不足。";
	local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
	if not teamMemberCount or teamMemberCount < x401001_g_limitMembers then
		if x401001_enumerate == eventId then
			AddText(sceneId, strOutmsg);
		else
			x401001_NotifyFailTips(sceneId, selfId, strOutmsg);
		end
		return 
	end
		
	--bug27726，2007.11.15 by alan，因为sceneMemberCount不一定准确，改用附近队员数与队伍人数的比较判断
	--并不再提示具体不在附近的队员名称
	
	local nearMemberCount = GetNearTeamCount(sceneId, selfId);
	strOutmsg = "您有队员不在附近，请集合后再找我进入活动。";
	if not nearMemberCount or teamMemberCount ~= nearMemberCount then
		if x401001_enumerate == eventId then
			AddText(sceneId, strOutmsg);
		else
			x401001_NotifyFailTips(sceneId, selfId, strOutmsg);
		end
		return
	end
	
	-- [ QUFEI 2008-01-09 21:10 UPDATE BugID 31131 ]
	-- 检测队长的等级是否满足要求
	if GetLevel(sceneId, selfId) < x401001_g_Low_Level then
		if x401001_enumerate == eventId then
			AddText( sceneId, "#{QIJU_INFO_03}" )
		else
			x401001_NotifyFailTips(sceneId, selfId, "#{QIJU_INFO_03}");
		end
		return 0
	end
	-- 统计不满足等级要求的队员数量
	local nLowLvlCnt = 0
	
	for i = 0, nearMemberCount - 1 do
		local sceneMemId = GetNearTeamMember(sceneId, selfId, i)
		
		if sceneMemId and sceneMemId >= 0 then			
			if GetLevel(sceneId, sceneMemId) < x401001_g_Low_Level then
				nLowLvlCnt = nLowLvlCnt + 1
			end
		end
	end
		
	local memNameList = ""
	local nCountTmp = 1
	for i = 0, nearMemberCount - 1 do
		local sceneMemId = GetNearTeamMember(sceneId, selfId, i)
		if sceneMemId and sceneMemId >= 0 then			
			if GetLevel(sceneId, sceneMemId) < x401001_g_Low_Level then
				local memName = GetName(sceneId, sceneMemId)
				
				if nCountTmp < nLowLvlCnt then
					memNameList = memNameList..memName.."、"
					nCountTmp = nCountTmp + 1
				else
					memNameList = memNameList..memName
					break;
				end
			end
		end
	end
	
	if nLowLvlCnt > 0 then
		local msgstr = "#{QIJU_INFO_01} "..memNameList.." #{QIJU_INFO_02}"
		if x401001_enumerate == eventId then
			AddText( sceneId, msgstr )
		else
			x401001_NotifyFailTips(sceneId, selfId, msgstr);
		end
		return 0
	end
	
	--bug27726 end
	
	--strOutmsg = "您有队员不在附近，请集合后再找我进入活动。";
	--local sceneMemberCount = GetTeamSceneMemberCount(sceneId, selfId);
	--if not sceneMemberCount or teamMemberCount ~= sceneMemberCount + 1 then
	--	if x401001_enumerate == eventId then
	--		AddText(sceneId, strOutmsg);
	--	else
	--		x401001_NotifyFailTips(sceneId, selfId, strOutmsg);
	--	end
	--	return
	--end

	--local nearMemberCount = GetNearTeamCount(sceneId, selfId)
	--if nearMemberCount ~= sceneMemberCount + 1 then
	--	strOutmsg = "您队伍中有成员（";
	--	local checkNearCount = 0;
	--	for	i = 0, sceneMemberCount - 1 do
	--		local sceneMemId = LuaFnGetTeamSceneMember(sceneId, selfId, i);
	--		if sceneMemId and sceneMemId >= 0 then
	--			local findFlag = 0;
	--			for	j = 0, nearMemberCount - 1 do
	--				local nearMemId = GetNearTeamMember(sceneId, selfId, j);
	--				if nearMemId and nearMemId == sceneMemId then
	--					findFlag = 1;
	--					break;
	--				end
	--			end
				
	--			if findFlag == 0 then
	--				memName = GetName(sceneId, sceneMemId);
	--				if checkNearCount == 0 then
	--					strOutmsg = strOutmsg..memName;
	--				else
	--					strOutmsg = strOutmsg.."、"..memName;
	--				end
	--				checkNearCount = checkNearCount + 1;
	--			end
	--		end
	--	end
	--	if checkNearCount  > 0 then
	--		strOutmsg = strOutmsg.."）不在附近，请集合后再找我进入活动。";
	--		if x401001_enumerate == eventId then
	--			AddText(sceneId, strOutmsg);
	--		else
	--			x401001_NotifyFailTips(sceneId, selfId, strOutmsg);
	--		end
	--	end
	--	return 
	--end
	
	--取得玩家附近的队友数量（包括自己）
	local day = GetDayTime();
	local memName;
	local checkPKvalueMsg = "对弈棋局需要心平气和，杀气过重者不适合进入，（";
	local checkPKcount = 0;
	for	i=0,nearMemberCount-1 do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local pk_value = LuaFnGetHumanPKValue( sceneId, memId )
		if pk_value and pk_value > 0 then
			memName = GetName( sceneId, memId )
			if checkPKcount == 0 then
				checkPKvalueMsg = checkPKvalueMsg..memName;
			else
				checkPKvalueMsg = checkPKvalueMsg.."、"..memName;
			end
			checkPKcount = checkPKcount + 1;
		end
	end
	
	if checkPKcount > 0 then
		checkPKvalueMsg = checkPKvalueMsg.."）杀气过高，还是请回吧。";
		if x401001_enumerate == eventId then
			AddText(sceneId, "    "..checkPKvalueMsg);
		else
			x401001_NotifyFailTips(sceneId, selfId, checkPKvalueMsg);
		end
		return
	end
	
	local checkCurDayMsg = "队伍当中的（";
	local checkCurDaycount = 0;
	for	i=0,nearMemberCount-1 do
		local memId = GetNearTeamMember(sceneId, selfId, i)
		local lastDay = GetMissionData(sceneId, memId, MD_LAST_QIJU_DAY);
		if lastDay == day then
			memName = GetName(sceneId, memId);
			if checkCurDaycount == 0 then
				checkCurDayMsg = checkCurDayMsg..memName;
			else
				checkCurDayMsg = checkCurDayMsg.."、"..memName;
			end
			checkCurDaycount = checkCurDaycount + 1;
		end
	end
	
	if checkCurDaycount > 0 then
		checkCurDayMsg = checkCurDayMsg.."）已经完成了此次棋局活动、因此您的队伍无法进入。";
		if x401001_enumerate == eventId then
			AddText(sceneId, checkCurDayMsg);
		else
			x401001_NotifyFailTips(sceneId, selfId, checkCurDayMsg);
		end
		return
	end

	if eventId == x401001_enumerate then
		-- 检测带新手模式
		if x401001_OnXinShouCount( sceneId, selfId ) > 0 then
			AddText(sceneId, "#{QJ_20080522_01}");
		else
			AddText(sceneId, "#{QJ_20080522_02}");
		end
	
		AddNumText(sceneId, x401001_g_ScriptId, x401001_g_CopySceneName,10,-1);
	elseif eventId == x401001_defaultEvent then
		BeginEvent(sceneId)	
			AddText(sceneId, "#{function_help_063}#r  如果你能看见这行字，说明你的网路已经卡到空前绝后的境界。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		x401001_MakeCopyScene(sceneId, selfId, nearMemberCount);
	end
end

--**********************************
--创建副本
--**********************************
function x401001_MakeCopyScene(sceneId, selfId, nearmembercount)

	--指数参数
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
	
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end

	if level1 == 0 then
		mylevel = 0;
	else
		mylevel = level0/level1;
	end

	local leaderguid = LuaFnObjId2Guid(sceneId, selfId);
	LuaFnSetSceneLoad_Map(sceneId, "zhenlong.nav");										--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401001_g_NoUserTime * 1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401001_g_tickDiffTime * 1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401001_g_CopySceneType);					--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401001_g_ScriptId);						--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);											--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);										--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);											--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);											--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId, selfId));				--保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);											--杀死Boss的数量
	LuaFnSetCopySceneData_Param(sceneId, 8, random(1, x401001_g_mStepPosListCount));	--选用的棋谱
	LuaFnSetCopySceneData_Param(sceneId, 9, 0);											--已经下了的步数
	LuaFnSetCopySceneData_Param(sceneId, 11, 0);										--已经杀了多了个怪了
	LuaFnSetCopySceneData_Param(sceneId, 12, 0);										--上次出怪时间
	LuaFnSetCopySceneData_Param(sceneId, 13, 0);										--普通模式与新手模式选择	0:普通	1:带一个新人	2:	带两个以上的新人
	
	-- 检测是否带新手模式
	if x401001_OnXinShouCount( sceneId, selfId ) >= 2 then
		LuaFnSetCopySceneData_Param(sceneId, 13, 2);										--两个以上的新手
	elseif x401001_OnXinShouCount( sceneId, selfId ) > 0 then
		LuaFnSetCopySceneData_Param(sceneId, 13, 1);										--只有一个新手
	end

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 10;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) * 10;
	else
		iniLevel = PlayerMaxLevel;
	end

	if iniLevel/10 <= x401001_g_MoTypeCount then
		LuaFnSetCopySceneData_Param(sceneId, 10, iniLevel/10);							--记录所产生的怪物组
	else
		LuaFnSetCopySceneData_Param(sceneId, 10, x401001_g_MoTypeCount);				--记录所产生的怪物组
	end
	LuaFnSetSceneLoad_Monster(sceneId, "zhenlong_monster_" .. iniLevel .. ".ini");
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel);	--级别差，CopyScene_LevelGap 在 scene.lua 中赋值
	
	local bRetSceneID = LuaFnCreateCopyScene(sceneId);								--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x401001_NotifyFailTips(sceneId, selfId, "副本创建成功！");
	else
		x401001_NotifyFailTips(sceneId, selfId, "副本数量已达上限，请稍候再试！");
	end
end

--**********************************
--玩家退出副本
--**********************************
function x401001_PlayerExit(sceneId, selfId)
	if selfId then
		local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--取得副本入口场景号
		
		--将当前副本场景里的所有人传送回原来进入时候的场景
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if memId == selfId then
				if oldsceneId == 0 or oldsceneId == 418 or oldsceneId == 419 then
					NewWorld(sceneId, selfId, 0, x401001_g_Back_X_Ly, x401001_g_Back_Z_Ly);
				elseif oldsceneId == 1 or oldsceneId == 518 then
					NewWorld(sceneId, selfId, 1, x401001_g_Back_X_Sz, x401001_g_Back_Z_Sz);
				else
					NewWorld(sceneId, selfId, 2, x401001_g_Back_X_Dl, x401001_g_Back_Z_Dl);
				end
				return 
			end
		end
	end
end

--**********************************
--副本事件
--**********************************
function x401001_OnCopySceneReady(sceneId, destsceneId)

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
		SetMissionData(sceneId, memId, MD_LAST_QIJU_DAY, day);
		NewWorld(sceneId, memId, destsceneId, x401001_g_Fuben_X, x401001_g_Fuben_Z);
		--活动统计
		LuaFnAuditQuest(sceneId, memId, "珍珑棋局");
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x401001_OnPlayerEnter(sceneId, selfId)
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo(sceneId, selfId, "%10", -1, "0", sceneId, x401001_g_Fuben_X, x401001_g_Fuben_Z);
	local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, selfId);
	if teamLeaderFlag and teamLeaderFlag == 1 then
		LuaFnSetTeamExpAllotMode(sceneId, selfId, 0);
	end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x401001_OnHumanDie(sceneId, selfId, killerId)
end

--***********************************
-- 创建10个年兽 add by cuiyinjie 2008-11-6
--***********************************
--function x401001_CreateNianshou(sceneId)
--	local iNianshouCreateFlagIndex = 20; --最大32个参数
--	-- 判断已经创建就不再创建了
--	if ( 1 == LuaFnGetCopySceneData_Param(sceneId, iNianshouCreateFlagIndex) ) then
--	   return
--	end
--	
--	local iIdx = LuaFnGetCopySceneData_Param(sceneId, 10);
--	
--	local iIdx = floor(iIdx);
--	
--	if (iIdx > getn(x401001_g_Nianshous)) then
--	    iIdx = getn(x401001_g_Nianshous);
--	end
--
--	local iNianshouID = x401001_g_Nianshous[iIdx];
--
--	if ( nil == iNianshouID ) then
--	    return
--	end
--
--	local NsPos = {{44,38},{49,38},{39,43},{39,48},{56,63},{51,67},{77,45},{86,43},{60,82},{57,88},};
--	for i = 1, 10 do    -- 创建10个
--		local objId = LuaFnCreateMonster(sceneId, iNianshouID, NsPos[i][1], NsPos[i][2], 1, 272, -1);
--		local dis = LuaFnGetCopySceneData_Param(sceneId, CopyScene_LevelGap);	--级别差，CopyScene_LevelGap 在 scene.lua 中赋值	
--		local actLevel = dis + iIdx * 10;
--		SetLevel( sceneId, objId, actLevel ) -- zchw
--		LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--	end
--	
--	LuaFnSetCopySceneData_Param(sceneId, iNianshouCreateFlagIndex, 1);
--
--end


--**********************************
--副本场景定时器事件
--**********************************
function x401001_OnCopySceneTimer(sceneId, nowTime)

--	x401001_CreateNianshou(sceneId); -- add by cuiyinjie 2008-11-6
	--副本时钟读取及设置
	local curTickCount = LuaFnGetCopySceneData_Param(sceneId, 2);		--取得已经执行的定时次数
	
	if curTickCount == 2 then
		local nHour = GetHour();
		local nMinute = GetMinute();
		local nCurTempTime = nHour * 60 + nMinute;
		
		local tempTimes = 0;
		if nCurTempTime < x401001_g_endTime1 then
			tempTimes = x401001_g_endTime1 - nCurTempTime;
		else
			tempTimes = x401001_g_endTime2 - nCurTempTime;
		end
		
		if tempTimes > 0 then
			local tempH = floor(tempTimes / 60);
			local tempM = floor(tempTimes - tempH * 60);
	  		local strText = format("副本将在");
			if tempH > 0 then
				strText = strText .. tempH .. "小时";
			end

			if tempM > 0 then
				strText = strText .. tempM .. "分钟";
			end

			strText = strText .. "后关闭！";

			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			local memId;
			for	i = 0, membercount - 1 do
				memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
 					x401001_NotifyFailTips(sceneId, memId, strText);
 				end
			end
		end
	end
		
	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4);
	if leaveFlag == 1 then --需要离开

		--离开倒计时间的读取和设置
		local closeTickCount = LuaFnGetCopySceneData_Param(sceneId, 5);
		if closeTickCount >= x401001_g_closeTickCount then --倒计时间到，大家都出去吧
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3);		--取得副本入口场景号
			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			local memId;
			for	i = 0, membercount - 1 do
				memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
					if oldsceneId == 0 or oldsceneId == 418 or oldsceneId == 419 then
						NewWorld(sceneId, memId, 0, x401001_g_Back_X_Ly, x401001_g_Back_Z_Ly);
					elseif oldsceneId == 1 or oldsceneId == 518 then
						NewWorld(sceneId, memId, 1, x401001_g_Back_X_Sz, x401001_g_Back_Z_Sz);
					else
						NewWorld(sceneId, memId, 2, x401001_g_Back_X_Dl, x401001_g_Back_Z_Dl);
					end
				end
			end
			
		elseif closeTickCount < x401001_g_closeTickCount then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			if floor(closeTickCount) == floor(closeTickCount / x401001_g_tipsIntervalTickCount) * floor(x401001_g_tipsIntervalTickCount) then
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
				local memId;
	  			local strText = format("你将在%d秒后离开场景!", (x401001_g_closeTickCount - closeTickCount) * x401001_g_tickDiffTime);
				for	i = 0, membercount - 1 do
					memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
					if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
 						x401001_NotifyFailTips(sceneId, memId, strText);
 					end
				end
			end
		end
		closeTickCount = closeTickCount + 1;
		LuaFnSetCopySceneData_Param(sceneId, 5, closeTickCount);
	else
		--检测活动时间是否结束
		local bActive = x401001_IsActivityOpen(sceneId);
		if bActive and bActive == 1 then
		else
			--设置副本关闭标志
			LuaFnSetCopySceneData_Param(sceneId, 4, 1);
			return
		end

		--开始时的提示
		if curTickCount < x401001_g_startTickCount then
			if floor(curTickCount) == floor(curTickCount / x401001_g_tipsIntervalTickCount) * floor(x401001_g_tipsIntervalTickCount) then
				local memId;
	  			local strText = format("战斗将在%d秒后开始!", (x401001_g_startTickCount - curTickCount) * x401001_g_tickDiffTime);
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
				for	i = 0, membercount - 1 do
					memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
					if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
 						x401001_NotifyFailTips(sceneId, memId, strText);
 					end
				end
			end
		elseif curTickCount == x401001_g_startTickCount then
			local memId;
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
			for	i = 0, membercount - 1 do
				memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
				if LuaFnIsObjValid(sceneId, memId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, memId) == 1 then
					x401001_NotifyFailTips(sceneId, memId, "战斗开始了!");
				end
			end
		end
			
		--怪物控制逻辑
		if curTickCount >= x401001_g_startTickCount then	--时间到，开始出怪
			local mgroup = LuaFnGetCopySceneData_Param(sceneId, 10);	--记录所产生的怪物组
			local xinshoucnt = 0
			
			if mgroup > x401001_g_MoTypeCount then
				print("Error! ");
				mgroup = 1;
			end
			
			-- 根据普通和新人模式选择不同的monster类型
			local Black_A = x401001_g_Black_A
			local Black_B = x401001_g_Black_B
			local Black_C = x401001_g_Black_C
			local White_A = x401001_g_White_A
			local White_B = x401001_g_White_B
			local White_C = x401001_g_White_C
			local	LastBoss = x401001_g_LastBoss
			xinshoucnt = LuaFnGetCopySceneData_Param(sceneId, 13);	--获取带新手模式信息
			--PrintStr("xinshoucnt ="..xinshoucnt)
			if xinshoucnt == 2 then
					Black_B = x401001_g_Black_XinShou3_B
					Black_C = x401001_g_Black_XinShou3_C
					White_B = x401001_g_White_XinShou3_B
					White_C = x401001_g_White_XinShou3_C
					LastBoss = x401001_g_LastBoss_XinShou3
			elseif xinshoucnt == 1 then
					Black_B = x401001_g_Black_XinShou6_B
					Black_C = x401001_g_Black_XinShou6_C
					White_B = x401001_g_White_XinShou6_B
					White_C = x401001_g_White_XinShou6_C
					LastBoss = x401001_g_LastBoss_XinShou6
			end 
		  
			--变化怪物
			local monsterObjId = -1;
			local monsterCount = GetMonsterCount(sceneId);
			for i = 0, monsterCount - 1 do
				monsterObjId = GetMonsterObjID(sceneId, i);
				if LuaFnIsCharacterLiving(sceneId, monsterObjId) > 0 then	--活的怪物
					local monstertype = GetMonsterDataID(sceneId, monsterObjId);	--怪物类型
					local monsterLevel = GetLevel(sceneId, monsterObjId);
					local mcreatetime = GetObjCreateTime(sceneId, monsterObjId);	--怪物创建时间
					local PosX, PosZ = LuaFnGetWorldPos(sceneId, monsterObjId);
					PosX = floor(PosX);
					PosZ = floor(PosZ);

					if monstertype == Black_A[mgroup] then
						if nowTime >= mcreatetime + x401001_g_aToBInterval then --需要将怪物变成B状态了
							LuaFnDeleteMonster(sceneId, monsterObjId);
							--PrintStr("Black_B ="..Black_B[mgroup])
							monsterObjId = LuaFnCreateMonster(sceneId, Black_B[mgroup], PosX, PosZ, 7, 0, 401001);
							if monsterObjId and monsterObjId > -1 then
								SetLevel(sceneId, monsterObjId, monsterLevel);
							end
						end
					elseif monstertype == Black_B[mgroup] then
						if nowTime >= mcreatetime + x401001_g_aToBInterval + x401001_g_bToCInterval then --需要将怪物变成C状态了
							LuaFnDeleteMonster(sceneId, monsterObjId);
							--PrintStr("Black_C ="..Black_C[mgroup])
							monsterObjId = LuaFnCreateMonster(sceneId, Black_C[mgroup], PosX, PosZ, 5, 0, 401001);
							if monsterObjId and monsterObjId > -1 then
								SetLevel(sceneId, monsterObjId, monsterLevel);
							end
						end
					elseif monstertype == White_A[mgroup] then
						if nowTime >= mcreatetime + x401001_g_aToBInterval then --需要将怪物变成B状态了
							LuaFnDeleteMonster(sceneId, monsterObjId)
							--PrintStr("White_B ="..White_B[mgroup])
							monsterObjId = LuaFnCreateMonster(sceneId, White_B[mgroup], PosX, PosZ, 7, 0, 401001);
							if monsterObjId and monsterObjId > -1 then
								SetLevel(sceneId, monsterObjId, monsterLevel);
							end
						end
					elseif monstertype == White_B[mgroup] then
						if nowTime >= mcreatetime + x401001_g_aToBInterval + x401001_g_bToCInterval then --需要将怪物变成C状态了
							LuaFnDeleteMonster(sceneId, monsterObjId)
							--PrintStr("White_C ="..White_C[mgroup])
							monsterObjId = LuaFnCreateMonster(sceneId, White_C[mgroup], PosX, PosZ, 5, 0, 401001);
							if monsterObjId and monsterObjId > -1 then
								SetLevel(sceneId, monsterObjId, monsterLevel);
							end
						end
					else
					end
				else
				end
			end

			--刷怪
			--取得已经下了的步数
			local pressStep = LuaFnGetCopySceneData_Param(sceneId, 9);
			if pressStep < x401001_g_mStepPosListSize then
				--出怪时间检测
				local needCreate = 0;
				local curKillCount = LuaFnGetCopySceneData_Param(sceneId, 11);
				if pressStep == x401001_g_mStepPosListSize - 1 then
					if curKillCount == pressStep then
						needCreate = 1;
					end
				elseif pressStep == 0 then
					needCreate = 1;
				else
					local createMonsterIntervalTickCount = 0;
					local createMonsterIntervalInfo;
					for _, createMonsterIntervalInfo in x401001_g_createMonsterIntervalInfoList do
						if pressStep < createMonsterIntervalInfo.topPressStep then
							createMonsterIntervalTickCount = createMonsterIntervalInfo.intervalTickCount;
							break;
						end
					end
					
					--取上次出怪时间
					local prevCreateMonsterTickCount = LuaFnGetCopySceneData_Param(sceneId, 12);
					if prevCreateMonsterTickCount + createMonsterIntervalTickCount <= curTickCount then
						needCreate = 1;
					end
				end
				
				--生成怪物
				if needCreate == 1 then
					LuaFnSetCopySceneData_Param(sceneId, 12, curTickCount);
					
					--设置新的定时器调用次数
					pressStep = pressStep + 1;
					LuaFnSetCopySceneData_Param(sceneId, 9, pressStep);
					
					--根据棋谱生成怪物
					local selectQiPuIndex = LuaFnGetCopySceneData_Param(sceneId, 8);
					local pos = x401001_g_mStepPosLists[selectQiPuIndex][pressStep];
					local monsterType = -1;
					local monsterAIType = -1;
					local monsterAIScript = -1;
					local isBoss = 0;
					if pressStep == x401001_g_mStepPosListSize then
						monsterType = LastBoss[mgroup];
						monsterAIType = 14;
						monsterAIScript = 123;
						isBoss = 1;
					else
						local whiteOrBlack = mod(pressStep, 2);
						if whiteOrBlack == 1 then
							monsterType = White_B[mgroup];
						else
							monsterType = Black_B[mgroup];
						end
						monsterAIType = 3;
						monsterAIScript = 0;
						isBoss = 0;
					end
					
					if monsterType and monsterType ~= -1 and pos then
						--PrintStr("monsterType ="..monsterType)
						local newObjId = LuaFnCreateMonster(sceneId, monsterType, pos.x, pos.z, monsterAIType, monsterAIScript, 401001);
						if newObjId and newObjId > -1 then
							local LevelGap = LuaFnGetCopySceneData_Param(sceneId, CopyScene_LevelGap);
							local monsterLevel = GetLevel(sceneId, newObjId);
							monsterLevel = LevelGap + monsterLevel;
							SetLevel(sceneId, newObjId, monsterLevel);
							
							if isBoss == 1 then
							
								local szName = LuaFnGetName(sceneId, newObjId)
	
								if szName == "远古棋魂"   then
									SetCharacterTitle(sceneId, newObjId, "“棋王”")
								end
							
								local strText = format("#R%s:觉悟吧！你们应该为你们的行为付出代价。", LuaFnGetName(sceneId, newObjId));
  								MonsterTalk(sceneId, -1, x401001_g_CopySceneName, strText);
	  							
								--大家都封印吧
								local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
								local memId;
								for	i = 0, membercount - 1 do
									memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
  									LuaFnSendSpecificImpactToUnit(sceneId, memId, newObjId, memId, 46, 0);
								end
							end
						end
					end
				end
			end
		end
	end
	
	curTickCount = curTickCount + 1;
	LuaFnSetCopySceneData_Param(sceneId, 2, curTickCount);--设置新的定时器调用次数
end

function x401001_NotifyFailTips(sceneId, selfId, Tip)
	BeginEvent(sceneId);
		AddText(sceneId, Tip);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end

function x401001_IsActivityOpen(sceneId)
	local nHour = GetHour();
	local nMinute = GetMinute();
	local nCurTempTime = nHour * 60 + nMinute;
	if nCurTempTime >= x401001_g_beginTime1 and nCurTempTime < x401001_g_endTime1 then
		return 1;
	end
	if nCurTempTime >= x401001_g_beginTime2 and nCurTempTime < x401001_g_endTime2 then
		return 1;
	end
	return 0;
end

function x401001_OnDie(sceneId, selfId, killerId)						-- 场景ID, 被杀的ObjId, 杀手ObjId
	local objType = GetMonsterDataID(sceneId, selfId);
	local mgroup = LuaFnGetCopySceneData_Param(sceneId, 10);	--记录所产生的怪物组
	local xinshoucnt = 0
	local	LastBoss = x401001_g_LastBoss
	xinshoucnt = LuaFnGetCopySceneData_Param(sceneId, 13);	--获取带新手模式信息
			
	if xinshoucnt == 2 then
			LastBoss = x401001_g_LastBoss_XinShou3
	elseif xinshoucnt == 1 then
			LastBoss = x401001_g_LastBoss_XinShou6
	end 
	--PrintStr("LastBoss ="..LastBoss[mgroup])
	--PrintStr("objType ="..objType)
	
	--杀死怪物的是宠物则获取其主人的Id....
	local playerID = killerId
	local objTypeEx = GetCharacterType( sceneId, killerId )
	if objTypeEx == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end

	-- 带新手模式下善恶值和额外经验的给予
	-- 检测是否满足带新手模式
	if playerID ~= nil and playerID ~= -1 and x401001_OnXinShouCount( sceneId, playerID ) > 0 then
		local	memberId = 0
		local memcount = LuaFnGetCopyScene_HumanCount(sceneId);
		
		local memlevel = GetLevel( sceneId, playerID )
		local teamLeaderFlag = 0
		teamLeaderFlag = LuaFnIsTeamLeader(sceneId, playerID);
		if memlevel >= x401001_g_Highlvl_Limit then
			local nStr = ""
			local memgoodbad = LuaFnGetHumanGoodBadValue(sceneId, playerID)
			if teamLeaderFlag == 1 then
				--PrintStr("High_GoodBadParam")
				LuaFnSetHumanGoodBadValue(sceneId, playerID, memgoodbad+x401001_g_High_GoodBadParam)		-- 杀手是队长的话多给些善恶
				nStr = format( "#{QJ_20080522_04}%d#{QJ_20080522_05}", x401001_g_High_GoodBadParam )
			else
				--PrintStr("Low_GoodBadParam")
				LuaFnSetHumanGoodBadValue(sceneId, playerID, memgoodbad+x401001_g_Low_GoodBadParam)			-- 杀手是队员的话少给些善恶
				nStr = format( "#{QJ_20080522_04}%d#{QJ_20080522_05}", x401001_g_Low_GoodBadParam )
			end
			
			Msg2Player( sceneId, playerID, nStr, MSG2PLAYER_PARA )
		end
		
		for	k = 0, memcount - 1 do
			memberId = LuaFnGetCopyScene_HumanObjId(sceneId, k);
			local memlvl = GetLevel( sceneId, memberId )
			--PrintStr("memberId ="..memberId)
			--PrintStr("memlvl ="..memlvl)
			-- 只给新人额外经验
			if memlvl >= x401001_g_Lowlvl_Limit.from and memlvl <= x401001_g_Lowlvl_Limit.to then
				local MonsterLevel = GetLevel( sceneId, selfId )
				--PrintStr("MonsterLevel ="..MonsterLevel)
				local levelcur = memlvl - MonsterLevel
				--local nExpAtn = 0 --经验衰减已经取消，by hukai
				local PlayerExpList = {}
				local	ExpParam = x401001_g_XinShou_Exp_Mod01										-- 经验系数加成,平时给的少
				--nExpAtn = GetExpAttenuationInfo( sceneId, memberId, levelcur )	-- 根据ExpAttenuation.txt获得经验衰减系数,已经取消，by hukai
				--PrintStr("nExpAtn ="..nExpAtn)
				for n, ExpListInfo in x401001_g_XinShou_ExpAtu do
					if ( objType and objType >= ExpListInfo.mBengin01 and objType <= ExpListInfo.mEnd01)						-- 根据monster类型,根据每个玩家的等级给予不同的额外经验
						 or ( objType and objType >= ExpListInfo.mBengin02 and objType <= ExpListInfo.mEnd02) then
						 PlayerExpList = ExpListInfo.ExpList
						 break
					end
				end
				
				local plyLevel = floor(memlvl/10)
				local playerExp01 = 0
				if PlayerExpList and PlayerExpList[plyLevel] > 0 then
					playerExp01 = PlayerExpList[plyLevel]
				end
				--PrintStr("playerExp01 ="..playerExp01)
				
				-- 是否有双倍经验Buffer
				for i, ExpPreList in x401001_g_DoubleExpList do
					if LuaFnHaveImpactOfSpecificDataIndex(sceneId, memberId, ExpPreList.BuffId) == 1   then
						ExpParam = ExpPreList.ExpPre						
						break
					end
				end
				
				local nFreeHave = DEGetFreeTime(sceneId, memberId)
				local nMoneyHave = DEGetMoneyTime(sceneId, memberId)
				--PrintStr("nFreeHave ="..nFreeHave)
				--PrintStr("nMoneyHave ="..nMoneyHave)
				if DEIsLock(sceneId,memberId) <= 0 then								-- 玩家是否领取到双倍/四倍经验奖励,不包括冻结状态
					if nFreeHave > 0 or nMoneyHave > 0 then
						--PrintStr("Exp_Mod02")
						ExpParam = x401001_g_XinShou_Exp_Mod02						-- 未冻结的双倍/四倍经验经验系数加成高
					end
				end				

				-- 根据组队人数经验衰减
				playerExp01 = playerExp01*( ( 1+( memcount-1 )/x401001_g_ExpTeamPre )/memcount )
				--local ExpSum = (1-nExpAtn)*playerExp01*ExpParam				-- 根据公式给予玩家经验。经验衰减已经取消 by hukai
				local ExpSum = playerExp01*ExpParam				-- 根据公式给予玩家经验
				--PrintStr("ExpSum ="..ExpSum)
				if ExpSum > 0 then
					LuaFnAddExp( sceneId, memberId, floor(ExpSum) )
				end
			end
		end
	end
	
	if objType and objType == LastBoss[mgroup] then
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId
		local teamLeaderName;
		local firstMemName;
		local firstMemId;
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, memId);
			if teamLeaderFlag and teamLeaderFlag == 1 then
				teamLeaderName = LuaFnGetName(sceneId, memId);
			end
			if firstMemName then
			else
				firstMemId = memId;
				firstMemName = LuaFnGetName(sceneId, memId);
			end
		end
		if teamLeaderName or firstMemName then
			local bossName = "#{_BOSS26}";
			local winMessage = {};
			if teamLeaderName then
				winMessage[1] = format("#W#{_INFOUSR%s}#P率队在珍珑棋局中的最后阶段，将#G%s#P击败，#G%s#P临终前喟然长叹：世事如棋局局新，下次我一定努力……", teamLeaderName, bossName, bossName);
				winMessage[2] = format("#G%s#P与#W#{_INFOUSR%s}#P率领的队伍会战珍珑棋局，因眼花而自添一眼导致形势逆转而负。", bossName, teamLeaderName);
				winMessage[3] = format("#W#{_INFOUSR%s}#P正与#G%s#P聚精会神的对弈，队友们从背后分左中右三路袭向#G%s#P，遂大胜珍珑棋局，那#G%s#P含泪道：你们……你们……", teamLeaderName, bossName, bossName, bossName);
				winMessage[4] = format("#W#{_INFOUSR%s}#P正在珍珑棋局与#G%s#P正在对弈，队友们在#G%s#P身后叫道：“大飞，小飞，虎，虎上！”#G%s#P最终因心智混乱而败。", teamLeaderName, bossName, bossName, bossName);
			elseif firstMemName then
				winMessage[1] = format("#W#{_INFOUSR%s}#P等人在珍珑棋局中的最后阶段，将#G%s#P击败，#G%s#P临终前喟然长叹：世事如棋局局新，下次我一定努力……", firstMemName, bossName, bossName);
				winMessage[2] = format("#G%s#P与#W#{_INFOUSR%s}#P等人的队伍会战珍珑棋局，因眼花而自添一眼导致形势逆转而负。", bossName, firstMemName);
			end
			
			local messageCount = getn(winMessage);
			local randIndex = random(1, messageCount);
			if winMessage[randIndex] then
			else
				randIndex = 1;
			end
			
			if winMessage[randIndex] then
				BroadMsgByChatPipe(sceneId, firstMemId, winMessage[randIndex], 4);
			end
			
		end
	else
	    --++++++++++++++ 判断是年兽，则不计数
--	    local iNsIdx = 1;
--	    for iNsIdx = 1, getn(x401001_g_Nianshous) do
--	       if x401001_g_Nianshous[iNsIdx] == objType then
--	          return
--	       end
--	    end
	    --++++++++++++++
		local curKillCount = LuaFnGetCopySceneData_Param(sceneId, 11);
		curKillCount = curKillCount + 1;
		LuaFnSetCopySceneData_Param(sceneId, 11, curKillCount);
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
		local memId
		local strText = format("你已杀死棋子%d/%d", curKillCount, x401001_g_mStepPosListSize - 1);
		for	i = 0, membercount - 1 do
			memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
			if LuaFnIsObjValid( sceneId, memId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, memId ) == 1 then
				x401001_NotifyFailTips(sceneId, memId, strText);
			end
		end
	end
end

-- 获得带新手模式下新手的数量
function x401001_OnXinShouCount( sceneId, selfId )

	-- 带新手模式棋局
	local nHightlvlNum = 0
	local nLowlvlNum = 0
	local nTipToplvl	=	0
	local nTipBotlvl	=	GetHumanMaxLevelLimit()
	local nearMemberCount = GetNearTeamCount(sceneId, selfId);
	for	i=0,nearMemberCount-1 do
		local sceneMemId = GetNearTeamMember(sceneId, selfId, i)
		if sceneMemId and sceneMemId >= 0 then			
			if GetLevel(sceneId, sceneMemId) >= x401001_g_Highlvl_Limit then
				nHightlvlNum = nHightlvlNum + 1
			end
			if GetLevel(sceneId, sceneMemId) >= x401001_g_Lowlvl_Limit.from and GetLevel(sceneId, sceneMemId) <= x401001_g_Lowlvl_Limit.to then
				nLowlvlNum = nLowlvlNum + 1
			end
			if GetLevel(sceneId, sceneMemId) > nTipToplvl then
				nTipToplvl = GetLevel(sceneId, sceneMemId)
			end
			if GetLevel(sceneId, sceneMemId) < nTipBotlvl then
				nTipBotlvl = GetLevel(sceneId, sceneMemId)
			end
		end
	end
	
	if nHightlvlNum > 0 and nLowlvlNum > 0 and (nTipToplvl-nTipBotlvl) >= x401001_g_LvLCur then
		return nLowlvlNum
	end
	
	return 0

end
