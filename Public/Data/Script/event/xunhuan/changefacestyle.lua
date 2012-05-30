--��������
--�ű���
x805029_g_ScriptId = 805029

--��������UI 21

--**********************************
--�о��¼�
--**********************************
function x805029_OnEnumerate( sceneId, selfId, targetId )
	-- ������Ϣ
	--BeginEvent(sceneId)
	--	AddText(sceneId, "����������ͽű�");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- ΪʲôҪ NPC ���֣�
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 928)
	return
end

--**********************************
--��������
--**********************************
function x805029_FinishAdjust( sceneId, selfId, styleId)

	-- �õ���������������Ʒ��id��������
	local ItemId, ItemCount = GetChangeFaceItemIdAndItemCount(styleId)
		
	-- ����ֵ�Ƿ�
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	-- ��Ʒ�Ƿ��û�����
	if ItemCount > nItemNum then
		BeginEvent(sceneId)
			AddText(sceneId, "��û�ж����飬���߶����鱻������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
		-- ��ö������ڱ����е�λ�ã���������ڸı����͵Ĺ����б�ɾ����������Ҫ�ȱ���������Ϣ��
	local ItemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, ItemId, 0)
	local szItemTransfer = GetBagItemTransfer(sceneId, selfId, ItemPos)
	
	-- ��Ʒ���ͨ�����ټ����ҽ�Ǯ
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	
	-- ��Ʒ�ͽ�Ǯ��ⶼͨ��
	if (moneyJZ + money >= 50000)	then	
		-- ������������ͣ��������������������Ʒ�ͽ�Ǯ��
		local ret = ChangeHumanFaceModel( sceneId, selfId, styleId )
		if ret == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"�ı����ͳɹ���");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		-- �ı�����ʧ��
		elseif ret == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"��ѡ��һ�������͡�");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 3 then
			BeginEvent(sceneId)
				AddText(sceneId, "��û�ж����飬���߶����鱻������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 4 then	
			BeginEvent(sceneId)
				AddText(sceneId, "��Ǯ����");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else
			return
		end

	-- ��Ǯ����
	else
		BeginEvent(sceneId)
			AddText(sceneId, "������Я���Ľ�Ǯ���㡣");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- ���͹㲥
	local message;	
	local randMessage = random(3);
	local nsex = LuaFnGetSex(sceneId, selfId)
	local str1,str2
	if nsex == 0  then
		str1 = "��"
		str2 = "��"
	else
		str1 = "��"
		str2 = "˧"
	end
	
	if randMessage == 1 then
		message = format("#H��Ҫ������ҪƤ��#W#{_INFOUSR%s}#H��֪�������������#W#{_INFOMSG%s}#H��һ���ݸ������ˣ���ֱ���������˰�����ɷ������", LuaFnGetName(sceneId, selfId), szItemTransfer);
	elseif randMessage == 2 then
		message = format("#Hħ��˵�����������" .. str2 .. "���˵����ˣ��Ǿ��Ǹղ������ϴ����������#W#{_INFOUSR%s}#H����ȥ����" .. str1 .. "�ɣ���#W#{_INFOMSG%s}#H������ȻЧ�����ڣ�", LuaFnGetName(sceneId, selfId), szItemTransfer);
	else
		message = format("#H�ף���ôСϪ�е���������˶�Ƥ���ѵ����ж����������ԣ�ԭ����#W#{_INFOUSR%s}#H�ո��߹�ȥ��������ߵ����˹�ȥ����ѽ��" .. str1 .. "����#W#{_INFOMSG%s}#H�Ժ�Ȼ���������ľ������գ�", LuaFnGetName(sceneId, selfId), szItemTransfer);
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
end
