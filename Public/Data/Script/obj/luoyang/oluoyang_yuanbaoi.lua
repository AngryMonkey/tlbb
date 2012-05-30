-- �콱NPC

x000172_g_scriptId = 000172

x000172_g_PrimaryAward = 1
x000172_g_Award2 = 2
x000172_g_Award3 = 3

x000172_g_Intro = 4

x000172_g_NewCard1 = 5
x000172_g_NewCard2 = 6
x000172_g_NewCard3 = 7
x000172_g_NewCard4 = 10
x000172_g_NewCard5 = 11
x000172_g_NewCard6 = 12
x000172_g_NewCard7 = 13
x000172_g_NewCard8 = 14
x000172_g_LevelUp = 103
x000172_g_NewCardIntro = 9
x000172_g_VirtualNew = 30505080

x000172_g_eventList={210244} --{210244}

--CD-KEY
x000172_g_AwardList = {}
x000172_g_AwardList[x000172_g_PrimaryAward] = {
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
x000172_g_AwardList[x000172_g_Award2] = {
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
x000172_g_AwardList[x000172_g_Award3] = {
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
x000172_g_NewCardList = {}
x000172_g_NewCardList[x000172_g_NewCard1] = {
	needLevel = -1,
	itemAward = { hashTable = {}, itemList = {10402001,10422012,10423020,10141050,10141051} },
	moneyReward = 0,
	PropBagSpaceNeed = 5,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0,
	redundantMsg = "    ���Ѿ����1���Ľ����ˣ���15���������Ұɡ�",
	recvMsg = "#{Mis_NewUserCard_16}",
}
x000172_g_NewCardList[x000172_g_NewCard2] = {
	needLevel = 15,
	itemAward = { hashTable = {}, itemList = {10413013,10411013,10412013,10421013,30008027,30008027,30008027,30008027,30008027} },
	moneyReward = 0,
	PropBagSpaceNeed = 9,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1,
	redundantMsg = "    ���Ѿ����15�������ˣ���30���������Ұɡ�",
	recvMsg = "#{Mis_NewUserCard_17}",
}
x000172_g_NewCardList[x000172_g_NewCard3] = {
	needLevel = 30,
	itemAward = { hashTable = {}, itemList = {30900015} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2,
	redundantMsg = "    ���Ѿ����30�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_18}",
}
x000172_g_NewCardList[x000172_g_NewCard4] = {
	needLevel = 40,
	itemAward = { hashTable = {}, itemList = {30505106} },
	moneyReward = 2000,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3,
	redundantMsg = "    ���Ѿ����40�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_19}",
}
x000172_g_NewCardList[x000172_g_NewCard5] = {
	needLevel = 89,
	itemAward = { hashTable = {}, itemList = {10141037} },
	moneyReward = 50000,
	PropBagSpaceNeed =0 ,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4,
	redundantMsg = "    ���Ѿ����89�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_20}",
}
x000172_g_NewCardList[x000172_g_NewCard6] = {
	needLevel = 99,
	itemAward = { hashTable = {}, itemList = {10141027} },
	moneyReward = 120000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5,
	redundantMsg = "    ���Ѿ����99�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_21}",
}
x000172_g_NewCardList[x000172_g_NewCard7] = {
	needLevel = 129,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 120000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6,
	redundantMsg = "    ���Ѿ����129�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_22}",
}
x000172_g_NewCardList[x000172_g_NewCard8] = {
	needLevel = 150,
	itemAward = { hashTable = {}, itemList = {30008004,30502002,30502002,30502002,30502002,30502002,30502002,30502002,30502002,30502002,30502002} },
	moneyReward = 200000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7,
	redundantMsg = "    ���Ѿ����150�������ˡ�",
	recvMsg = "#{Mis_NewUserCard_23}",
}

--**********************************
--�¼��������
--**********************************
function x000172_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    #G��ӭ���������˲���Ϸ���磬��ʲô���ܰ���������㻹��Ҫ�ȼ�����ȡ����������ȡ������"
		AddText( sceneId, strText )

		--for i, eventId in x000172_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end

		--AddNumText( sceneId, x000172_g_scriptId, "���ǲƸ����û�", 2, 101 )
		--AddNumText( sceneId, x000172_g_scriptId, "�����ƹ�Աcdkey�û�", 2, 201 )
		
		--AddNumText( sceneId, x000172_g_scriptId, "�����ƹ�Աϵͳ����", 11, x000172_g_Intro )
		--AddNumText( sceneId, x000172_g_scriptId, "���ڲƸ���ϵͳ����", 11, x000172_g_NewCardIntro )
                AddNumText( sceneId, x000172_g_scriptId, "���������ȡԪ��--ÿ����10��", 2, 102)
                --AddNumText( sceneId, x000172_g_scriptId, "���������ȡ����--ÿ����10��", 2, 123)
		--AddNumText( sceneId, x000172_g_scriptId, "#gff0c0c -= [��Ҫת��] =-", 2,x000172_g_LevelUp )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--CD-KEY
function x000172_AddCDKeyNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "����cdkey", 2, 0 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_AwardList[x000172_g_PrimaryAward].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡcdkey����", 2, x000172_g_PrimaryAward )
			 eventNum = eventNum + 1
		end

		--if GetMissionFlag( sceneId, selfId, x000172_g_AwardList[x000172_g_Award2].flagBit ) == 0 then
			-- AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_AwardList[x000172_g_Award2].needLevel .. "���Ľ���", 2, x000172_g_Award2 )
			-- eventNum = eventNum + 1
		--end

		--if GetMissionFlag( sceneId, selfId, x000172_g_AwardList[x000172_g_Award3].flagBit ) == 0 then
			-- AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_AwardList[x000172_g_Award3].needLevel .. "���Ľ���", 2, x000172_g_Award3 )
			-- eventNum = eventNum + 1
		--end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ������ȡ���е�CDKEY������" )
	end
end

--�Ƹ���
function x000172_AddNewUserCardNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "����Ƹ���", 2, 8 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard1].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ1���Ľ���", 2, x000172_g_NewCard1 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard2].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_NewCardList[x000172_g_NewCard2].needLevel .. "���Ľ���", 2, x000172_g_NewCard2 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard3].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_NewCardList[x000172_g_NewCard3].needLevel .. "���Ľ���", 2, x000172_g_NewCard3 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard4].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_NewCardList[x000172_g_NewCard4].needLevel .. "���Ľ���", 2, x000172_g_NewCard4 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard5].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_NewCardList[x000172_g_NewCard5].needLevel .. "���Ľ���", 2, x000172_g_NewCard5 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard6].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_NewCardList[x000172_g_NewCard6].needLevel .. "���Ľ���", 2, x000172_g_NewCard6 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard7].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_NewCardList[x000172_g_NewCard7].needLevel .. "���Ľ���", 2, x000172_g_NewCard7 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard8].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "��ȡ" .. x000172_g_NewCardList[x000172_g_NewCard8].needLevel .. "���Ľ���", 2, x000172_g_NewCard8 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ������ȡ���еĲƸ���������" )
	end
