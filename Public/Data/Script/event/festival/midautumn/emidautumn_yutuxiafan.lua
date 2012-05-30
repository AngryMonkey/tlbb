-- �һ���������

-- �ű���
x050017_g_ScriptId = 050017

x050017_g_eventId_cancel = 0;		-- ȡ��
x050017_g_eventId_redeem = 1;		-- �һ�
x050017_g_eventId_redeem_5 = 2;		-- �һ�5��
x050017_g_eventId_redeem_45 = 3;	-- �һ�45��
x050017_g_eventId_redeem_55 = 4;	-- �һ�55��
x050017_g_eventId_redeem_65 = 5;	-- �һ�65��
x050017_g_eventId_about = 10;		-- ����

--�һ��б�
x050017_g_redeemList = {};
 x050017_g_redeemList[x050017_g_eventId_redeem_5] = {count=10, level=5, item=30505126, petName="����"}
x050017_g_redeemList[x050017_g_eventId_redeem_45] = {count=45, level=45, item=30505127, petName="�������"}
x050017_g_redeemList[x050017_g_eventId_redeem_55] = {count=55, level=55, item=30505128, petName="󸹬����"}
x050017_g_redeemList[x050017_g_eventId_redeem_65] = {count=65, level=65, item=30505129, petName="�϶�����"}

--�������
x050017_g_redeemItemId = 30505125;

--�ʱ��
x050017_g_StartDayTime = 8257   --���ʼʱ�� 2008-9-14,��������
x050017_g_EndDayTime = 8304   --�����ʱ�� 2008-10-31,��������

--**********************************
--�о��¼�
--**********************************
function x050017_OnEnumerate( sceneId, selfId, targetId )
	local check = x050017_IsMidAutumnPeriod(sceneId, selfId);
	if not check or check ~= 1 then
		return
	end
	AddNumText(sceneId, x050017_g_ScriptId, "��Ҫ�һ�����", 6, x050017_g_eventId_redeem);
	--AddNumText(sceneId, x050017_g_ScriptId, "���ڶһ���������", 11, x050017_g_eventId_about);
end

--**********************************
--������ں���
--**********************************
function x050017_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	local selEventId = GetNumText();
	if selEventId then
		if selEventId == x050017_g_eventId_redeem then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_DB1}");
				AddNumText(sceneId, x050017_g_ScriptId, "�һ�Я���ȼ�5��������", 6, x050017_g_eventId_redeem_5);
				AddNumText(sceneId, x050017_g_ScriptId, "�һ�Я���ȼ�45�����������", 6, x050017_g_eventId_redeem_45);
				AddNumText(sceneId, x050017_g_ScriptId, "�һ�Я���ȼ�55����󸹬����", 6, x050017_g_eventId_redeem_55);
				AddNumText(sceneId, x050017_g_ScriptId, "�һ�Я���ȼ�65�����϶�����", 6, x050017_g_eventId_redeem_65);
				AddNumText(sceneId, x050017_g_ScriptId, "��ʱ���һ�����", 6, x050017_g_eventId_cancel);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		elseif selEventId == x050017_g_eventId_redeem_5
			or selEventId == x050017_g_eventId_redeem_45
			or selEventId == x050017_g_eventId_redeem_55
			or selEventId == x050017_g_eventId_redeem_65 then
			local redeemItem = x050017_g_redeemList[selEventId];
			if not redeemItem then
				x050017_NotifyBox(sceneId, selfId, targetId, "δ���ŵ��ߣ����ܶһ���");
				return 0;
			end
			
			local redeemItemName = GetItemName(sceneId, x050017_g_redeemItemId);
			local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050017_g_redeemItemId);
			if not itemCount or itemCount < redeemItem.count then
				x050017_NotifyBox(sceneId, selfId, targetId, "�һ�"..GetItemName(sceneId, redeemItem.item).."��Ҫ"..redeemItem.count.."��"..redeemItemName.."�������ϵ�"..redeemItemName.."���������ܶһ���");
				return 0;
			end
			
			local addItemIndex;
			BeginAddItem(sceneId);
				addItemIndex = AddItem(sceneId, redeemItem.item, 1);
			local ret = EndAddItem(sceneId, selfId);
			if not ret or ret ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "�Բ���������Ʒ���Ѿ�û�пռ������������ƣ��״̬��");
				return 0;
			end
			
			local delRet = LuaFnDelAvailableItem(sceneId, selfId, x050017_g_redeemItemId, redeemItem.count);
			if not delRet or delRet ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "�޷��۳�"..GetItemName(sceneId, redeemItem.item).."��");
				return 0;
			end
			
			AddItemListToHuman(sceneId, selfId);
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			
			local itemTransfer;
			if addItemIndex and addItemIndex  > -1 then
				itemTransfer = GetItemTransfer(sceneId, selfId, addItemIndex);
			end
			
			if itemTransfer then
				if selEventId == x050017_g_eventId_redeem_45 then
					msg = "#Y����Բ��#P��λ���ڣ�#W#{_INFOUSR"..GetName(sceneId, selfId).."}#l���������һ���#{_INFOMSG"..itemTransfer.."}#P������ǿɰ���#G�������#P����Ҿ����ڴ��ɣ�";
				elseif selEventId == x050017_g_eventId_redeem_55 then
					msg = "#Y����Բ��#P���ӣ��������#W#{_INFOUSR"..GetName(sceneId, selfId).."}#l����#{_INFOMSG"..itemTransfer.."}�ٻ�#G󸹬����#P�ˣ�";
				elseif selEventId == x050017_g_eventId_redeem_65 then
					msg = "#Y����Բ��#P�ҵ�����ү�����ѵ��Ǵ�˵�е������ܶ�Ա���ɣ�#W#{_INFOUSR"..GetName(sceneId, selfId).."}#lҲ�һ�#{_INFOMSG"..itemTransfer.."}�ٻ�#G�϶�����#P�֣�";
				else
					msg = "#Y����Բ��#P�����������������������·�����#W#{_INFOUSR"..GetName(sceneId, selfId).."}#l�õ��˴�˵�е�#{_INFOMSG"..itemTransfer.."}�����ڿ����ٻ�#G����#P����";
				end
				
				if msg then
					BroadMsgByChatPipe(sceneId, selfId, msg, 4);
				end
			end
			
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
			return 1;
		elseif selEventId == x050017_g_eventId_cancel then
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		elseif selEventId == x050017_g_eventId_about then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_ABOUT}");
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		end
	end
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x050017_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x050017_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--��Ƿ���
--**********************************
function x050017_IsMidAutumnPeriod(sceneId, selfId)
	local curDay = GetDayTime();
	if not curDay then
		return 0;
	end

	if curDay < x050017_g_StartDayTime or curDay > x050017_g_EndDayTime then
		return 0;
	end

	return 1
end
