--401040

-- 燕子坞副本

--************************************************************************
--MisDescBegin
--脚本号
x401040_g_ScriptId = 401040
x401040_g_Name = "李纲"


--MisDescEnd
--************************************************************************
x401040_TIME_2000_01_03_ = 946828868

x401040_g_SceneData_1 = 8   -- 记录副本刷怪到第几批

x401040_g_SceneData_3 = 9	-- 
x401040_g_SceneData_4 = 10	-- 
x401040_g_SceneData_5 = 11	-- 
x401040_g_SceneData_6 = 12	-- 

x401040_g_SceneData_7 = 13	-- 玩家等级

x401040_g_SD_Monster_1 	 = 14			-- 暂未使用
x401040_g_SD_Monster_1_T = 15			-- 暂未使用


x401040_g_SD_Monster_2 	 = 16
x401040_g_SD_Monster_2_T = 17
x401040_g_SD_Monster_3 	 = 18
x401040_g_SD_Monster_3_T = 19

x401040_g_KillMonsCount_Qincheng = 20
x401040_g_KillMonsCount_Qinjia 	 = 21
x401040_g_KillMonsCount_Lama		 = 22

x401040_g_SkillSign = 23 	-- 公冶干、邓百川、包不同和风波恶 其中一个人死后，别人狂暴标记

-- 王语嫣开始点名的开关
x401040_g_bWangyuyanSpeak = 24
x401040_g_bWangyuyanSpeak_T = 27

-- 关闭副本的时间记录
x401040_g_CloseTime = 25

-- 副本失败的标记
x401040_g_MissionLost = 26

-- 控制系统提示的时间
x401040_g_SystemTipsTime = 28

-- 控制 王语嫣受到伤害后，王语嫣和段誉的对话
x401040_g_DuanAndWangFlag = 29

--副本名称
x401040_g_CopySceneName = "燕子坞"
x401040_g_CopySceneType = FUBEN_DAZHAN_YZW	--副本类型，定义在ScriptGlobal.lua里面
x401040_g_CopySceneMap = "yanziwu.nav"
x401040_g_LimitMembers = 1			--可以进副本的最小队伍人数
x401040_g_TickTime = 1				--回调脚本的时钟时间（单位：秒/次）
x401040_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x401040_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x401040_g_CloseTick = 3				--副本关闭前倒计时（单位：次数）
x401040_g_NoUserTime = 300			--副本中没有人后可以继续保存的时间（单位：秒）
x401040_g_DeadTrans = 0				--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x401040_g_Fuben_X = 177				--进入副本的位置X
x401040_g_Fuben_Z = 234				--进入副本的位置Z
x401040_g_Back_X = 70				--源场景位置X
x401040_g_Back_Z = 120				--源场景位置Z
x401040_g_Back_SceneId = 4			--源场景Id

x401040_g_Npc_1 = {	
-- 宋军士兵
--{id=9210,x=171,y=236,camp=109,ai=21,af=222},{id=9210,x=175,y=236,camp=109,ai=21,af=222},
--{id=9210,x=179,y=236,camp=109,ai=21,af=222},{id=9210,x=183,y=236,camp=109,ai=21,af=222},
{id=9210,x=175,y=202,camp=109,ai=21,af=222},{id=9210,x=181,y=202,camp=109,ai=21,af=222},
{id=9210,x=172,y=152,camp=109,ai=21,af=222},{id=9210,x=173,y=158,camp=109,ai=21,af=222},
{id=9210,x=146,y=151,camp=109,ai=21,af=222},{id=9210,x=151,y=154,camp=109,ai=21,af=222},
{id=9210,x=137,y=177,camp=109,ai=21,af=222},{id=9210,x=133,y=175,camp=109,ai=21,af=222},
{id=9210,x=109,y=162,camp=109,ai=21,af=222},{id=9210,x=104,y=164,camp=109,ai=21,af=222},
{id=9210,x=82 ,y=176,camp=109,ai=21,af=222},{id=9210,x=77 ,y=176,camp=109,ai=21,af=222},
{id=9210,x=53 ,y=157,camp=109,ai=21,af=222},{id=9210,x=58 ,y=156,camp=109,ai=21,af=222},
{id=9210,x=76 ,y=210,camp=109,ai=21,af=222},{id=9210,x=80 ,y=210,camp=109,ai=21,af=222},
{id=9210,x=86 ,y=210,camp=109,ai=21,af=222},{id=9210,x=91 ,y=210,camp=109,ai=21,af=222},
{id=9210,x=211,y=146,camp=109,ai=21,af=222},{id=9210,x=214,y=146,camp=109,ai=21,af=222},
{id=9210,x=217,y=146,camp=109,ai=21,af=222},{id=9210,x=220,y=146,camp=109,ai=21,af=222},
{id=9210,x=223,y=146,camp=109,ai=21,af=222},

-- 一品堂武士
{id=9240,x=175,y=152,camp=110,ai=21,af=226},{id=9240,x=149,y=150,camp=110,ai=21,af=226},
{id=9240,x=147,y=146,camp=110,ai=21,af=226},{id=9240,x=135,y=174,camp=110,ai=21,af=226},
{id=9240,x=133,y=171,camp=110,ai=21,af=226},{id=9240,x=135,y=177,camp=110,ai=21,af=226},
{id=9240,x=105,y=161,camp=110,ai=21,af=226},{id=9240,x=108,y=159,camp=110,ai=21,af=226},
{id=9240,x=80 ,y=173,camp=110,ai=21,af=226},{id=9240,x=81 ,y=177,camp=110,ai=21,af=226},
{id=9240,x=55 ,y=155,camp=110,ai=21,af=226},{id=9240,x=52 ,y=154,camp=110,ai=21,af=226},
{id=9240,x=58 ,y=155,camp=110,ai=21,af=226},

-- 燕子坞庄丁
{id=9280,x=209,y=80 ,camp=110,ai=21,af=239},{id=9280,x=222,y=79 ,camp=110,ai=21,af=239},
{id=9280,x=218,y=69 ,camp=110,ai=21,af=239},{id=9280,x=228,y=64 ,camp=110,ai=21,af=239},
{id=9280,x=228,y=52 ,camp=110,ai=21,af=239},{id=9280,x=217,y=39 ,camp=110,ai=21,af=239},
{id=9280,x=186,y=31 ,camp=110,ai=21,af=239},{id=9280,x=181,y=36 ,camp=110,ai=21,af=239},
{id=9280,x=176,y=42 ,camp=110,ai=21,af=239},{id=9280,x=176,y=52 ,camp=110,ai=21,af=239},
{id=9280,x=136,y=93 ,camp=110,ai=21,af=239},{id=9280,x=140,y=88 ,camp=110,ai=21,af=239},
{id=9280,x=137,y=82 ,camp=110,ai=21,af=239},{id=9280,x=144,y=86 ,camp=110,ai=21,af=239},
{id=9280,x=143,y=101,camp=110,ai=21,af=239},{id=9280,x=141,y=111,camp=110,ai=21,af=239},
{id=9280,x=148,y=112,camp=110,ai=21,af=239},{id=9280,x=146,y=103,camp=110,ai=21,af=239},
{id=9280,x=154,y=110,camp=110,ai=21,af=239},

-- 连弩塔
{id=9290,x=234,y=30 ,camp=110,ai=21,af=223},{id=9290,x=225,y=25 ,camp=110,ai=21,af=223},
{id=9290,x=175,y=41 ,camp=110,ai=21,af=223},{id=9290,x=179,y=45 ,camp=110,ai=21,af=223},
{id=9290,x=172,y=48 ,camp=110,ai=21,af=223},{id=9290,x=171,y=52 ,camp=110,ai=21,af=223},
{id=9290,x=170,y=57 ,camp=110,ai=21,af=223},{id=9290,x=167,y=61 ,camp=110,ai=21,af=223},
}