end

--**********************************
--ת��
--**********************************
function x000172_LevelUp (sceneId, selfId, targetId)
	if GetExp(sceneId,selfId) >= 1000000000 and GetLevel(sceneId,selfId) >= 149  then 
		BeginEvent( sceneId )
			SetLevel( sceneId,selfId, 49)
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			ZengDian(SceneId,selfId,targetId,1,1000000)
			AddText(sceneId,"��ϲ��,�ɹ�ת�� ")
		EndEvent( sceneId )
	else

		BeginEvent( sceneId )
			AddText(sceneId,".������δ�ɹ�,ͬ־����Ŭ��,��149���������Ұ�,����Ҫ�ܹ�10�ھ���Ŷ...")
		EndEvent( sceneId )
		
	end
	

	DispatchEventList( sceneId, selfId, targetId )

end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x000172_OnEventRequest( sceneId, selfId, targetId, eventId )


	if x000172_g_NewCardIntro == GetNumText() then
		
		BeginEvent( sceneId )
			AddText( sceneId, "#{XinShouKa_Help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	end

	if GetNumText() == 0 then
		x000172_CheckCDKey( sceneId, selfId, targetId )
	elseif GetNumText() == x000172_g_Intro then
		x000172_Introduce( sceneId, selfId, targetId )
	elseif x000172_g_AwardList[GetNumText()] then
		x000172_GetAward( sceneId, selfId, targetId, GetNumText() )
	elseif GetNumText() == 8 then
		x000172_CheckNewUserCard(sceneId, selfId, targetId)
	elseif x000172_g_NewCardList[GetNumText()] then
		x000172_GetNewCardPrize( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
		x000172_AddNewUserCardNumText(sceneId,selfId,targetId)
	elseif GetNumText() == 201 then
		x000172_AddCDKeyNumText(sceneId, selfId, targetId)	
         elseif GetNumText() == 102 then  
               YuanBao(sceneId,selfId,targetId,1,100000) 
                 BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:���ɹ���ȡ10��Ԫ��", 0) 
                BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD: Я��Ԫ����������Ϊ100�򣬳�����Ч��", 0 )
         elseif GetNumText() == 123 then  
               ZengDian(sceneId,selfId,targetId,1,100000) 
                 BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:���ɹ���ȡ10������", 0) 
	elseif GetNumText() == 	x000172_g_LevelUp then
		x000172_LevelUp(sceneId, selfId, targetId)	
	end
		
	for i, eventId in x000172_g_eventList do		
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end	
	
end

--**********************************
-- ��� CDKey
--**********************************
function x000172_CheckCDKey( sceneId, selfId, targetId )
	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		return
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ�������Ƹ������޷��ټ���cdkey��" )
		--return
	--end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    �Բ������Ѿ�����10�����޷������콱������" )
		--return
	--end

	CallScriptFunction( PRIZE_SCRIPT_ID, "AskCDKey", sceneId, selfId )

	-- ����Ϊ����ʹ��
	-- SetMissionFlag( sceneId, selfId, MF_GetAwardFlag, 1 )
end

--**********************************
-- ��� �Ƹ���
--**********************************
function x000172_CheckNewUserCard( sceneId, selfId, targetId )
	--if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ������cdkey���޷��ټ���Ƹ�����" )
		--return
	--end
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ���Ѿ�������Ƹ����������ٴμ��" )
		return
	end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ĵȼ��Ѿ�����10�����޷��ټ���Ƹ�����" )
		--return
	--end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x000172_g_VirtualNew )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x000172_g_VirtualNew, 1 )
		if ret < 1 then
			return
		end
		--�Ƹ��������⿨����
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ϲ�����Ѿ�����Ƹ����ɹ�������һ���ȼ�֮�����������������ȡ������" )
	else
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
function x000172_Introduce( sceneId, selfId, targetId )
	x000172_NotifyFailBox( sceneId, selfId, targetId, "    Cdkey�������ƹ�Ա�������û������кţ�ʹ�ô����к���ҳ�漤��֮�󣬿��Ե���Ϸ����ȡ����Ľ���������ֻ����ȡһ�Ρ�" )
