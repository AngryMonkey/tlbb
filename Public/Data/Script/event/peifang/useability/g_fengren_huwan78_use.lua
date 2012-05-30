-- �����䷽�ű� ����ʹ�ü���������Ʒ
-- *******
-- ���� 9 ��
-- �ýű������������ر����ܺ�����
-- x700941_AbilityCheck ��������ʹ�ü�麯��
-- x700941_AbilityConsume �����ϳɽ����������������
-- x700941_AbilityProduce �����ϳɳɹ���������Ʒ

--------------------------------------------------------------------------------
-- ���²�����Ҫ��д
--------------------------------------------------------------------------------
--�ű�������
--2��ñ�䷽ ������Ʒ

-- �ű���
x700941_g_ScriptId = 700941

-- ����ܺ�
x700941_g_AbilityID = ABILITY_FENGREN

-- ��������ܵ���󼶱�
x700941_g_AbilityMaxLevel = 12

-- �䷽��
x700941_g_RecipeID = 115

-- �䷽�ȼ�(�����ܵĵȼ�)
x700941_g_RecipeLevel = 9

-- ���ϱ�
x700941_g_CaiLiao = {
	{ID = 20105009, Count = 18},
	{ID = 20107011, Count = 20},
	{ID = 20108093, Count = 29},
	{ID = 20308088, Count = 1},
}

-- ��Ʒ��
x700941_g_ChanPin = {
	{ID = 10212030, Odds = 1666},
	{ID = 10212031, Odds = 3332},
	{ID = 10212032, Odds = 4998},
	{ID = 10212033, Odds = 6664},
	{ID = 10212034, Odds = 8330},
	{ID = 10212035, Odds = 10000},
}
--------------------------------------------------------------------------------
-- ���ϲ�����Ҫ��д
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700941_AbilityCheck(sceneId, selfId)

	-- ��ⱳ���ǲ����пո�û�пո�Ͳ��ܽ���
	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
		return OR_BAG_OUT_OF_SPACE
	end

	-- �����������
	VigorValue = x700941_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻

	for idx, Mat in x700941_g_CaiLiao do
		nCount = Mat.Count

		ret = LuaFnGetAvailableItemCount(sceneId, selfId, Mat.ID)
		if ret < nCount then
			return OR_STUFF_LACK
		end
	end

	return OR_OK
end

----------------------------------------------------------------------------------------
--	�ϳɽ����������������
----------------------------------------------------------------------------------------
function x700941_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700941_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������

	for idx, Mat in x700941_g_CaiLiao do
		nCount = Mat.Count

		ret = LuaFnDelAvailableItem(sceneId, selfId, Mat.ID, nCount)
		if ret ~= 1 then
			return 0
		end
	end

	return 1
end

----------------------------------------------------------------------------------------
--	�ϳɳɹ���������Ʒ
----------------------------------------------------------------------------------------
function x700941_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700941_g_AbilityID)

	-- �����һ���� [1, 10000]
	rand = random(10000)

	for i, item in x700941_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", sceneId, x700941_g_RecipeLevel, AbilityLevel, x700941_g_AbilityMaxLevel,item.ID )

			local pos = LuaFnTryRecieveItem(sceneId, selfId, item.ID, QUALITY_MUST_BE_CHANGE)
			if pos ~= -1 then
				LuaFnSetItemCreator( sceneId, selfId, pos, LuaFnGetName( sceneId, selfId ) )
			else
				return OR_ERROR
			end

			LuaFnAuditAbility( sceneId, selfId, x700941_g_AbilityID, x700941_g_RecipeID, Quality )
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700941_g_AbilityID, x700941_g_RecipeID, item.ID )
			return OR_OK
		end
		LuaFnAuditAbility( sceneId, selfId, x700941_g_AbilityID, x700941_g_RecipeID, 0 )
	end

	return OR_ERROR
end
