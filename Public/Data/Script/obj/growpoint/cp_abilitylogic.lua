-- ͨ��������߼��ű�
-- �ű���
x701601_g_ScriptId = 701601

-- װ��������Ƕ�ı�ʯ���ͱ�
x701601_g_EquipGemTable = {}

x701601_g_EquipGemCost = {}

x701601_g_EnergyCostTbl = {}
-- �ɿ�
x701601_g_EnergyCostTbl[ABILITY_CAIKUANG] = {
	3,4,5,6,7,8,9,10,11,12,13,14
}

-- ��ҩ
x701601_g_EnergyCostTbl[ABILITY_CAIYAO] = {
	3,4,5,6,7,8,9,10,11,12,13,14
}
-- ��ֲ
x701601_g_EnergyCostTbl[ABILITY_ZHONGZHI] = {
	10,10,10,20,20,20,30,30,30,30,30,30

}

---------------------------------------------------------------------
---------------------------------------------------------------------


-- �����ƷƷ��
function x701601_CalcQuality(sceneId, RecipeLevel, AbilityLevel, AbilityMaxLevel, ItemIndex)
	-- �����һ���� [0, 49]
	--Quality = random(0, 49)
	--return Quality
	if IsEquipItem(ItemIndex) == 1 then
		local lEquipPoint = GetItemEquipPoint(ItemIndex)
		local	lEquipLevel = GeEquipReqLevel(ItemIndex)
		if(lEquipPoint == -1) then
			return random(0, 49)
		elseif 	lEquipPoint == HEQUIP_WEAPON then
			return (lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_CAP then
			return 20+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_ARMOR then
			return 10+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_CUFF then
			return 40+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_BOOT then
			return 30+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_SASH then
			return 20+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_RING then
			return 30+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_NECKLACE then
			return 40+(lEquipLevel/10)-1
		end
	end
	return	random(0, 49)
end

---------------------------------------------------------------------
---------------------------------------------------------------------


-- �䷽�ϳɽ���ʱ������������
function x701601_GainExperience(sceneId, selfId, AbilityID, RecipeLevel)
	-- ����ܼ���
	local AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	local MinLevelDisparity = 0
	local MaxLevelDisparity = 1
	local ExpGain = 0

	if AbilityLevel < 1 or AbilityLevel > 12 then
		return
	end

	--old
	--if AbilityID == ABILITY_PENGREN then
	--	ExpLimit = LEVELUP_ABILITY_PENGREN[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_DIAOYU then
	--	ExpLimit = LEVELUP_ABILITY_DIAOYU[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHONGZHI then
	--	ExpLimit = LEVELUP_ABILITY_ZHONGZHI[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_CAIYAO then
	--	ExpLimit = LEVELUP_ABILITY_CAIYAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHIYAO then
	--	ExpLimit = LEVELUP_ABILITY_ZHIYAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_CAIKUANG then
	--	ExpLimit = LEVELUP_ABILITY_CAIKUANG[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHUZAO then
	--	ExpLimit = LEVELUP_ABILITY_ZHUZAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_FENGREN then
	--	ExpLimit = LEVELUP_ABILITY_FENGREN[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_GONGYI then
	--	ExpLimit = LEVELUP_ABILITY_GONGYI[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_XIANGQIAN then
	--	ExpLimit = LEVELUP_ABILITY_XIANGQIAN[AbilityLevel].AbilityExpLimitTop
	--else
	--	ExpLimit = LEVELUP_ABILITY_MENPAI[AbilityLevel].AbilityExpLimitTop
	--end
	--new
	local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(AbilityID, AbilityLevel);
	if ret and ret == 1 then
		ExpLimit = currentLevelAbilityExpTop;
	end

	ExpNow = GetAbilityExp(sceneId, selfId, AbilityID)

	if ExpLimit <= ExpNow then
		return
	end

	LevelDisparity = AbilityLevel - RecipeLevel
	if LevelDisparity < 0 then
		LevelDisparity = 0
	end

	if LevelDisparity <= MinLevelDisparity then
		ExpGain = 100
	elseif LevelDisparity <= MaxLevelDisparity then
		ExpGain = 100 / (LevelDisparity - MinLevelDisparity + 1)
	end

	Exp = ExpGain + ExpNow

	if Exp > ExpLimit then
		Exp = ExpLimit
	end

	SetAbilityExp(sceneId, selfId, AbilityID, Exp)
	--Msg2Player(sceneId,selfId,"���������ӵ�"..floor(Exp/100).."��",MSG2PLAYER_PARA)
end

---------------------------------------------------------------------------

--���ĳ��������Ƿ���Ҫ����(�����������Զ�����)
--AbilityID ָ����� ID
--
function	x701601_CheckAbilityLevel(sceneId,selfId,AbilityID)
	--��Ҽӹ����ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, AbilityID)
	Flag = 0

	if AbilityLevel<=10 then
		if AbilityLevel*10<ExpPoint then
			Flag = 1
		end
	elseif AbilityLevel<=20 then
		if (10*10 + (AbilityLevel-10)*20)<ExpPoint then
			Flag = 1
		end
	--elseif ...
	end

	if Flag>0 then
		SetHumanAbilityLevel(sceneId, selfId, AbilityID, AbilityLevel+1)
		AddText(sceneId, selfId, 0, "����������ˣ�")
	end

end

function	x701601_TooManyGems(sceneId,selfId, EquipPos)
	GemCount = GetGemEmbededCount(sceneId, selfId, EquipPos)

	if GemCount<3 then
		return 0
	end

	--���� 1 ��ʾ��ʯ��Ƕ��������
	return 1
end

--��ʯ��Ƕ�ӿ� Gaoqi: ��ǰ�����Ĵ��룬���������޸Ĺ���������δ����Ѿ�����
--GemIndex ��ʯ��Ӧ����ƷΨһ��(ItemIndex)
--selfId ָ�ϳ���Ʒ�����
--����ֵ 0:�ɹ�������ʧ�� 1:��ʯ��ʧ 2:װ����ʧ 3:��ʯװ������ʧ 4:��������
function	x701601_EmbedProc(sceneId,selfId, EquipBagIndex, GemIndex, MatIndex1, MatIndex2)
	--��Ҽӹ����ܵĵȼ�
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_XIANGQIAN)
	--��Ҽӹ����ܵ�������
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_XIANGQIAN)
	--��ʯ�ȼ�(1~8)
	GemQual = GetItemQuality(GemIndex)
	--��ʯ���
	GemType = GetItemIndex(GemIndex)

	--�ж�������ɣ������㷨���Խ����޸�
	--odds = 90 - (GemQual - 1) * 5
	odds = 25
	if MatIndex1 == 30900009 then --�ͼ���ʯ��Ƕ��
		odds = 50
	end
	if MatIndex1 == 30900010 then --�߼���ʯ��Ƕ��
		odds = 75
	end
	rand = random(100)


	-- ���㾫������
	EnergyCost = GemQual * 2 + 1
	MyNewEnergy = GetHumanEnergy( sceneId, selfId ) - EnergyCost
	if MyNewEnergy < 0 then
		return 4
	end

	--���Ľ�Ǯ
	local GemCount = GetGemEmbededCount(sceneId, selfId, EquipBagIndex)
	local need_money = x701601_g_EquipGemCost[GemQual]
	if GemCount == 1 then
		need_money = need_money * 2
	elseif GemCount == 2 then
		need_money = need_money * 3
	end
	local ret = LuaFnCostMoney( sceneId, selfId, need_money )
	if ret ~= 1 then
--		BeginEvent(sceneId)
--		AddText(sceneId,"��Ǯ���㡣");
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
		return 4 --��������û����ض���
	end

	-- ���ľ���
	SetHumanEnergy( sceneId, selfId, MyNewEnergy )

	if odds>rand then
		--����������
		--x701601_GainExperience(sceneId, selfId, ABILITY_XIANGQIAN, GemQual)
		return 0 --��Ƕ�ɹ�
	else
		if MatIndex2 == 30900011 then --��ʯǿ����
			if GemQual <= 1 then
				return 1 --��ʯû��
			else
				return 5 --��ʯ��1��
			end
		else
			if GemQual <= 2 then
				return 1 --��ʯû��
			else
				return 6 --��ʯ��2��
			end
		end
	end
end

--��ʯ��Ƕʱ�ж�������ʯ�Ƿ��ͻ
--Gem1SerialNumber ��ʯ�����к�
--Gem2SerialNumber ��ʯ�����к�
--����ֵ true ��ʾ��ͻ��false ��ʾ����ͻ
function	x701601_IsGemConflict(sceneId, Gem1SerialNumber, Gem2SerialNumber)
	--�õ���Ʒ�����ͣ���ʯ���ࣩ
	return (LuaFnGetItemType(Gem1SerialNumber) == LuaFnGetItemType(Gem2SerialNumber))
end

function	x701601_IsGemFitEquip(sceneId, selfId, GemSerialNum, EquipBagIndex)
	EquipType = LuaFnGetBagEquipType(sceneId, selfId, EquipBagIndex)
	GemType = LuaFnGetItemType(GemSerialNum)
	GemQual = GetItemQuality(GemSerialNum)
	GemCount = GetGemEmbededCount(sceneId, selfId, EquipBagIndex)
	if GemQual <= 0 or GemQual > 9 then
		return 0
	end
	local need_money = x701601_g_EquipGemCost[GemQual]
	if GemCount == 1 then
		need_money = need_money * 2
	elseif GemCount == 2 then
		need_money = need_money * 3
	end
	
	local money = GetMoney( sceneId, selfId )
	if money < need_money then
		return 0
	end

--ÿ���׵��е���Ƕ�ı�ʯ���벻ͬ����	
	local i
	for i=0, GemCount-1 do
		GemEmbededType = GetGemEmbededType(sceneId, selfId, EquipBagIndex, i)
		if GemEmbededType == GemType then
			return 0
		end
	end
	
	if EquipType == -1 then
		return 0
	end

	for i, gem in x701601_g_EquipGemTable[EquipType] do
		if gem == GemType then
			return 1
		end
	end

	return 0
end

--�ɼ�������ܵľ������Ĵ���
function x701601_CalcEnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
	if not x701601_g_EnergyCostTbl[AbilityID] then
		return
	end

	local energyCost = x701601_g_EnergyCostTbl[AbilityID][BaseLevel]
	if not energyCost then
		energyCost = 0
	end

	return energyCost
end

--�ɼ�������ܵľ������Ĵ���
function x701601_EnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
	local energyCost = x701601_CalcEnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)

	if energyCost > 0 then
		local curEnergy = GetHumanEnergy( sceneId, selfId )
		curEnergy = curEnergy - energyCost
		if curEnergy < 0 then
			curEnergy = 0
		end

		--�������ĺ�ľ���
		SetHumanEnergy( sceneId, selfId, curEnergy )
	end
end

--��ֲ���ܵľ������Ĵ���
function x701601_EnergyCostZhongZhi(sceneId, selfId, AbilityID, BaseLevel)
	x701601_EnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
end

--��ҩ���ܻ�������
function x701601_VigorCostZhiYao( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	if RecipeLevel < 8 then
		cost = 5 + 5 * RecipeLevel
	else
		cost = 40
	end

	return cost
end

--��⿼��ܻ�������
function x701601_VigorCostPengRen( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	if RecipeLevel < 8 then
		cost = 5 + 5 * RecipeLevel
	else
		cost = 40
	end

	return cost
end

--���켼�ܻ�������
function x701601_VigorCostDazao( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	cost = 5 + 15 * RecipeLevel

	return cost
end

--��ʯժ���ӿ�
--����ֵ 0:�ɹ����ͼ���ʯժ������ 1:�޴�װ�� 2:��ʯλ�ô��� 3:װ����û�б�ʯ 4:װ���Ƿ� 8:��Ҫ��ʯժ���� 9:�ɹ����߼���ʯժ������
function	x701601_ReomveProc(sceneId,selfId, EquipIndex, GemIndex, MatIndex)
	local equip_point = LuaFnGetBagEquipType(sceneId,selfId, EquipIndex)
	if equip_point == -1 then
		return 1
	end
	
	local gem_type = GetGemEmbededType(sceneId,selfId, EquipIndex, GemIndex)
	if gem_type == 0 then
		return 3
	end
	if gem_type == -1 then
		return 4
	end
	local gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatIndex )
	
	if gem_index == 30900012 then  --�ͼ���ʯժ����
		return 0
	elseif (gem_index >= 30900036 and gem_index <= 30900044) then  --�߼���ʯժ����
		return 9
	else
	  return 8
	end

end

--��ʯժ���ӿ�
--��ʯժ�������ش����������繫�棩
function	x701601_SplitGemSucceed(sceneId,selfId, EquipPos, GemPos, MatPos)

    --������Ч
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
    local CharmId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatPos )
    --���ڵ���3�����ϸ߼���ʯժ����ʹ��ժ���ɹ��������繫��
    if (CharmId >= 30900038 and CharmId <= 30900044) then  --�߼���ʯժ����
		   local PlayerName = GetName(sceneId,selfId)
		   local GemInfo = GetBagItemTransfer( sceneId, selfId, GemPos )
		   local MatInfo = GetBagItemTransfer( sceneId, selfId, MatPos )
	     str = format( "#H#{_INFOUSR%s}����#{_INFOMSG%s}���������дʣ�ֻ��#{_INFOMSG%s}�������䣬���������ˣ����Ǽ�Ʒ֮������", PlayerName, MatInfo, GemInfo)
	     BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	  end

end