-- 呼延庆 呼延豹
x401040_g_Npc_2 = {	{id=9200,x=177,y=232,script=402240,camp=0,ai=3,af=-1},
		 	{id=9220,x=79, y=202,script=402241,camp=109,ai=21,af=220}
}

-- 呼延庆身后有对话的宋兵
x401040_g_Npc_2_1={	{id=9210,x=171,y=236,camp=109,ai=21,af=222,script=402262},
			{id=9210,x=175,y=236,camp=109,ai=21,af=222,script=402262},
			{id=9210,x=179,y=236,camp=109,ai=21,af=222,script=402262},
			{id=9210,x=183,y=236,camp=109,ai=21,af=222,script=402262},
}

-- 岳老三
x401040_g_Npc_3 = {	{id=9340,	x=81,y=197,	script=402242,camp=110,ai=21,af=227}
}

-- 岳老三 附带的小怪 (一品堂武士)
x401040_g_Npc_3_1={	{id=9240,x=79,y=195,camp=110,ai=21,af=226},
			{id=9240,x=77,y=207,camp=110,ai=21,af=226},
			{id=9240,x=82,y=195,camp=110,ai=21,af=226},
			{id=9240,x=86,y=206,camp=110,ai=21,af=226},
}

-- 叶二娘 云中鹤
x401040_g_Npc_4 = {	{id=9330,x=77,y=195,script=402244,camp=110,ai=21,af=228},
			{id=9350,x=83,y=198,script=402243,camp=110,ai=21,af=229},
}                                         
                                                 
-- 段延庆
x401040_g_Npc_5 = {	{id=9320,x=81,y=195,script=402245,camp=110,ai=21,af=230},
}

-- 钱宏宇 华赫艮
x401040_g_Npc_6 = {	{id=9230,x=217,y=150,script=402246,camp=109,ai=21,af=221},
			{id=9480,x=179,y=91,script=402249,camp=0,ai=3,af=-1},
}

-- 可以由玩家修理的连弩塔
x401040_g_Npc_7 = {	{id=9290,x=210,y=155,script=402247, name="前",camp=0,ai=3,af=-1},
			{id=9290,x=225,y=138,script=402247, name="后",camp=0,ai=3,af=-1},
			{id=9300,x=225,y=155,script=402247, name="",camp=0,ai=3,af=-1},
			{id=9310,x=209,y=138,script=402247, name="",camp=0,ai=3,af=-1},
}

-- 和 呼延豹 对话后，不断输出的小怪 (一品堂武士)
x401040_g_Npc_8 = {	{id=9240,x=79,y=195,script=-1,camp=110,ai=21,af=226},
			{id=9240,x=77,y=207,script=-1,camp=110,ai=21,af=226},
			{id=9240,x=82,y=195,script=-1,camp=110,ai=21,af=226},
			{id=9240,x=86,y=206,script=-1,camp=110,ai=21,af=226},
}

-- 和钱宏宇对话后，不断刷出的小怪
x401040_g_Npc_9 = {	{id=9250,x=233,y=214,script=402258,pp=0,camp=110,ai=21,af=231},
			{id=9250,x=236,y=214,script=402258,pp=1,camp=110,ai=21,af=231},
			{id=9250,x=235,y=217,script=402258,pp=2,camp=110,ai=21,af=231},
			{id=9250,x=238,y=216,script=402258,pp=3,camp=110,ai=21,af=231},
			{id=9250,x=237,y=219,script=402258,pp=4,camp=110,ai=21,af=231},
}

