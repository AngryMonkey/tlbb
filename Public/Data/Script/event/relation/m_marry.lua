--�������

--�ű���
x806003_g_ScriptId		= 806003

x806003_g_eventId_marry = 0;				-- ��������¼�ID
x806003_g_eventId_selectLevel1 = 1;			-- ѡ��һ���ģ������¼�ID
x806003_g_eventId_selectLevel2 = 2;			-- ѡ���еȹ�ģ������¼�ID
x806003_g_eventId_selectLevel3 = 3;			-- ѡ�������ģ������¼�ID
x806003_g_eventId_selectLevelCancel = 4;	-- ȡ��ѡ������ģ���¼�ID
x806003_g_eventId_selfAcceptLevel1 = 5;		-- ����ȷ����ѡ��һ���ģ����
x806003_g_eventId_selfAcceptLevel2 = 6;		-- ����ȷ����ѡ���еȹ�ģ����
x806003_g_eventId_selfAcceptLevel3 = 7;		-- ����ȷ����ѡ�������ģ����
x806003_g_eventId_selfCancelLevel = 8;		-- ����ȡ����ѡ������ģ
x806003_g_eventId_targetAcceptLevel1 = 9;	-- �Է�ȷ����ѡ��һ���ģ����
x806003_g_eventId_targetAcceptLevel2 = 10;	-- �Է�ȷ����ѡ���еȹ�ģ����
x806003_g_eventId_targetAcceptLevel3 = 11;	-- �Է�ȷ����ѡ�������ģ����
x806003_g_eventId_targetCancelLevel = 12;	-- �Է�ȡ����ѡ������ģ
x806003_g_eventId_end = 13;					-- ������

x806003_g_ticketItemId = 30505079;			-- �߼�����ȯID
x806003_g_ticketItemId2 = 30505106;			-- �м�����ȯID

--**********************************
--������ں��� ������
--**********************************
function x806003_OnDefaultEvent(sceneId, selfId, targetId)
	local selectEventId	= GetNumText();

	--��������¼�
	if x806003_g_eventId_marry == selectEventId then
		local canMarry = x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId);
		if canMarry == 1 then
			x806003_OpenMarryLevelUI(sceneId, selfId, targetId);
		end
	--ѡ������ģ���¼�
	elseif x806003_g_eventId_selectLevel1 == selectEventId or x806003_g_eventId_selectLevel2 == selectEventId or x806003_g_eventId_selectLevel3 == selectEventId then
	
		local marryLevel = 0;
		--�е�
		if x806003_g_eventId_selectLevel2 == selectEventId then
			marryLevel  = 1;
		--����
		elseif x806003_g_eventId_selectLevel3 == selectEventId then
			marryLevel  = 2;
		end
	
		x806003_SelfCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
		
	--ȡ��ѡ������ģ���¼�
	elseif x806003_g_eventId_selectLevelCancel == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
		
	--����ȷ����ѡ��
	elseif x806003_g_eventId_selfAcceptLevel1 == selectEventId or x806003_g_eventId_selfAcceptLevel2 == selectEventId or x806003_g_eventId_selfAcceptLevel3 == selectEventId then
	
		local marryLevel = 0;
		--�е�
		if x806003_g_eventId_selfAcceptLevel2 == selectEventId then
			marryLevel  = 1;
		--����
		elseif x806003_g_eventId_selfAcceptLevel3 == selectEventId then
			marryLevel  = 2;
		end
		
		x806003_OnSelfAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
	
	--����ȡ����ѡ������ģ
	elseif x806003_g_eventId_selfCancelLevel == selectEventId then
		local canMarry = x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId);
		if canMarry == 1 then
			x806003_OpenMarryLevelUI(sceneId, selfId, targetId);
		end
		
	--�Է�ȷ����ѡ��
	elseif x806003_g_eventId_targetAcceptLevel1 == selectEventId or x806003_g_eventId_targetAcceptLevel2 == selectEventId or x806003_g_eventId_targetAcceptLevel3 == selectEventId then
	
		local marryLevel = 0;
		--�е�
		if x806003_g_eventId_targetAcceptLevel2 == selectEventId then
			marryLevel  = 1;
		--����
		elseif x806003_g_eventId_targetAcceptLevel3 == selectEventId then
			marryLevel  = 2;
		end
		
		x806003_OnTargetAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
	
	--�Է�ȡ����ѡ������ģ
	elseif x806003_g_eventId_targetCancelLevel == selectEventId then
	
		x806003_OnTargetCancelSelectMarryLevel(sceneId, selfId, targetId);
	
	--������
	elseif x806003_g_eventId_end == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end
