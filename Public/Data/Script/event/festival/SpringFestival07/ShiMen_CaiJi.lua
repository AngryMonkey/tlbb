 --师门采集

--************************************************************************
--MisDescBegin

-- 脚本号
x050059_g_ScriptId = 050059

-- 任务文本描述
x050059_g_MissionName = "门派年货大采购"


--MisDescEnd

x050059_g_Times=8
--活动时间
x050059_Time_Start = 09024 --活动开始2009年1月25日0时
x050059_Time_End   = 09031 --活动开始2009年2月1日24时

x050059_g_StrForePart=4

--兑换时间
x050059_ChangeTime_Start =  09024 --兑换开始2009年1月25日0时
x050059_ChangeTime_End   =  09037  --兑换截至2009年2月7日24时

x050059_TaskMaxCount  =24

x050059_g_strGongGaoInfo = {
  "#{SMCJ_081014_21}#{_INFOUSR%s}#{SMCJ_081014_22}#{_INFOMSG%s}#{JG_8731}#{_INFOUSR%s}#{SMCJ_081014_23}",
  "#{_INFOUSR%s}#{SMCJ_081014_24}#{_INFOUSR%s}#{SMCJ_081014_25}#{_INFOMSG%s}#{SMCJ_081014_26}",
}

x050059_gPetGongGaoInfo = "#{SMCJ_081014_27}#{_INFOUSR%s}#{SMCJ_081014_28}#{_INFOMSG%s}#{JG_8731}"

--寻物表数量
x050059_XunWuCount = 18

x050059_XunWuTbl = {
		30304037,
		30300051, 
		30302021,
		20308154,
		30506031, 
		30301143,
		30304038,
		30505012,
		30303053,
		30102007, 
		30102008, 
		30102010,
		30101073,
		30101083,
		30101082,
		30101071,
		30101052,
		30101062,
	}

x050059_g_ExpTbl ={}
x050059_g_ExpTbl[1] = {[10]=770,[11]=825,[12]=880,[13]=935,[14]=990,
	[15]=1045,[16]=1100,[17]=1155,[18]=1210,[19]=1265,
	[20]=1320,[21]=1375,[22]=1430,[23]=1485,[24]=1540,
	[25]=1595,[26]=1650,[27]=1705,[28]=1760,[29]=1815,
	[30]=1870,[31]=1925,[32]=1980,[33]=2035,[34]=2090,
	[35]=2145,[36]=2200,[37]=2255,[38]=2310,[39]=2365,
	[40]=2420,[41]=2475,[42]=2530,[43]=2585,[44]=2640,
	[45]=2695,[46]=2750,[47]=2805,[48]=2860,[49]=2915,
	[50]=2970,[51]=3025,[52]=3080,[53]=3135,[54]=3190,
	[55]=3245,[56]=3300,[57]=3355,[58]=3410,[59]=3465,
	[60]=3520,[61]=3575,[62]=3630,[63]=3685,[64]=3740,
	[65]=3795,[66]=3850,[67]=3905,[68]=3960,[69]=4015,
	[70]=4070,[71]=4125,[72]=4180,[73]=4235,[74]=4290,
	[75]=4345,[76]=4400,[77]=4455,[78]=4510,[79]=4565,
	[80]=4620,[81]=4675,[82]=4730,[83]=4785,[84]=4840,
	[85]=4895,[86]=4950,[87]=5005,[88]=5060,[89]=5115,
	[90]=5170,[91]=6234,[92]=7448,[93]=8819,[94]=10355,
	[95]=12064,[96]=13952,[97]=16026,[98]=18294,[99]=20761,
	[100]=20628,[101]=20510,[102]=20405,[103]=20312,[104]=20232,
	[105]=20164,[106]=20107,[107]=20060,[108]=20024,[109]=19998,
	[110]=19981,[111]=19973,[112]=19974,[113]=19984,[114]=20001,
	[115]=20027,[116]=20060,[117]=20101,[118]=20148,[119]=20203,
	[120]=20265,
	}

