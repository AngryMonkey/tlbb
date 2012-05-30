x600022_g_ScriptId = CITY_BUILDING_ABILITY_SCRIPT

--*******************************************************************************
--城市生活技能检查报错信息
--*******************************************************************************
x600022_g_ErrorMsg = {
	{-1, "这里没有这个生活技能。"},
	{-2, "等级不够。"},
	{-3, "金钱不够。"},
	{-4, "经验不够。"},
	{-5, "你需要升级这个建筑物。"},
	{-6, "你还没学会这个生活技能。"},
	{-7, "你已经学会这个生活技能。"},
	{-8, "你不能使用这个城市的功能。"},
	{-9, "服务器繁忙，请稍后再试。"},
	{-10, "没有找到帮贡消耗信息。"},
	{-11, "帮贡不够。"},
	{-12, "技能熟练度不够。"},
	{-13, "你需要升级这个建筑物。"},
	{-14, "你已经达到此项技能的最高等级，无需再升级了"},
	{-15, "此建筑目前已经是最高等级，只能升级此技能到此级别，无法再升级了"},
}
x600022_g_CITY_BUILDING_MaxLevel = {
					[CITY_BUILDING_SHUFANG]		= 4,
					[CITY_BUILDING_DUANTAI]		= 4,
					[CITY_BUILDING_MICANG]		= 4,
					[CITY_BUILDING_JIFANG]		=	4,
					[CITY_BUILDING_JIUSI]			=	3,
					[CITY_BUILDING_YISHE]			=	3,
					[CITY_BUILDING_QIANZHUANG]=	4,

}

--扣除帮贡的锁
x600022_g_Contribution_Lock	=	0					--enum Obj_Human::BITLOCKTYPE
x600022_g_Contribution_AttrType = 6

--最大等级是12级的生活技能的帮贡消耗表
x600022_g_Contribution_Cost_12 = {
	30,		-- 0 -> 1
	40,		-- 1 -> 2
	50,
	60,
	70,
	100,
	250,
	500,
	1000,
	2000,
	6870,
	7500,		-- 11 -> 12
}

--最大等级是100级的生活技能的帮贡消耗表
--minlv 最小技能等级
--maxlv 最大技能等级
--costrate 需要costrate*curlv帮贡
--x600022_g_Contribution_Cost_100 = {
--	{minlv=1,		maxlv=20,		costrate=1},
--	{minlv=21,	maxlv=40,		costrate=2},
--	{minlv=41,	maxlv=60,		costrate=3},
--	{minlv=61,	maxlv=80,		costrate=4},
--	{minlv=81,	maxlv=100,	costrate=5},
--}

x600022_g_ExtraNPCName = {{"木婉清", "阮星竹", "耶律大石"}
													,{ABILITY_FENGREN, ABILITY_GONGYI, ABILITY_ZHUZAO}}

function x600022_GetCostContributionByAbilityLevel(aid,alv)
	if CITY_ABILITY_DETAIL[aid] then
		local ret, maxlevel = LuaFnGetAbilityMaxLevel(aid);
		if ret and ret == 1 and maxlevel then
			if 10 == maxlevel then
			--12级封顶的技能，查表看扣除多少帮贡
				return x600022_g_Contribution_Cost_12[alv+1]
			elseif 100 == maxlevel or 99 == maxlevel then
			--100级封顶的技能，通过技能等级算出来
				return floor( x600022_g_Contribution_Cost_12[ floor( alv/10 ) + 1 ] / 10 )

			--	for i = 1, getn(x600022_g_Contribution_Cost_100) do
			--		local l = x600022_g_Contribution_Cost_100[i]
			--		if alv+1 >= l.minlv and alv+1 <= l.maxlv then
			--			return (alv+1)*l.costrate
			--		end
			--	end
			end
		end
	end
	--if CITY_ABILITY_DETAIL[aid] and CITY_ABILITY_DETAIL[aid].cond[alv+1] then
	--	if 12 == getn(CITY_ABILITY_DETAIL[aid].cond) then
	--	--12级封顶的技能，查表看扣除多少帮贡
	--		return x600022_g_Contribution_Cost_12[alv+1]
	--	elseif 100 == getn(CITY_ABILITY_DETAIL[aid].cond) then
	--	--100级封顶的技能，通过技能等级算出来
	--		for i = 1, getn(x600022_g_Contribution_Cost_100) do
	--			local l = x600022_g_Contribution_Cost_100[i]
	--			if alv+1 >= l.minlv and alv+1 <= l.maxlv then
	--				return (alv+1)*l.costrate
	--			end
	--		end
	--	end
	--end

	return -1