end

--**********************************
--�о��¼�
--**********************************
function x806003_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x806003_g_ScriptId, "������", 10, x806003_g_eventId_marry);
end

--**********************************
--����Ƿ������ڽ�������
--**********************************
function x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId)
	local ret, maleId, femaleId = x806003_CheckMarry(sceneId, selfId, targetId, 0, 1);
	return ret;
end

--**********************************
-- �����ģ��ѡ��ҳ��
--**********************************
function x806003_OpenMarryLevelUI(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		local moneyLevel0 = x806003_CalcNeedMoney(0);
		local moneyLevel1 = x806003_CalcNeedMoney(1);
		local moneyLevel2 = x806003_CalcNeedMoney(2);
		AddText(sceneId, "#{yuelao_jiehun}#rһ���ģ�Ļ�����Ҫ����#{_EXCHG"..moneyLevel0.."}���еȹ�ģ�Ļ�����Ҫ����#{_EXCHG"..moneyLevel1.."}��������ģ�Ļ�����Ҫ����#{_EXCHG"..moneyLevel2.."}��");
		AddNumText(sceneId, x806003_g_ScriptId, "һ���ģ�Ļ���", 6, x806003_g_eventId_selectLevel1);
		AddNumText(sceneId, x806003_g_ScriptId, "�еȹ�ģ�Ļ���", 6, x806003_g_eventId_selectLevel2);
		AddNumText(sceneId, x806003_g_ScriptId, "������ģ�Ļ���", 6, x806003_g_eventId_selectLevel3);
		AddNumText(sceneId, x806003_g_ScriptId, "����ʱ��׼����顭��", 8, x806003_g_eventId_selectLevelCancel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
-- ����ȷ��ѡ���ҳ��
--**********************************
function x806003_SelfCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel)
	
	LuaFnSetHumanMarryInfo(sceneId, selfId, -1, 0);

	BeginEvent(sceneId);
		if marryLevel == 2 then
			AddText(sceneId, "��ѡ����"..x806003_GetMarryLevelName(marryLevel).."��ͬʱ�㽫Ҫ֧��#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W��#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}��#r�����Ƿ��Ѿ������ý�飬�����ڽ������������У����벻���أ�");
		else
			AddText(sceneId, "��ѡ����"..x806003_GetMarryLevelName(marryLevel).."��ͬʱ�㽫Ҫ֧��#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W��#Y"..GetItemName(sceneId, x806003_g_ticketItemId2).."#W��#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}��#r�����Ƿ��Ѿ������ý�飬�����ڽ������������У����벻���أ�");
		end
		local tempAcceptEventID = x806003_g_eventId_selfAcceptLevel1;
		if marryLevel == 1 then
			tempAcceptEventID = x806003_g_eventId_selfAcceptLevel2;
		elseif marryLevel == 2 then
			tempAcceptEventID = x806003_g_eventId_selfAcceptLevel3;
		end		
		AddNumText(sceneId, x806003_g_ScriptId, "ȷ��", 6, tempAcceptEventID);
		AddNumText(sceneId, x806003_g_ScriptId, "ȡ��", 8, x806003_g_eventId_selfCancelLevel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
	
end

--**********************************
-- �����Ѿ�ȷ�������ѡ����¼�
--**********************************
function x806003_OnSelfAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		marryTargetGUID = LuaFnGetGUID(sceneId, marryTargetId);
		LuaFnSetHumanMarryInfo(sceneId, selfId, marryTargetGUID, 1);
		
		x806003_TargetCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
		
		x806003_MessageBox(sceneId, selfId, targetId, "�ȴ��Է�ȷ������");
		
	end
end

--**********************************
-- �Է�ȷ��ѡ���ҳ��
--**********************************
function x806003_TargetCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		LuaFnSetHumanMarryInfo(sceneId, marryTargetId, -1, 0);
		
		BeginEvent(sceneId);
			if marryLevel == 2 then
				AddText(sceneId, "�Է�ѡ����"..x806003_GetMarryLevelName(marryLevel).."��ͬʱ�Է���Ҫ֧��#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W��#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}��#r�����Ƿ��Ѿ������ý�飬�����ڽ������������У����벻���أ�");
			else
				AddText(sceneId, "�Է�ѡ����"..x806003_GetMarryLevelName(marryLevel).."��ͬʱ�Է���Ҫ֧��#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W��#Y"..GetItemName(sceneId, x806003_g_ticketItemId2).."#W��#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}��#r�����Ƿ��Ѿ������ý�飬�����ڽ������������У����벻���أ�");
			end
			local tempAcceptEventID = x806003_g_eventId_targetAcceptLevel1;
			if marryLevel == 1 then
				tempAcceptEventID = x806003_g_eventId_targetAcceptLevel2;
			elseif marryLevel == 2 then
				tempAcceptEventID = x806003_g_eventId_targetAcceptLevel3;
			end
			AddNumText(sceneId, x806003_g_ScriptId, "ȷ��", 6, tempAcceptEventID);
			AddNumText(sceneId, x806003_g_ScriptId, "ȡ��", 8, x806003_g_eventId_targetCancelLevel);
		EndEvent(sceneId);
		DispatchEventList(sceneId, marryTargetId, targetId);
	end
end

--**********************************
-- �Է��Ѿ�ȷ�������ѡ����¼�
--**********************************
function x806003_OnTargetAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		--��ʱ��self=�Է�
		marryTargetGUID = LuaFnGetGUID(sceneId, marryTargetId);
		LuaFnSetHumanMarryInfo(sceneId, selfId, marryTargetGUID, 1);

		local checkRet, maleId, femaleId = x806003_CheckMarry(sceneId, marryTargetId, targetId, marryLevel, 0);
		if checkRet == 1 then
			x806003_DoMarry(sceneId, marryTargetId, targetId, marryLevel, maleId, femaleId);
		end
		
	end
end

--**********************************
-- �Է��Ѿ�ȡ�������ѡ����¼�
--**********************************
function x806003_OnTargetCancelSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	--�ر����ѵĴ���
	BeginUICommand(sceneId);
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 1000);
	
	--��ʾ��Ϣ���Է�
	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 0, targetId);
	
	if marryTargetId ~= -1 then
	
		x806003_MessageBox(sceneId, marryTargetId, targetId, "�Է��ܾ����㣡");
		
	end
