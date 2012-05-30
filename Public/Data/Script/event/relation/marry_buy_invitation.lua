--��������

--�ű���
x806017_g_ScriptId = 806017;

x806017_g_invitationDataId_level1  = 30303100;		-- ��ͨ����ID
x806017_g_invitationDataId_level2  = 30303101;		-- �߼�����ID
x806017_g_invitationDataId_level3  = 30303102;		-- ��������ID


--EventId����
--1234
--||++--�������(1,5,10)
--|+----����ȼ�(0,1,2)
--+-----�˵�ID(0=ˢ���б�1=ѡ��ȼ���2=ѡ�������3=�Ƿ�ȷ��)

x806017_g_eventId_update = 0;			--ˢ���б�
x806017_g_eventId_cancel = 1;			--�ر�
x806017_g_eventId_select_level = 1000;	--ѡ��ȼ�
x806017_g_eventId_select_count = 2000;	--ѡ�����
x806017_g_eventId_select_buy = 3000;	--�Ƿ�ȷ��

--x806017_g_eventId_update = 0;				-- ��������
--x806017_g_eventId_level_0 = 1000;			-- ��ͨ����
--x806017_g_eventId_level_1 = 1100;			-- �߼�����
--x806017_g_eventId_level_2 = 1200;			-- ��������

--x806017_g_eventId_count_0_1 = 2001;		-- ����һ����ͨ����
--x806017_g_eventId_count_0_5 = 2005;		-- ����������ͨ����
--x806017_g_eventId_count_0_10 = 2010;		-- ����ʮ����ͨ����
					   
--x806017_g_eventId_count_1_1 = 2101;		-- ����һ�Ÿ߼�����
--x806017_g_eventId_count_1_5 = 2105;		-- �������Ÿ߼�����
--x806017_g_eventId_count_1_10 = 2110;		-- ����ʮ�Ÿ߼�����
					   
--x806017_g_eventId_count_2_1 = 2201;		-- ����һ�ź�������
--x806017_g_eventId_count_2_5 = 2205;		-- �������ź�������
--x806017_g_eventId_count_2_10 = 2210;		-- ����ʮ�ź�������

--x806017_g_eventId_buy_0_1 = 3001;			-- ����һ����ͨ����
--x806017_g_eventId_buy_0_5 = 3005;			-- ����������ͨ����
--x806017_g_eventId_buy_0_10 = 3010;		-- ����ʮ����ͨ����
					  
--x806017_g_eventId_buy_1_1 = 3101;			-- ����һ�Ÿ߼�����
--x806017_g_eventId_buy_1_5 = 3105;			-- �������Ÿ߼�����
--x806017_g_eventId_buy_1_10 = 3110;		-- ����ʮ�Ÿ߼�����
					  
--x806017_g_eventId_buy_2_1 = 3201;			-- ����һ�ź�������
--x806017_g_eventId_buy_2_5 = 3205;			-- �������ź�������
--x806017_g_eventId_buy_2_10 = 3210;		-- ����ʮ�ź�������

--**********************************
--������ں���
--**********************************
function x806017_OnDefaultEvent(sceneId, selfId, targetId)
	local selectEventId = GetNumText();

	if selectEventId then
		if selectEventId > x806017_g_eventId_select_buy - 1 then
			local level = floor((selectEventId - x806017_g_eventId_select_buy)/100);
			local count = mod(selectEventId, 100);
			x806017_OnBuy(sceneId, selfId, targetId, level, count);
			
		elseif selectEventId > x806017_g_eventId_select_count - 1 then
			local level = floor((selectEventId - x806017_g_eventId_select_count)/100);
			local count = mod(selectEventId, 100);
			x806017_OnSelectCount(sceneId, selfId, targetId, level, count);
			
		elseif selectEventId > x806017_g_eventId_select_level - 1 then
			local level = floor((selectEventId - x806017_g_eventId_select_level)/100);
			x806017_OnSelectLevel(sceneId, selfId, targetId, level);
			
		elseif selectEventId == x806017_g_eventId_update then
			x806017_OnUpdate(sceneId, selfId, targetId);
		else
			BeginUICommand(sceneId);
			EndUICommand(sceneId);
			DispatchUICommand(sceneId, selfId, 1000);
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x806017_OnEnumerate(sceneId, selfId, targetId)
	--local isMarried = LuaFnIsMarried(sceneId, selfId);
	--if isMarried and isMarried == 0 then
		AddNumText(sceneId, x806017_g_ScriptId, "��������", 7, x806017_g_eventId_update);
	--end
end

