--��װ��
--805027
-- [ QUFEI 2007-10-15 15:31 UPDATE BugID 26358 ]
-- ������Ʒ��Ӧ��
x805027_g_NeedItemBonus={{sqid01=10300000, sqid02=10302000, sqid03=10304000, sqid04=10305000, sfid={ 30505800, 30505801, 30505802, 30505803, 30505804, 30505805, 30505806 }},		-- ����΢��2008.5.30�����30505806��ç���7����������ͼ�������
												 {sqid01=10300001, sqid02=10302001, sqid03=10304001, sqid04=10305001, sfid={ 30505801, 30505802, 30505803, 30505804, 30505805, 30505806 }},
												 {sqid01=10300002, sqid02=10302002, sqid03=10304002, sqid04=10305002, sfid={ 30505802, 30505803, 30505804, 30505805, 30505806 }},
												 {sqid01=10300003, sqid02=10302003, sqid03=10304003, sqid04=10305003, sfid={ 30505803, 30505804, 30505805, 30505806 }},
												 {sqid01=10300004, sqid02=10302004, sqid03=10304004, sqid04=10305004, sfid={ 30505804, 30505805, 30505806 }},
												 {sqid01=10300005, sqid02=10302005, sqid03=10304005, sqid04=10305005, sfid={ 30505805, 30505806 }},
												 {sqid01=10300100, sqid02=10300100, sqid03=10300100, sqid04=10300100, sfid={30505806}},		-- ����΢
												 {sqid01=10300101, sqid02=10300101, sqid03=10300101, sqid04=10300101, sfid={30505806}},
												 {sqid01=10300102, sqid02=10300102, sqid03=10300102, sqid04=10300102, sfid={30505806}},
												 {sqid01=10301100, sqid02=10301100, sqid03=10301100, sqid04=10301100, sfid={30505806}},
												 {sqid01=10301101, sqid02=10301101, sqid03=10301101, sqid04=10301101, sfid={30505806}},
												 {sqid01=10301102, sqid02=10301102, sqid03=10301102, sqid04=10301102, sfid={30505806}},
												 {sqid01=10301200, sqid02=10301200, sqid03=10301200, sqid04=10301200, sfid={30505806}},
												 {sqid01=10301201, sqid02=10301201, sqid03=10301201, sqid04=10301201, sfid={30505806}},
												 {sqid01=10301202, sqid02=10301202, sqid03=10301202, sqid04=10301202, sfid={30505806}},
												 {sqid01=10302100, sqid02=10302100, sqid03=10302100, sqid04=10302100, sfid={30505806}},
												 {sqid01=10302101, sqid02=10302101, sqid03=10302101, sqid04=10302101, sfid={30505806}},
												 {sqid01=10302102, sqid02=10302102, sqid03=10302102, sqid04=10302102, sfid={30505806}},
												 {sqid01=10303100, sqid02=10303100, sqid03=10303100, sqid04=10303100, sfid={30505806}},
												 {sqid01=10303101, sqid02=10303101, sqid03=10303101, sqid04=10303101, sfid={30505806}},
												 {sqid01=10303102, sqid02=10303102, sqid03=10303102, sqid04=10303102, sfid={30505806}},
												 {sqid01=10303200, sqid02=10303200, sqid03=10303200, sqid04=10303200, sfid={30505806}},
												 {sqid01=10303201, sqid02=10303201, sqid03=10303201, sqid04=10303201, sfid={30505806}},
												 {sqid01=10303202, sqid02=10303202, sqid03=10303202, sqid04=10303202, sfid={30505806}},
												 {sqid01=10304100, sqid02=10304100, sqid03=10304100, sqid04=10304100, sfid={30505806}},
												 {sqid01=10304101, sqid02=10304101, sqid03=10304101, sqid04=10304101, sfid={30505806}},
												 {sqid01=10304102, sqid02=10304102, sqid03=10304102, sqid04=10304102, sfid={30505806}},
												 {sqid01=10305100, sqid02=10305100, sqid03=10305100, sqid04=10305100, sfid={30505806}},
												 {sqid01=10305101, sqid02=10305101, sqid03=10305101, sqid04=10305101, sfid={30505806}},
												 {sqid01=10305102, sqid02=10305102, sqid03=10305102, sqid04=10305102, sfid={30505806}},
												 {sqid01=10305200, sqid02=10305200, sqid03=10305200, sqid04=10305200, sfid={30505806}},
												 {sqid01=10305201, sqid02=10305201, sqid03=10305201, sqid04=10305201, sfid={30505806}},
												 {sqid01=10305202, sqid02=10305202, sqid03=10305202, sqid04=10305202, sfid={30505806}},
												 }

x805027_g_SHENQI_BEGIN = 10300000
x805027_g_SHENQI_END = 10399999
x805027_g_ZHUCAI_INDEX = 0
x805027_g_Impact_Complete_Repair = 150