-- 木人傀儡在 双数次刷
x401040_g_Npc_9_1={	{id=9530,x=237,y=219,script=402259,pp=4,camp=110,ai=21,af=233}}

-- 青城派弟子，在50到100刷出
x401040_g_Npc_9_2 = {	{id=9260,x=233,y=214,script=402257,pp=0,camp=110,ai=21,af=232},
			{id=9260,x=236,y=214,script=402257,pp=1,camp=110,ai=21,af=232},
			{id=9260,x=235,y=217,script=402257,pp=2,camp=110,ai=21,af=232},
			{id=9260,x=238,y=216,script=402257,pp=3,camp=110,ai=21,af=232},
			{id=9260,x=237,y=219,script=402257,pp=4,camp=110,ai=21,af=232},
}

-- 和钱宏宇对话后，不断刷出的 吐蕃喇嘛
x401040_g_Npc_10= {	{id=9270,x=233,y=214,script=402260,pp=0,camp=110,ai=21,af=234},
			{id=9270,x=236,y=214,script=402260,pp=1,camp=110,ai=21,af=234},
			{id=9270,x=235,y=217,script=402260,pp=2,camp=110,ai=21,af=234},
			{id=9270,x=238,y=216,script=402260,pp=2,camp=110,ai=21,af=234},
			{id=9270,x=237,y=219,script=402260,pp=2,camp=110,ai=21,af=234},
}

-- 和钱宏宇对话后，姚伯当,司马林,鸠摩智 （鸠摩智 有脚本）
x401040_g_Npc_11= {	{id=9360,x=233,y=214,script=402248,pp=0,camp=110,ai=21,af=235},
			{id=9370,x=233,y=214,script=402248,pp=0,camp=110,ai=21,af=236},
			{id=9380,x=233,y=214,script=402248,pp=0,camp=110,ai=21,af=237},
}

-- 公冶干 邓百川 包不同 风波恶
--x401040_g_Npc_12= {	{id=9390,x=130,y=112,script=402250,camp=110,ai=21,af=240},
--			{id=9400,x=126,y=109,script=402251,camp=110,ai=21,af=241},
--			{id=9410,x=126,y=112,script=402252,camp=110,ai=21,af=242},
--			{id=9420,x=126,y=115,script=402253,camp=110,ai=21,af=243},
--}
x401040_g_Npc_12= {	{id=9390,x=130,y=112,script=402250,camp=110,ai=21,af=241},
			{id=9400,x=126,y=109,script=402251,camp=110,ai=21,af=241},
			{id=9410,x=126,y=112,script=402252,camp=110,ai=21,af=241},
			{id=9420,x=126,y=115,script=402253,camp=110,ai=21,af=241},
}

-- 慕容复
x401040_g_Npc_13 ={	{id=9430,x=63,y=67,	script=402254,camp=110,ai=25,af=244},
}

-- 王姑娘，段誉 等人
x401040_g_Npc_14= {	{id=9450,x=76,y=67,	script=402255,camp=0,ai=26,af=-1},
			{id=9440,x=76,y=64,	script=402256,camp=0,ai=27,af=245},
			{id=9460,x=79,y=70,	script=402249,camp=0,ai=27,af=247},
			{id=9470,x=79,y=69,	script=402249,camp=0,ai=27,af=248},
			{id=9490,x=79,y=68,	script=402249,camp=0,ai=27,af=249},
			{id=9500,x=79,y=67,	script=402249,camp=0,ai=27,af=250},
			{id=9510,x=79,y=66,	script=402249,camp=0,ai=27,af=251},
			{id=9520,x=79,y=65,	script=402249,camp=0,ai=27,af=252},
}

-- 和慕容复开战后的 燕子坞庄丁 开怪后不断刷出的家丁
x401040_g_Npc_15=	{	}
--										{id=9280,x=60,y=55,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=66,y=55,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=60,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=66,y=63,	script=-1,camp=110,ai=21,af=239},
--}

-- 慕容复身边的背景，每次慕容复脱离战斗后，都会重新刷
x401040_g_Npc_16=	{	}
--										{id=9280,x=61,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=63,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=65,y=63,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=59,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=61,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=63,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=65,y=61,	script=-1,camp=110,ai=21,af=239},
--										{id=9280,x=67,y=61,	script=-1,camp=110,ai=21,af=239},
--}