x050059_g_ExpTbl[2] = {[10]=910,[11]=975,[12]=1040,[13]=1105,[14]=1170,
	[15]=1235,[16]=1300,[17]=1365,[18]=1430,[19]=1495,
	[20]=1560,[21]=1625,[22]=1690,[23]=1755,[24]=1820,
	[25]=1885,[26]=1950,[27]=2015,[28]=2080,[29]=2145,
	[30]=2210,[31]=2275,[32]=2340,[33]=2405,[34]=2470,
	[35]=2535,[36]=2600,[37]=2665,[38]=2730,[39]=2795,
	[40]=2860,[41]=2925,[42]=2990,[43]=3055,[44]=3120,
	[45]=3185,[46]=3250,[47]=3315,[48]=3380,[49]=3445,
	[50]=3510,[51]=3575,[52]=3640,[53]=3705,[54]=3770,
	[55]=3835,[56]=3900,[57]=3965,[58]=4030,[59]=4095,
	[60]=4160,[61]=4225,[62]=4290,[63]=4355,[64]=4420,
	[65]=4485,[66]=4550,[67]=4615,[68]=4680,[69]=4745,
	[70]=4810,[71]=4875,[72]=4940,[73]=5005,[74]=5070,
	[75]=5135,[76]=5200,[77]=5265,[78]=5330,[79]=5395,
	[80]=5460,[81]=5525,[82]=5590,[83]=5655,[84]=5720,
	[85]=5785,[86]=5850,[87]=5915,[88]=5980,[89]=6045,
	[90]=6110,[91]=7368,[92]=8802,[93]=10422,[94]=12238,
	[95]=14257,[96]=16488,[97]=18940,[98]=21620,[99]=24536,
	[100]=24379,[101]=24239,[102]=24114,[103]=24005,[104]=23911,
	[105]=23830,[106]=23762,[107]=23708,[108]=23665,[109]=23634,
	[110]=23614,[111]=23605,[112]=23606,[113]=23617,[114]=23638,
	[115]=23668,[116]=23707,[117]=23755,[118]=23812,[119]=23877,
	[120]=23949,
	}
	
x050059_g_ExpTbl[3] ={[10]=1050,[11]=1125,[12]=1200,[13]=1275,[14]=1350,
	[15]=1425,[16]=1500,[17]=1575,[18]=1650,[19]=1725,
	[20]=1800,[21]=1875,[22]=1950,[23]=2025,[24]=2100,
	[25]=2175,[26]=2250,[27]=2325,[28]=2400,[29]=2475,
	[30]=2550,[31]=2625,[32]=2700,[33]=2775,[34]=2850,
	[35]=2925,[36]=3000,[37]=3075,[38]=3150,[39]=3225,
	[40]=3300,[41]=3375,[42]=3450,[43]=3525,[44]=3600,
	[45]=3675,[46]=3750,[47]=3825,[48]=3900,[49]=3975,
	[50]=4050,[51]=4125,[52]=4200,[53]=4275,[54]=4350,
	[55]=4425,[56]=4500,[57]=4575,[58]=4650,[59]=4725,
	[60]=4800,[61]=4875,[62]=4950,[63]=5025,[64]=5100,
	[65]=5175,[66]=5250,[67]=5325,[68]=5400,[69]=5475,
	[70]=5550,[71]=5625,[72]=5700,[73]=5775,[74]=5850,
	[75]=5925,[76]=6000,[77]=6075,[78]=6150,[79]=6225,
	[80]=6300,[81]=6375,[82]=6450,[83]=6525,[84]=6600,
	[85]=6675,[86]=6750,[87]=6825,[88]=6900,[89]=6975,
	[90]=7050,[91]=8501,[92]=10156,[93]=12026,[94]=14121,
	[95]=16451,[96]=19025,[97]=21854,[98]=24946,[99]=28311,
	[100]=28130,[101]=27968,[102]=27824,[103]=27699,[104]=27589,
	[105]=27496,[106]=27418,[107]=27355,[108]=27306,[109]=27270,
	[110]=27247,[111]=27236,[112]=27237,[113]=27250,[114]=27274,
	[115]=27309,[116]=27355,[117]=27410,[118]=27475,[119]=27550,
	[120]=27634,
		}
x050059_g_ExpTbl[4] ={[10]=1190,[11]=1275,[12]=1360,[13]=1445,[14]=1530,
[15]=1615,[16]=1700,[17]=1785,[18]=1870,[19]=1955,
[20]=2040,[21]=2125,[22]=2210,[23]=2295,[24]=2380,
[25]=2465,[26]=2550,[27]=2635,[28]=2720,[29]=2805,
[30]=2890,[31]=2975,[32]=3060,[33]=3145,[34]=3230,
[35]=3315,[36]=3400,[37]=3485,[38]=3570,[39]=3655,
[40]=3740,[41]=3825,[42]=3910,[43]=3995,[44]=4080,
[45]=4165,[46]=4250,[47]=4335,[48]=4420,[49]=4505,
[50]=4590,[51]=4675,[52]=4760,[53]=4845,[54]=4930,
[55]=5015,[56]=5100,[57]=5185,[58]=5270,[59]=5355,
[60]=5440,[61]=5525,[62]=5610,[63]=5695,[64]=5780,
[65]=5865,[66]=5950,[67]=6035,[68]=6120,[69]=6205,
[70]=6290,[71]=6375,[72]=6460,[73]=6545,[74]=6630,
[75]=6715,[76]=6800,[77]=6885,[78]=6970,[79]=7055,
[80]=7140,[81]=7225,[82]=7310,[83]=7395,[84]=7480,
[85]=7565,[86]=7650,[87]=7735,[88]=7820,[89]=7905,
[90]=7990,[91]=9634,[92]=11510,[93]=13629,[94]=16004,
[95]=18644,[96]=21562,[97]=24768,[98]=28272,[99]=32086,
[100]=31880,[101]=31697,[102]=31534,[103]=31392,[104]=31268,
[105]=31162,[106]=31074,[107]=31002,[108]=30946,[109]=30906,
[110]=30880,[111]=30868,[112]=30869,[113]=30884,[114]=30911,
[115]=30950,[116]=31002,[117]=31065,[118]=31139,[119]=31223,
[120]=31319,
	}