-- ������ĵ�����
x805027_g_ShenCaiCount	= 1

function x805027_OnEquipRepair( sceneId, selfId, itemId)
--һЩ�����ж�
--����
--���	
	
	
	local price = 0
	local cailiaoList = 0
	local cailiaoID = 1
	local ItemIndex = LuaFnGetItemTableIndexByIndex(sceneId, selfId, itemId)
		

	if ItemIndex >= x805027_g_SHENQI_BEGIN and ItemIndex <= x805027_g_SHENQI_END then	
		price = 0
		
		for i, item in x805027_g_NeedItemBonus do								
			if ItemIndex == item.sqid01
				 or ItemIndex == item.sqid02
				 or ItemIndex == item.sqid03
				 or ItemIndex == item.sqid04 then
				 cailiaoList = item.sfid
				 break
			end
		end
						

		if cailiaoList ~= 0 then
							
			for j, cailiao in cailiaoList do
					
				if LuaFnGetAvailableItemCount( sceneId, selfId, cailiao ) > 0 then
					cailiaoID = cailiao
					break
				end
			end
			
		end
		

		x805027_g_ZHUCAI_INDEX = cailiaoID

		local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, cailiaoID )
		
		if ItemCount < 1 then
			BeginEvent(sceneId)
			local strNotice = "��ȱ������".."#{_ITEM"..(cailiaoList[1]).."}"
			AddText(sceneId, strNotice)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			Msg2Player(sceneId,selfId, strNotice, 8)			
	 		return 0
		end
		
	else				
		x805027_g_ZHUCAI_INDEX = 0
		price = GetHighRepairPrice(sceneId, selfId, itemId)
	end

	if price < 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"����װ���ȼ����ϴ���Ŀǰ�޷�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	

	--PrintStr(sceneId.."--"..selfId.."--"..itemId.."--"..price)
	
	ret = DoHighRepair( sceneId, selfId, itemId, price)
	if ret == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"��װ���޷��ٴ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(sceneId,selfId,"��װ���޷��ٴ�����", 8)
	elseif ret == -2 then
		BeginEvent(sceneId)
		AddText(sceneId,"�����������֧��������á�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(sceneId,selfId,"#R�����������֧��������á�", 8)
	elseif ret == -4 then
		BeginEvent(sceneId)
		AddText(sceneId,"����ʧ�ܣ�����װ�������������1��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(sceneId,selfId,"����ʧ�ܣ�����װ�����������#R��1��", 8)
	elseif ret == -5 then
		BeginEvent(sceneId)
		AddText(sceneId,"��������г���δ֪����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(sceneId,selfId,"��������г���δ֪����", 8)
	elseif ret == -6 then
		BeginEvent(sceneId)
		AddText(sceneId,"��Ʒû���𺦣���������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(sceneId,selfId,"��Ʒû���𺦣���������", 8)
	elseif ret == 0 then
		
		if x805027_g_ZHUCAI_INDEX ~= 0 then
			local bagbegin = GetBasicBagStartPos(sceneId, selfId)
			local bagend   = GetBasicBagEndPos(sceneId, selfId)
			local ItemEX
			-- ��õ�ǰ�������ĵĵ�һ������ڱ����е�λ��	
			local scbagpos = -1
			for i=bagbegin, bagend do
				if LuaFnIsItemAvailable( sceneId, selfId, i ) == 1 then
					ItemEX = LuaFnGetItemTableIndexByIndex(sceneId, selfId, i)			
					if ItemEX == x805027_g_ZHUCAI_INDEX then						
						scbagpos = i
						break
					end		
				end
			end
						
			if scbagpos == -1 then
				BeginEvent(sceneId)
				local strNotice = "��ȱ��".."#{_ITEM"..(x805027_g_ZHUCAI_INDEX).."}"
				AddText(sceneId, strNotice)
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				Msg2Player(sceneId,selfId, strNotice, 8)				 			
			  return 0
			end
			
			local res = LuaFnDelAvailableItem(sceneId, selfId, x805027_g_ZHUCAI_INDEX, x805027_g_ShenCaiCount)
			
			if res == 0 then
				BeginEvent(sceneId)
				AddText(sceneId,"��������г���δ֪����")
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				Msg2Player(sceneId,selfId,"��������г���δ֪����", 8)
			end
			
		end
		
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x805027_g_Impact_Complete_Repair, 0 )
			
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(sceneId,selfId,"#G����ɹ���", 8)
	end	
end

--��������۸�
function x805027_CalRepairPrice( sceneId, selfId, itemId,targetId)
	
	local price = GetHighRepairPrice(sceneId, selfId, itemId)

	if price < 0 then
		price = 0
	end

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddInt(sceneId,price )
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 19810313)
end