--**********************************
--任务入口函数
--**********************************
function x401040_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"#{yanziwu_info}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x401040_g_Name  then
		return
	end

	-- 根据玩家的情况，将玩家送到不同的副本
	-- 2，检测玩家是不是组队了
	if GetTeamSize(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B讨伐燕子坞");
			AddText(sceneId,"  此战凶险异常，不足2人我可不敢让你们进入。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3，检测玩家是不是队长
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#B讨伐燕子坞");
			AddText(sceneId,"  你必须是队长才行。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4，检测是不是人都到位了
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B讨伐燕子坞");
			AddText(sceneId,"  还有队员不在附近。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5，检测队伍里头的每个玩家是不是都到60级了
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		if GetLevel(sceneId,nPlayerId) < 60  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B讨伐燕子坞");
				AddText(sceneId,"  此战凶险异常，不足60级我可不敢让你们进入。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

-- 每天只能3次
-- MD_YANZIWU_TIMES		=	195  -- 每天进入燕子坞的次数
-- MD_PRE_YANZIWU_TIME		=	196  -- 上一次去燕子坞的时间

	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""

	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	local bOk = 1
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		local nTimes = GetMissionData(sceneId,nPlayerId, MD_YANZIWU_TIMES) 
		local nPreTime = GetMissionData(sceneId,nPlayerId, MD_PRE_YANZIWU_TIME)
		local nCurTime = LuaFnGetCurrentTime()
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x401040_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x401040_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_YANZIWU_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_PRE_YANZIWU_TIME, nPreTime)
		end
		
		if nTimes >= 10  then
			bOk = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
		
	end
	local nCount = 0

	if bOk == 0  then
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
			AddText(sceneId,"#B讨伐燕子坞");
			AddText(sceneId,"  你的队伍中" .. szAllName .. "今天已经参加过3次讨伐燕子坞战役。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	
	end
	
	-- 所有的检测通过，
	x401040_MakeCopyScene(sceneId, selfId)
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
	
end

--**********************************
--列举事件
--**********************************
function x401040_OnEnumerate( sceneId, selfId, targetId )
	-- 最好在这里做一个名字判定
	if GetName(sceneId, targetId) == x401040_g_Name  then
		AddNumText( sceneId, x401040_g_ScriptId, "讨伐燕子坞",10 ,-1  )
		AddNumText( sceneId, x401040_g_ScriptId, "关于讨伐燕子坞",8 ,1  )
	end
end

--**********************************
--检测接受条件
--**********************************
function x401040_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x401040_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x401040_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x401040_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x401040_MakeCopyScene( sceneId, selfId )
	
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
	LuaFnSetSceneLoad_Map(sceneId, "yanziwu.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401040_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401040_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401040_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401040_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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
		iniLevel = 10;
	end

	-- 使用第13位，记录怪物实际的等级
	LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_7, mylevel)
	
	--设置场景中的各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "yanziwu_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yanziwu_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--副本事件
--**********************************
function x401040_OnCopySceneReady( sceneId, destsceneId )

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
		x401040_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x401040_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x401040_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x401040_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld( sceneId, ObjId, destsceneId, x401040_g_Fuben_X, x401040_g_Fuben_Z) ;
end


--**********************************
--有玩家进入副本事件
--**********************************
function x401040_OnPlayerEnter( sceneId, selfId )
	-- 3,设置死亡事件
	
	-- 设置玩家的阵营为 109
	SetUnitCampID(sceneId, selfId, selfId, 109)
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x401040_g_Fuben_X, x401040_g_Fuben_Z )
	
	local nTimes = GetMissionData(sceneId,selfId, MD_YANZIWU_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_PRE_YANZIWU_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	SetMissionData(sceneId, selfId, MD_YANZIWU_TIMES, nTimes+1) 
	SetMissionData(sceneId, selfId, MD_PRE_YANZIWU_TIME, nCurTime)
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x401040_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x401040_OnAbandon( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x401040_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x401040_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x401040_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x401040_OnDie( sceneId, objId, killerId )
	
end

--**********************************
--提示所有副本内玩家
--**********************************
function x401040_TipAllHuman( sceneId, Str )
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
function x401040_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x401040_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x401040_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--每一关的系统提示 每隔15秒由系统发出每一关的提示信息
--**********************************
function x401040_SystemTips( sceneId, nStep )
	if nStep == 1  then
		x401040_TipAllHuman(sceneId, "有高手要刺杀呼延豹将军")
		x401040_TipAllHuman(sceneId, "请使用轻功从荷叶飞跃到水军旗舰上去保护他")
	elseif nStep == 2  then
		x401040_TipAllHuman(sceneId, "有大批武林高手要赶来增援慕容反贼")
		x401040_TipAllHuman(sceneId, "请迅速赶至阻截点协助钱宏宇将军阻击反贼援军")
	elseif nStep == 3  then
		x401040_TipAllHuman(sceneId, "有大批武林高手要赶来增援慕容反贼")
		x401040_TipAllHuman(sceneId, "请迅速赶至阻截点协助钱宏宇将军阻击反贼援军")
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x401040_OnCopySceneTimer( sceneId, nowTime )
	
	local nStep = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_1);
	--PrintNum(nStep)
	-- nStep == 12 是副本任务失败标记，进入到这里，玩家只能出副本了，没有别的事情可作
	if nStep == 13  then
		-- 执行10秒后把玩家传出场景的逻辑
		return
	end
	--PrintNum(nStep)
	-- 岳老三伴随小怪的批数	
	local nTime = LuaFnGetCurrentTime()

	if nStep == 0  then
		x401040_CreateMonster_1(sceneId)
	end
	
	-- 获得上一次的系统提示时间
	local nPreSystemTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime)
	if nStep == 1  then
		if nTime-nPreSystemTime >= 15  then
			x401040_SystemTips( sceneId, 1 )
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime, nTime)
		end
	end
	
	if nStep == 2  then
		x401040_CreateMonster_2(sceneId)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 3)
	end
	
--	-- 控制刷伴随岳老三的小怪
--	if nStep >=3 and nStep<9  then
--		local nStep1 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1)
--		local nPreTime=LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1_T)
--		if nStep1 < 2  then
--			if nTime-nPreTime >= 40  then
--				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1, nStep1+1)
--				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_1_T,nTime)
--				-- 刷怪
--				x401040_CreateMonster_6(sceneId)
--			end
--		end
--	end
	
	if nStep == 4  then
		x401040_CreateMonster_3(sceneId)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 5)
	end
	
	if nStep == 6  then
		x401040_CreateMonster_5(sceneId)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 7)
	end
	
	-- 段延庆死亡，删除 "一品堂武士","叶二娘"，"云中鹤"
	if nStep == 9  then
		--PrintNum(nStep)
		x401040_ClearMonsterByName(sceneId, "一品堂武士")
		x401040_TipAllHuman(sceneId, "段延庆战败，手下及一品堂武士纷纷逃走。")
		
		x401040_ClearMonsterByName(sceneId, "叶二娘")
		x401040_ClearMonsterByName(sceneId, "云中鹤")
		
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 10)
	end

	-- 获得上一次的系统提示时间
	local nPreSystemTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime)
	if nStep == 10  then
		if nTime-nPreSystemTime >= 15  then
			x401040_SystemTips( sceneId, 2 )
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime, nTime)
		end
	end
	
	-- 刷按照路线巡逻的小怪
	if nStep == 11  then
		local nStep1 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2)
		local nPreTime=LuaFnGetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T)
		
		if nStep1 == 0  then
			-- 转换 钱宏宇 的阵营
			local nNpcNum = GetMonsterCount(sceneId)
			for i=0, nNpcNum-1 do
				local nNpcId = GetMonsterObjID(sceneId,i)
				if GetName(sceneId, nNpcId)  == "钱宏宇"  then
					SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				end
			end
		end
		
		if nStep1 < 10  then
			if nTime-nPreTime >= 30  then
			--if nTime-nPreTime >= 1  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T,nTime)
				-- 刷怪
				x401040_CreateMonster_7_1(sceneId)
				x401040_CreateMonster_7_3(sceneId)
				
				x401040_TipAllHuman(sceneId, "警惕！第" .. nStep1+1 .. "波燕子坞援军已经赶至，还有" .. 25-(nStep1+1) .. "波燕子坞援军即将赶来。")
				
				-- 刷 姚伯当
				if nStep1==9  then
					x401040_CreateMonster_8(sceneId, 1)
				end
				
			end
		end
				
		
		-- 刷10波小怪后，需要有一个90秒的等待时间
		if nStep1 == 10  then
			if nTime-nPreTime >= 90  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
			end
		end
		
		if nStep1>=11 and nStep1<21  then
			if nTime-nPreTime >= 60  then
			--if nTime-nPreTime >= 1  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T,nTime)
				
				-- 刷怪
				x401040_CreateMonster_7_4(sceneId)
				x401040_CreateMonster_7_3(sceneId)
				x401040_TipAllHuman(sceneId, "警惕！第" .. nStep1 .. "波燕子坞援军已经赶至，还有" .. 25-(nStep1) .. "波燕子坞援军即将赶来。")
				
				if nStep1==20  then
					-- 刷 司马林
					x401040_CreateMonster_8(sceneId, 2)
				end
				
			end
		end
		
		-- 再次刷10波小怪后，再有一个90秒的等待时间
		if nStep1 == 21  then
			if nTime-nPreTime >= 90  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
			end
		end
		
		if nStep1>=22 and nStep1<27  then
			if nTime-nPreTime >= 90  then
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2, nStep1+1)
				LuaFnSetCopySceneData_Param(sceneId, x401040_g_SD_Monster_2_T,nTime)
				x401040_CreateMonster_7_2(sceneId)
				x401040_TipAllHuman(sceneId, "警惕！第" .. nStep1-1 .. "波燕子坞援军已经赶至，还有" .. 25-(nStep1-1) .. "波燕子坞援军即将赶来。")
				
				if nStep1==26  then
					-- 刷 鸠摩智
					x401040_CreateMonster_8(sceneId, 3)
					-- 
					LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 12)
				end
				
			end
		end
	end
	
	
	-- 打败鸠摩智，检测钱宏宇是不是还活着，看第二步是成功还是失败了
	if nStep == 12  then
		local nNpcNum = GetMonsterCount(sceneId)
		local bOK = 0
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, nNpcId)  == "钱宏宇"  then
				bOK = 1
			end
		end
		
		if bOK == 1  then
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 15)
			-- 刷4门神
			x401040_CreateMonster_9(sceneId)
			x401040_CreateMonster_10(sceneId)
			x401040_CreateMonster_11(sceneId)
			
			--慕容复身后的怪
			x401040_CreateMonster_13(sceneId)
		else
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 501)
		end
	end
	
	-- 500 ，失败条件1，呼延豹 死亡
	local nLost = LuaFnGetCopySceneData_Param(sceneId, x401040_g_MissionLost)
	if nLost == 500  then
		CallScriptFunction((200060), "Paopao",sceneId, "呼延庆", "燕子坞", "由于呼延豹将军战败，该次讨伐行动失利，我们退回去，待重整旗鼓再来。")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, 1000)
	end
	
	-- 501，失败条件2，钱宏宇 死亡
	if nLost == 501  then
		CallScriptFunction((200060), "Paopao",sceneId, "呼延庆", "燕子坞", "由于钱宏宇将军战败，该次讨伐行动失利，我们退回去，待重整旗鼓再来。")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, 1000)
	end
	
	local nCloaeTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_CloseTime)
	-- 1000 ，倒计时，30秒后关闭副本
	if nLost == 1000 then
		x401040_TipAllHuman(sceneId, "副本将在30秒后关闭。")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	if nLost == 1001 and nTime-nCloaeTime>=15  then
		x401040_TipAllHuman(sceneId, "副本将在15秒后关闭。")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	if nLost == 1002 and nTime-nCloaeTime>=10  then
		x401040_TipAllHuman(sceneId, "副本将在5秒后关闭。")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	if nLost == 1003 and nTime-nCloaeTime>=5  then
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local nPlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			NewWorld( sceneId, nPlayerId, x401040_g_Back_SceneId, x401040_g_Back_X, x401040_g_Back_Z) ;
		end
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_CloseTime, nTime)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_MissionLost, nLost+1)
	end
	
	-- 连弩塔的修理
	-- 如果玩家交够了木材，就改变这个塔的阵营
	local jianta1 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_3)
	if jianta1 >= 5 and jianta1 < 1000  then
		x401040_ChangeNpc(sceneId, "前连弩塔")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_3, jianta1+1000)
	end
	local jianta2 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_4)
	if jianta2 >= 5 and jianta2 < 1000  then
		x401040_ChangeNpc(sceneId, "后连弩塔")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_4, jianta2+1000)
	end
	local jianta3 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_5)
	if jianta3 >= 10 and jianta3 < 1000  then
		x401040_ChangeNpc(sceneId, "治疗塔")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_5, jianta3+1000)
	end
	local jianta4 = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_6)
	if jianta4 >= 5 and jianta4 < 1000  then
		x401040_ChangeNpc(sceneId, "守御塔")
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_6, jianta4+1000)
	end
	
	-- 几个箭塔放技能
	if nStep >= 11   then
		if nTime-nPreSystemTime >=5  then
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_SystemTipsTime, nTime)
			if jianta1 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "前连弩塔")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("前连弩塔放技能")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1008,nNpcId,x,z,10,0)
					end
				end
			end
			
			if jianta2 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "后连弩塔")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("后连弩塔放技能")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1008,nNpcId,x,z,10,0)
					end
				end
			end
			
			if jianta3 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "治疗塔")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("治疗塔放技能")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1010,nNpcId,x,z,10,0)
					end
				end
			end
			
			if jianta4 > 1000  then
				local nNpcId = x401040_NameToId(sceneId, "守御塔")
				if nNpcId>=0  then
					if GetHp(sceneId, nNpcId) > 0  then
						--PrintStr("守御塔放技能")
						local x
						local z
						x,z = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1009,nNpcId,x,z,10,0)
					end
				end
			end
			
		end
	end
	
	-- 王语嫣点名
	-- 王语言开始点名的开关
	-- x401040_g_bWangyuyanSpeak = 24
	-- x401040_g_bWangyuyanSpeak_T = 27
	local bSpeak = LuaFnGetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak)
	local nSpeakTime = LuaFnGetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T)
	if bSpeak == 1  then
		CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "段公子，你能去帮帮我表哥吗？")
		
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 2)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
	
	elseif bSpeak == 2 and nTime - nSpeakTime >= 1  then
		CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "王姑娘有命，在下自是万死莫辞了。#70")
		
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 3)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
		
		local nNpcNum = GetMonsterCount(sceneId)
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, nNpcId)  == "段誉"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				SetUnitCampID(sceneId, nNpcId, nNpcId, 110)
				SetNPCAIType(sceneId, nNpcId, 27)
				SetAIScriptID(sceneId, nNpcId, 245)
				--PrintNum(222)
			end
			if GetName(sceneId, nNpcId)  == "王语嫣"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
				SetUnitCampID(sceneId, nNpcId, nNpcId, 110)
			end
		end
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 3)

	elseif bSpeak == 3 and nTime - nSpeakTime >= 20  then
		CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "#18#18#18王姑娘，真是不好意思，你看我这六脉神剑时灵时不灵的，现在怎么也伤不了人……")
	
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 4)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
	
	elseif bSpeak == 4 and nTime - nSpeakTime >= 1  then
		CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "#20#20#20又来这套……还是我自己来帮表哥。")
	
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak, 5)
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
	
	elseif bSpeak == 5  then
		if nTime-nSpeakTime >= 10  then
			x401040_GiveDirections(sceneId)
			LuaFnSetCopySceneData_Param(sceneId, x401040_g_bWangyuyanSpeak_T, nTime)
		end
		