end

--**********************************
-- �ж��Ƿ���Խ��
--**********************************
function x806003_CheckMarry(sceneId, selfId, targetId, marryLevel, isCheckOpenMarryLevelUI)
	local szMsg = "�����Ҫ���Ļ���������Ů˫��һ�����֮���������ҡ�"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	szMsg = "�����ӵĶ������ֻ������Ů˫����ɣ������в�����������Ա��"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "ֻ�����˾��ߵ������֮����ܽ�顣"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "����˫��Ϊ���Բſ��Խ�顣"
	local maleId = -1;
	local femaleId = -1;
	local marryTargetId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
		if memId ~= selfId then
			marryTargetId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "���ʱ�з���Ҫ�ﵽ35����Ů����Ҫ�ﵽ20����"
	if LuaFnGetLevel(sceneId, maleId) < 35 or LuaFnGetLevel(sceneId, femaleId) < 20 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "����˫����Ϊδ����ܽ�顣"
	if LuaFnIsMarried(sceneId, maleId) > 0 or LuaFnIsMarried(sceneId, femaleId) > 0 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "�����Ҫ��飬˫�����Ѻöȱ��뵽��1000��"
	if LuaFnIsFriend(sceneId, maleId, femaleId) ~= 1 or LuaFnIsFriend(sceneId, femaleId, maleId) ~= 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	if LuaFnGetFriendPoint(sceneId, maleId, femaleId) < 1000 or LuaFnGetFriendPoint(sceneId, femaleId, maleId) < 1000 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "������ʦͽ����ô���Խ���أ�"
	if LuaFnIsMaster(sceneId, maleId, femaleId) == 1 or LuaFnIsMaster(sceneId, femaleId, maleId) == 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "�Ѿ���ݵ�˫���ǲ��ܽ��ġ�"
	if LuaFnIsBrother(sceneId, maleId, femaleId) == 1 or LuaFnIsBrother(sceneId, femaleId, maleId) == 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	if isCheckOpenMarryLevelUI and isCheckOpenMarryLevelUI == 1 then
		return 1, -1, -1;
	end
	
	local ticketItemPos = -1;
	local selectTicketItemId = -1;
	if marryLevel == 2 then
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
		selectTicketItemId = x806003_g_ticketItemId;
	else
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId2);
		selectTicketItemId = x806003_g_ticketItemId2;
		if not ticketItemPos or ticketItemPos < 0 then
			ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
			selectTicketItemId = x806003_g_ticketItemId;
		end
	end
	if ticketItemPos and ticketItemPos > -1 then
		local checkRet = LuaFnIsItemAvailable(sceneId, selfId, ticketItemPos);
		if not checkRet or checkRet ~= 1 then
			x806003_MessageBox(sceneId, selfId, targetId, "���#Y"..GetItemName(sceneId, selectTicketItemId).."#W�������ˣ��������ڻ����ܽ����ҡ�");
			x806003_MessageBox(sceneId, marryTargetId, targetId, "�Է���#Y"..GetItemName(sceneId, selectTicketItemId).."#W�������ˣ��������ڻ����ܽ����ҡ�");
			return 0, -1, -1;
		end
	else
	--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		local needMoney = x806003_CalcNeedMoney(marryLevel);
		if nMoneyJZ and nMoneyJB and nMoneySelf and needMoney and nMoneySelf >= needMoney then
		else
			szMsg = "�Բ��������ϵĽ�Ǯ���㡣"
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
			szMsg = "�Բ��𣬶Է����ϵĽ�Ǯ���㡣"
			x806003_MessageBox(sceneId, marryTargetId, targetId, szMsg);
			return 0, -1, -1;
		end
	end
	
	szMsg = "��Ʒ�����ռ��������޷����ý���ָ������˫���ı�����"
	local maleProSpace = LuaFnGetPropertyBagSpace(sceneId, maleId);
	local femaleProSpace = LuaFnGetPropertyBagSpace(sceneId, femaleId);
	if maleProSpace < 1 or femaleProSpace < 1 then
		x806003_MessageBox(sceneId, maleId, targetId, szMsg);
		x806003_MessageBox(sceneId, femaleId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	local selfTaskCount = GetMissionCount(sceneId, selfId);
	if selfTaskCount >= 20 then
		szMsg = "�����¼�������޷���ȡ������"
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		szMsg = "�Է������¼�������޷���ȡ������"
		x806003_MessageBox(sceneId, marryTargetId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	szMsg = "˫����û����ȫͬ���顣"
	local maleGUID = LuaFnGetGUID(sceneId, maleId);
	local femaleGUID = LuaFnGetGUID(sceneId, femaleId);
	local maleIsAccept, maleTargetGUID = LuaFnGetHumanMarryInfo(sceneId, maleId);
	if maleIsAccept and maleIsAccept == 1 and maleTargetGUID and maleTargetGUID == femaleGUID then
	else
		x806003_MessageBox(sceneId, maleId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	local femaleIsAccept, femaleTargetGUID = LuaFnGetHumanMarryInfo(sceneId, femaleId);
	if femaleIsAccept and femaleIsAccept == 1 and femaleTargetGUID and femaleTargetGUID == maleGUID then
	else
		x806003_MessageBox(sceneId, femaleId, targetId, szMsg);
		return 0, -1, -1;
	end

	return 1, maleId, femaleId;
end

--**********************************
-- ������
--**********************************
function x806003_DoMarry(sceneId, selfId, targetId, marryLevel, maleId, femaleId)
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		return 0;
	end

	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		return 0;
	end

	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		return 0;
	end

	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end

	if maleId == -1 or femaleId == -1 then
		return 0;
	end

	--��Ǯ
	local ticketItemPos = -1;
	local selectTicketItemId = -1;
	if marryLevel == 2 then
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
		selectTicketItemId = x806003_g_ticketItemId;
	else
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId2);
		selectTicketItemId = x806003_g_ticketItemId2;
		if not ticketItemPos or ticketItemPos < 0 then
			ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
			selectTicketItemId = x806003_g_ticketItemId;
		end
	end
	if ticketItemPos and ticketItemPos > -1 then
		local checkRet = LuaFnIsItemAvailable(sceneId, selfId, ticketItemPos);
		if not checkRet or checkRet ~= 1 then
			return 0;
		end
		
		local eraseItemRet = EraseItem(sceneId, selfId, ticketItemPos);
		if not eraseItemRet or eraseItemRet ~= 1 then
			return 0;
		end
	else
		--local money = LuaFnGetMoney(sceneId, selfId);
		--local needMoney = x806003_CalcNeedMoney(marryLevel);
		--if money and needMoney and money >= needMoney then
		--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		local needMoney = x806003_CalcNeedMoney(marryLevel);
		if nMoneyJZ and nMoneyJB and nMoneySelf and needMoney and nMoneySelf >= needMoney then
		else
			return 0;
		end

		--LuaFnCostMoney(sceneId, selfId, needMoney);	
		LuaFnCostMoneyWithPriority(sceneId, selfId, needMoney);	
	end

	--���ӳƺ�
	local maleName = LuaFnGetName(sceneId, maleId);
	local femaleName = LuaFnGetName(sceneId, femaleId);

	LuaFnAwardSpouseTitle(sceneId, femaleId, maleName .. "������");
	DispatchAllTitle(sceneId, femaleId);

	LuaFnAwardSpouseTitle(sceneId, maleId, femaleName .. "�ķ��");
	DispatchAllTitle(sceneId, maleId);

	--����ָ
	local pos;
	local ringItemId = x806003_GetRingByMarryLevel(marryLevel);
	pos	= TryRecieveItem(sceneId, maleId, ringItemId, 1);
	if pos and pos ~= -1 then
		LuaFnSetItemCreator(sceneId, maleId, pos, femaleName);
	end

	pos	= TryRecieveItem(sceneId, femaleId, ringItemId, 1);
	if pos and pos ~= -1 then
		LuaFnSetItemCreator(sceneId, femaleId, pos, maleName);
	end
	
	--���»��������0
	SetMissionData( sceneId, maleId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	SetMissionData( sceneId, femaleId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	
	--��ʽ���
	LuaFnMarry(sceneId, maleId, femaleId, marryLevel);
	
	--����������
	CallScriptFunction( 250036, "OnAccept", sceneId, selfId, marryLevel);

	--���촰�ڸ��з���ʾ
	--Msg2Player(sceneId, maleId, "��ϲ���"..femaleName.."��Ϊ���ޣ�", MSG2PLAYER_PARA);
	Msg2Player(sceneId, maleId, "������˳ƺ�'"..femaleName.."�ķ��'��", MSG2PLAYER_PARA);

	--���촰�ڸ�Ů����ʾ
	--Msg2Player(sceneId, femaleId, "��ϲ���"..maleName.."��Ϊ���ޣ�", MSG2PLAYER_PARA);
	Msg2Player(sceneId, femaleId, "������˳ƺ�'"..maleName.."������'��", MSG2PLAYER_PARA);
	
	local ringItemName = GetItemName(sceneId, ringItemId);
	if ringItemName then
		Msg2Player(sceneId, maleId, "�������"..ringItemName.."��", MSG2PLAYER_PARA );
		Msg2Player(sceneId, femaleId, "�������"..ringItemName.."��", MSG2PLAYER_PARA);
	end
	
	--���繫��
	local strChatMessage = "#b#cff99ff��ϲ#W#{_INFOUSR"..maleName.."}#b#cff99ff��#W#{_INFOUSR"..femaleName.."}#b#cff99ffϲ������ףԸ���ǰ�ͷ���ϡ�����˫�ɡ�һ���Ҹ���";
	BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;AUC:"..strChatMessage, 4);
	
	--�ֱ�EMAIL����Ů˫����������к���
	local maleGuid = LuaFnGetGUID(sceneId, maleId);
	local femaleGuid = LuaFnGetGUID(sceneId, femaleId);
	LuaFnSendMailToAllFriend( sceneId, maleId, "���װ������ѣ����Ѻ�" .. femaleName .. "ϲ����Ե��ף�����ǰɣ�", 1, femaleGuid )
	LuaFnSendMailToAllFriend( sceneId, femaleId, "���װ������ѣ����Ѻ�" .. maleName .. "ϲ����Ե��ף�����ǰɣ�", 1, maleGuid )

	--������
	local endMsg = "��ϲ����ϲ����������������������177��94����ϲ���ְ��Ż���Ѳ�Σ�����ϲ���ָ�������������ϲ�£�ÿ���ر�æ����������һ��Ҫ��һ��Сʱ֮���ҵ������������������޿ɾ�û�취�ˡ�";
	BeginEvent(sceneId);
		AddText(sceneId, endMsg);
		AddNumText(sceneId, x806003_g_ScriptId, "лл����", 8, x806003_g_eventId_end);
	EndEvent(sceneId);
	DispatchEventList(sceneId, maleId, targetId);
	
	BeginEvent(sceneId);
		AddText(sceneId, endMsg);
		AddNumText(sceneId, x806003_g_ScriptId, "лл����", 8, x806003_g_eventId_end);
	EndEvent(sceneId);
	DispatchEventList(sceneId, femaleId, targetId);
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x806003_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--��������Ӧ��Ǯ��
--**********************************
function x806003_CalcNeedMoney(marryLevel)
	if marryLevel == 1 then
		return 5203344;
	elseif marryLevel == 2 then
		return 13145200;
	else
		return 520520;
	end
end

--**********************************
--�û���ȼ���Ӧ������
--**********************************
function x806003_GetMarryLevelName(marryLevel)
	if marryLevel == 1 then
		return "�еȹ�ģ����";
	elseif marryLevel == 2 then
		return "������ģ����";
	else
		return "һ���ģ����";
	end
end

--**********************************
--�û���ȼ���Ӧ�Ľ�ָ��ID
--**********************************
function x806003_GetRingByMarryLevel(marryLevel)
	if marryLevel == 1 then
		return 10422097;
	elseif marryLevel == 2 then
		return 10422098;
	else
		return 10422096;
	end
end

--**********************************
--�öԷ���objId
--**********************************
function x806003_GetMarryTargetId(sceneId, selfId, showMessage, targetId)

	local marryTargetId = -1;
	
	local szMsg = "�����Ҫ���Ļ���������Ů˫��һ�����֮���������ҡ�"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end
	
	szMsg = "�����ӵĶ������ֻ������Ů˫����ɣ������в�����������Ա��"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end

	szMsg = "ֻ�����˾��ߵ������֮����ܽ�顣"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end

	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		if memId ~= selfId then
			marryTargetId = memId;
		end
	end
	
	return marryTargetId;
	
end