end

function x600022_ShowErrorMsg(sceneId,selfId,errid)
	for i = 1, getn(x600022_g_ErrorMsg) do
		if x600022_g_ErrorMsg[i][1] == errid then
			Msg2Player( sceneId,selfId,"@*;SrvMsg;DBD:"..x600022_g_ErrorMsg[i][2],MSG2PLAYER_PARA)
			--BeginEvent(sceneId)
      --	AddText(sceneId,x600022_g_ErrorMsg[i][2]);
      --EndEvent(sceneId)
      --DispatchMissionTips(sceneId,selfId)
			break
		end
	end
	return errid
end

--处理用户点击的此建筑物的生活技能选项
function x600022_OnDefaultEvent( sceneId, selfId, targetId, eventScriptId, npcScriptId, bid )
	--判断玩家是不是这个城市所属帮会的成员
	--if GetNumText() == 666 then
	--	BeginEvent(sceneId)
	--		AddText(sceneId, "#{JZBZ_081031_01}");
	--	EndEvent()
	--	DispatchEventList(sceneId, selfId, targetId)
	--end
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return end

	local nUserSelNum = GetNumText();
	if(eventScriptId == x600022_g_ScriptId) then
		--玩家选择了一个生活技能
		local aid = nUserSelNum;
		if(aid and CITY_ABILITY_DETAIL[aid]) then
			BeginEvent(sceneId)
			for i = 1, getn(CITY_ABILITY_DETAIL[aid].script) do
				if(CITY_ABILITY_DETAIL[aid].script[i] > 0) then
					-- i == 1	学习
					-- i == 2 升级
					-- i == 3 了解
					CallScriptFunction( CITY_ABILITY_DETAIL[aid].script[i], "OnEnumerate",sceneId, selfId, targetId, bid, i)
				end
			end
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	else
		--具体技能的处理函数
		if x600022_IsValidCityLifeSkill_Script_Id(eventScriptId) == 1 then
			CallScriptFunction( eventScriptId, "OnDefaultEvent",sceneId, selfId, targetId, nUserSelNum, npcScriptId, bid )
		end
	end
end

--检查这个事件Id是不是城市生活技能学习关系的脚本
function x600022_IsValidCityLifeSkill_Script_Id(eid)
	if nil == eid then return 0 end
	for i = 1, getn(CITY_ABILITY_DETAIL) do
		if CITY_ABILITY_DETAIL[i] then
			local letb = CITY_ABILITY_DETAIL[i].script
			for k = 1, getn(letb) do
				if eid == letb[k] then return 1 end
			end
		end
	end
	return 0
end

--列举此建筑物生活技能的选项
function x600022_GetLifeAbilityByBuildingId(bid)
	local aRet = {}
	if bid and CITY_BUILDING_ABILITY_LIST[bid] then
		aRet = CITY_BUILDING_ABILITY_LIST[bid]
	end

	return aRet	--返回结果
end

--添加学习生活技能选项
function x600022_AddCityLifeAbilityOpt(sceneId, selfId, scriptid, bid, optid)
	--判断玩家是不是这个城市所属帮会的成员
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return end
	
	local lifeNum = getn(x600022_GetLifeAbilityByBuildingId(bid))
	if lifeNum > 0 then
		AddNumText( sceneId, scriptid, "学习生活技能", 6, optid )
		--AddNumText( sceneId, x600022_g_ScriptId, "#{JZBZ_081031_02}", 11, 666)
	end
end

--添加生活技能的详细内容
function x600022_IsHaveLifeAbilityByBuildingId(sceneId, selfId, bid)
	return getn(x600022_GetLifeAbilityByBuildingId(bid))
end

function x600022_OnEnumerate( sceneId, selfId, targetId, bid )
	--判断玩家是不是这个城市所属帮会的成员
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return end
	--生成所有生活技能的表项
	AddText( sceneId, "#{BPJZ_081103_05}" )
	local aTable = x600022_GetLifeAbilityByBuildingId(bid)
	for i = 1, getn(aTable) do
		AddNumText( sceneId, x600022_g_ScriptId, CITY_ABILITY_DETAIL[aTable[i]].aname, 6, aTable[i])
	end
