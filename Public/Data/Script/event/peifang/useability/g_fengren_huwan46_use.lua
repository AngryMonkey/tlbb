-- �����䷽�ű� ����ʹ�ü���������Ʒ
-- *******
-- ���� 5 ��
-- �ýű������������ر����ܺ�����
-- x700925_AbilityCheck ��������ʹ�ü�麯��
-- x700925_AbilityConsume �����ϳɽ����������������
-- x700925_AbilityProduce �����ϳɳɹ���������Ʒ

--------------------------------------------------------------------------------
-- ���²�����Ҫ��д
--------------------------------------------------------------------------------
--�ű�������
--2��ñ�䷽ ������Ʒ

-- �ű���
x700925_g_ScriptId = 700925

-- ����ܺ�
x700925_g_AbilityID = ABILITY_FENGREN

-- ��������ܵ���󼶱�
x700925_g_AbilityMaxLevel = 12

-- �䷽��
x700925_g_RecipeID = 91

-- �䷽�ȼ�(�����ܵĵȼ�)
x700925_g_RecipeLevel = 5

-- ���ϱ�
x700925_g_CaiLiao = {
	{ID = 20105005, Count = 12},
	{ID = 20107005, Count = 14},
	{ID = 20108089, Count = 17},
	{ID = 20308085, Count = 1},
}

-- ��Ʒ��
x700925_g_ChanPin = {
	{ID = 10212012, Odds = 3333},
	{ID = 10212013, Odds = 6666},
	{ID = 10212014, Odds = 10000},
}
--------------------------------------------------------------------------------
-- ���ϲ�����Ҫ��д
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700925_AbilityCheck(sceneId, selfId)

	-- ��ⱳ���ǲ����пո�û�пո�Ͳ��ܽ���
	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
		return OR_BAG_OUT_OF_SPACE
	end

	-- �����������
	VigorValue = x700925_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- ����Ƿ�����㹻

	for idx, Mat in x700925_g_CaiLiao do
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
function x700925_AbilityConsume(sceneId, selfId)
	-- ���Ƚ�����������
	VigorCost = x700925_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- Ȼ����в�������

	for idx, Mat in x700925_g_CaiLiao do
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
function x700925_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700925_g_AbilityID)

	-- �����һ���� [1, 10000]
	rand = random(10000)

	for i, item in x700925_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", sceneId, x700925_g_RecipeLevel, AbilityLevel, x700925_g_AbilityMaxLevel,item.ID )

			local pos = LuaFnTryRecieveItem(sceneId, selfId, item.ID, QUALITY_MUST_BE_CHANGE)
			if pos ~= -1 then
				LuaFnSetItemCreator( sceneId, selfId, pos, LuaFnGetName( sceneId, selfId ) )
			else
				return OR_ERROR
			end

			LuaFnAuditAbility( sceneId, selfId, x700925_g_AbilityID, x700925_g_RecipeID, Quality )
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700925_g_AbilityID, x700925_g_RecipeID, item.ID )
			return OR_OK
		end
		LuaFnAuditAbility( sceneId, selfId, x700925_g_AbilityID, x700925_g_RecipeID, 0 )
	end

	return OR_ERROR
end
