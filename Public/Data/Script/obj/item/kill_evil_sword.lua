--------------------------------------------
--斩妖剑道具脚本
--Created By 左春伟
--------------------------------------------

--脚本ID
x335808_g_scriptId = 335808

--年兽ID
x335808_g_monster_info = 
{
	{ID = 12200, Level = 10, blood = 63360 },
	{ID = 12201, Level = 20, blood = 577920 },
	{ID = 12202, Level = 30, blood = 983040 }, 
	{ID = 12203, Level = 40, blood = 1468800 }, 
	{ID = 12204, Level = 50, blood = 2035200},
	{ID = 12205, Level = 60, blood = 2682240 }, 
	{ID = 12206, Level = 70, blood = 3409920},
	{ID = 12207, Level = 80, blood = 4218240}, 
	{ID = 12208, Level = 90, blood = 5107200}, 
	{ID = 12209, Level = 100, blood = 6076800}, 
	{ID = 12210, Level = 110, blood = 7127040}, 
	{ID = 12211, Level = 120, blood = 7772160}, 	
};
--经验奖励值
x335808_g_prize_exp =
{
	[10] = 788,[11] = 851,[12] = 907,[13] = 962,[14] = 1017,[15] = 1072,[16] = 1135,[17] = 1190,[18] = 1246,[19] = 1301,
	[20] = 1585,[21] = 1656,[22] = 1719,[23] = 1782,[24] = 1853,[25] = 1916,[26] = 1987,[27] = 2050,[28] = 2113,[29] = 2184,
	[30] = 2571,[31] = 2650,[32] = 2721,[33] = 2799,[34] = 2870,[35] = 2949,[36] = 3028,[37] = 3099,[38] = 3178,[39] = 3249,
	[40] = 3746,[41] = 3833,[42] = 3912,[43] = 3998,[44] = 4085,[45] = 4172,[46] = 4259,[47] = 4337,[48] = 4424,[49] = 4511,
	[50] = 5110,[51] = 5205,[52] = 5300,[53] = 5394,[54] = 5489,[55] = 5584,[56] = 5678,[57] = 5773,[58] = 5868,[59] = 5962,
	[60] = 6656,[61] = 6767,[62] = 6869,[63] = 6972,[64] = 7074,[65] = 7177,[66] = 7287,[67] = 7390,[68] = 7492,[69] = 7595,
	[70] = 8399,[71] = 8518,[72] = 8628,[73] = 8739,[74] = 8857,[75] = 8967,[76] = 9086,[77] = 9196,[78] = 9306,[79] = 9425,
	[80] = 10332,[81] = 10458,[82] = 10576,[83] = 10702,[84] = 10821,[85] = 10947,[86] = 11073,[87] = 11191,[88] = 11318,[89] = 11436,
	[90] = 11830,[91] = 11957,[92] = 12083,[93] = 12209,[94] = 12335,[95] = 12461,[96] = 12587,[97] = 12706,[98] = 12832,[99] = 12958,
	[100] = 13282,[101] = 13416,[102] = 13542,[103] = 13668,[104] = 13794,[105] = 13920,[106] = 14054,[107] = 14181,[108] = 14307,[109] = 14433,
	[110] = 14670,[111] = 14796,[112] = 14922,[113] = 15056,[114] = 15190,[115] = 15316,[116] = 15443,[117] = 15569,[118] = 15695,[119] = 15829,
	[120] = 15955,[121] = 16089,[122] = 16216,[123] = 16342,[124] = 16476,[125] = 16602,[126] = 16728,[127] = 16854,[128] = 16981,[129] = 17115,
	[130] = 17249,[131] = 17375,[132] = 17501,[133] = 17627,[134] = 17761,[135] = 17888,[136] = 18014,[137] = 18140,[138] = 18274,[139] = 18408,
	[140] = 18534,[141] = 18661,[142] = 18787,[143] = 18913,[144] = 19047,[145] = 19173,[146] = 19307,[147] = 19434,[148] = 19560,[149] = 19694,
}
--**********************************
--事件交互入口
--**********************************
function x335808_OnDefaultEvent( sceneId, selfId, bagIndex )	
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335808_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335808_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335808_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1 ~= LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end	
	--选择使用对象了？
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	if targetId < 0 or targetId == selfId then
		x335808_MsgBox(sceneId, selfId, "斩妖剑只能对年兽使用。");	
		return 0;
	end	
	--目标对象类型
	local objType = GetCharacterType( sceneId, targetId )
	if(objType ~= 2)then	--对象不是怪物
		x335808_MsgBox( sceneId, selfId, "斩妖剑只能对年兽使用。")	
		return 0;
	else
		local dataId = GetMonsterDataID(sceneId, targetId); 
		if dataId < 12200 or dataId > 12211 then
			x335808_MsgBox( sceneId, selfId, "斩妖剑只能对年兽使用。")
			return 0;
		end
	end	
	return 1;
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335808_OnDeplete( sceneId, selfId )
	if(0 < LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
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
function x335808_OnActivateOnce( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local damage = GetMaxHp(sceneId, targetId)/6+1; --+1确保能6次杀死
	LuaFnSetDamage(sceneId, selfId, targetId, damage);
	
	local mstLevel = GetLevel(sceneId, targetId);
	local extraExp = 1;
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 62) == 1 then --小灵丹
		extraExp = 1.5;
	end
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 60) == 1 then
		extraExp = 2;
	end
	local nFreeHave = DEGetFreeTime(sceneId, selfId)
	local nMoneyHave = DEGetMoneyTime(sceneId, selfId)
	if DEIsLock(sceneId,selfId) <= 0 then								
		if nFreeHave > 0 or nMoneyHave > 0 then
			extraExp = 2						
		end
	end	
	LuaFnAddExp(sceneId, selfId, x335808_g_prize_exp[mstLevel] * extraExp);
	if extraExp > 1 then
		BeginEvent(sceneId)
			local msg = format("#{NSJYTS_1}%d#{NSJYTS_2}", x335808_g_prize_exp[mstLevel] * (extraExp-1))
			AddText(sceneId, msg)
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
	end
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335808_OnActivateEachTick( sceneId, selfId)
	return 1;
end

--**********************************
--信息提示
--**********************************
function x335808_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
