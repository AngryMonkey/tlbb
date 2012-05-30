-- ��ʯ��Ƕ

-- �ű���
x701614_g_scriptId = 701614

-- Ӳ���趨��װ��������Ƕ��ʯ��
x701614_g_MaxEquipGemCount = 3

-- װ��������Ƕ�ı�ʯ���ͱ�
x701614_g_EquipGemTable = {}
x701614_g_EquipGemTable[HEQUIP_WEAPON] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_CAP] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_ARMOR] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_CUFF] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_BOOT] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_SASH] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_RING] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_NECKLACE] = { 1, 2, 3, 4, 11, 12, 13, 14, 21 }
x701614_g_EquipGemTable[HEQUIP_RING_2] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_CHARM] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_CHARM_2] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_WRIST] = {1, 2, 3, 4, 21  }
x701614_g_EquipGemTable[HEQUIP_SHOULDER] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_DARK] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21 }

-- ��Ƕ��ͬ�ȼ���ʯ�Ľ�Ǯ���ı�
x701614_g_EquipGemCost = {}
x701614_g_EquipGemCost[1] = 5000
x701614_g_EquipGemCost[2] = 6000
x701614_g_EquipGemCost[3] = 7000
x701614_g_EquipGemCost[4] = 8000
x701614_g_EquipGemCost[5] = 9000
x701614_g_EquipGemCost[6] = 10000
x701614_g_EquipGemCost[7] = 11000
x701614_g_EquipGemCost[8] = 12000
x701614_g_EquipGemCost[9] = 13000

-- ��ʯ��Ƕ����
x701614_g_AssisMat = { { idx = 30900009, odds = 50 }, { idx = 30900010, odds = 100 } }

-- ��ʯǿ����
x701614_g_FastenMat = 30900011

x701614_GemEmbed_four_ID = {
														50113004,50213004,50313004,50413004,50513004,50613004,50713004,50813004,50913004,50113006,
														50213006,50313006,50413006,50513006,50613006,50713006,50813006,50913006
													}		

--**********************************************************************
-- ������ں���
--**********************************************************************
function x701614_OnDefaultEvent( sceneId, selfId, targetId )
end

--**********************************************************************
-- �о��¼�
--**********************************************************************
function x701614_OnEnumerate( sceneId, selfId, targetId )
end

--**********************************************************************
-- �ж��Ƿ�ʯ
--**********************************************************************
function x701614_IsGem( itemIndex )
	if floor( itemIndex / 10000000 ) == 5 then
		return 1
	end

	return 0
end