end

--检查这个建筑物的条件约束，供各生活技能脚本反调查询
--checktype = 1	学习检查
--checktype = 2	升级检查
--checktype = 3 升级(Client)				--学习是在各生活技能脚本中直接完成的
--checktype = 4 学习的提示信息中需要的数据(Server)
--checktype = 5 列举学习选项时的检查
--checktype = 6 列举升级选项时的检查
function x600022_OnCityCheck(sceneId, selfId, aid, bid, checktype, ex1, targetId)
	--判断玩家是不是这个城市所属帮会的成员
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return x600022_ShowErrorMsg(sceneId, selfId, -8) end

	--生成所有生活技能的表项
	local blv = CityGetBuildingLevel(sceneId, selfId, sceneId, bid)
	local rl = nil
	if CITY_BUILDING_ABILITY_RULE[bid] and CITY_BUILDING_ABILITY_RULE[bid][blv] then
		local aTable = CITY_BUILDING_ABILITY_RULE[bid][blv]
	for i = 1, getn(aTable) do
		if aTable[i].aid == aid then rl = aTable[i] end
	end
	end

	--获得检查类型
	local alv
	if(1 == checktype or 5 == checktype) then alv = 0 end	--学习
	if(2 == checktype or 3 == checktype or 6 == checktype) then --升级
		alv = QueryHumanAbilityLevel(sceneId, selfId, aid)
	end

	--按照找到的这行来检查
	if CITY_BUILDING_SIXRATE[bid] then
		--获取学习提示的数据
		if(4 == checktype) then return 1 end
		if(2 == checktype) then 
			local ret, maxlevel = LuaFnGetAbilityMaxLevel(aid);
			if ret and ret == 1 and alv>=maxlevel then
				return x600022_ShowErrorMsg(sceneId, selfId, -14);
			end;
			if(alv<1)then
				return x600022_ShowErrorMsg(sceneId, selfId, -6)
			end;
			return 1;			
		end
		--是否学会了技能
		--学习
		if 1 == checktype and QueryHumanAbilityLevel(sceneId, selfId, aid) > 0 then
			return x600022_ShowErrorMsg(sceneId, selfId, -7)
		end
		if 5 == checktype and QueryHumanAbilityLevel(sceneId, selfId, aid) > 0 then
			return x600022_ShowErrorMsg(sceneId, selfId, -7)
		end
		--升级
		if 3 == checktype  then	--Client
			local ret, maxlevel = LuaFnGetAbilityMaxLevel(aid);
			if ret and ret == 1 and alv>=maxlevel then
				return x600022_ShowErrorMsg(sceneId, selfId, -14);
			end;
			if(alv<1)then
				return x600022_ShowErrorMsg(sceneId, selfId, -6)
			end;
		end
		if 6 == checktype and alv < 1 then	--Server
			return x600022_ShowErrorMsg(sceneId, selfId, -6)
		end

		if rl and 5 ~= checktype and 6 ~= checktype then
			--技能最小最大等级检查
			if alv >= rl.amax	or alv+1 < rl.amin then
				if x600022_g_CITY_BUILDING_MaxLevel[bid] and x600022_g_CITY_BUILDING_MaxLevel[bid]<=blv then
					return x600022_ShowErrorMsg(sceneId, selfId, -15);
				end;
				return x600022_ShowErrorMsg(sceneId, selfId, -5)
			end
		
			local tempAbilityId = rl.aid;
			local tempAbilityLevel = alv+1;
			local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(tempAbilityId, tempAbilityLevel);
			
			--特写附加NPC逻辑
			for i = 1, getn(x600022_g_ExtraNPCName[1]) do
				--PrintStr(GetName(sceneId, targetId).." "..x600022_g_ExtraNPCName[1][i].." "..tempAbilityId .." ".. x600022_g_ExtraNPCName[2][i])
				if GetName(sceneId, targetId) == x600022_g_ExtraNPCName[1][i] and tempAbilityId == x600022_g_ExtraNPCName[2][i] then
					demandMoney = extraMoney
					demandExp = extraExp
					break
				end
			end
			
			if ret and ret == 1 then
				--人物等级检查
				if GetLevel(sceneId,selfId) < limitLevel then
					return x600022_ShowErrorMsg(sceneId, selfId, -2)
				end
				--人物金钱检查
				local rate = -0.2	--CITY_BUILDING_SIXRATE[bid]		获得这个建筑物的对应率值
				if GetMoney(sceneId,selfId) + GetMoneyJZ(sceneId, selfId) < floor((1+rate)*demandMoney) then
					return x600022_ShowErrorMsg(sceneId, selfId, -3)
				end
				--人物经验检查
				if 1 ~= checktype and 4 ~= checktype then
				if GetExp(sceneId,selfId) < floor((1+rate)*demandExp) then
					return x600022_ShowErrorMsg(sceneId, selfId, -4)
				end
				end
				--人物帮会贡献度检查
				local costContribution = x600022_GetCostContributionByAbilityLevel(aid, alv)
				if costContribution < 0 then
					return x600022_ShowErrorMsg(sceneId, selfId, -10)
				end
				local curContribute = CityGetAttr(sceneId,selfId,x600022_g_Contribution_AttrType)
				if ex1 and ex1 < curContribute then curContribute = ex1 end
				if curContribute < costContribution then
					return x600022_ShowErrorMsg(sceneId, selfId, -11)
				end
				--人物技能熟练度检查
				local aexp = GetAbilityExp(sceneId, selfId, aid)
				if checktype == 3 then
					if aexp < limitAbilityExp then
						return x600022_ShowErrorMsg(sceneId, selfId, -12)
					end
				end
			else
				return 0;
			end
		else
			if nil == rl and 5~= checktype and 6 ~= checktype then
				return x600022_ShowErrorMsg(sceneId, selfId, -13)
			end
		end
	else
		return x600022_ShowErrorMsg(sceneId, selfId, -1)			--没有找到这个建筑物可以操作这种技能
	end

	return 1				--检查成功