--	else
--		local nNpcNum = GetMonsterCount(sceneId)
--		for i=0, nNpcNum-1 do
--			local nNpcId = GetMonsterObjID(sceneId,i)
--			if GetName(sceneId, nNpcId)  == "段誉"  then
--				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
--				SetUnitCampID(sceneId, nNpcId, nNpcId, 109)
--				--PrintNum(222)
--			end
--			if GetName(sceneId, nNpcId)  == "王语嫣"  then
--				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
--				SetUnitCampID(sceneId, nNpcId, nNpcId, 109)
--			end
--		end
		
	end
	
	local bSpeak = LuaFnGetCopySceneData_Param(sceneId, x401040_g_DuanAndWangFlag)
 	if bSpeak == 1 then
		CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "表哥，救我！")
		CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "王姑娘，我来救你！")
 		
		local nNpcNum = GetMonsterCount(sceneId)
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			if GetName(sceneId, nNpcId)  == "段誉"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				SetUnitCampID(sceneId, nNpcId, nNpcId, 110)
				SetAIScriptID(sceneId, nNpcId, 246)
				--PrintNum(222)
			end
		end
 		LuaFnSetCopySceneData_Param(sceneId, x401040_g_DuanAndWangFlag, 2)
 	end
	
	
end

--**********************************
--从名字获得NpcId
--**********************************
function x401040_NameToId(sceneId, szName)
	local nNpcId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== szName  then
			nNpcId = nMonsterId
		end
	end
	return nNpcId