--**********************************************************************
-- ���б�ʯ��Ƕ
-- �����е���
--**********************************************************************
function x701614_GemEmbed( sceneId, selfId, GemBagIndex, EquipBagIndex, MatBagIndex1, MatBagIndex2 )
	local gemIdx, equipIdx, matIdx1, matIdx2 = -1, -1, -1, -1
	local odds = 25														-- �ɹ���
	local szTransferItem = ""
	local	GemIsBind = 0;
	local EquipIsBind = 0;
	local CharmIsBind = 0;
	local OddsIsBind = 0;

	
	--!!
	if(LuaFnGetItemBindStatus( sceneId, selfId, GemBagIndex ) == 1) then
		GemIsBind = 1;
	end
	
	local itemTableIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	-- ����΢��2008.7.1����¥�䡢��¥��Ļ����޸ģ�1�����Դ�ף�2��������Ƕ��ʯ����ֻ����Ƕ���󶨵ı�ʯ
	if(GemIsBind == 1) then
	  	if(itemTableIndex == 10422016 or itemTableIndex == 10423024) then
	  		return OR_STUFF_LACK
	  	end
	end
	
	if(LuaFnGetItemBindStatus( sceneId, selfId, EquipBagIndex ) == 1) then
		EquipIsBind = 1;
	end
  
  if MatBagIndex1 ~= -1 then
     if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex1 ) == 1) then
		    CharmIsBind = 1;
	   end
	end
	
	if MatBagIndex2 ~= -1 then
	   if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex2 ) == 1) then
		    OddsIsBind = 1;
		 end
	end
	
	
	-- �жϱ�ʯ�Ϸ���
	if LuaFnIsItemAvailable( sceneId, selfId, GemBagIndex ) < 1 then	-- ʹ�����������Ʒ���˳�����
		return OR_STUFF_LACK
	else
		gemIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemBagIndex )
		szTransferItem = GetBagItemTransfer(sceneId,selfId,GemBagIndex)
		if x701614_IsGem( gemIdx ) == 0 then
			return OR_STUFF_LACK
		end
	end

	-- �ж�װ���Ϸ���
	local equipType = LuaFnGetBagEquipType( sceneId, selfId, EquipBagIndex )
	if LuaFnIsItemLocked( sceneId, selfId, EquipBagIndex ) ~= 0
	or equipType == -1 then												-- ʹ�����������Ʒ���˳�����
		return OR_STUFF_LACK
	else
		equipIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	end
	
	-- �ж��Ƿ񻹿�����Ƕ���౦ʯ
	local equipMaxGemCount = GetBagGemCount( sceneId, selfId, EquipBagIndex )
	local equipEmbededGemCount = GetGemEmbededCount( sceneId, selfId, EquipBagIndex )

	--modi:lby�Ƿ������Ƕ
	if equipMaxGemCount > equipEmbededGemCount and equipEmbededGemCount >= x701614_g_MaxEquipGemCount then

		return OR_GEM_EMBED_LACK
	end
	
	if equipMaxGemCount <= equipEmbededGemCount or equipEmbededGemCount >= x701614_g_MaxEquipGemCount then
		return OR_GEM_SLOT_LACK
	end

	
	
	-- �жϺ�װ���ϵ����б�ʯ�Ƿ��г�ͻ
	local gemEmbededIdx = -1
	local gemType = LuaFnGetItemType( gemIdx )
	for i = 0, equipMaxGemCount - 1 do
		gemEmbededIdx = GetGemEmbededType( sceneId, selfId, EquipBagIndex, i )
		if gemEmbededIdx ~= -1 then
			-- �Ա����ű�ʯ�����ͣ���ʯ���ࣩ
			if gemType == LuaFnGetItemType( gemEmbededIdx ) then
				return OR_GEM_CONFLICT
			end
		end
	end

	-- �жϱ�ʯ��װ����ƥ����
	if not x701614_g_EquipGemTable[equipType] then
		return OR_GEM_NOT_FIT_EQUIP
	end

	local passFlag = 0
	for i, gt in x701614_g_EquipGemTable[equipType] do
		if gt == gemType then
			passFlag = 1
			break
		end
	end

	if passFlag == 0 then
		return OR_GEM_NOT_FIT_EQUIP
	end

	-- �жϸ������ϵ���Ч��
	if MatBagIndex1 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex1 ) < 1 then
		MatBagIndex1 = -1
	else
		local findFlag = 0
		matIdx1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex1 )
		for i, matInfo in x701614_g_AssisMat do
			if matInfo.idx == matIdx1 then
				findFlag = 1
				odds = matInfo.odds
				break
			end
		end

		if findFlag == 0 then													-- �������������Ƕ��
			MatBagIndex1 = -1
			matIdx1 = -1
		end
	end
	
	-- ������Ƕ��
	if MatBagIndex1 == -1 then
		return OR_GEM_NEED_STUFF
	end

	if MatBagIndex2 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex2 ) < 1 then
		MatBagIndex2 = -1
	else
		matIdx2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex2 )

		if matIdx2 ~= x701614_g_FastenMat then											-- �����������ǿ����
			MatBagIndex2 = -1
			matIdx2 = -1
		end
	end

	-- �жϽ�Ǯ����
	local gemQual = GetItemQuality( gemIdx )
	local cost = x701614_g_EquipGemCost[gemQual]
	if not cost then
		cost = 0
	end

	-- ��һ����ԭ�ۣ���Ƕ�ڶ������շѡ�2����Ƕ���������շѡ�3
	cost = cost * ( equipEmbededGemCount + 1 )

	-- ���չ����������
	-- ���ܳɹ�ʧ�ܶ����Ľ�Ǯ���������
	if GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId) < cost then
		return OR_NOTENOUGH_MONEY
	end
	local ret1, ret2 = LuaFnCostMoneyWithPriority( sceneId, selfId, cost )
	if ret1 == -1 then
		return OR_NOTENOUGH_MONEY
	end

	if MatBagIndex1 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex1 )
	end

	if MatBagIndex2 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex2 )
	end

	-- ����ɹ�
	local randRet = LuaFnGemEmbedRandom();
	if odds >= randRet then
		local ret = GemEnchasing( sceneId, selfId, GemBagIndex, EquipBagIndex )
		if ret and ret == 0 then
		
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind( sceneId, selfId, EquipBagIndex);
			end
		
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, 3, -1, equipIdx )

			local name = GetName( sceneId, selfId )

			local szTransferEquip = GetBagItemTransfer( sceneId, selfId, EquipBagIndex )
			local message = format("#W#{_INFOUSR%s}#H��#W#{_INFOMSG%s}#H��Ƕ��һ��#W#{_INFOMSG%s}#H�������������װ����������", name, szTransferEquip, szTransferItem);
			
			--���澫��С��3���ı�ʯ��Ƕ����������Ϣ
			if (gemQual >= 3) then
				BroadMsgByChatPipe( sceneId, selfId, message, 4 )
			end

			--[�ظ���ʾ]
			--x701614_MsgBox( sceneId, selfId, "#Y��ϲ�㣬��Ƕ�ɹ���" )
			--Add Log
			LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),
				1,
				gemIdx,
				equipIdx,
				matIdx1,
				matIdx2,
				gemIdx )
			WriteDebugLog( sceneId, selfId, LogInfo )
		end
	-- ���ʧ��
	else
		-- �������б�ʯǿ��������Ƕʧ��֮��ʯ���ήM=1����Ϊ0����ʧ��
		local qualDec			= 1
		local	gemIdx_new	= -1

		-- ������û�б�ʯǿ��������ô��Ƕʧ��֮��ʯ���ήN=2����Ϊ0����ʧ��
		if MatBagIndex2 == -1 then
			qualDec = qualDec + 1
		end

		LuaFnEraseItem( sceneId, selfId, GemBagIndex )

		if gemQual - qualDec > 0 then
			gemIdx_new = gemIdx - 100000 * qualDec
			local GemBagIndex = LuaFnTryRecieveItem( sceneId, selfId, gemIdx_new, QUALITY_MUST_BE_CHANGE )
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind(sceneId, selfId, GemBagIndex)
			end
			x701614_MsgBox( sceneId, selfId, "#Y���ź�����Ƕʧ�ܣ���ʯ����"..qualDec.."����" )
		else
			x701614_MsgBox( sceneId, selfId, "#Y���ź�����Ƕʧ�ܣ���ʯ�𻵣�" )
		end
		--Add Log
		LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			0,
			gemIdx,
			equipIdx,
			matIdx1,
			matIdx2,
			gemIdx_new )
		WriteDebugLog( sceneId, selfId, LogInfo )
		
		if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
			LuaFnItemBind( sceneId, selfId, EquipBagIndex);
		end

		return OR_FAILURE
	end

	-- ���ճɹ��ʽ��кϳ�
	return OR_OK
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x701614_MsgBox( sceneId, selfId, str )

	--��Ŀ��ʾ
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	--Ƶ����ʾ
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )

end


																						
--**********************************************************************
-- ���е��ĸ���ʯ��Ƕ
-- �����е���
--**********************************************************************
function x701614_GemEmbed_Four( sceneId, selfId, GemBagIndex, EquipBagIndex, MatBagIndex1, MatBagIndex2 )
	local gemIdx, equipIdx, matIdx1, matIdx2 = -1, -1, -1, -1
	local odds = 25														-- �ɹ���
	local szTransferItem = ""
	local	GemIsBind = 0;
	local EquipIsBind = 0;
	local CharmIsBind = 0;
	local OddsIsBind = 0;
	local IsRedGem = 0;	
	--!!
	
	if(LuaFnGetItemBindStatus( sceneId, selfId, GemBagIndex ) == 1) then
		GemIsBind = 1;
	end
	
	local itemTableIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	-- ����΢��2008.7.1����¥�䡢��¥��Ļ����޸ģ�1�����Դ�ף�2��������Ƕ��ʯ����ֻ����Ƕ���󶨵ı�ʯ
	if(GemIsBind == 1) then
	  	if(itemTableIndex == 10422016 or itemTableIndex == 10423024) then
	  		return OR_STUFF_LACK
	  	end
	end
	
	if(LuaFnGetItemBindStatus( sceneId, selfId, EquipBagIndex ) == 1) then
		EquipIsBind = 1;
	end
  
  if MatBagIndex1 ~= -1 then
     if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex1 ) == 1) then
		    CharmIsBind = 1;
	   end
	end
	
	if MatBagIndex2 ~= -1 then
	   if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex2 ) == 1) then
		    OddsIsBind = 1;
		 end
	end
	
	
	-- �жϱ�ʯ�Ϸ���
	if LuaFnIsItemAvailable( sceneId, selfId, GemBagIndex ) < 1 then	-- ʹ�����������Ʒ���˳�����
		return OR_STUFF_LACK
	else
		gemIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemBagIndex )
		szTransferItem = GetBagItemTransfer(sceneId,selfId,GemBagIndex)
		
		if x701614_IsGem( gemIdx ) == 0 then
			return OR_STUFF_LACK
		end
		
	end

	-- �ж�װ���Ϸ���
	local equipType = LuaFnGetBagEquipType( sceneId, selfId, EquipBagIndex )
	
	if LuaFnIsItemLocked( sceneId, selfId, EquipBagIndex ) ~= 0	or equipType == -1 then												-- ʹ�����������Ʒ���˳�����
		return OR_STUFF_LACK
	else
		equipIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	end
	
	-- �ж��Ƿ񻹿�����Ƕ���౦ʯ
	local equipMaxGemCount = GetBagGemCount( sceneId, selfId, EquipBagIndex )
	local equipEmbededGemCount = GetGemEmbededCount( sceneId, selfId, EquipBagIndex )


	if equipMaxGemCount < 4 then --���������С��4��
		return OR_GEM_NO_FOUR_SLOT
	end 
		
	if equipEmbededGemCount > 3 then --��Ƕ��ʯ���ܴ���3
		return OR_GEM_ENCHASE_FOUR
	end
		
	if equipEmbededGemCount < 3 then --��Ƕ��ʯ����С��3
		return OR_GEM_MUST_ENCHASE_THREE
	end
	

	
	-- �����Ѫ��ʯ���ߺ챦ʯ�������ʧ��
	for i, Data in x701614_GemEmbed_four_ID do
		if x701614_GemEmbed_four_ID[i] == gemIdx then
				
			IsRedGem = 1
		end
	end
		 
	if IsRedGem == 1 then
	 	return OR_GEM_NOT_ENCHASE
	end
	 
	
	-- �жϱ�ʯ��װ����ƥ����
	if not x701614_g_EquipGemTable[equipType] then
		return OR_GEM_NOT_FIT_EQUIP
	end

	
	local gemType = LuaFnGetItemType( gemIdx )
	
	local passFlag = 0
	for i, gt in x701614_g_EquipGemTable[equipType] do
		if gt == gemType then
			passFlag = 1
			break
		end
	end

	if passFlag == 0 then
		return OR_GEM_NOT_FIT_EQUIP
	end


	
	-- �жϸ������ϵ���Ч��
	if MatBagIndex1 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex1 ) < 1 then
		MatBagIndex1 = -1
	else
		local findFlag = 0
		matIdx1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex1 )
		for i, matInfo in x701614_g_AssisMat do
			if matInfo.idx == matIdx1 then
				findFlag = 1
				odds = matInfo.odds
				break
			end
		end

		if findFlag == 0 then													-- �������������Ƕ��
			MatBagIndex1 = -1
			matIdx1 = -1
		end
	end
	
	-- ������Ƕ��
	if MatBagIndex1 == -1 then
		return OR_GEM_NEED_STUFF
	end

	if MatBagIndex2 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex2 ) < 1 then
		MatBagIndex2 = -1
	else
		matIdx2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex2 )

		if matIdx2 ~= x701614_g_FastenMat then											-- �����������ǿ����
			MatBagIndex2 = -1
			matIdx2 = -1
		end
	end

	-- �жϽ�Ǯ����
	local gemQual = GetItemQuality( gemIdx )
	local cost = x701614_g_EquipGemCost[gemQual]
	if not cost then
		cost = 0
	end

	-- ��һ����ԭ�ۣ���Ƕ�ڶ������շѡ�2����Ƕ���������շѡ�3
	cost = cost * ( equipEmbededGemCount + 1 )

	local PlayerMoney = GetMoney( sceneId, selfId ) +  GetMoneyJZ(sceneId, selfId)  --�����ռ� Vega
	if PlayerMoney < cost then
		return OR_NOTENOUGH_MONEY
	end
	-- ���չ����������
	-- ���ܳɹ�ʧ�ܶ����Ľ�Ǯ���������
	local ret = LuaFnCostMoneyWithPriority( sceneId, selfId, cost )      --�����ռ� Vega
	if ret < 0 then
		return OR_NOTENOUGH_MONEY
	end

	if MatBagIndex1 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex1 )
	end

	if MatBagIndex2 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex2 )
	end

	-- ����ɹ�
	local randRet = LuaFnGemEmbedRandom();
	if odds >= randRet then
		local ret = GemEnchasing( sceneId, selfId, GemBagIndex, EquipBagIndex )
		if ret and ret == 0 then
		
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind( sceneId, selfId, EquipBagIndex);
			end
		
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, 3, -1, equipIdx )

			local name = GetName( sceneId, selfId )

			local szTransferEquip = GetBagItemTransfer( sceneId, selfId, EquipBagIndex )
			local message = format("#W#{_INFOUSR%s}#H��#W#{_INFOMSG%s}#H��Ƕ��һ��#W#{_INFOMSG%s}#H�������������װ����������", name, szTransferEquip, szTransferItem);
			BroadMsgByChatPipe( sceneId, selfId, message, 4 )

			--[�ظ���ʾ]
			--x701614_MsgBox( sceneId, selfId, "#Y��ϲ�㣬��Ƕ�ɹ���" )
			--Add Log
			LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),
				1,
				gemIdx,
				equipIdx,
				matIdx1,
				matIdx2,
				gemIdx )
			WriteDebugLog( sceneId, selfId, LogInfo )
		end
	-- ���ʧ��
	else
		-- �������б�ʯǿ��������Ƕʧ��֮��ʯ���ήM=1����Ϊ0����ʧ��
		local qualDec			= 1
		local	gemIdx_new	= -1

		-- ������û�б�ʯǿ��������ô��Ƕʧ��֮��ʯ���ήN=2����Ϊ0����ʧ��
		if MatBagIndex2 == -1 then
			qualDec = qualDec + 1
		end

		LuaFnEraseItem( sceneId, selfId, GemBagIndex )

		if gemQual - qualDec > 0 then
			gemIdx_new = gemIdx - 100000 * qualDec
			local GemBagIndex = LuaFnTryRecieveItem( sceneId, selfId, gemIdx_new, QUALITY_MUST_BE_CHANGE )
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind(sceneId, selfId, GemBagIndex)
			end
			x701614_MsgBox( sceneId, selfId, "#Y���ź�����Ƕʧ�ܣ���ʯ����"..qualDec.."����" )
		else
			x701614_MsgBox( sceneId, selfId, "#Y���ź�����Ƕʧ�ܣ���ʯ�𻵣�" )
		end
		--Add Log
		LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			0,
			gemIdx,
			equipIdx,
			matIdx1,
			matIdx2,
			gemIdx_new )
		WriteDebugLog( sceneId, selfId, LogInfo )
		
		if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
			LuaFnItemBind( sceneId, selfId, EquipBagIndex);
		end

		return OR_FAILURE
	end

	-- ���ճɹ��ʽ��кϳ�
	return OR_OK
end
