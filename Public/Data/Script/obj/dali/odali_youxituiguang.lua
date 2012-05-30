-- �콱NPC

x002084_g_scriptId = 002084

x002084_g_PrimaryAward = 1
x002084_g_Award2 = 2
x002084_g_Award3 = 3

x002084_g_Intro = 4

x002084_g_NewCard1 = 5
x002084_g_NewCard2 = 6
x002084_g_NewCard3 = 7
x002084_g_NewCard4 = 10
x002084_g_NewCard5 = 11
x002084_g_NewCard6 = 12
x002084_g_NewCard7 = 13
x002084_g_NewCard8 = 14

x002084_g_NewCardIntro = 9
x002084_g_VirtualNew = 30505080


--�Ƹ���
x002084_g_NewCardList = {}
--x002084_g_NewCardList[x002084_g_NewCard1] = {
--	needLevel = -1,
--	itemAward = { hashTable = {}, itemList = {10402001,10422012,10423020,10141050,10141051} },
--	moneyReward = 0,
--	PropBagSpaceNeed = 5,
--	MatBagSpaceNeed = 0,
--	TaskBagSpaceNeed = 0,
--	flagBit = MF_GetNewUserCard0,
--	redundantMsg = "    ���Ѿ����1���Ľ����ˣ���15���������Ұɡ�",
--	recvMsg = "#{Mis_NewUserCard_16}",
--}
--x002084_g_NewCardList[x002084_g_NewCard2] = {
--	needLevel = 40,
--	itemAward = { hashTable = {}, itemList = {} },
--	moneyReward = 10000,
--	PropBagSpaceNeed = 0,
--	MatBagSpaceNeed = 0,
--	TaskBagSpaceNeed = 0,
--	flagBit = MF_GetNewUserCard1,
--	redundantMsg = "    ���Ѿ����40�������ˣ���60���������Ұɡ�",
--	recvMsg = "    ��ϲ��ɹ���ȡ40����ȡ��#G1�����㡣��",
--}
x002084_g_NewCardList[x002084_g_NewCard3] = {
	needLevel = 70,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 20000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2,
	redundantMsg = "    ���Ѿ����60�������ˡ�",
	recvMsg = "    ��ϲ��ɹ���ȡ40����ȡ��#G2�����㡣��",
}
x002084_g_NewCardList[x002084_g_NewCard4] = {
	needLevel = 80,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 40000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3,
	redundantMsg = "    ���Ѿ����80�������ˡ�",
	recvMsg = "    ��ϲ��ɹ���ȡ40����ȡ��#G4�����㡣��",
}
x002084_g_NewCardList[x002084_g_NewCard5] = {
	needLevel = 100,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 60000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4,
	redundantMsg = "    ���Ѿ����100�������ˡ�",
	recvMsg = "    ��ϲ��ɹ���ȡ40����ȡ��#G6�����㡣��",
}
x002084_g_NewCardList[x002084_g_NewCard6] = {
	needLevel = 120,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 80000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5,
	redundantMsg = "    ���Ѿ����120�������ˡ�",
	recvMsg = "    ��ϲ��ɹ���ȡ40����ȡ��#G8�����㡣��",
}
x002084_g_NewCardList[x002084_g_NewCard7] = {
	needLevel = 130,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 100000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6,
	redundantMsg = "    ���Ѿ����130�������ˡ�",
	recvMsg = "    ��ϲ��ɹ���ȡ40����ȡ��#G10�����㡣��",
}
x002084_g_NewCardList[x002084_g_NewCard8] = {
	needLevel = 140,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 300000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7,
	redundantMsg = "    ���Ѿ����140�������ˡ�",
	recvMsg = "    ��ϲ��ɹ���ȡ40����ȡ��#G30�����㡣��",
}

