-- �콱NPC

x889066_g_scriptId = 889066

x889066_g_PrimaryAward = 1
x889066_g_Award2 = 2
x889066_g_Award3 = 3

x889066_g_Intro = 4

x889066_g_NewCard1 = 5
x889066_g_NewCard2 = 6
x889066_g_NewCard3 = 7
x889066_g_NewCard4 = 10
x889066_g_NewCard5 = 11
x889066_g_NewCard6 = 12
x889066_g_NewCard7 = 13
x889066_g_NewCard8 = 14

x889066_g_NewCardIntro = 9
x889066_g_VirtualNew = 30505080

x889066_g_VirtualNew666 = 30504027 --��ʱû���鿨
x889066_g_ActiveNewCard666 = 51--����666�Ƹ���ѡ��

x889066_g_NewCard1_666 = 43
x889066_g_NewCard2_666 = 44
x889066_g_NewCard3_666 = 45
x889066_g_NewCard4_666 = 46
x889066_g_NewCard5_666 = 47
x889066_g_NewCard6_666 = 48
x889066_g_NewCard7_666 = 49
x889066_g_NewCard8_666 = 50

--�绰�ܱ���Ʒ����"��굤"
x889066_g_eventList={210244} --{210244}	LB JIA ���210245��2008-7-29 10:23:36

--��ʱ�رյ绰�ܱ���Ʒ������
--x889066_g_eventList={210244}


--CD-KEY
x889066_g_AwardList = {}
x889066_g_AwardList[x889066_g_PrimaryAward] = {
	needLevel = -1,
	itemAward = { hashTable = {}, itemList = { 10402001, 10422012, 10423020 } },
	moneyReward = 0,
	PropBagSpaceNeed = 3,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward0Flag,
	redundantMsg = "    ���Ѿ�������������ˣ���30���������Ұɡ�",
	recvMsg = "    ���Ｘ����Ʒ�����߽�����������õ��ϣ�������ЩǮһ�����㣬ף���������˲���Ϸ��졣",
}
x889066_g_AwardList[x889066_g_Award2] = {
	needLevel = 30,
	itemAward = { hashTable = { 40 }, itemList = {} },
	moneyReward = 0,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward1Flag,
	redundantMsg = "    ���Ѿ����30�������ˣ���60���������Ұɡ�",
	recvMsg = "    �����ʯ��һ�����⣬�ǵúñ�ʯҪ�ںõ�װ������Ƕ��ף�����\��",
}
x889066_g_AwardList[x889066_g_Award3] = {
	needLevel = 60,
	itemAward = { hashTable = { 41 }, itemList = {} },
	moneyReward = 0,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward2Flag,
	redundantMsg = "    ���Ѿ����60�������ˡ�",
	recvMsg = "    ���Ҫ����һ�����⣬�ǵú�Ҫ��Ҫ���õ�����ѧϰ��ף�����\��",
}
--�Ƹ���
x889066_g_NewCardList = {}
x889066_g_NewCardList[x889066_g_NewCard1] = {
	needLevel = 50,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 10000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0,
	redundantMsg = "    ���Ѿ����50���Ľ����ˣ���60���������Ұɡ�",
	recvMsg = "#{Mis_NewUserCard_16}",
}
x889066_g_NewCardList[x889066_g_NewCard2] = {
	needLevel = 60,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 30000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1,
	redundantMsg = "    ���Ѿ����60�������ˣ���70���������Ұɡ�",
	recvMsg = "#{Mis_NewUserCard_17}",
}
x889066_g_NewCardList[x889066_g_NewCard3] = {
	needLevel = 70,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 50000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2,
	redundantMsg = "    ���Ѿ����70�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_18}",
}
x889066_g_NewCardList[x889066_g_NewCard4] = {
	needLevel = 80,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 60000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3,
	redundantMsg = "    ���Ѿ����80�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_19}",
}
x889066_g_NewCardList[x889066_g_NewCard5] = {
	needLevel = 90,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 80000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4,
	redundantMsg = "    ���Ѿ����90�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_20}",
}
x889066_g_NewCardList[x889066_g_NewCard6] = {
	needLevel = 100,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 100000,
	PropBagSpaceNeed = 13,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5,
	redundantMsg = "    ���Ѿ����100�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_21}",
}
x889066_g_NewCardList[x889066_g_NewCard7] = {
	needLevel = 130,
	itemAward = { hashTable = {}, itemList = {30900016} },
	moneyReward = 150000,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6,
	redundantMsg = "    ���Ѿ����130�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_22}",
}
x889066_g_NewCardList[x889066_g_NewCard8] = {
	needLevel = 149,
	itemAward = { hashTable = {}, itemList = {30900016} },
	moneyReward = 300000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7,
	redundantMsg = "    ���Ѿ����149�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_23}",
}
	--�Ƹ���666
