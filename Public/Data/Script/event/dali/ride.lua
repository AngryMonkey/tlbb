--9��������˽ű�

x210299_g_ScriptId = 210299;

--ѧϰ�ȼ�����
x210299_g_SpecialEffectID = 18;

x210299_g_rideskillList = {};
x210299_g_rideskillList[1] ={limitLevel = 40, costMoney =350000, skillList = {
	{id=447,name="��������"},
	{id=561,name="������ʨ��"},
	{id=455,name="����������"},
	{id=450,name="��������"},
	{id=451,name="���������"},
	{id=452,name="��������ţ"},
	{id=448,name="������������"},
	{id=454,name="��������"},
	{id=453,name="������¹"}}
	};

x210299_g_rideskillList[2] ={limitLevel = 60, costMoney =2900000, skillList = {
	{id=456,name="�������׻�"},
	{id=562,name="��������ʨ"},
	{id=464,name="����������"},
	{id=459,name="�����������"},
	{id=460,name="��������׷�"},
	{id=461,name="����������ţ"},
	{id=457,name="�������������"},
	{id=463,name="�������׵�"},
	{id=462,name="��������¹"}}
	};

--**********************************
--������ں���
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
			x210299_ShowTipWindow(sceneId, selfId, "��Ҫ�ﵽ"..limitLevel.."������ѧϰ�˼��ܡ�");
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
				x210299_ShowTipWindow(sceneId, selfId, "ѧ��"..selectSkill.name.."��");
			end
		else
			x210299_ShowTipWindow(sceneId, selfId, "���Ѿ�ѧ��"..selectSkill.name.."��");
		end
	end
end

--**********************************
--��ʾ
--**********************************
function x210299_ShowTipWindow(sceneId, selfId, message)
	BeginEvent(sceneId);
		AddText(sceneId, message);
	EndEvent( );
	DispatchMissionTips(sceneId, selfId);
end