end

--**********************************
--第一次生成怪物
--**********************************
function x401040_CreateMonster_1(sceneId)
	-- 设置刷怪
	if LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_1) == 0  then
		
		-- 刷小怪， 宋军士兵，一品堂武士，燕子坞家丁
		for i, Npc in x401040_g_Npc_1  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y,	Npc.ai, Npc.af, -1)
			local szName = GetName(sceneId, nNpcId)
			SetUnitCampID(sceneId,nNpcId,nNpcId,Npc.camp)
			
			if szName == "宋军士兵"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				
			elseif szName == "一品堂武士"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
				
			elseif szName == "燕子坞家丁"  then
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			end
		end
		
		-- 刷Npc，有脚本的Npc
		for i, Npc in x401040_g_Npc_2  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
		end
		
		for i, Npc in x401040_g_Npc_2_1  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
		end
		
		-- 刷钱宏宇
		for i, Npc in x401040_g_Npc_6  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
		end
		
		-- 刷连弩塔
		for i, Npc in x401040_g_Npc_7  do
			local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
			SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 0)
			local szName = GetName(sceneId, nNpcId)
			SetCharacterName(sceneId, nNpcId, Npc.name .. szName )
		end
	
		-- 记录下第一批怪已经刷玩
		LuaFnSetCopySceneData_Param(sceneId, x401040_g_SceneData_1, 1) 
		
	end
	
