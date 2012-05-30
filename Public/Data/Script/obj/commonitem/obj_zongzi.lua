--道具：美味的粽子<ID:30505196>
--脚本号 335139

x335139_g_scriptId = 335139
x335139_g_ImpactId = 2965

--奖励经验表
x335139_g_Exp = {
	[10]=1516,[11]=1596,[12]=1672,[13]=1749,[14]=1829,
	[15]=1906,[16]=1983,[17]=2063,[18]=2140,[19]=2220,
	[20]=3002,[21]=3124,[22]=3250,[23]=3376,[24]=3502,
	[25]=3625,[26]=3751,[27]=3877,[28]=4003,[29]=4125,
	[30]=5137,[31]=5289,[32]=5441,[33]=5589,[34]=5742,
	[35]=5894,[36]=6046,[37]=6194,[38]=6346,[39]=6498,
	[40]=9700,[41]=9922,[42]=10139,[43]=10361,[44]=10583,
	[45]=10801,[46]=11022,[47]=11244,[48]=11462,[49]=11684,
	[50]=11905,[51]=12123,[52]=12345,[53]=12567,[54]=12789,
	[55]=13006,[56]=13228,[57]=13450,[58]=13667,[59]=13889,
	[60]=14111,[61]=14328,[62]=14550,[63]=14772,[64]=14990,
	[65]=15211,[66]=15433,[67]=15651,[68]=15873,[69]=16095,
	[70]=16316,[71]=16534,[72]=16756,[73]=16978,[74]=17195,
	[75]=17417,[76]=17639,[77]=17856,[78]=18078,[79]=18300,
	[80]=18517,[81]=18739,[82]=18961,[83]=19183,[84]=19401,
	[85]=19622,[86]=19844,[87]=20062,[88]=20284,[89]=20505,
	[90]=20723,[91]=20945,[92]=21167,[93]=21384,[94]=21606,
	[95]=21828,[96]=22045,[97]=22267,[98]=22489,[99]=22711,
	[100]=22928,[101]=23146,[102]=23368,[103]=23590,[104]=23807,
	[105]=24029,[106]=24251,[107]=24468,[108]=24690,[109]=24912,
	[110]=25129,[111]=25351,[112]=25573,[113]=25791,[114]=26013,
	[115]=26234,[116]=26452,[117]=26674,[118]=26896,[119]=27113,
	[120]=27335,[121]=27557,[122]=27774,[123]=27996,[124]=28218,
	[125]=28435,[126]=28657,[127]=28879,[128]=29101,[129]=29319,
	[130]=29540,[131]=29762,[132]=29980,[133]=30202,[134]=30423,
	[135]=30641,[136]=30863,[137]=31085,[138]=31302,[139]=31524,
	[140]=31746,[141]=31963,[142]=32185,[143]=32407,[144]=32625,
	[145]=32846,[146]=33068,[147]=33286,[148]=33508,[149]=33729,
	[150]=33947
	}

x335139_g_RadomList = {
	{rad = 50,   id = -1,			num = -1},--1经验-
	{rad = 80,   id = 30505195,		num = 1},--美味的粽子  
	{rad = 95,   id = 30505195,		num = 2},--
	{rad = 100,   id = 30505195,	num = 3}--
}
	
--**********************************
--事件交互入口
--**********************************
function x335139_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335139_IsSkillLikeScript( sceneId, selfId )
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335139_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335139_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		local strNotice = "#{ZXP_90511_2}"
		x335139_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end

			
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335139_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		local guid = LuaFnObjId2Guid(sceneId, selfId);
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_USE_MWZONGZI, guid)	
		return 1;
	end

	return 0;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x335139_OnActivateOnce( sceneId, selfId )
		
	--随机放出奖励
	local rdRlt = random(x335139_g_RadomList[getn(x335139_g_RadomList)].rad)
	local itemId = -1
	local itemIdx = -1
	local itemNum = -1
	local guid = LuaFnObjId2Guid(sceneId, selfId);
	for i = 1, getn(x335139_g_RadomList) do 
		if rdRlt <= x335139_g_RadomList[i].rad then
		  itemId = x335139_g_RadomList[i].id
		  itemNum = x335139_g_RadomList[i].num
		  itemIdx = i
		  break
		end
	end	
	if itemId == -1 then
		--放出经验奖励
		local nLevel = GetLevel(sceneId,selfId)
		local nExp = x335139_g_Exp[nLevel]
		AddExp(sceneId,selfId,nExp)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x335139_g_ImpactId, 0)
		local log = format("exp:%d", nExp)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_MWZONGZI_PRIZE, guid, log);
		--x808125_MsgBox( sceneId, selfId, targetId, "#{ZXP_90511_6}" )
		return 1
	end

	BeginAddItem(sceneId)
		AddItem( sceneId,itemId,itemNum )
	ret = EndAddItem(sceneId,selfId)
	if ret <= 0 then
		local strNotice = "#{ZXP_90511_2}"
		x335139_ShowNotice( sceneId, selfId, strNotice)	
		return 1
	end
	-- 强制绑定	
	--LuaFnItemBind( sceneId, selfId, nBagIndex )
	
	AddItemListToHuman(sceneId,selfId)
	local msg = ""
	if itemNum == 1 then
		msg = "#{ZXP_90511_3}"
	elseif itemNum == 2 then
		msg = "#{ZXP_90511_4}"
	elseif itemNum == 3 then
		msg = "#{ZXP_90511_5}"
	end
	x335139_ShowNotice( sceneId, selfId, msg)
	
	
	local log = format("%d,%d", itemId,itemNum)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_MWZONGZI_PRIZE, guid, log);
	
	--特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x335139_g_ImpactId, 0)	
 
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335139_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x335139_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