x889066_g_NewCardListEx = {}
x889066_g_NewCardListEx[x889066_g_NewCard1_666] = {
	needLevel = 100,
	itemAward = { hashTable = {}, itemList = {50601001,50601002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0_666,
	redundantMsg = "    ���Ѿ����100���Ľ����ˣ���100���������Ұɡ�",
	recvMsg = "#{CHAOJIDALIKA_081224_1}",
}
x889066_g_NewCardListEx[x889066_g_NewCard2_666] = {
	needLevel = 120,
	itemAward = { hashTable = {}, itemList = {50601001,50601002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1_666,
	redundantMsg = "    ���Ѿ����120�������ˣ���120���������Ұɡ�",
	recvMsg = "#{CHAOJIDALIKA_081224_2}",
}
x889066_g_NewCardListEx[x889066_g_NewCard3_666] = {
	needLevel = 140,
	itemAward = { hashTable = {}, itemList = {50601001,50601002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2_666,
	redundantMsg = "    ���Ѿ����140�������ˡ�",
	recvMsg = "#{CHAOJIDALIKA_081224_3}",
}
x889066_g_NewCardListEx[x889066_g_NewCard4_666] = {
	needLevel = 160,
	itemAward = { hashTable = {}, itemList = {50701001,50701002} },
	moneyReward = 1000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3_666,
	redundantMsg = "    ���Ѿ����160�������ˡ�",
	recvMsg = "#{CHAOJIDALIKA_081224_4}",
}
x889066_g_NewCardListEx[x889066_g_NewCard5_666] = {
		needLevel = 180,
	itemAward = { hashTable = {}, itemList = {50701001,50701002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4_666,
	redundantMsg = "    ���Ѿ����180�������ˡ�",
	recvMsg = "#{CHAOJIDALIKA_081224_5}",
}
x889066_g_NewCardListEx[x889066_g_NewCard6_666] = {
		needLevel = 200,
	itemAward = { hashTable = {}, itemList = {50801001,50801002} },
	moneyReward = 1000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5_666,
	redundantMsg = "    ���Ѿ����200�������ˡ�",
	recvMsg = "#{CHAOJIDALIKA_081224_6}",
}
x889066_g_NewCardListEx[x889066_g_NewCard7_666] = {
	needLevel = 220,
	itemAward = { hashTable = {}, itemList = {50801001,50801002} },
	moneyReward = 2000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6_666,
	redundantMsg = "    ���Ѿ����220�������ˡ�",
	recvMsg = "#{CAIFUKA_081224_7}",
}
x889066_g_NewCardListEx[x889066_g_NewCard8_666] = {
	needLevel = 240,
	itemAward = { hashTable = {}, itemList = {50901001,50901002} },
	moneyReward = 4000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7_666,
	redundantMsg = "    ���Ѿ����240�������ˡ�",
	recvMsg = "#{CAIFUKA_081224_8}",
}


--**********************************
--�¼��������
--**********************************
function x889066_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		--strText = "    ��ӭ���������˲���Ϸ���磬��ʲô���ܰ��������������Ѿ�����վ��ʹ�ù�CD-KEY�ˣ��㻹��Ҫ�ȼ�����ȡ����������ȡ������"
		--AddText( sceneId, strText )

		--for i, eventId in x889066_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end
		AddText( sceneId, "  #G��ӭ����#cFF0000��������ϵͳ��" )	
		--AddText( sceneId, "  #Y�����#cFF000050#W-#cFF0000149#W���#Y������ȡ������" )
		--AddText( sceneId, "  #G�ȼ�#cFF0000100��#Yʱ���������ȡ#cFF0000��ɫ��װ��" )
		--AddText( sceneId, "  #G�ȼ�#cFF0000130#W-#cFF0000150��#Yʱ���������ȡ#cFF0000�߼���ʯ�ϳɷ���" )
		--AddNumText( sceneId, x889066_g_scriptId, "#e0e8de5#Y��ȡ#G��װԪ��#W����", 2, 101 )
		AddNumText( sceneId, x889066_g_scriptId, "#e0e8de5#Y��ȡ#G����#W����", 2, 103 )
		--AddNumText( sceneId, x889066_g_scriptId, "�����ƹ�Աcdkey�û�", 2, 201 )
		
		--AddNumText( sceneId, x889066_g_scriptId, "#e0e8de5#Y��ȡ#G�߼���ʯ#W����", 2, 102 )
		--AddNumText( sceneId, x889066_g_scriptId, "�����ƹ�Աcdkey�û�", 2, 201 )
		
		--AddNumText( sceneId, x889066_g_scriptId, "�����ƹ�Աϵͳ����", 11, x889066_g_Intro )
		--AddNumText( sceneId, x889066_g_scriptId, "���ڲƸ���ϵͳ����", 11, x889066_g_NewCardIntro )
		--AddNumText( sceneId, x889066_g_scriptId, "���ڳ���������ϵͳ����", 11, 520 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--CD-KEY
function x889066_AddCDKeyNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "����cdkey", 2, 0 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_AwardList[x889066_g_PrimaryAward].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "��ȡcdkey����", 2, x889066_g_PrimaryAward )
			 eventNum = eventNum + 1
		end

		--if GetMissionFlag( sceneId, selfId, x889066_g_AwardList[x889066_g_Award2].flagBit ) == 0 then
			-- AddNumText( sceneId, x889066_g_scriptId, "��ȡ" .. x889066_g_AwardList[x889066_g_Award2].needLevel .. "���Ľ���", 2, x889066_g_Award2 )
			-- eventNum = eventNum + 1
		--end

		--if GetMissionFlag( sceneId, selfId, x889066_g_AwardList[x889066_g_Award3].flagBit ) == 0 then
			-- AddNumText( sceneId, x889066_g_scriptId, "��ȡ" .. x889066_g_AwardList[x889066_g_Award3].needLevel .. "���Ľ���", 2, x889066_g_Award3 )
			-- eventNum = eventNum + 1
		--end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ������ȡ���е�CDKEY������" )
	end
end

--�Ƹ���
function x889066_AddNewUserCardNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		AddText(sceneId," #ed7ffff#c0b38ba ��ӭ���������˲�[��]! ")
		--AddText(sceneId,"#effc9d8#cf30768 ע�⣺�Ƹ������輤��,����ʹ��! ")

		--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 0 then
			 --AddNumText( sceneId, x889066_g_scriptId, "����Ƹ���", 2, 8 )
			 --eventNum = eventNum + 1
		--end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard1].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard1].needLevel .. "��#G [Ԫ��:10000]#Y  ����", 2, x889066_g_NewCard1 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard2].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard2].needLevel .. "��#G [Ԫ��:30000]#Y ����", 2, x889066_g_NewCard2 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard3].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard3].needLevel .. "��#G [Ԫ��:50000]#Y ����", 2, x889066_g_NewCard3 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard4].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard4].needLevel .. "��#G [Ԫ��:60000]#Y ����", 2, x889066_g_NewCard4 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard5].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard5].needLevel .. "��#G [Ԫ��:80000]#Y����", 2, x889066_g_NewCard5 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard6].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ#cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard6].needLevel .. "��#G [Ԫ��:100000]#Y����", 2, x889066_g_NewCard6 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard7].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ#cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard7].needLevel .. "��#G[Ԫ��:150000]#Y����", 2, x889066_g_NewCard7 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard8].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ#cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard8].needLevel .. "��#G[Ԫ��:300000]#Y����", 2, x889066_g_NewCard8 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ������ȡ���еĲƸ���������" )
	end
