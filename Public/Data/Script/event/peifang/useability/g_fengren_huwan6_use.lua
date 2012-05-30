-- �����䷽�ű� ����ʹ�ü���������Ʒ
-- *******
-- ���� 1 ��
-- �ýű������������ر����ܺ�����
-- x700909_AbilityCheck ��������ʹ�ü�麯��
-- x700909_AbilityConsume �����ϳɽ����������������
-- x700909_AbilityProduce �����ϳɳɹ���������Ʒ

--------------------------------------------------------------------------------
-- ���²�����Ҫ��д
--------------------------------------------------------------------------------
--�ű�������
--2��ñ�䷽ ������Ʒ

-- �ű���
x700909_g_ScriptId = 700909

-- ����ܺ�
x700909_g_AbilityID = ABILITY_FENGREN

-- ��������ܵ���󼶱�
x700909_g_AbilityMaxLevel = 12

-- �䷽��
x700909_g_RecipeID = 63

-- �䷽�ȼ�(�����ܵĵȼ�)
x700909_g_RecipeLevel = 1

-- ���ϱ�
x700909_g_CaiLiao = {
	{ID = 20105001, Count = 5},
	{ID = 20107001, Count = 7},
	{ID = 20108085, Count = 3},
	{ID = 20308081, Count = 1},
}

-- ��Ʒ��
x700909_g_ChanPin = {
	{ID = 10212001, Odds = 3333},
	{ID = 10212002, Odds = 6666},
	{ID = 10212003, Odds = 10000},
}
--------------------------------------------------------------------------------
-- ���ϲ�����Ҫ��д
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700909_AbilityCheck(sceneId, selfId)

	-- ��ⱳ���ǲ����пո�û�пո�Ͳ��ܽ���
	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
		return OR_BAG_OUT_OF_SPACE
	end

	-- �����������
	VigorValue = x700909_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻

	for idx, Mat in x700909_g_CaiLiao do
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
function x700909_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700909_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������

	for idx, Mat in x700909_g_CaiLiao do
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
function x700909_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700909_g_AbilityID)

	-- �����һ���� [1, 10000]
	rand = random(10000)

	for i, item in x700909_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", sceneId, x700909_g_RecipeLevel, AbilityLevel, x700909_g_AbilityMaxLevel,item.ID )

			local pos = LuaFnTryRecieveItem(sceneId, selfId, item.ID, QUALITY_MUST_BE_CHANGE)
			if pos ~= -1 then
				LuaFnSetItemCreator( sceneId, selfId, pos, LuaFnGetName( sceneId, selfId ) )
			else
				return OR_ERROR
			end

			LuaFnAuditAbility( sceneId, selfId, x700909_g_AbilityID, x700909_g_RecipeID, Quality )
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700909_g_AbilityID, x700909_g_RecipeID, item.ID )
			return OR_OK
		end
		LuaFnAuditAbility( sceneId, selfId, x700909_g_AbilityID, x700909_g_RecipeID, 0 )
	end

	return OR_ERROR
end