x050059_g_ExpTbl[5] ={[10]=1330,[11]=1425,[12]=1520,[13]=1615,[14]=1710,
[15]=1805,[16]=1900,[17]=1995,[18]=2090,[19]=2185,
[20]=2280,[21]=2375,[22]=2470,[23]=2565,[24]=2660,
[25]=2755,[26]=2850,[27]=2945,[28]=3040,[29]=3135,
[30]=3230,[31]=3325,[32]=3420,[33]=3515,[34]=3610,
[35]=3705,[36]=3800,[37]=3895,[38]=3990,[39]=4085,
[40]=4180,[41]=4275,[42]=4370,[43]=4465,[44]=4560,
[45]=4655,[46]=4750,[47]=4845,[48]=4940,[49]=5035,
[50]=5130,[51]=5225,[52]=5320,[53]=5415,[54]=5510,
[55]=5605,[56]=5700,[57]=5795,[58]=5890,[59]=5985,
[60]=6080,[61]=6175,[62]=6270,[63]=6365,[64]=6460,
[65]=6555,[66]=6650,[67]=6745,[68]=6840,[69]=6935,
[70]=7030,[71]=7125,[72]=7220,[73]=7315,[74]=7410,
[75]=7505,[76]=7600,[77]=7695,[78]=7790,[79]=7885,
[80]=7980,[81]=8075,[82]=8170,[83]=8265,[84]=8360,
[85]=8455,[86]=8550,[87]=8645,[88]=8740,[89]=8835,
[90]=8930,[91]=10768,[92]=12864,[93]=15233,[94]=17886,
[95]=20837,[96]=24098,[97]=27681,[98]=31598,[99]=35861,
[100]=35631,[101]=35426,[102]=35244,[103]=35085,[104]=34947,
[105]=34828,[106]=34730,[107]=34650,[108]=34587,[109]=34542,
[110]=34512,[111]=34499,[112]=34501,[113]=34517,[114]=34548,
[115]=34592,[116]=34649,[117]=34719,[118]=34802,[119]=34897,
[120]=35003,
	}

x050059_g_ExpTbl[6] ={[10]=1470,[11]=1575,[12]=1680,[13]=1785,[14]=1890,
[15]=1995,[16]=2100,[17]=2205,[18]=2310,[19]=2415,
[20]=2520,[21]=2625,[22]=2730,[23]=2835,[24]=2940,
[25]=3045,[26]=3150,[27]=3255,[28]=3360,[29]=3465,
[30]=3570,[31]=3675,[32]=3780,[33]=3885,[34]=3990,
[35]=4095,[36]=4200,[37]=4305,[38]=4410,[39]=4515,
[40]=4620,[41]=4725,[42]=4830,[43]=4935,[44]=5040,
[45]=5145,[46]=5250,[47]=5355,[48]=5460,[49]=5565,
[50]=5670,[51]=5775,[52]=5880,[53]=5985,[54]=6090,
[55]=6195,[56]=6300,[57]=6405,[58]=6510,[59]=6615,
[60]=6720,[61]=6825,[62]=6930,[63]=7035,[64]=7140,
[65]=7245,[66]=7350,[67]=7455,[68]=7560,[69]=7665,
[70]=7770,[71]=7875,[72]=7980,[73]=8085,[74]=8190,
[75]=8295,[76]=8400,[77]=8505,[78]=8610,[79]=8715,
[80]=8820,[81]=8925,[82]=9030,[83]=9135,[84]=9240,
[85]=9345,[86]=9450,[87]=9555,[88]=9660,[89]=9765,
[90]=9870,[91]=11901,[92]=14219,[93]=16836,[94]=19769,
[95]=23031,[96]=26635,[97]=30595,[98]=34924,[99]=39636,
[100]=39382,[101]=39155,[102]=38954,[103]=38778,[104]=38625,
[105]=38495,[106]=38386,[107]=38297,[108]=38228,[109]=38178,
[110]=38145,[111]=38130,[112]=38132,[113]=38150,[114]=38184,
[115]=38233,[116]=38296,[117]=38374,[118]=38465,[119]=38570,
[120]=38688,
	}

