-- 891002
-- ��̫�� ��կ������

--�ű���
x891002_g_scriptId = 891002

--��ӵ�е��¼�ID�б�
x891002_g_eventList={891000}

--9����ʯ
x891002_g_LootItem_1 = {
50901001,50901002,50902005,50902006,50902007,50902008,50903001,50904002,
50911001,50911002,50912005,50912006,50912007,50912008,50913001,50913002,
50913003,50913004,50913005,50913006,50914001,50921001,50921002,50921003,
50921004,
}
--���±���
x891002_g_LootItem_2 = {
30504125,30504126,30504127,30504128,30504094,
}
--�������
x891002_g_LootItem_3 = {
30505706,30505706,30505706,
}
--�����¥
x891002_g_LootItem_4 = {
10422016,10423024,10433320,10433321,10433322,10433323,
}
--8����ʯ
x891002_g_LootItem_5 = {
50801001,50801002,50802005,50802006,50802007,50802008,50803001,50804002,
50811001,50811002,50812005,50812006,50812007,50812008,50813001,50813002,
50813003,50813004,50813005,50813006,50814001,50821001,50821002,50821003,
50821004,
}


x891002_g_KaiQuTime = 11281   --����ʱ��

--**********************************
--�¼��б�
--**********************************
function x891002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	--local today = GetDayTime()						--��ǰʱ��
	--AddText(sceneId,"���ڵ�ʱ����"..today.."�ˣ�")
	AddText(sceneId,"  ��������������PK��Ϸ��#Y������ǰ��#W�����뿴��ϸ���ԡ�������#cFF0000��������#Y����ñ����ߣ�#W�ڱ�NPC�һ�����ʱ�����#cFF0000Ԫ��100��#Y�ռ���������")
	AddText(sceneId,"  #G����#W�����ɱ�ֵñ��䣬���б���ֱ�������ᱦ����������ý�����")
	AddText(sceneId,"  #G����ʱ�䣺#Wÿ����#Y19��45-20��00��#r  #G�ᱦʱ�䣺#Wÿ����#Y20��00-21��00��")
	AddText(sceneId,"  #cFF0000������#Wÿ�ζһ�����#Y5��8-9��#W���������ʯ,#G����ұ���,#Y������������,#cFF0000��¥�Ͷ�����ꡣ")
	
	AddNumText( sceneId, x891002_g_scriptId, "�һ���������",4 ,1  )
	AddNumText( sceneId, x891002_g_scriptId, "�����ᱦ����",0 ,2  )
	
	for i, eventId in x891002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--�¼��������
