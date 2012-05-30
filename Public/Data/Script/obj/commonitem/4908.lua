-- �ռ���ͯ��


-- ����ͨ�ù��ܽű�
x334908_g_petCommonId = PETCOMMON

x334908_g_itemList = {}
x334908_g_itemList[30503016] = {minLevel = 1, maxLevel = 85}	--�ռ����޻�ͯ����
x334908_g_itemList[30503017] = {minLevel = 1, maxLevel = 35}	--�ͼ����޻�ͯ����
x334908_g_itemList[30503018] = {minLevel = 1, maxLevel = 65}	--�м����޻�ͯ����
x334908_g_itemList[30503019] = {minLevel = 1, maxLevel = 85}	--�߼����޻�ͯ����
x334908_g_itemList[30503020] = {minLevel = 1, maxLevel = 95}	--�������޻�ͯ����
--******************************************************************************
-- ���²�����Ҫ����Ҫ�޸ĵĲ���
--******************************************************************************

--�ű��� ���ĳ���ȷ�ű��ţ�
x334908_g_scriptId = 334908

--��׼Ч��ID ���ĳɳ���ʹ��ѱ�����ߵ���Ч��
--g_ImpactID = 0

--******************************************************************************
-- ���ϲ�����Ҫ����Ҫ�޸ĵĲ���
--******************************************************************************

--�ű�

--**********************************
--���뷵�� 1 ������ȷִ����������
--**********************************
function x334908_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x334908_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local petItem = x334908_g_itemList[itemTblIndex];
	if not petItem then
		x334908_NotifyTip(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	if LuaFnPetCanReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1) == 0 then
		return 0
	end
	
	local petDataID = LuaFnGetPetDataIDByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not petDataID or petDataID < 0 then
		x334908_NotifyTip(sceneId, selfId, "�޷���ָ�����޽��л�ͯ��");
		return 0;
	end
	
	local petTakeLevel = GetPetTakeLevel(petDataID);
	if not petTakeLevel or petTakeLevel < 1 then
		x334908_NotifyTip(sceneId, selfId, "�޷�ʶ�����޵�Я���ȼ���");
		return 0;
	end
	
	if petTakeLevel > petItem.maxLevel then
		if (petTakeLevel == 95) then
			x334908_NotifyTip(sceneId, selfId, "#{95ZSH_081121_01}");
			return 0;
		else
			x334908_NotifyTip(sceneId, selfId, "���ܶ�Я���ȼ�Ϊ"..petItem.maxLevel.."�����ϵ����޽��л�ͯ��");
			return 0;
		end
	end

	return 1
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x334908_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x334908_OnActivateOnce( sceneId, selfId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	-- ���޻�ͯ
	local ret, perLevel = LuaFnPetReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1)
	if ret and ret == 1 then
		local szMsg = "���޻�ͯ�ɹ���";
		x334908_NotifyTip( sceneId, selfId, szMsg );															-- ��Ŀ��ʾ
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);		-- ��Ч
		
		local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );			--by Vega 20080919
		local nGrowLevel = 0;
		if (itemTblIndex == 30503017 or itemTblIndex == 30503018 or itemTblIndex == 30503019 or itemTblIndex == 30503020 or itemTblIndex == 30503016) then		
			nGrowLevel = LuaFnGetPetGrowRateByGUID( sceneId, selfId, petGUID_H, petGUID_L )      
		end											--by Vega 20080919

		local selfName = LuaFnGetName(sceneId, selfId);
		local petTransfer = LuaFnGetPetTransferByGUID(sceneId, selfId, petGUID_H, petGUID_L);
		if perLevel and perLevel >= 6 and selfName and petTransfer then
			local strWorldChat = "#{_INFOUSR"..selfName.."}#Hʹ��#Y��ͯ����#H��#{_INFOMSG"..petTransfer.."}#H���������";
			BroadMsgByChatPipe(sceneId, selfId, strWorldChat, 4);
		end
		
		-- �ɳ����ڽܳ�����������ʱ����ϵͳ����
		-- add by WTT	20090116
		if (nGrowLevel >= 4) then
			local strTbl = {"��ͨ","����","�ܳ�","׿Խ","����"};
			-- AAA��ϲ��С��������޻�ͯ��Ȼ����ĵõ��˳ɳ���ΪCCC��BBB�����ĵĻر���Ȼ���
			-- AAAΪ�������  BBBΪ��ͯ�����޵�����	 CCCΪ�ɳ��ʣ��ܳ������ϣ���
			local Msg = "#W#{_INFOUSR%s}#{HT14}#Y"..strTbl[nGrowLevel].."#{HT15}#{_INFOMSG%s}#{HT16}"
			local szPetTrans = GetPetTransString ( sceneId, selfId, petGUID_H, petGUID_L )
			local str = format( Msg, selfName, szPetTrans )
				
			BroadMsgByChatPipe (sceneId, selfId, str, 4)
		end
		
	end
	return 1
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x334908_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- �������û��ʲô�ã����Ǳ�����
function x334908_CancelImpacts( sceneId, selfId )
	return 0
end


--**********************************
--��Ŀ��ʾ
--**********************************
function x334908_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