x050059_g_ExpTbl[7] ={[10]=1610,[11]=1725,[12]=1840,[13]=1955,[14]=2070,
[15]=2185,[16]=2300,[17]=2415,[18]=2530,[19]=2645,
[20]=2760,[21]=2875,[22]=2990,[23]=3105,[24]=3220,
[25]=3335,[26]=3450,[27]=3565,[28]=3680,[29]=3795,
[30]=3910,[31]=4025,[32]=4140,[33]=4255,[34]=4370,
[35]=4485,[36]=4600,[37]=4715,[38]=4830,[39]=4945,
[40]=5060,[41]=5175,[42]=5290,[43]=5405,[44]=5520,
[45]=5635,[46]=5750,[47]=5865,[48]=5980,[49]=6095,
[50]=6210,[51]=6325,[52]=6440,[53]=6555,[54]=6670,
[55]=6785,[56]=6900,[57]=7015,[58]=7130,[59]=7245,
[60]=7360,[61]=7475,[62]=7590,[63]=7705,[64]=7820,
[65]=7935,[66]=8050,[67]=8165,[68]=8280,[69]=8395,
[70]=8510,[71]=8625,[72]=8740,[73]=8855,[74]=8970,
[75]=9085,[76]=9200,[77]=9315,[78]=9430,[79]=9545,
[80]=9660,[81]=9775,[82]=9890,[83]=10005,[84]=10120,
[85]=10235,[86]=10350,[87]=10465,[88]=10580,[89]=10695,
[90]=10810,[91]=13035,[92]=15573,[93]=18440,[94]=21652,
[95]=25224,[96]=29172,[97]=33509,[98]=38251,[99]=43410,
[100]=43132,[101]=42884,[102]=42664,[103]=42471,[104]=42304,
[105]=42161,[106]=42041,[107]=41944,[108]=41869,[109]=41813,
[110]=41778,[111]=41762,[112]=41764,[113]=41784,[114]=41821,
[115]=41874,[116]=41944,[117]=42029,[118]=42129,[119]=42243,
[120]=42372,
	}
	
x050059_g_ExpTbl[8]={[10]=1750,[11]=1875,[12]=2000,[13]=2125,[14]=2250,
[15]=2375,[16]=2500,[17]=2625,[18]=2750,[19]=2875,
[20]=3000,[21]=3125,[22]=3250,[23]=3375,[24]=3500,
[25]=3625,[26]=3750,[27]=3875,[28]=4000,[29]=4125,
[30]=4250,[31]=4375,[32]=4500,[33]=4625,[34]=4750,
[35]=4875,[36]=5000,[37]=5125,[38]=5250,[39]=5375,
[40]=5500,[41]=5625,[42]=5750,[43]=5875,[44]=6000,
[45]=6125,[46]=6250,[47]=6375,[48]=6500,[49]=6625,
[50]=6750,[51]=6875,[52]=7000,[53]=7125,[54]=7250,
[55]=7375,[56]=7500,[57]=7625,[58]=7750,[59]=7875,
[60]=8000,[61]=8125,[62]=8250,[63]=8375,[64]=8500,
[65]=8625,[66]=8750,[67]=8875,[68]=9000,[69]=9125,
[70]=9250,[71]=9375,[72]=9500,[73]=9625,[74]=9750,
[75]=9875,[76]=10000,[77]=10125,[78]=10250,[79]=10375,
[80]=10500,[81]=10625,[82]=10750,[83]=10875,[84]=11000,
[85]=11125,[86]=11250,[87]=11375,[88]=11500,[89]=11625,
[90]=11750,[91]=14168,[92]=16927,[93]=20043,[94]=23535,
[95]=27418,[96]=31708,[97]=36423,[98]=41577,[99]=47185,
[100]=46883,[101]=46613,[102]=46374,[103]=46164,[104]=45982,
[105]=45827,[106]=45697,[107]=45592,[108]=45509,[109]=45449,
[110]=45411,[111]=45393,[112]=45396,[113]=45417,[114]=45457,
[115]=45515,[116]=45591,[117]=45683,[118]=45792,[119]=45917,
[120]=46057,
	}
	
--春联表
x050059_g_ChunLianTbl = {30505241,
									30505242,
									30505243,
									30505244,
									30505245,
									30505246,
									30505247,
									30505248,
								}
								
--烟花表
x050059_g_YanHuaTbl = {
		30509042,
		30509043,
		30509044,
		30509045,
		30509046,
	}
--宠物列表
x050059_g_PetTbl = {{id = 30309649,Level = 5},
		{id = 30309650,Level = 45},
		{id = 30309651,Level = 55},
		{id = 30309652,Level = 65},
		{id = 30309653,Level = 75},
		{id = 30309654,Level = 85},
	}