end

--获得这个建筑物实际该扣的金钱、贡献度、经验等数值，供各生活技能脚本反调
--checktype = 1	学习检查(Server)
--checktype = 2	升级检查(Server)
--checktype = 3 升级(Client)				--学习是在各生活技能脚本中直接完成的
--checktype = 4 学习的提示信息中需要的数据(Server)
function x600022_OnCityAction(sceneId, selfId, targetId, aid, bid, checktype, ex1)
	--生成所有生活技能的表项
	local blv = CityGetBuildingLevel(sceneId, selfId, sceneId, bid)
	local rl = nil
	if CITY_BUILDING_ABILITY_RULE[bid] and CITY_BUILDING_ABILITY_RULE[bid][blv] then
		local aTable = CITY_BUILDING_ABILITY_RULE[bid][blv]
	for i = 1, getn(aTable) do
		if aTable[i].aid == aid then rl = aTable[i] end
	end
	end

	--按照找到的这行来生成
	if x600022_OnCityCheck(sceneId, selfId, aid, bid, checktype, ex1, targetId) == 1 then
		local alv = QueryHumanAbilityLevel(sceneId, selfId, aid)
		local rate = -0.2	--CITY_BUILDING_SIXRATE[bid]		获得这个建筑物的对应率值

		local tempAbilityId = aid;
		local tempAbilityLevel = alv+1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel, extraMoney, extraExp = LuaFnGetAbilityLevelUpConfig2(tempAbilityId, tempAbilityLevel);
		
		--特写附加NPC逻辑
		for i = 1, getn(x600022_g_ExtraNPCName[1]) do
			--PrintStr(GetName(sceneId, targetId).." "..x600022_g_ExtraNPCName[1][i].." "..tempAbilityId .." ".. x600022_g_ExtraNPCName[2][i])
			if GetName(sceneId, targetId) == x600022_g_ExtraNPCName[1][i] and tempAbilityId == x600022_g_ExtraNPCName[2][i] then
				demandMoney = extraMoney
				demandExp = extraExp
				break
			end
		end
		
		if ret and ret == 1 then
			local Need_Money = floor((1+rate)*demandMoney)				--需要玩家的金钱
			local Need_Level	= limitLevel			--需要玩家的等级
			local Need_Exp		=	floor((1+rate)*demandExp)		--需要玩家的经验值
			local Need_Aexp	=	limitAbilityExpShow		--需要的技能熟练度

			local costContribution = x600022_GetCostContributionByAbilityLevel(aid, alv)
			if costContribution < 0 then
				return x600022_ShowErrorMsg(sceneId, selfId, -10)
			end
			local Need_Contribute = costContribution																--需要玩家的帮贡

			--检查当前是否能扣除帮贡的锁
			if Need_Contribute > 0 and 1 == checktype and 3 == checktype then
				if IsLocked(sceneId, selfId, x600022_g_Contribution_Lock) then return x600022_ShowErrorMsg(sceneId, selfId, -9) end
			end

			local User_Contribute = CityGetAttr(sceneId,selfId,x600022_g_Contribution_AttrType)			--玩家当前的帮贡
			if ex1 and ex1 < User_Contribute then User_Contribute = ex1 end	--为了暂时显示使用，因为帮贡属性比较特殊

			if rl and checktype == 1 then	--Server
				--扣除消耗
				LuaFnCostMoneyWithPriority(sceneId,selfId,Need_Money)
				--学习生活技能不耗经验值
				--if Need_Exp > 0 then AddExp(sceneId,selfId,Need_Exp*-1)	end
				CityChangeAttr(sceneId,selfId,x600022_g_Contribution_AttrType,Need_Contribute*-1)
				--学习生活技能
				SetHumanAbilityLevel(sceneId,selfId,rl.aid,1)
				--在npc聊天窗口通知玩家已经学会了
				BeginEvent(sceneId)
					AddText(sceneId,"你学会了"..CITY_ABILITY_DETAIL[rl.aid].aname.."技能")
				EndEvent()
				DispatchEventList(sceneId,selfId,targetId)
			elseif checktype == 2 then	--Server
				BeginUICommand(sceneId)
					UICommand_AddInt(sceneId,targetId) --调用城市生活技能界面
					UICommand_AddInt(sceneId,aid)
					UICommand_AddInt(sceneId,Need_Aexp)
					UICommand_AddInt(sceneId,Need_Money)
					UICommand_AddInt(sceneId,Need_Level)
					UICommand_AddInt(sceneId,Need_Exp)
					UICommand_AddInt(sceneId,Need_Contribute)
					UICommand_AddInt(sceneId,bid)
					UICommand_AddInt(sceneId,User_Contribute)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 555)
			elseif checktype == 3 then	--Client
				--扣除消耗
				local bOk = CityChangeAttr(sceneId,selfId,x600022_g_Contribution_AttrType,Need_Contribute*-1)
				if bOk > 0 then
					--优先扣除交子 zchw
					local HumanMoney = LuaFnGetMoney( sceneId, selfId )
  					local HumanMoneyJZ = GetMoneyJZ( sceneId, selfId );
					if HumanMoney + HumanMoneyJZ  <  Need_Money then
						return 0;
					end
					local nDelJZ, nDelMoney = LuaFnCostMoneyWithPriority(sceneId, selfId, Need_Money);
					if (nDelJZ == -1) then
						return 0;
					end

					if Need_Exp > 0 then AddExp(sceneId,selfId,Need_Exp*-1)	end
					--CityChangeAttr(sceneId,selfId,x600022_g_Contribution_AttrType,Need_Contribute*-1)
					--升级生活技能
					SetHumanAbilityLevel(sceneId,selfId,aid,alv+1)
					--重新激活客户端的升级按钮
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,targetId) --调用城市生活技能界面
						UICommand_AddInt(sceneId,aid)
						UICommand_AddInt(sceneId,bid)
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,selfId, 556)
					--递归调用自己，显示下一级的信息
					x600022_OnCityAction(sceneId, selfId, targetId, aid, bid, 2, User_Contribute-Need_Contribute)
				end
			elseif checktype ==4 then	--Server
				return Need_Level,Need_Money,Need_Contribute
			end
		else
			return x600022_ShowErrorMsg(sceneId, selfId, -1)			--没有找到这个建筑物可以操作这种技能
		end
	else
		return 0			--没有找到这个建筑物可以操作这种技能
	end

	return 1				--检查成功
end

--检查城市的当前维护状态，低维护状态时，给提示信息。
function x600022_CheckCityStatus(sceneId, selfId,targetId)
	if CityGetSelfCityID(sceneId,selfId) ~= sceneId then return -2 end
	
	if CityGetMaintainStatus( sceneId, selfId, sceneId ) == 1 then				-- 低维护状态
		BeginEvent(sceneId)
			AddText(sceneId,"本帮现在资金不足，还是多做做商人任务让我帮能恢复正常维护再来找我吧。")
		EndEvent()
		DispatchEventList(sceneId,selfId,targetId)
  	return -1
	end
	
	return 1
end