end

--�Ƹ���666
function x889066_AddNewUserCardNumText666(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
	
		--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) == 0 then
			 --AddNumText( sceneId, x889066_g_scriptId, "��������������", 2, x889066_g_ActiveNewCard666 )
			 --eventNum = eventNum + 1
		--end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard1_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard1_666].needLevel .. "��#G[6����ʯ]#Y����", 2, x889066_g_NewCard1_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard2_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard2_666].needLevel .. "��#G[6����ʯ]#Y����", 2, x889066_g_NewCard2_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard3_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard3_666].needLevel .. "��#G[6����ʯ]#Y����", 2, x889066_g_NewCard3_666 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard4_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard4_666].needLevel .. "��#G[7����ʯ]#Y����", 2, x889066_g_NewCard4_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard5_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard5_666].needLevel .. "��#G[7����ʯ]#Y����", 2, x889066_g_NewCard5_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard6_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard6_666].needLevel .. "��#G[8����ʯ]#Y����", 2, x889066_g_NewCard6_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard7_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard7_666].needLevel .. "��#G[8����ʯ]#Y����", 2, x889066_g_NewCard7_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard8_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc��ȡ #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard8_666].needLevel .. "��#G[9����ʯ]#Y����", 2, x889066_g_NewCard8_666 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ������ȡ���еĳ���������������" )
	end
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889066_OnEventRequest( sceneId, selfId, targetId, eventId )