end

--**********************************
-- 生成岳老三
--**********************************
function x401040_CreateMonster_2(sceneId)
	for i, Npc in x401040_g_Npc_3  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		if GetName(sceneId,nNpcId) == "岳老三"   then
			LuaFnNpcChat(sceneId, nNpcId, 0, "狗官，我岳老二来杀你啦，赶紧把脑袋伸过来，让我哢嚓一声拧断你的脖子。")
		end
	end
	
	x401040_CreateMonster_6(sceneId)
	
	-- 转换 呼延豹 的阵营
	local nNpcNum = GetMonsterCount(sceneId)
	for i=0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nNpcId)  == "呼延豹"  then
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			return
		end
	end
end

--**********************************
-- 岳老三死，创建 叶二娘，云中和
--**********************************
function x401040_CreateMonster_3(sceneId)
	for i, Npc in x401040_g_Npc_4  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
	x401040_CreateMonster_6(sceneId)
end

--**********************************
-- 叶二娘，云中和 两人其中一个死了，刷段延庆
--**********************************
function x401040_CreateMonster_5(sceneId)
	for i, Npc in x401040_g_Npc_5  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
	x401040_CreateMonster_6(sceneId)
end

--**********************************
-- 修理箭塔
--**********************************
function x401040_ChangeNpc(sceneId, szName)
	local nNpcNum = GetMonsterCount(sceneId)
	for i=0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nNpcId)  == szName  then
			SetUnitCampID(sceneId,nNpcId, nNpcId, 109)
			SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			LuaFnNpcChat(sceneId, nNpcId, 0, szName .. "我被修理好了。")
		end
	end
end

--**********************************
-- 生成岳老三之后，伴随刷出的小怪
--**********************************
function x401040_CreateMonster_6(sceneId)
	for i, Npc in x401040_g_Npc_8  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- 和宏宇对话后刷的怪，1
--**********************************
function x401040_CreateMonster_7_1(sceneId)
	for i, Npc in x401040_g_Npc_9  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end

--**********************************
-- 和宏宇对话后，在偶数次刷出的木人傀儡
--**********************************
function x401040_CreateMonster_7_3(sceneId)
	for i, Npc in x401040_g_Npc_9_1  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end


--**********************************
-- 和宏宇对话后，在50-100波刷出的青城派弟子
--**********************************
function x401040_CreateMonster_7_4(sceneId)
	for i, Npc in x401040_g_Npc_9_2  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end

--**********************************
-- 和宏宇对话后刷的怪，2
--**********************************
function x401040_CreateMonster_7_2(sceneId)
	for i, Npc in x401040_g_Npc_10  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		SetPatrolId(sceneId, nNpcId, Npc.pp)
	end
end

--**********************************
-- 和宏宇对话后 刷 姚伯当 司马林 鸠摩智
--**********************************
function x401040_CreateMonster_8(sceneId, nIndex)
	local Npc = x401040_g_Npc_11[nIndex]
	local nNpcId
	if nIndex == 3  then
		nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
	else
		nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
	end
	SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
	SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	SetPatrolId(sceneId, nNpcId, Npc.pp)
end

--**********************************
-- 刷4门神
--**********************************
function x401040_CreateMonster_9(sceneId)
	for i, Npc in x401040_g_Npc_12  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId, nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
		
		SetMonsterGroupID(sceneId, nNpcId, 99)
	end
end

--**********************************
-- 刷 总boss 慕容复
--**********************************
function x401040_CreateMonster_10(sceneId)
	for i, Npc in x401040_g_Npc_13  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- 刷 王语嫣  段誉
--**********************************
function x401040_CreateMonster_11(sceneId)
	for i, Npc in x401040_g_Npc_14  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- 和慕容复开打后，不断刷出的家丁 （已经删除了这些怪，不再刷了）
--**********************************
function x401040_CreateMonster_12(sceneId)
	for i, Npc in x401040_g_Npc_15  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- 慕容复 身后的家丁 （已经删除了这些怪，不再刷了）
--**********************************
function x401040_CreateMonster_13(sceneId)
	for i, Npc in x401040_g_Npc_16  do
		local nNpcId = x401040_CreateNpc(sceneId, Npc.id, Npc.x, Npc.y, Npc.ai, Npc.af, Npc.script)
		SetUnitCampID(sceneId,nNpcId, nNpcId, Npc.camp)
		SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
	end
end