--**********************************
--�¼��������
--**********************************
function x002084_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    ��ӭ�������������˲����뵽��һ���ȼ�����������ȡ���㡣��"
		AddText( sceneId, strText )

		AddNumText( sceneId, x002084_g_scriptId, "��Ҫ����弶������", 2, 101 )
		AddNumText( sceneId, x002084_g_scriptId, "��Ҫ�����ķ���149��", 3, 1000 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--�Ƹ���
function x002084_AddNewUserCardNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "����弶������", 2, 8 )
			 eventNum = eventNum + 1
		end

		--if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard1].flagBit ) == 0 then
		--	 AddNumText( sceneId, x002084_g_scriptId, "��ȡ1���Ľ���", 2, x002084_g_NewCard1 )
		--	 eventNum = eventNum + 1
		--end

		--if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard2].flagBit ) == 0 then
		--	 AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_NewCardList[x002084_g_NewCard2].needLevel .. "���Ľ���[1������]", 2, x002084_g_NewCard2 )
		--	 eventNum = eventNum + 1
		--end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard3].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_NewCardList[x002084_g_NewCard3].needLevel .. "���Ľ���[2������]", 2, x002084_g_NewCard3 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard4].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_NewCardList[x002084_g_NewCard4].needLevel .. "���Ľ���[4������]", 2, x002084_g_NewCard4 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard5].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_NewCardList[x002084_g_NewCard5].needLevel .. "���Ľ���[6������]", 2, x002084_g_NewCard5 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard6].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_NewCardList[x002084_g_NewCard6].needLevel .. "���Ľ���[8������]", 2, x002084_g_NewCard6 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard7].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_NewCardList[x002084_g_NewCard7].needLevel .. "���Ľ���[10������]", 2, x002084_g_NewCard7 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard8].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "��ȡ" .. x002084_g_NewCardList[x002084_g_NewCard8].needLevel .. "���Ľ���[30������]", 2, x002084_g_NewCard8 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ������ȡ���еĲƸ���������" )
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x002084_OnEventRequest( sceneId, selfId, targetId, eventId )