if x889066_g_NewCardIntro == GetNumText() then
		
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

	if GetNumText() == 0 then
		x889066_CheckCDKey( sceneId, selfId, targetId )
	elseif GetNumText() == x889066_g_Intro then
		x889066_Introduce( sceneId, selfId, targetId )
	elseif x889066_g_AwardList[GetNumText()] then
		x889066_GetAward( sceneId, selfId, targetId, GetNumText() )
	elseif GetNumText() == 8 then
		x889066_CheckNewUserCard(sceneId, selfId, targetId)
	elseif GetNumText() == x889066_g_ActiveNewCard666 then
		x889066_CheckNewUserCard666(sceneId, selfId, targetId)
	elseif x889066_g_NewCardList[GetNumText()] then
		x889066_GetNewCardPrize( sceneId, selfId, targetId, GetNumText())
	elseif x889066_g_NewCardListEx[GetNumText()] then
		x889066_GetNewCardPrize666( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
		x889066_AddNewUserCardNumText(sceneId,selfId,targetId)
	elseif GetNumText() == 102 then
		x889066_AddNewUserCardNumText666(sceneId,selfId,targetId)
	elseif GetNumText() == 103 then
		BeginEvent( sceneId )
			AddText( sceneId, "#Y��ȡ�ȼ����㽱������ʹ��#G����ʯ#Y->#G������#Y->#G��ȡ����#Y��" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 201 then
		x889066_AddCDKeyNumText(sceneId, selfId, targetId)	
	end
		
	for i, eventId in x889066_g_eventList do		
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		--return --���棺��û���������������£�ѭ��������return
	end	
	
end

--**********************************
-- ��� CDKey
--**********************************
function x889066_CheckCDKey( sceneId, selfId, targetId )
	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		return
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ�������Ƹ������޷��ټ���cdkey��" )
		--return
	--end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    �Բ������Ѿ�����10�����޷������콱������" )
		--return
	--end

	CallScriptFunction( PRIZE_SCRIPT_ID, "AskCDKey", sceneId, selfId )

	-- ����Ϊ����ʹ��
	-- SetMissionFlag( sceneId, selfId, MF_GetAwardFlag, 1 )
end

--**********************************
-- ��� �Ƹ���
--**********************************
function x889066_CheckNewUserCard( sceneId, selfId, targetId )
	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ������cdkey���޷��ټ���Ƹ�����" )
		return
	end
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ�������Ƹ����������ٴμ��" )
		return
	end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ĵȼ��Ѿ�����10�����޷��ټ���Ƹ�����" )
		--return
	--end
	
	-- �ж��Ƿ�ֱ�Ӽ���Ƹ���
	-- [ QUFEI 2008-02-29 22:26 UPDATE BugID 32610 ]
	local nIsActive = 0
	nIsActive = IsActiveRichesCard()
	if nIsActive == 1 then
		--�Ƹ�������
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ϲ�����Ѿ�����Ƹ����ɹ�������һ���ȼ�֮�����������������ȡ������" )
		
		return 0
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889066_g_VirtualNew )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x889066_g_VirtualNew, 1 )
		if ret < 1 then
			return
		end
		--�Ƹ��������⿨����
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ϲ�����Ѿ�����Ƹ����ɹ�������һ���ȼ�֮�����������������ȡ������" )
	else
	
		if GetLevel( sceneId, selfId ) > 30 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ����ߣ��޷������Ƹ���" )
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
-- ��� �Ƹ���666
--**********************************
function x889066_CheckNewUserCard666( sceneId, selfId, targetId )
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ������������������������ٴ�������" )
		return
	end

	-- �ж��Ƿ�ֱ�Ӽ���Ƹ���
	-- [ QUFEI 2008-02-29 22:26 UPDATE BugID 32610 ]
	local nIsActive = 0
	nIsActive = IsActiveRichesCard666()
	if nIsActive == 1 then
		--�Ƹ�������
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ϲ�����Ѿ����������������ɹ�������һ���ȼ�֮�����������������ȡ������" )
		
		return 0
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889066_g_VirtualNew666 )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x889066_g_VirtualNew666, 1 )
		if ret < 1 then
			return
		end
		--�Ƹ��������⿨����
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "   ��ϲ�����Ѿ����������������ɹ�������һ���ȼ�֮�����������������ȡ������" )
	else
	
		if GetLevel( sceneId, selfId ) > 30 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "  ���ĵȼ����ߣ��޷������Ƹ���" )
		return
		end
	
		--������Ƹ������Ž���
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 20080819 )
	end

	-- ����Ϊ����ʹ��
	--SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666, 1 )