-- 春联的获得概率表
x050059_g_RateTbl = {
		{MinLevel = 10,MaxLevel = 39,rate = 0},
		{MinLevel = 40,MaxLevel = 49,rate = 4},
		{MinLevel = 50,MaxLevel = 59,rate = 18},
		{MinLevel = 60,MaxLevel = 69,rate = 44},
		{MinLevel = 70,MaxLevel = 79,rate = 44},
		{MinLevel = 80,MaxLevel = 89,rate = 89},
		{MinLevel = 90,MaxLevel = 99,rate = 89},
		{MinLevel = 100,MaxLevel = 109,rate = 89},
		{MinLevel = 110,MaxLevel = 119,rate = 89},
	}
				
--************************************************************************

function x050059_GetStrIndexByStrValue(stringV)
	for i, v in x050059_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("必须将%s注册到StrList中", stringV)
	----PrintStr(strText)
	return 0;
end
				
--**********************************
--检测兑换活动时间
--**********************************
function x050059_CheckTime()
	local today = GetDayTime()						--当前时间
	
	if today < x050059_ChangeTime_Start or today > x050059_ChangeTime_End then
		return 0
	end
	
	return 1
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--检测采集活动时间
--**********************************
function x050059_CheckCaiJiTime()
	local today = GetDayTime()						--当前时间

	if today < x050059_Time_Start or today > x050059_Time_End then
		return 0
	end

	return 1
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--根据玩家等级获得珍兽序号
--**********************************
function x050059_GetPetIndexByLevel(sceneId, selfId)
	local nLevel = GetLevel(sceneId, selfId)
	local iIndex =1
	if (nLevel<45) then
		iIndex =1
	elseif nLevel<55 then
		iIndex = 2
	elseif nLevel<65 then
		iIndex = 3
	elseif nLevel <75 then
		iIndex = 4
	elseif nLevel<85 then
		iIndex =5
	else
		iIndex = 6
	end
	
	return iIndex
	
end

--**********************************
--列举事件
--********************************** 
function x050059_OnEnumerate( sceneId, selfId, targetId,ScriptID )
	if (x050059_CheckTime() == 1) then
		--师门采集
		AddNumText(sceneId,ScriptID,"#{SMCJ_081014_01}",4,1);
	end
end