end

--**********************************
-- ��CD-KEY��Ʒ
--**********************************
function x000172_GetAward( sceneId, selfId, targetId, grade )
	local awardInfo = x000172_g_AwardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) ~= 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ����ʱ�޷���ȡ��������" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    �ţ���ĵȼ����������ȼ��ﵽ" .. awardInfo.needLevel .. "���������Ұɡ�" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.PropBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.MatBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.TaskBagSpaceNeed .. "��" )
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
		AddMoney( sceneId, selfId, awardInfo.moneyReward )
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- ��Ƹ�����Ʒ
--**********************************
function x000172_GetNewCardPrize( sceneId, selfId, targetId, grade )
	local awardInfo = x000172_g_NewCardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- �����
	end

	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) ~= 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ����ʱ�޷���ȡ��������" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    �ţ���ĵȼ����������ȼ��ﵽ" .. awardInfo.needLevel .. "���������Ұɡ�" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.PropBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.MatBagSpaceNeed .. "��" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��ı���������������Ҫ����" .. awardInfo.TaskBagSpaceNeed .. "��" )
		return
	end
	
	if grade == x000172_g_NewCard3 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x000172_NotifyFailBox( sceneId, selfId, targetId, "    ��Я�������������������Է���һ������������λ��" )
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
		if grade == x000172_g_NewCard4 or grade == x000172_g_NewCard5 or grade == x000172_g_NewCard6 or grade == x000172_g_NewCard7 or grade == x000172_g_NewCard8 then
			ZengDian(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			AddMoney( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x000172_g_NewCard3 then
		local mItem = x000172_GetMenpaiTaoEquip(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
		LuaFnCreatePetToHuman(sceneId, selfId, 3359, 1, 0)
	end
	
	if grade == x000172_g_NewCard7 then
		local mItem = x000172_GetMenpaiYaoJue(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x000172_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

-- ������װ
function x000172_GetMenpaiTaoEquip(mid)
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
function x000172_GetMenpaiYaoJue(mid)
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