end

--**********************************
-- �ƹ�Աϵͳ����
--**********************************
function x889066_Introduce( sceneId, selfId, targetId )
	x889066_NotifyFailBox( sceneId, selfId, targetId, "    Cdkey�������ƹ�Ա�������û������кţ�ʹ�ô����к���ҳ�漤��֮�󣬿��Ե���Ϸ����ȡ����Ľ���������ֻ����ȡһ�Ρ�" )
end

--**********************************
-- ��CD-KEY��Ʒ
--**********************************
function x889066_GetAward( sceneId, selfId, targetId, grade )
	local awardInfo = x889066_g_AwardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) ~= 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ����ʱ�޷���ȡ��������" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    �ţ���ĵȼ����������ȼ��ﵽ" .. awardInfo.needLevel .. "���������Ұɡ�" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.PropBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.MatBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.TaskBagSpaceNeed .. "��" )
		return
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- �Ų��¾�û����
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		TryRecieveItem( sceneId, selfId, itemSN, 9 )
	end

	if awardInfo.moneyReward > 0 then
		YuanBao( sceneId, selfId, awardInfo.moneyReward )
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- ��Ƹ�����Ʒ
--**********************************
function x889066_GetNewCardPrize( sceneId, selfId, targetId, grade )
	local awardInfo = x889066_g_NewCardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) ~= 1 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    ����ʱ�޷���ȡ��������" )
		--return
	--end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    �ţ���ĵȼ����������ȼ��ﵽ" .. awardInfo.needLevel .. "���������Ұɡ�" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.PropBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.MatBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.TaskBagSpaceNeed .. "��" )
		return
	end
	
	if grade == x889066_g_NewCard3 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��Я�������������������Է���һ������������λ��" )
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
		TryRecieveItem( sceneId, selfId, itemSN, 9 )
	end

	if awardInfo.moneyReward > 0 then
		if grade == x889066_g_NewCard1 or grade == x889066_g_NewCard2 or grade == x889066_g_NewCard3 or grade == x889066_g_NewCard4 or grade == x889066_g_NewCard5 or grade == x889066_g_NewCard6 or grade == x889066_g_NewCard7 or grade == x889066_g_NewCard8 then
			YuanBao(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			YuanBao( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x889066_g_NewCard5 then
		local MemPai=GetMenPai(sceneId, selfId)
		    if MemPai == 0 then
			TryRecieveItem( sceneId, selfId, 10500009, 1 )
			TryRecieveItem( sceneId, selfId, 10510009, 1 )
			TryRecieveItem( sceneId, selfId, 10511009, 1 )
			TryRecieveItem( sceneId, selfId, 10512009, 1 )
			TryRecieveItem( sceneId, selfId, 10513009, 1 )
			TryRecieveItem( sceneId, selfId, 10514009, 1 )
			TryRecieveItem( sceneId, selfId, 10515009, 1 )
			TryRecieveItem( sceneId, selfId, 10520009, 1 )
			TryRecieveItem( sceneId, selfId, 10521009, 1 )
			TryRecieveItem( sceneId, selfId, 10522009, 1 )
			TryRecieveItem( sceneId, selfId, 10523009, 1 )
			TryRecieveItem( sceneId, selfId, 10552009, 1 )
			TryRecieveItem( sceneId, selfId, 10553009, 1 )
		    elseif MemPai == 1  then
			TryRecieveItem( sceneId, selfId, 10500019, 1 )
			TryRecieveItem( sceneId, selfId, 10510019, 1 )
			TryRecieveItem( sceneId, selfId, 10511019, 1 )
			TryRecieveItem( sceneId, selfId, 10512019, 1 )
			TryRecieveItem( sceneId, selfId, 10513019, 1 )
			TryRecieveItem( sceneId, selfId, 10514019, 1 )
			TryRecieveItem( sceneId, selfId, 10515019, 1 )
			TryRecieveItem( sceneId, selfId, 10520019, 1 )
			TryRecieveItem( sceneId, selfId, 10521019, 1 )
			TryRecieveItem( sceneId, selfId, 10522019, 1 )
			TryRecieveItem( sceneId, selfId, 10523019, 1 )
			TryRecieveItem( sceneId, selfId, 10552019, 1 )
			TryRecieveItem( sceneId, selfId, 10553019, 1 )
		    elseif MemPai == 2  then
			TryRecieveItem( sceneId, selfId, 10501009, 1 )
			TryRecieveItem( sceneId, selfId, 10510029, 1 )
			TryRecieveItem( sceneId, selfId, 10511029, 1 )
			TryRecieveItem( sceneId, selfId, 10512029, 1 )
			TryRecieveItem( sceneId, selfId, 10513029, 1 )
			TryRecieveItem( sceneId, selfId, 10514029, 1 )
			TryRecieveItem( sceneId, selfId, 10515029, 1 )
			TryRecieveItem( sceneId, selfId, 10520029, 1 )
			TryRecieveItem( sceneId, selfId, 10521029, 1 )
			TryRecieveItem( sceneId, selfId, 10522029, 1 )
			TryRecieveItem( sceneId, selfId, 10523029, 1 )
			TryRecieveItem( sceneId, selfId, 10552029, 1 )
			TryRecieveItem( sceneId, selfId, 10553029, 1 )
		    elseif MemPai == 3  then
			TryRecieveItem( sceneId, selfId, 10502009, 1 )
			TryRecieveItem( sceneId, selfId, 10510039, 1 )
			TryRecieveItem( sceneId, selfId, 10511039, 1 )
			TryRecieveItem( sceneId, selfId, 10512039, 1 )
			TryRecieveItem( sceneId, selfId, 10513039, 1 )
			TryRecieveItem( sceneId, selfId, 10514039, 1 )
			TryRecieveItem( sceneId, selfId, 10515039, 1 )
			TryRecieveItem( sceneId, selfId, 10520039, 1 )
			TryRecieveItem( sceneId, selfId, 10521039, 1 )
			TryRecieveItem( sceneId, selfId, 10522039, 1 )
			TryRecieveItem( sceneId, selfId, 10523039, 1 )
			TryRecieveItem( sceneId, selfId, 10552039, 1 )
			TryRecieveItem( sceneId, selfId, 10553039, 1 )
		    elseif MemPai == 4  then
			TryRecieveItem( sceneId, selfId, 10503009, 1 )
			TryRecieveItem( sceneId, selfId, 10510049, 1 )
			TryRecieveItem( sceneId, selfId, 10511049, 1 )
			TryRecieveItem( sceneId, selfId, 10512049, 1 )
			TryRecieveItem( sceneId, selfId, 10513049, 1 )
			TryRecieveItem( sceneId, selfId, 10514049, 1 )
			TryRecieveItem( sceneId, selfId, 10515049, 1 )
			TryRecieveItem( sceneId, selfId, 10520049, 1 )
			TryRecieveItem( sceneId, selfId, 10521049, 1 )
			TryRecieveItem( sceneId, selfId, 10522049, 1 )
			TryRecieveItem( sceneId, selfId, 10523049, 1 )
			TryRecieveItem( sceneId, selfId, 10552049, 1 )
			TryRecieveItem( sceneId, selfId, 10553049, 1 )
		    elseif MemPai == 5  then
			TryRecieveItem( sceneId, selfId, 10503019, 1 )
			TryRecieveItem( sceneId, selfId, 10510059, 1 )
			TryRecieveItem( sceneId, selfId, 10511059, 1 )
			TryRecieveItem( sceneId, selfId, 10512059, 1 )
			TryRecieveItem( sceneId, selfId, 10513059, 1 )
			TryRecieveItem( sceneId, selfId, 10514059, 1 )
			TryRecieveItem( sceneId, selfId, 10515059, 1 )
			TryRecieveItem( sceneId, selfId, 10520059, 1 )
			TryRecieveItem( sceneId, selfId, 10521059, 1 )
			TryRecieveItem( sceneId, selfId, 10522059, 1 )
			TryRecieveItem( sceneId, selfId, 10523059, 1 )
			TryRecieveItem( sceneId, selfId, 10552059, 1 )
			TryRecieveItem( sceneId, selfId, 10553059, 1 )
		    elseif MemPai == 6  then
			TryRecieveItem( sceneId, selfId, 10504009, 1 )
			TryRecieveItem( sceneId, selfId, 10510069, 1 )
			TryRecieveItem( sceneId, selfId, 10511069, 1 )
			TryRecieveItem( sceneId, selfId, 10512069, 1 )
			TryRecieveItem( sceneId, selfId, 10513069, 1 )
			TryRecieveItem( sceneId, selfId, 10514069, 1 )
			TryRecieveItem( sceneId, selfId, 10515069, 1 )
			TryRecieveItem( sceneId, selfId, 10520069, 1 )
			TryRecieveItem( sceneId, selfId, 10521069, 1 )
			TryRecieveItem( sceneId, selfId, 10522069, 1 )
			TryRecieveItem( sceneId, selfId, 10523069, 1 )
			TryRecieveItem( sceneId, selfId, 10552069, 1 )
			TryRecieveItem( sceneId, selfId, 10553069, 1 )
		    elseif MemPai == 7  then
			TryRecieveItem( sceneId, selfId, 10504019, 1 )
			TryRecieveItem( sceneId, selfId, 10510079, 1 )
			TryRecieveItem( sceneId, selfId, 10511079, 1 )
			TryRecieveItem( sceneId, selfId, 10512079, 1 )
			TryRecieveItem( sceneId, selfId, 10513079, 1 )
			TryRecieveItem( sceneId, selfId, 10514079, 1 )
			TryRecieveItem( sceneId, selfId, 10515079, 1 )
			TryRecieveItem( sceneId, selfId, 10520079, 1 )
			TryRecieveItem( sceneId, selfId, 10521079, 1 )
			TryRecieveItem( sceneId, selfId, 10522079, 1 )
			TryRecieveItem( sceneId, selfId, 10523079, 1 )
			TryRecieveItem( sceneId, selfId, 10552079, 1 )
			TryRecieveItem( sceneId, selfId, 10553079, 1 )
		    elseif MemPai == 8  then
			TryRecieveItem( sceneId, selfId, 10505009, 1 )
			TryRecieveItem( sceneId, selfId, 10510089, 1 )
			TryRecieveItem( sceneId, selfId, 10511089, 1 )
			TryRecieveItem( sceneId, selfId, 10512089, 1 )
			TryRecieveItem( sceneId, selfId, 10513089, 1 )
			TryRecieveItem( sceneId, selfId, 10514089, 1 )
			TryRecieveItem( sceneId, selfId, 10515089, 1 )
			TryRecieveItem( sceneId, selfId, 10520089, 1 )
			TryRecieveItem( sceneId, selfId, 10521089, 1 )
			TryRecieveItem( sceneId, selfId, 10522089, 1 )
			TryRecieveItem( sceneId, selfId, 10523089, 1 )
			TryRecieveItem( sceneId, selfId, 10552089, 1 )
			TryRecieveItem( sceneId, selfId, 10553089, 1 )
		   end
	end

	if grade == x889066_g_NewCard7 then
		local mItem = x889066_GetMenpaiYaoJue(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )

		local str = ""
		local rand = random(5)
				
		if rand == 1  then
			str = format("#effc9d8#cf30768������Ϣ,#eFFFF00#g11Cc3F#{_INFOUSR%s}#effc9d8#cf30768�����������ȡ�˽�����������ҵ���ȼ�����������ȡ����Ԫ������װ��", GetName(sceneId,selfId))
		elseif rand == 2  then
			str = format("#b#e6f00c7#c00ffff֪ͨ��#effffff#gffff00#{_INFOUSR%s}#e6f00c7#c00ffff�����˵ȼ�,��#effffff#gffff00�����ȼ�����#e6f00c7#c00ffff��ȡ�˴�����Ԫ������װ��", GetName(sceneId,selfId))
		elseif rand == 3  then
			str = format("#e0ba4b6#c00ffff�װ������ע��,����#effffff#gf0fff5#{_INFOUSR%s}#e0ba4b6#c00ffff�������ȼ�����NPC,�����ȡ�˴���Ԫ������װ��", GetName(sceneId,selfId))
		elseif rand == 4  then
			str = format("#b#gffff00#{_INFOUSR%s}#e6f00c7���ǹ�����,�ڵȼ�����NPC����ȡ�˴�����Ԫ������װ,���֪ͨ��ұ�����ȥ��ȡŶ��", GetName(sceneId,selfId))
		else
			str = format("#e0e8de5#Y��ϲ#gffff00#{_INFOUSR%s}#e0e8de5#Y�������ȼ�����NPC����ȡ�˴���Ԫ������װ,�ȼ����˵���Ҷ����������ȡŶ��", GetName(sceneId,selfId))
		end
				
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
end

--**********************************
-- ��Ƹ�����Ʒ666
--**********************************
function x889066_GetNewCardPrize666( sceneId, selfId, targetId, grade )
	local awardInfo = x889066_g_NewCardListEx[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) ~= 1 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    ����ʱ�޷���ȡ��������" )
		--return
	--end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    �ţ���ĵȼ����������ȼ��ﵽ" .. awardInfo.needLevel .. "���������Ұɡ�" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.PropBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.MatBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.TaskBagSpaceNeed .. "��" )
		return
	end
	
	if grade == x889066_g_NewCard3_666 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x889066_NotifyFailBox( sceneId, selfId, targetId, "    ��Я�������������������Է���һ������������λ��" )
			return
		end
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			local bagpos01 = TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- �Ų��¾�û����
			LuaFnItemBind( sceneId, selfId, bagpos01 )
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		local ibagidx = TryRecieveItem( sceneId, selfId, itemSN, 9 )
		LuaFnItemBind(sceneId, selfId,ibagidx)	

	end

	if awardInfo.moneyReward > 0 then
		if grade == x889066_g_NewCard4_666 or grade == x889066_g_NewCard5_666 or grade == x889066_g_NewCard6_666 or grade == x889066_g_NewCard7_666 or grade == x889066_g_NewCard8_666 then
			YuanBao(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			YuanBao( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x889066_g_NewCard3_666 then
		local mItem = x889066_GetMenpaiTaoEquip(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
		LuaFnCreatePetToHuman(sceneId, selfId, 3359, 1, 0)
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x889066_NotifyFailBox( sceneId, selfId, targetId, "��ϲ���ɹ���ȡ����" )
end


--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x889066_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

-- ������װ
function x889066_GetMenpaiTaoEquip(mid)
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
function x889066_GetMenpaiYaoJue(mid)
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