function x050059_GetGift(sceneId, selfId, targetId,MenPai)
	
	--检测是否活动时间
	if (x050059_CheckTime() < 1) then
		return
	end
	
	if (MenPai~=GetMenPai(sceneId, selfId)) then
		x050059_MsgBox(sceneId, selfId,"#{SMCJ_081014_17}")
		x050059_CloseWindow(sceneId, selfId,targetId)
		return
	end
	--检测春联是否一组
	for i, item in x050059_g_ChunLianTbl do
		if (LuaFnGetAvailableItemCount(sceneId, selfId, item) <1) then
			x050059_MsgBox(sceneId, selfId,"#{SMCJ_081014_18}")
			x050059_CloseWindow(sceneId, selfId,targetId)
			return
		end
	end
	-- 检查背包空间
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x050059_MsgBox(sceneId, selfId,"#{LLFB_80821_6}")
			x050059_CloseWindow(sceneId, selfId,targetId)
			return
	end 
		
		for i, item in x050059_g_ChunLianTbl do
			if 1 ~= LuaFnDelAvailableItem(sceneId, selfId, item, 1) then
				return 0
			end
		end
		local iIndex = x050059_GetPetIndexByLevel(sceneId, selfId)
		--给玩家东西，完成
		BeginAddItem( sceneId )
		local nIndex = AddItem(sceneId,x050059_g_PetTbl[iIndex].id, 1 )
		local ret = EndAddItem(sceneId, selfId )
		if ret <= 0 then 
			return
		end
		AddItemListToHuman(sceneId,selfId)
		x050059_MsgBox(sceneId, selfId, "#{SMCJ_081014_19}")
		local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
		x050059_ShowPetSystemNotice( sceneId, selfId, szItemTransfer )
		x050059_CloseWindow(sceneId, selfId,targetId)
		--获得各个级别珍兽的玩家
		AuditShiMenCaiJiPet(sceneId, selfId,x050059_g_PetTbl[iIndex].Level)
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--任务入口函数
--**********************************
function x050059_OnDefaultEvent( sceneId, selfId, targetId,MenPai,MissionID,ScriptID  )	--点击该任务后执行此脚本
	--检测门派信息是否合法
		
		local NumText = GetNumText()
		if (NumText == 2) then
			--接受任务
			x050059_AcceptTask(sceneId, selfId,targetId,MenPai,MissionID,ScriptID)
		elseif (NumText == 3) then
			--兑奖
			x050059_GetGift(sceneId, selfId,targetId,MenPai)
		elseif (NumText == 4) then
			--帮助
			BeginEvent(sceneId)
				AddText(sceneId,"#{SMCJ_081014_20}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else
			--师门采集活动一级菜单
			BeginEvent(sceneId)
			if (x050059_CheckCaiJiTime() >0) then
				AddNumText(sceneId,ScriptID,"#{SMCJ_081014_02}",4,2);
			end
				AddNumText(sceneId,ScriptID,"#{SMCJ_081014_03}",6,3);
				AddNumText(sceneId,ScriptID,"#{SMCJ_081014_04}",11,4);
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--关闭窗口
--**********************************
function x050059_CloseWindow(sceneId,selfId, targetId)
	BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
-- 获得今天的任务数量 -1表示今天的任务已满额
--**********************************
function x050059_GetTaskCount(sceneId,selfId)
	--判断今天的任务量是否超出
		local iTaskCount =0
		local td = GetDayTime()
		local LastGetTaskTime = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_DAY)
		--当前日期已经过期
		if td < LastGetTaskTime then
			iTaskCount = -1
		--当前日期，检测当天的任务次数
		else
			local TaskCount = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT)
			--当天的任务次数大于24，还有可能是交任务，所以24在次函数中认为是合法次数
			if (TaskCount>x050059_TaskMaxCount) then
				iTaskCount = -1
			else
				iTaskCount = TaskCount
			end
		end
		return iTaskCount
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050059_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x050059_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 满足获取任务的条件，接受任务
--**********************************
function x050059_AcceptTask(sceneId, selfId,targetId,MenPai,MissionID,ScriptID)

	--检测是否活动时间
	if (x050059_CheckCaiJiTime() <=0) then
		return
	end

	if (MenPai~=GetMenPai(sceneId, selfId)) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SMCJ_081014_05}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		x050059_CloseWindow(sceneId, selfId,targetId)
		return
	end
	local iTaskCount = x050059_GetTaskCount(sceneId,selfId)
	--今天的任务次数已满，醒目提示，退出
	if (-1 == iTaskCount) then
		x050059_MsgBox(sceneId, selfId, "#{SMCJ_081014_06}")
		x050059_CloseWindow(sceneId, selfId,targetId)
		return 
	end
	
	--24次的时候只能交任务，不能接任务
	if (x050059_TaskMaxCount == iTaskCount and IsHaveMission(sceneId,selfId,MissionID) == 0) then
		local td = GetDayTime()
		local LastGetTaskTime = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_DAY)
		if (td<=LastGetTaskTime) then
			x050059_MsgBox(sceneId, selfId, "#{SMCJ_081014_06}")
			x050059_CloseWindow(sceneId, selfId,targetId)
			return
		end
	end
	--身上已经有一个任务
	if IsHaveMission(sceneId,selfId,MissionID) > 0 then
		local bDone = x050059_CheckSubmit( sceneId, selfId,MissionID)
		local str = "#{SMCJ_081014_09}"
		if (bDone ==0) then
			str = "#{SMCJ_081014_11}"
		end
		BeginEvent(sceneId)
				AddText(sceneId, x050059_g_MissionName)
				AddText(sceneId, str)
		EndEvent( )
		DispatchMissionDemandInfo(sceneId, selfId, targetId, ScriptID, MissionID, bDone)
	elseif (x050059_CheckAccept(sceneId, selfId)>0) then
		local td = GetDayTime()
		local LastGetTaskTime = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_DAY)

		--当前日期已经过期
		if td > LastGetTaskTime then
			SetMissionData(sceneId, selfId, MD_SHIMENCAIJI_DAY, td)
			SetMissionData(sceneId, selfId, MD_SHIMENCAIJI_COUNT, 0)
			SetMissionData(sceneId, selfId, MD_SHIMENCAIJI_ABANDON,0)
		end
		--当天的放弃次数
		local iAbandonCount = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_ABANDON)
		if (iAbandonCount>=3) then
			x050059_MsgBox( sceneId, selfId, "#{SMCJ_081103_01}")
			x050059_CloseWindow(sceneId, selfId,targetId)
			return
		end
		BeginEvent(sceneId)
			AddText(sceneId,x050059_g_MissionName)
			x050059_Accept(sceneId, selfId,MissionID,ScriptID)
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
		
	else 
		x050059_MsgBox(sceneId, selfId, "#{SMCJ_081014_06}")
		x050059_CloseWindow(sceneId, selfId,targetId)
	end 
end 