--**********************************
--ˢ�¹��������ĵȼ��б���¼�
--**********************************
function x806017_OnUpdate(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		AddText(sceneId, "����������Ч�ڵģ���Ч��һ���£�����û׼���ý���ʱ��Ҫ���繺�򰡡���ֻҪ���������׸�������ѣ�������ѾͿ���ʹ�ô���Ʒ�μ����Ļ����ˡ�");
		AddNumText(sceneId, x806017_g_ScriptId, "����"..x806017_GetItemLevelNameByLevel(sceneId, selfId, 0).."����", 7, 0 * 100 + x806017_g_eventId_select_level);
		AddNumText(sceneId, x806017_g_ScriptId, "����"..x806017_GetItemLevelNameByLevel(sceneId, selfId, 1).."����", 7, 1 * 100 + x806017_g_eventId_select_level);
		AddNumText(sceneId, x806017_g_ScriptId, "����"..x806017_GetItemLevelNameByLevel(sceneId, selfId, 2).."����", 7, 2 * 100 + x806017_g_eventId_select_level);
		AddNumText(sceneId, x806017_g_ScriptId, "�뿪����", 8, x806017_g_eventId_cancel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--ѡ�������ĵȼ����¼�
--**********************************
function x806017_OnSelectLevel(sceneId, selfId, targetId, itemLevel)
	BeginEvent(sceneId);
		AddText(sceneId, "��ѡ����Ҫ�����������");
		AddNumText(sceneId, x806017_g_ScriptId, "һ��", 6, itemLevel * 100 + x806017_g_eventId_select_count + 1);
		AddNumText(sceneId, x806017_g_ScriptId, "����", 6, itemLevel * 100 + x806017_g_eventId_select_count + 5);
		AddNumText(sceneId, x806017_g_ScriptId, "ʮ��", 6, itemLevel * 100 + x806017_g_eventId_select_count + 10);
		AddNumText(sceneId, x806017_g_ScriptId, "����", 8, 0);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--ѡ���������������¼�
--**********************************
function x806017_OnSelectCount(sceneId, selfId, targetId, itemLevel, itemCount)
	if itemLevel and itemCount then
		BeginEvent(sceneId);
			local szText = format("����%d��%s���������軨��#{_EXCHG%d}���Ƿ�ȷ�Ϲ���", itemCount, x806017_GetItemLevelNameByLevel(sceneId, selfId, itemLevel), itemCount * x806017_GetItemPriceByLevel(sceneId, selfId, itemLevel) );
			AddText(sceneId, szText);
			AddNumText(sceneId, x806017_g_ScriptId, "ȷ��", 6, itemLevel * 100 + x806017_g_eventId_select_buy + itemCount);
			AddNumText(sceneId, x806017_g_ScriptId, "ȡ��", 8, itemLevel * 100 + x806017_g_eventId_select_level);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--ѡ�������ĵȼ�
--**********************************
function x806017_OnBuy(sceneId, selfId, targetId, itemLevel, itemCount)
	if itemLevel and itemCount and itemCount > 0 then
		--�����û����ô��Ǯ
		local itemPrice = x806017_GetItemPriceByLevel(sceneId, selfId, itemLevel);
		local money = LuaFnGetMoney(sceneId, selfId);
		local moneyJZ = GetMoneyJZ(sceneId, selfId);
		local needMoney = itemPrice * itemCount;
		if money and needMoney and moneyJZ and (money + moneyJZ) < needMoney then
		  x806017_MessageBox(sceneId, selfId, targetId, "�ܱ�Ǹ����û���㹻�Ľ�Ǯ��", 1);
			return 0;
		end
		
		--�����û�б����ռ�
		local selfProSpace = LuaFnGetPropertyBagSpace(sceneId, selfId);
		if selfProSpace and selfProSpace > itemCount - 1 then
		else
			x806017_MessageBox(sceneId, selfId, targetId, "�ܱ�Ǹ����ı���û���㹻�Ŀռ䣡", 1);
			return 0;
		end
		
		--��Ǯ
		LuaFnCostMoneyWithPriority(sceneId, selfId, needMoney);
		
		--����Ʒ
		local selfName = LuaFnGetName(sceneId, selfId);
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		local itemId = x806017_GetItemDataByLevel(sceneId, selfId, itemLevel);
		local i;
		for i = 0, itemCount - 1 do
			pos	= TryRecieveItem(sceneId, selfId, itemId, 1);
			if pos and pos ~= -1 then
				LuaFnSetItemCreator(sceneId, selfId, pos, selfName);
				SetBagItemParam(sceneId, selfId, pos, 0, 2, selfGUID);
			end
		end
	end
	x806017_OnSelectLevel(sceneId, selfId, targetId, itemLevel);
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806017_MessageBox(sceneId, selfId, targetId, msg, showReturn)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
		if showReturn and showReturn == 1 then
			AddNumText(sceneId, x806017_g_ScriptId, "����", 8, x806017_g_eventId_update);
		end
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--ȡ��Ʒ������
--**********************************
function x806017_GetItemLevelNameByLevel(sceneId, selfId, level)
	if level == 2 then
		return "����";
	elseif level == 1 then
		return "�߼�";
	else
		return "��ͨ";
	end
	return "";
end

--**********************************
--ȡ��Ʒ��ID
--**********************************
function x806017_GetItemDataByLevel(sceneId, selfId, level)
	local itemId = -1;
	if level == 2 then
		itemId = x806017_g_invitationDataId_level3;
	elseif level == 1 then
		itemId = x806017_g_invitationDataId_level2;
	else
		itemId = x806017_g_invitationDataId_level1;
	end
	return itemId;
end

--**********************************
--ȡ��Ʒ�ļ۸�
--**********************************
function x806017_GetItemPriceByLevel(sceneId, selfId, level)
	local itemId = x806017_GetItemDataByLevel(sceneId, selfId, level);
	local price = LuaFnGetItemPrice(sceneId, itemId);
	return price;
end