--**********************************
-- 清除场景内的XX怪
--**********************************
function x401040_ClearMonsterByName(sceneId, szName)
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== szName  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
end

--**********************************
-- 王语嫣的点名
--**********************************
function x401040_GiveDirections(sceneId)
	-- 先看王语嫣是不是还活着
	local nWangId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== "王语嫣"  then
			nWangId = nMonsterId
		end
	end
	-- 王语嫣已经不在场景内，无法点名了
	if nWangId == -1  then
		return
	end
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	local nRand = random( 1, nHumanCount ) - 1
	local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,nRand)
	-- 需要检测玩家是不是处于死亡状态，死亡状态不能加 buff
	
	LuaFnSendSpecificImpactToUnit(sceneId, nWangId, nWangId, nHumanId, 10188, 2000 )
	local szHumanName = GetName(sceneId, nHumanId)
	local str1 = "王语嫣把目光投向了#H【" .. szHumanName .. "】"
	
	local str = x401040_GetDirectionsDesc(GetMenPai(sceneId, nHumanId))
	CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", str)
	
	x401040_TipAllHuman(sceneId, str1)
end

--**********************************
-- 通用创建怪物函数
--**********************************
function x401040_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script)
	local PlayerLevel = LuaFnGetCopySceneData_Param(sceneId, x401040_g_SceneData_7)
	local ModifyLevel = 0
	if PlayerLevel >= 10   then
		ModifyLevel = 1
	end
	if PlayerLevel >= 20   then
		ModifyLevel = 2
	end
	if PlayerLevel >= 30   then
		ModifyLevel = 3
	end
	if PlayerLevel >= 40   then
		ModifyLevel = 4
	end
	if PlayerLevel >= 50   then
		ModifyLevel = 5
	end
	if PlayerLevel >= 60   then
		ModifyLevel = 6
	end
	if PlayerLevel >= 70   then
		ModifyLevel = 7
	end
	if PlayerLevel >= 80   then
		ModifyLevel = 8
	end
	if PlayerLevel >= 90   then
		ModifyLevel = 9
	end
	--npc等级扩展至200
	if PlayerLevel >= 100   then         
		ModifyLevel = 30001
	end
	if PlayerLevel >= 110   then         
		ModifyLevel = 30002
	end
	if PlayerLevel >= 120   then         
		ModifyLevel = 30003
	end
	if PlayerLevel >= 130   then         
		ModifyLevel = 30004
	end
	if PlayerLevel >= 140   then         
		ModifyLevel = 30005
	end
	local nNpcId = NpcId + ModifyLevel-1
	local nMonsterId = LuaFnCreateMonster(sceneId, nNpcId, x, y, Ai, AiFile, Script)
	SetLevel(sceneId, nMonsterId, PlayerLevel)
	
	-- 看有没有设置称号，有就加称号
	x401040_SetNpcTitle(sceneId, nMonsterId)
	
	return nMonsterId
end

--**********************************
-- 门派Id到门派名称
--**********************************
function x401040_GetDirectionsDesc(MenpaiId)
	
	local str = ""

	if MenpaiId == 0  then
		str = "表哥，少林弟子的弱点在大椎穴！"
	elseif MenpaiId == 1  then
		str = "表哥，明教弟子的弱点在灵台穴！"
	elseif MenpaiId == 2  then
		str = "表哥，丐帮弟子的弱点在悬枢穴！"
	elseif MenpaiId == 3  then
		str = "表哥，武当弟子的弱点在百会穴！"
	elseif MenpaiId == 4  then
		str = "表哥，峨嵋弟子的弱点在神庭穴！"
	elseif MenpaiId == 5  then
		str = "表哥，星宿弟子的弱点在太阳穴！"
	elseif MenpaiId == 6  then
		str = "表哥，天龙弟子的弱点在膻中穴！"
	elseif MenpaiId == 7  then
		str = "表哥，天山弟子的弱点在鸠尾穴！"
	elseif MenpaiId == 8  then
		str = "表哥，逍遥弟子的弱点在商曲穴！"
	end
	
	return str
end

--**********************************
-- 门派Id到门派名称
--**********************************
function x401040_SetNpcTitle(sceneId, nNpcId)
	
	local szName = GetName(sceneId, nNpcId)
	
	if szName == "呼延庆"   then
		SetCharacterTitle(sceneId, nNpcId, "太湖水军大都督")
	elseif szName == "呼延豹"   then
		SetCharacterTitle(sceneId, nNpcId, "水军先锋")
	elseif szName == "钱宏宇"   then
		SetCharacterTitle(sceneId, nNpcId, "苏州校尉")
	elseif szName == "岳老三"   then
		SetCharacterTitle(sceneId, nNpcId, "“凶神恶煞”")
	elseif szName == "叶二娘"   then
		SetCharacterTitle(sceneId, nNpcId, "“无恶不作”")
	elseif szName == "云中鹤"   then
		SetCharacterTitle(sceneId, nNpcId, "“穷凶极恶”")
	elseif szName == "段延庆"   then
		SetCharacterTitle(sceneId, nNpcId, "“恶贯满盈”")
	elseif szName == "姚伯当"   then
		SetCharacterTitle(sceneId, nNpcId, "秦家寨寨主")
	elseif szName == "司马林"   then
		SetCharacterTitle(sceneId, nNpcId, "青城派掌门")
	elseif szName == "鸠摩智"   then
		SetCharacterTitle(sceneId, nNpcId, "大轮明王")
	elseif szName == "慕容复"   then
		SetCharacterTitle(sceneId, nNpcId, "“斗转星移”")
	
	end
end