--**********************************
--根据玩家等级得出任务的等级阶段(1~5)
--**********************************
function x050059_Accept(sceneId, selfId,MissionID,ScriptID)
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, MissionID, ScriptID, 0, 0, 1 )
	if bAdd < 1 then
		return
	end	
	local iRandom =random(1,getn(x050059_XunWuTbl))
	local nitemId = x050059_XunWuTbl[iRandom]
	local strItemName = "#{_ITEM"..nitemId.."}"
	
	Msg2Player(sceneId, selfId, "#Y接受任务：门派年货大采购", MSG2PLAYER_PARA )
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,MissionID)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	--在FormatList中的序号
	SetMissionByIndex(sceneId, selfId, misIndex, x050059_g_StrForePart, iRandom-1)--formet字符串索引
	--在strList中的序号
	--SetMissionByIndex(sceneId, selfId, misIndex, x050059_g_StrForePart+1, iRandom-1)
	SetMissionByIndex(sceneId, selfId, misIndex, x050059_g_StrForePart+2, nitemId)
		
	--第几轮任务
	local iDayCount = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT)
	
	local strMissionTarget = format("#{SMCJ_081014_07}%s#{SMCJ_081014_08}", strItemName)
	local iTimes = mod(iDayCount,x050059_g_Times)+1
	AddText(sceneId,"本次为今日第"..(floor(iDayCount/x050059_g_Times)+1).."轮第"..iTimes.."次任务")
	AddText(sceneId, strMissionTarget)
	
	--环数
	SetMissionByIndex(sceneId, selfId, misIndex, 1, iTimes)
	SetMissionData(sceneId, selfId,MD_SHIMENCAIJI_COUNT,iDayCount+1)
	
	--检测玩家身上的道具是否已经满足完成条件
	local bHaveItem = HaveItem(sceneId, selfId, nitemId)
	if bHaveItem == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1
		ResetMissionEvent(sceneId, selfId, x050059_g_StrForePart, 2)
	end	
	--统计参加活动的人
	AuditShiMenCaiJi(sceneId, selfId,1)
end

function x050059_CheckSubmit(sceneId, selfId,MissionID)
	--身上没有任务
	if IsHaveMission( sceneId, selfId, MissionID ) <= 0 then
		return 0
	end
	--在此判断提交条件是否符合，并给予相应奖励
	local misIndex = GetMissionIndexByID(sceneId,selfId,MissionID)
	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x050059_g_StrForePart+2)
	if GetItemCount(sceneId,selfId,demandItemId) <= 0 then --没有索要的物品
		return 0
	end
	return 1
end

function x050059_CheckAccept(sceneId, selfId)
	local nLevel = GetLevel(sceneId, selfId)
	--玩家等级>=10级
	if nLevel < 10 then
		return 0
	else
		local iCount = x050059_GetTaskCount(sceneId,selfId)
		if (iCount == -1) then
			return 0
		end
	end
	
	return 1
end 

--**********************************
--道具改变
--**********************************
function x050059_OnItemChanged( sceneId, selfId, itemdataId,MissionID)
	local misIndex = GetMissionIndexByID(sceneId, selfId, MissionID)
	--获得该物品的名称
	local _, strItemName, _ = x050059_GetItemDetailInfo(itemdataId)
	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x050059_g_StrForePart+2)
	local _, strDemandItemName, _ = x050059_GetItemDetailInfo(demandItemId)
	if strItemName == strDemandItemName then
		BeginEvent(sceneId)
			strText = format("已得到%s", strItemName)
			AddText(sceneId,strText)
		EndEvent(sceneId)

		DispatchMissionTips(sceneId,selfId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		ResetMissionEvent(sceneId, selfId, MissionID, 2)
	end	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体item的详细信息
function x050059_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = "物品不存在!!"
		PrintStr(strText)
	end
	return itemId, itemName, itemDesc
end	

--**********************************
--继续
--**********************************
function x050059_OnContinue( sceneId, selfId, targetId,MissionID,ScriptID)
	if x050059_CheckAccept(sceneId,selfId) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId,x050059_g_MissionName)
			AddText(sceneId,"#{SMCJ_081014_10}")
		EndEvent( )
		DispatchMissionContinueInfo(sceneId, selfId, targetId, ScriptID, MissionID)
	end	
end

--**********************************
--提交
--**********************************
function x050059_OnSubmit( sceneId, selfId, targetId, selectRadioId,MissionID )
	local misIndex = GetMissionIndexByID(sceneId, selfId, MissionID)
	
	if x050059_CheckSubmit( sceneId, selfId,MissionID)>=1 then
		local iDayCount = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT)
		local iDayHuan = mod(iDayCount,x050059_g_Times)
		--第8环要奖励物品，检测是否有背包空间
		if (iDayHuan==0) then
			-- 检查背包空间
			if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
					x050059_MsgBox( sceneId, selfId, "#{LLFB_80821_6}")
					return
			end 
		end
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x050059_g_StrForePart+2)
		if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 1 then
			local ret = LuaFnDelAvailableItem(sceneId, selfId, demandItemId, 1)
			if ret <= 0 then
				x050059_MsgBox( sceneId, selfId, "#{SMCJ_081027_01}")
				return
			end
		else
			x050059_MsgBox( sceneId, selfId, "#{SMCJ_081027_01}")
			return	
		end
		
		DelMission( sceneId, selfId, MissionID )
		--调用通用提交任务接口接口	
		x050059_OnSubmit_Necessary(sceneId, selfId, targetId)	
	end
