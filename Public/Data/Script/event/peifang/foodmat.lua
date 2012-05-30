-- ʳ���䷽���ϳ��䷽

-- �ýű������¶����ر����ܺ�����
-- x700901_AbilityCheck		- ����ʹ�ü�麯��
-- x700901_AbilityProduce	-  �ϳɳɹ������������Լ�������Ʒ

-- �ű���
x700901_g_ScriptId	= 700901

-- ԭ�ϱ�
x700901_g_Stuff			= {}
-- ����ʳ��ԭ��
x700901_g_Stuff[1]	= { 20102001, 20102013, 20102002, 20102014, 20102003, 20102015, 20106001, 20106002, 20106003 }
-- �м�ʳ��ԭ��
x700901_g_Stuff[2]	= { 20102004, 20102016, 20102005, 20102017, 20102006, 20102018, 20106004, 20106005, 20106006 }
-- �߼�ʳ��ԭ��
x700901_g_Stuff[3]	= { 20102007, 20102008, 20102009, 20102010, 20102011, 20102012, 20102019, 20102020, 20102021,20102022,20102023,20102024,20102040,20102041,20102042,20102043,20102044,20102045,20102046,20102047,20106007,20106008,20106009,20106010,20106011,20106012 }


-- �䷽��
-- ����Ϊ�䷽ ID
-- abilityId: ����ܺ�
-- recipeLevel: �䷽�ȼ�
-- matTbl: ���䷽ʹ�õĲ������
--		matList:ĳ�����εĲ����嵥
--		count:ʹ�øõ��εĲ�����Ҫ������
-- Product: ��Ʒ
x700901_g_CompoundInfo			= {}
-- ����ʳ��
x700901_g_CompoundInfo[558]	= {
	abilityId = ABILITY_PENGREN,
	recipeLevel = 1,
	matTbl = {
		{ matList = x700901_g_Stuff[1], count = 10 },
	},
	Product = 20102037,
}
-- �м�ʳ��
x700901_g_CompoundInfo[559] = {
	abilityId = ABILITY_PENGREN,
	recipeLevel = 1,
	matTbl = {
		{ matList = x700901_g_Stuff[2], count = 10 },
	},
	Product = 20102038,
}
-- �߼�ʳ��
x700901_g_CompoundInfo[560] = {
	abilityId = ABILITY_PENGREN,
	recipeLevel = 1,
	matTbl = {
		{ matList = x700901_g_Stuff[3], count = 10 },
	},
	Product = 20102039,
}

-- ������Ҫ�Ŀռ�
x700901_g_BagSpace	= 1

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x700901_AbilityCheck( sceneId, selfId, recipeId )
	local CompoundInfo = x700901_g_CompoundInfo[recipeId]
	if not CompoundInfo then
		return OR_ERROR
	end

	-- ��ⱳ���ǲ����пո�û�пո�Ͳ��ܽ���
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < x700901_g_BagSpace then
		return OR_BAG_OUT_OF_SPACE
	end

	local abilityLevel = QueryHumanAbilityLevel( sceneId, selfId, CompoundInfo.abilityId )
	if abilityLevel < CompoundInfo.recipeLevel then
		return OR_NO_LEVEL
	end

	-- �ж����ϵĲ����Ƿ��㹻
	local i, matInfo, tblCount, bMatEnoughFlag, idx, MatSN, Count

	tblCount = getn( CompoundInfo.matTbl )
	bMatEnoughFlag = 0

	for i = 1, tblCount do
		Count = 0
		matInfo = CompoundInfo.matTbl[i]
		if not matInfo then
			print( "Exception: An unexpected value of the variable [i] in function [x700901_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x700901_AbilityCheck], the value is ", matInfo )
			return OR_STUFF_LACK
		end

		for idx, MatSN in matInfo.matList do
			Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

			-- ����������жϣ��Լ���ѭ���������ر��ǵ����ϳ�ԣʱ��
			if Count >= matInfo.count then
				bMatEnoughFlag = 1
				break
			end
		end

		if bMatEnoughFlag == 1 then
			break
		end
	end

	if bMatEnoughFlag == 1 then
		return OR_OK
	end

	return OR_STUFF_LACK
end

----------------------------------------------------------------------------------------
--	������Ʒ
----------------------------------------------------------------------------------------
function x700901_AbilityProduce( sceneId, selfId, recipeId )
	local CompoundInfo = x700901_g_CompoundInfo[recipeId]
	if not CompoundInfo then
		return OR_ERROR
	end

	-- ���Ĳ���
	local i, matInfo, tblCount, bMatEnoughFlag, idx, MatSN, Count, DelCount

	tblCount = getn( CompoundInfo.matTbl )
	bMatEnoughFlag = 0
	DelCount = 0

	for i = 1, tblCount do
		Count = 0
		matInfo = CompoundInfo.matTbl[i]
		if not matInfo then
			print( "Exception: An unexpected value of the variable [i] in function [x700901_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x700901_AbilityCheck], the value is ", matInfo )
			return OR_STUFF_LACK
		end

		for idx, MatSN in matInfo.matList do
			Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

			-- ����������жϣ��Լ���ѭ���������ر��ǵ����ϳ�ԣʱ��
			if Count >= matInfo.count then
				bMatEnoughFlag = 1
				break
			end
		end

		if bMatEnoughFlag == 1 then
			Count = matInfo.count

			for idx, MatSN in matInfo.matList do
				DelCount = LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

				if DelCount > 0 then
					if DelCount > Count then
						DelCount = Count
					end

					LuaFnDelAvailableItem( sceneId, selfId, MatSN, DelCount )
					Count = Count - DelCount

					-- ����������жϣ��Լ���ѭ���������ر��ǵ����ϳ�ԣʱ��
					if Count < 1 then
						bMatEnoughFlag = 2
						break
					end
				end
			end
		end

		if bMatEnoughFlag == 1 then
			return OR_ERROR
		elseif bMatEnoughFlag == 2 then
			break
		end
	end

	if bMatEnoughFlag ~= 2 then
		return OR_STUFF_LACK
	end

	if LuaFnTryRecieveItem( sceneId, selfId, CompoundInfo.Product, QUALITY_MUST_BE_CHANGE ) < 0 then
		LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 0)
		return OR_ERROR
	end

	LuaFnSendAbilitySuccessMsg( sceneId, selfId, CompoundInfo.abilityId, recipeId, CompoundInfo.Product )
	LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 1)
	return OR_OK
end
