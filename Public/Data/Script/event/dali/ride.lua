--9大门派骑乘脚本

x210299_g_ScriptId = 210299;

--学习等级限制
x210299_g_SpecialEffectID = 18;

x210299_g_rideskillList = {};
x210299_g_rideskillList[1] ={limitLevel = 40, costMoney =350000, skillList = {
	{id=447,name="骑术：虎"},
	{id=561,name="骑术：狮子"},
	{id=455,name="骑术：灰狼"},
	{id=450,name="骑术：鹤"},
	{id=451,name="骑术：青凤"},
	{id=452,name="骑术：牦牛"},
	{id=448,name="骑术：黄骠马"},
	{id=454,name="骑术：雕"},
	{id=453,name="骑术：鹿"}}
	};

x210299_g_rideskillList[2] ={limitLevel = 60, costMoney =2900000, skillList = {
	{id=456,name="骑术：白虎"},
	{id=562,name="骑术：白狮"},
	{id=464,name="骑术：白狼"},
	{id=459,name="骑术：金翼鹤"},
	{id=460,name="骑术：红白凤"},
	{id=461,name="骑术：白牦牛"},
	{id=457,name="骑术：青白骢马"},
	{id=463,name="骑术：白雕"},
	{id=462,name="骑术：白鹿"}}
	};

--**********************************
--任务入口函数
--**********************************
function x210299_OnDefaultEvent(sceneId, selfId, targetId, level, skillLevel)
	local selectSkill;
	local limitLevel;
	local costMoney;
	local selfMenpai = LuaFnGetMenPai(sceneId, selfId);
	if selfMenpai then
		skillLevel = skillLevel + 1;
		local selectRideskillList = x210299_g_rideskillList[skillLevel];

		local selectSkillIndex = selfMenpai + 1;
		selectSkill = selectRideskillList.skillList[selectSkillIndex];
		limitLevel = selectRideskillList.limitLevel;
		costMoney = selectRideskillList.costMoney;
	end
	
	local selfLevel = LuaFnGetLevel(sceneId, selfId);
	if selectSkill and limitLevel and selfLevel then
		if selfLevel < limitLevel then
			x210299_ShowTipWindow(sceneId, selfId, "需要达到"..limitLevel.."级才能学习此技能。");
			return
		end
		
		local checkRet = LuaFnHaveSpecificEquitation(sceneId, selfId, selectSkill.id);
		if checkRet and checkRet == 0 then
				------------------------------------------------------------------------------	
			  local jz,_ = LuaFnCostMoneyWithPriority( sceneId, selfId, costMoney );	
				if jz == -1 then
					x210299_ShowTipWindow(sceneId, selfId, "#{GCShopBuyHandler_Info_Money_Is_Not_Enough}")
					return
				end
			------------------------------------------------------------------------------------
			local ret = LuaFnLearnSpecificEquitation(sceneId, selfId, selectSkill.id, 1);
			if ret and ret == 1 then
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x210299_g_SpecialEffectID, 0);
				x210299_ShowTipWindow(sceneId, selfId, "学会"..selectSkill.name.."。");
			end
		else
			x210299_ShowTipWindow(sceneId, selfId, "你已经学会"..selectSkill.name.."。");
		end
	end
end

--**********************************
--提示
--**********************************
function x210299_ShowTipWindow(sceneId, selfId, message)
	BeginEvent(sceneId);
		AddText(sceneId, message);
	EndEvent( );
	DispatchMissionTips(sceneId, selfId);
end