end

--**********************************
--提交
--**********************************
function x050059_OnSubmit_Necessary( sceneId, selfId, targetId)
	local Level =GetLevel(sceneId, selfId)
	local iDayCount = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT)
	
	--设置当天的任务总数(接受任务的时候已经记录了次数，所以注释了此行
	--SetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT,iDayCount)
	local iDayHuan = mod(iDayCount,x050059_g_Times)
	if (iDayHuan==0) then
		iDayHuan=x050059_g_Times
	end
	--增加经验值
	AddExp( sceneId,selfId,x050059_g_ExpTbl[iDayHuan][Level])
	
	if (iDayHuan ==x050059_g_Times) then
		local giftID = x050059_GiveChunLian(sceneId, selfId)
		--送春联成功或者烟花
		if (0 == giftID) then
			return
		else
			local str 
			str = "#{SMCJ_081014_12}#{_ITEM"..giftID.."}"
			x050059_MsgBox(sceneId, selfId, str)
		end
	end
	
	if (iDayCount == x050059_TaskMaxCount) then
		--完成三环的玩家
		AuditShiMenCaiJi(sceneId, selfId,2)
	end 

	x050059_CloseWindow(sceneId, selfId,targetId)
	
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--送出春联
--**********************************
function x050059_GiveChunLian(sceneId, selfId)
	-- 检查背包空间
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{LLFB_80821_6}" )
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return 0
		else
			local Level =GetLevel(sceneId, selfId)
			local iIndex = 1
			--查询玩家等级对应的概率表
			for i, v in x050059_g_RateTbl do
				if (Level>=v.MinLevel and Level<=v.MaxLevel) then
					iIndex = i
					break
				end
			end
			local iRandom1 = random(1,1000)
			local giftID = 0
			--获得春联
			if (iRandom1<=x050059_g_RateTbl[iIndex].rate) then
				--获得春联
				local iRandom2 = random(1,8)
				--给玩家东西，完成
				BeginAddItem( sceneId )
				local nIndex = AddItem( sceneId, x050059_g_ChunLianTbl[iRandom2], 1 )
				local ret = EndAddItem( sceneId, selfId )
				if ret <= 0 then 
					return
				end
				AddItemListToHuman(sceneId,selfId)
				giftID = x050059_g_ChunLianTbl[iRandom2]
				local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
				x050059_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
			else
				--获得春节烟花
				local iRandom2 = random(1,5)
				--给玩家东西，完成
				BeginAddItem( sceneId )
				local nIndex = AddItem( sceneId, x050059_g_YanHuaTbl[iRandom2], 1 )
				local ret = EndAddItem( sceneId, selfId )
				if ret <= 0 then 
					return
				end
				AddItemListToHuman(sceneId,selfId)
				giftID = x050059_g_YanHuaTbl[iRandom2]
				
			end
			return giftID
		end
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--送出宠物蛋的公告
--**********************************
function x050059_ShowPetSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local str
	str = format( x050059_gPetGongGaoInfo, PlayerName, strItemInfo)
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--送出春联的公告
--**********************************
function x050059_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 2 )
	local str
	if nMsgIndex == 1 then
		str = format( x050059_g_strGongGaoInfo[1], PlayerName, strItemInfo, PlayerName )
	else
		str = format( x050059_g_strGongGaoInfo[2], PlayerName,PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end

--**********************************
--放弃
--**********************************
function x050059_OnAbandon( sceneId, selfId,MissionID)
	----PrintStr("OnAbandon...")
	if IsHaveMission(sceneId, selfId, MissionID) > 0 then	
			--删除玩家任务列表中对应的任务
	  DelMission( sceneId, selfId, MissionID )
		local td = GetDayTime()
		local LastGetTaskTime = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_DAY)
		--当前日期是否大于已经记录的日期
		if td > LastGetTaskTime then
			SetMissionData(sceneId, selfId, MD_SHIMENCAIJI_DAY, td)
			SetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT,0)	--当前环数清0
			SetMissionData(sceneId, selfId, MD_SHIMENCAIJI_ABANDON,1)
			x050059_MsgBox( sceneId, selfId, "#{SMCJ_081014_16}")
			return
		--当前日期，检测当天的任务次数
		else
			local TaskCount = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT)
	  	local iDayHuan = floor((TaskCount-1)/x050059_g_Times)
	  	SetMissionData(sceneId,selfId,MD_SHIMENCAIJI_COUNT,iDayHuan*x050059_g_Times)	--当前环数清0
	  	local iAbandonCount = GetMissionData(sceneId,selfId,MD_SHIMENCAIJI_ABANDON)
	  	SetMissionData(sceneId,selfId,MD_SHIMENCAIJI_ABANDON,iAbandonCount+1)
			x050059_MsgBox( sceneId, selfId, "#{SMCJ_081014_16}")
		end
	end	
end