if x002084_g_NewCardIntro == GetNumText() then
		
		BeginEvent( sceneId )
			AddText( sceneId, "#{XinShouKa_Help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 520 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{CHAOJIDALIKA_090112_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
	end

	if GetNumText() == 8 then
		x002084_CheckNewUserCard(sceneId, selfId, targetId)
	elseif x002084_g_NewCardList[GetNumText()] then
		x002084_GetNewCardPrize( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
		x002084_AddNewUserCardNumText(sceneId,selfId,targetId)
	elseif GetNumText() == 1000 then
		x002084_UpdateXinFa(sceneId,selfId,targetId)
	end
		
	
end


--**********************************
-- ��� �Ƹ���
--**********************************
function x002084_UpdateXinFa( sceneId, selfId, targetId )

		if GetLevel( sceneId, selfId ) < 128  then
				x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ȼ�����128�����޷������ķ���" )
				return
		end
	local nMenPaiId = GetMenPai(sceneId, selfId)
	local	nam	= LuaFnGetName( sceneId, selfId )
		if nMenPaiId == 9 then
						x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��Ŀǰ�����ɣ��޷������ķ���" )
				return
		end
		if nMenPaiId == 0 then
					LuaFnSetXinFaLevel(sceneId,selfId,1,149)
					LuaFnSetXinFaLevel(sceneId,selfId,2,149)
					LuaFnSetXinFaLevel(sceneId,selfId,3,149)
					LuaFnSetXinFaLevel(sceneId,selfId,4,149)
					LuaFnSetXinFaLevel(sceneId,selfId,5,149)
					LuaFnSetXinFaLevel(sceneId,selfId,6,149)
					LuaFnSetXinFaLevel(sceneId,selfId,55,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 1 then
					LuaFnSetXinFaLevel(sceneId,selfId,7,149)
					LuaFnSetXinFaLevel(sceneId,selfId,8,149)
					LuaFnSetXinFaLevel(sceneId,selfId,9,149)
					LuaFnSetXinFaLevel(sceneId,selfId,10,149)
					LuaFnSetXinFaLevel(sceneId,selfId,11,149)
					LuaFnSetXinFaLevel(sceneId,selfId,12,149)
					LuaFnSetXinFaLevel(sceneId,selfId,56,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 2 then
					LuaFnSetXinFaLevel(sceneId,selfId,13,149)
					LuaFnSetXinFaLevel(sceneId,selfId,14,149)
					LuaFnSetXinFaLevel(sceneId,selfId,15,149)
					LuaFnSetXinFaLevel(sceneId,selfId,16,149)
					LuaFnSetXinFaLevel(sceneId,selfId,17,149)
					LuaFnSetXinFaLevel(sceneId,selfId,18,149)
					LuaFnSetXinFaLevel(sceneId,selfId,57,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 3 then
					LuaFnSetXinFaLevel(sceneId,selfId,19,149)
					LuaFnSetXinFaLevel(sceneId,selfId,20,149)
					LuaFnSetXinFaLevel(sceneId,selfId,21,149)
					LuaFnSetXinFaLevel(sceneId,selfId,22,149)
					LuaFnSetXinFaLevel(sceneId,selfId,23,149)
					LuaFnSetXinFaLevel(sceneId,selfId,24,149)
					LuaFnSetXinFaLevel(sceneId,selfId,58,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 4 then
					LuaFnSetXinFaLevel(sceneId,selfId,25,149)
					LuaFnSetXinFaLevel(sceneId,selfId,26,149)
					LuaFnSetXinFaLevel(sceneId,selfId,27,149)
					LuaFnSetXinFaLevel(sceneId,selfId,28,149)
					LuaFnSetXinFaLevel(sceneId,selfId,29,149)
					LuaFnSetXinFaLevel(sceneId,selfId,30,149)
					LuaFnSetXinFaLevel(sceneId,selfId,59,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 5 then
					LuaFnSetXinFaLevel(sceneId,selfId,31,149)
					LuaFnSetXinFaLevel(sceneId,selfId,32,149)
					LuaFnSetXinFaLevel(sceneId,selfId,33,149)
					LuaFnSetXinFaLevel(sceneId,selfId,34,149)
					LuaFnSetXinFaLevel(sceneId,selfId,35,149)
					LuaFnSetXinFaLevel(sceneId,selfId,36,149)
					LuaFnSetXinFaLevel(sceneId,selfId,60,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 6 then
					LuaFnSetXinFaLevel(sceneId,selfId,37,149)
					LuaFnSetXinFaLevel(sceneId,selfId,38,149)
					LuaFnSetXinFaLevel(sceneId,selfId,39,149)
					LuaFnSetXinFaLevel(sceneId,selfId,40,149)
					LuaFnSetXinFaLevel(sceneId,selfId,41,149)
					LuaFnSetXinFaLevel(sceneId,selfId,42,149)
					LuaFnSetXinFaLevel(sceneId,selfId,61,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 7 then
					LuaFnSetXinFaLevel(sceneId,selfId,43,149)
					LuaFnSetXinFaLevel(sceneId,selfId,44,149)
					LuaFnSetXinFaLevel(sceneId,selfId,45,149)
					LuaFnSetXinFaLevel(sceneId,selfId,46,149)
					LuaFnSetXinFaLevel(sceneId,selfId,47,149)
					LuaFnSetXinFaLevel(sceneId,selfId,48,149)
					LuaFnSetXinFaLevel(sceneId,selfId,62,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 8 then
					LuaFnSetXinFaLevel(sceneId,selfId,49,149)
					LuaFnSetXinFaLevel(sceneId,selfId,50,149)
					LuaFnSetXinFaLevel(sceneId,selfId,51,149)
					LuaFnSetXinFaLevel(sceneId,selfId,52,149)
					LuaFnSetXinFaLevel(sceneId,selfId,53,149)
					LuaFnSetXinFaLevel(sceneId,selfId,54,149)
					LuaFnSetXinFaLevel(sceneId,selfId,63,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		end 

					--BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ������ķ���149����", 4 )
					x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ϲ���ɹ������ķ���149����" )
					return 0
end

--**********************************
-- ��� �Ƹ���
--**********************************
function x002084_CheckNewUserCard( sceneId, selfId, targetId )
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ�������Ƹ����������ٴμ��" )
		return
	end
	
	-- �ж��Ƿ�ֱ�Ӽ���Ƹ���
	-- [ QUFEI 2008-02-29 22:26 UPDATE BugID 32610 ]
	local nIsActive = 0
	nIsActive = IsActiveRichesCard()
	if nIsActive == 1 then
		--�Ƹ�������
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ϲ�����Ѿ�����Ƹ����ɹ�������һ���ȼ�֮�����������������ȡ������" )
		
		return 0
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x002084_g_VirtualNew )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x002084_g_VirtualNew, 1 )
		if ret < 1 then
			return
		end
		--�Ƹ��������⿨����
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ϲ�����Ѿ�����Ƹ����ɹ�������һ���ȼ�֮�����������������ȡ������" )
	else
	
		if GetLevel( sceneId, selfId ) > 30 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ����ߣ��޷�����������" )
		return
		end
	
		--������Ƹ������Ž���
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2004 )
	end

	-- ����Ϊ����ʹ��
	--SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
end

--**********************************
-- �ƹ�Աϵͳ����
--**********************************
function x002084_Introduce( sceneId, selfId, targetId )
	x002084_NotifyFailBox( sceneId, selfId, targetId, "    Cdkey�������ƹ�Ա�������û������кţ�ʹ�ô����к���ҳ�漤��֮�󣬿��Ե���Ϸ����ȡ����Ľ���������ֻ����ȡһ�Ρ�" )
end

--**********************************
-- ��Ƹ�����Ʒ
--**********************************
function x002084_GetNewCardPrize( sceneId, selfId, targetId, grade )
	local awardInfo = x002084_g_NewCardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) ~= 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ����ʱ�޷���ȡ��������" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    �ţ���ĵȼ����������ȼ��ﵽ" .. awardInfo.needLevel .. "���������Ұɡ�" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.PropBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.MatBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.TaskBagSpaceNeed .. "��" )
		return
	end
	
	if grade == x002084_g_NewCard3 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "    ��Я�������������������Է���һ������������λ��" )
			return
		end
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- �Ų��¾�û����
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		local ibagidx
		ibagidx =TryRecieveItem( sceneId, selfId, itemSN, 9 )
		if(itemSN == 30900015 and ibagidx ~= -1) then			--�ͼ���ʯ�ϳɷ��� by Vega 20081008
			LuaFnItemBind(sceneId, selfId,ibagidx)								
		end
	end

	if awardInfo.moneyReward > 0 then
		if grade == x002084_g_NewCard1 or grade == x002084_g_NewCard2 or grade == x002084_g_NewCard3 or grade == x002084_g_NewCard4 or grade == x002084_g_NewCard5 or grade == x002084_g_NewCard6 or grade == x002084_g_NewCard7 or grade == x002084_g_NewCard8 then
			ZengDian(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			AddMoney( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x002084_g_NewCard3 then
		local mItem = x002084_GetMenpaiTaoEquip(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
		LuaFnCreatePetToHuman(sceneId, selfId, 3359, 1, 0)
	end
	
	if grade == x002084_g_NewCard7 then
		local mItem = x002084_GetMenpaiYaoJue(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x002084_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

-- ������װ
function x002084_GetMenpaiTaoEquip(mid)
	if(mid == MP_SHAOLIN) then
		return 10500002
	elseif(mid == MP_MINGJIAO) then
		return 10500012
	elseif(mid == MP_GAIBANG) then
		return 10501002
	elseif(mid == MP_WUDANG) then
		return 10502002
	elseif(mid == MP_EMEI) then
		return 10503002
	elseif(mid == MP_XINGSU) then
		return 10503012
	elseif(mid == MP_DALI) then
		return 10505002
	elseif(mid == MP_TIANSHAN) then
		return 10504002
	elseif(mid == MP_XIAOYAO) then
		return 10504012
	else
		return 0
	end
	return 0
end

-- ����Ҫ��
function x002084_GetMenpaiYaoJue(mid)
	if(mid == MP_SHAOLIN) then
		return 30308011
	elseif(mid == MP_MINGJIAO) then
		return 30308012
	elseif(mid == MP_GAIBANG) then
		return 30308013
	elseif(mid == MP_WUDANG) then
		return 30308014
	elseif(mid == MP_EMEI) then
		return 30308015
	elseif(mid == MP_XINGSU) then
		return 30308016
	elseif(mid == MP_DALI) then
		return 30308017
	elseif(mid == MP_TIANSHAN) then
		return 30308018
	elseif(mid == MP_XIAOYAO) then
		return 30308019
	else
		return 0
	end
	return 0
end