--**********************************
function x891002_OnDefaultEvent( sceneId, selfId,targetId )
	x891002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x891002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1  then
		local nStoneId = 39910008
		local nStoneCount = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)
		if nStoneCount == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B�����ᱦ");
				AddText(sceneId,"  ����Я���������й����һ���");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)		
			return 0
		end

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 200) ~= 0 then
              LuaFnDelAvailableItem(sceneId, selfId, 39910008, 100)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "    �Ƿ�ȡ�ñ��У��Ѿ�ɾ����")
		return
	end

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, 16115) ~= 0 then
              LuaFnDelAvailableItem(sceneId, selfId, 39910008, 100)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "    �Ƿ�ȡ�ñ��У��Ѿ�ɾ����")
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 5 then
		x891002_NotifyFailBox( sceneId, selfId, targetId, "    ��ı����ռ䲻��5�����޷��һ�������")
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 5 then
		x891002_NotifyFailBox( sceneId, selfId, targetId, "  ��ı�����������������5����������������ҡ�" )
		return
	end

	       local today = GetDayTime()						--��ǰʱ��
	       if today == x891002_g_KaiQuTime then
			local bag01 = TryRecieveItem( sceneId, selfId, 39910005, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
			local bag02 = TryRecieveItem( sceneId, selfId, 39910005, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
			local bag03 = TryRecieveItem( sceneId, selfId, 39910005, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
			local bag04 = TryRecieveItem( sceneId, selfId, 39910005, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
			local bag05 = TryRecieveItem( sceneId, selfId, 39910005, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����

			LuaFnItemBind( sceneId, selfId, bag01 )
			LuaFnItemBind( sceneId, selfId, bag02 )
			LuaFnItemBind( sceneId, selfId, bag03 )
			LuaFnItemBind( sceneId, selfId, bag04 )
			LuaFnItemBind( sceneId, selfId, bag05 )
                end

		local ret = LuaFnDelAvailableItem(sceneId, selfId, 39910008, 1)
		if ret > 0   then

	local nItemCount = 2
	local nItemId_1
	local nItemId_2
	local nItemId_3
	local nItemId_4
	local nItemId_5
	local nItemId_6
	local nItemId_7
	local nItemId_8

	nItemId_1 = x891002_g_LootItem_1[random( getn(x891002_g_LootItem_1) )]
	nItemId_2 = x891002_g_LootItem_5[random( getn(x891002_g_LootItem_5) )]
	nItemId_3 = x891002_g_LootItem_5[random( getn(x891002_g_LootItem_5) )]
	nItemId_7 = x891002_g_LootItem_1[random( getn(x891002_g_LootItem_1) )]
	nItemId_8 = x891002_g_LootItem_5[random( getn(x891002_g_LootItem_5) )]


	if random(1000) <= 500  then
		nItemCount = 3
		nItemId_4 = x891002_g_LootItem_2[random( getn(x891002_g_LootItem_2))]
	end

	if random(1000) <= 200  then
		nItemCount = 4
	       nItemId_5 = x891002_g_LootItem_3[random( getn(x891002_g_LootItem_3) )]
	end	
	if random(1000) <= 50  then
		nItemCount = 5
	       nItemId_6 = x891002_g_LootItem_4[random( getn(x891002_g_LootItem_4) )]
	end


	if nItemCount == 2  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- ǿ�ư�										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- ϵͳ����										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00#{_INFOUSR%s}�����Լ�ǧ������õ��������䣬������#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}#W��", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}��һ��.",  itemInfo7, itemInfo8)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "��ϲ���һ����гɹ�����ô���������ϣ�����´μ���Ŭ����" )

	elseif nItemCount == 3  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos04 = TryRecieveItem( sceneId, selfId, nItemId_4, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo4 = GetBagItemTransfer( sceneId, selfId, bagpos04 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- ǿ�ư�										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- ϵͳ����										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00������Ѫ����н�������ྡ����,��������#{_INFOUSR%s}������������ѹȺ�����ڻ����#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}��", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}�Ͷ�����Ʒ#e0e8de5#G#{_INFOMSG%s}��һ��.",  itemInfo7, itemInfo8, itemInfo4)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "��ϲ���һ����гɹ�����ô���������ϣ�����´μ���Ŭ����" )

	elseif nItemCount == 4  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos04 = TryRecieveItem( sceneId, selfId, nItemId_4, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos05 = TryRecieveItem( sceneId, selfId, nItemId_5, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo4 = GetBagItemTransfer( sceneId, selfId, bagpos04 )
	       local itemInfo5 = GetBagItemTransfer( sceneId, selfId, bagpos05 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- ǿ�ư�										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- ϵͳ����										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00�����������������δ�����������н��������ֻ��#{_INFOUSR%s}��һ�����ã������������й�����#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}��", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}��һ����#{_INFOMSG%s}��������Ľ��#{_INFOMSG%s}.",  itemInfo7, itemInfo8, itemInfo4, itemInfo5)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "��ϲ���һ����гɹ�����ô���������ϣ�����´μ���Ŭ����" )

	elseif nItemCount == 5  then
		local bagpos01 = TryRecieveItem( sceneId, selfId, nItemId_1, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos02 = TryRecieveItem( sceneId, selfId, nItemId_2, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos03 = TryRecieveItem( sceneId, selfId, nItemId_3, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos04 = TryRecieveItem( sceneId, selfId, nItemId_4, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos05 = TryRecieveItem( sceneId, selfId, nItemId_5, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos06 = TryRecieveItem( sceneId, selfId, nItemId_6, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos07 = TryRecieveItem( sceneId, selfId, nItemId_7, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����
		local bagpos08 = TryRecieveItem( sceneId, selfId, nItemId_8, QUALITY_MUST_BE_CHANGE )	-- �Ų��¾�û����

	       local itemInfo1 = GetBagItemTransfer( sceneId, selfId, bagpos01 )
	       local itemInfo2 = GetBagItemTransfer( sceneId, selfId, bagpos02 )
	       local itemInfo3 = GetBagItemTransfer( sceneId, selfId, bagpos03 )
	       local itemInfo4 = GetBagItemTransfer( sceneId, selfId, bagpos04 )
	       local itemInfo5 = GetBagItemTransfer( sceneId, selfId, bagpos05 )
	       local itemInfo6 = GetBagItemTransfer( sceneId, selfId, bagpos06 )
	       local itemInfo7 = GetBagItemTransfer( sceneId, selfId, bagpos07 )
	       local itemInfo8 = GetBagItemTransfer( sceneId, selfId, bagpos08 )

		-- ǿ�ư�										
		LuaFnItemBind( sceneId, selfId, bagpos01 )
		LuaFnItemBind( sceneId, selfId, bagpos02 )
		LuaFnItemBind( sceneId, selfId, bagpos03 )

		-- ϵͳ����										
		local playername = GetName(sceneId, selfId)
		local strText = format("#gffff00#{_INFOUSR%s}����������Ʒ��������Ȼ�����#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}#W��", playername, itemInfo1, itemInfo2, itemInfo3)										
		local Text = format("#Y#{_INFOMSG%s}#W��#e0e8de5#G#{_INFOMSG%s}��#e0e8de5#G#{_INFOMSG%s}��#e0e8de5#W#{_INFOMSG%s}}��#e0e8de5#Y#{_INFOMSG%s}�����һ��ף������.",  itemInfo7, itemInfo8, itemInfo4, itemInfo5, itemInfo6)										
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BroadMsgByChatPipe(sceneId, selfId, Text, 4)
		x891002_NotifyFailBox( sceneId, selfId, targetId, "��ϲ���һ����гɹ�����ô���������ϣ�����´μ���Ŭ����" )

	end
		end

		return
	end

	if GetNumText() == 2  then
		BeginEvent( sceneId )
			AddText(sceneId,"�ᱦʱ��Ϊ#Y20��00-21��00��#W����ʱ��Ϊ#Y19��45-21��00��#cFF0000����ʱ�佫���ý��룬#Y21��00#G�ᱦʱ�������#W��ҽ�������ͼ��")
			AddText(sceneId,"�ᱦ��ͼ#Y20��00#W��׼ʱˢ��һ�����ɱ������ڵ�ͼ#Y����λ��#Gˢ��һ��#cFF0000���������еİ���#W���ֿ���#Y����ô˰���")
			AddText(sceneId,"#Y20:00-21:00#WΪս��ʱ�䣬ɱ��#G�õ�����#W����ң�#cFF0000���л���䣬#W��#Y��ͼ����λ�û�#W����ˢ�³�һ������#W���ֿ���#Y����ô˰���")
			AddText(sceneId,"������ͼ#Y���ܶ�λ��#G����ʹ�ô��ͼ��ܣ�#W��ñ���#Y��;���ߣ�#W�������ߺ󽫻�#cFF0000ɾ�����У������л�#Y����ˢ����#W������ҿ��Ի�ã�#G��;����ս��#W����#Y���͵�������")
			AddNumText( sceneId, x889063_g_scriptId, "ȡ��", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end

	for i, findId in x891002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x891002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--�ܾ���NPC������
--**********************************
function x891002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			x891002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�������Ѿ���������
--**********************************
function x891002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--�ύ�����������
--**********************************
function x891002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x891002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--�����¼�
--**********************************
function x891002_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x891002_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
