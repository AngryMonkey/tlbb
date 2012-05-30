-- ������
-- 300056
-- ��Ʒ����ʹ��10��
-- ��һ��ʹ�á���λ���ص㡱
-- �Ժ�ÿ��ʹ�ÿ�һ�Σ������ɾ����Ʒ��˲�Ƶ����ص�

x300056_g_scriptId = 300056
x300056_g_ItemId = 30008030


--��Ʊ
x300056_g_Yinpiao = 40002000

-- ����ʹ�ô��͹��ܵĳ���
x300056_g_NoChuangsongScn=
{
	151		-- ����
}

-- ����ʹ�������鶨λ�ĳ���
x300056_g_UselessScn=
{
	125,	-- ��ɽ
	414	  -- ������	
}


--��ֹ���͵�ĳЩ�����ĵȼ�����....
x300056_g_LimitTransScene =
{
	{423,90},	--����ɽ
	{519,90},	--�����
	{424,90},	--�߲�
	{520,90},	--�߲��Թ�
	{425,90},	--����ľ
	{427,90},	--���������
	{186,75},	--¥��
	{431,90}, --����
	{432,90}  --��Ѫ��
}

x300056_g_Impact_NotTransportList = { 5929 } -- ��ֹ���͵�Impact
x300056_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- ��ֹ���͵�Impact��ʾ��Ϣ

--**********************************
-- �¼��������
--**********************************
function x300056_OnDefaultEvent( sceneId, selfId, nItemIndex )
	
end

function x300056_IsSkillLikeScript( sceneId, selfId )
	return 1	 --����ű���Ҫ����֧��
end

function x300056_CancelImpacts( sceneId, selfId )
	return 0	 --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

function x300056_OnDeplete( sceneId, selfId )
	return 1
end

--**********************************
-- 
--**********************************
function x300056_OnConditionCheck( sceneId, selfId , idid)

	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	-- �ж������Ʒ�ǲ����Ѿ���λ
	if GetItemTableIndexByIndex(sceneId, selfId, bagId) ~= x300056_g_ItemId  then
		return 0
	end
	
	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		return 0
	end

	--���Impact״̬פ��Ч��
	for i, ImpactId in x300056_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x300056_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end

	-- 1����������Ʒ�ǲ����м�¼�������ˣ�
	-- ��Ҫ��¼�������ǣ�ʹ�ô�������λ����Id���Ѿ�����
	local nUseCount	= GetBagItemParam(sceneId, selfId, bagId, 0, 2)
	local x	= GetBagItemParam(sceneId, selfId, bagId, 4, 2)
	local z	= GetBagItemParam(sceneId, selfId, bagId, 8, 2)

	local nTarSceneId = floor(nUseCount/100)
	local nCount = nUseCount - nTarSceneId*100
	
	if nUseCount==0 and x==0 and z==0  then
		x300056_MsgBox( sceneId, selfId, "�����������δ��λ��" )
		return 0
	end

	--���Ŀ�곡���Ƿ����Ƶȼ�....
	for _, tmp in x300056_g_LimitTransScene do
		if ( (tmp[1] == nTarSceneId) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
			local szMsg = format("�˳�����Ҫ%d�����Ϸ�������", tmp[2])
			x300056_MsgBox( sceneId, selfId, szMsg)
			return 0
		end
	end

	return 1
end

--**********************************
-- 
--**********************************
function x300056_CallMe( sceneId, selfId, nItemIndex, PlayerGuid)	
	
	-- ����������ǲ����ܹ�ʹ�������鶨λ
	--�жϵ�ǰ״̬�Ƿ��ʹ�ö�λ��
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x300056_MsgBox( sceneId, selfId, "�����ڲ������͵�״̬������ʹ�������鴫�ͣ�" )
		return 0
	end

	--�����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x300056_g_Yinpiao) >= 1  then
		x300056_MsgBox(sceneId, selfId, "�����ڲ������͵�״̬������ʹ�������鴫�ͣ�")
		return 0
	end
	
	--�������ǲ��Ǵ��ڲ������͵ĳ������������
	for _, tmp in x300056_g_NoChuangsongScn do
		if tmp == sceneId then
			x300056_MsgBox( sceneId, selfId, "�˳����ڲ���ʹ�������鴫�ͣ�" )
			return 0
		end
	end
	
	-- �������ǲ��Ǵ��ڰ�̯״̬��
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "��̯״̬�£�����ʹ�������鴫�ͣ�" )
		return 0
	end
	
	-- ������Ӹ���״̬�£����ܴ���
	if IsTeamFollow(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "�㴦����Ӹ���״̬������ʹ�������鴫�ͣ�" )
		return 0
	end
	
	-- [ QUFEI 2007-08-23 20:50 UPDATE BugID 23699 ]
	-- ����ʹ�ý�ͨ����״̬�£����ܴ���
	local	inbus = LuaFnGetBusPassengerIDIsInBus(sceneId, selfId)
	-- PrintNum(inbus)
	if inbus == 1 then
		x300056_MsgBox( sceneId, selfId, "�������޷�ʹ�ô��͵�����£��޷�ʹ�ô��͵��ߣ�" )
		return 0
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x300056_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x300056_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	-- ��PlayerGuid �ǲ��Ƕ����е��ˣ�Ȼ���ٿ�ʱ���ǲ��ǹ��ڣ����Ҳû��ʲô�ܼ�����
	local Time = GetMissionData(sceneId,selfId,MD_TDZ_TIME)
	local nTarSceneId = GetMissionData(sceneId,selfId,MD_TDZ_SCENE)
	local x = GetMissionData(sceneId,selfId,MD_TDZ_X)
	local z = GetMissionData(sceneId,selfId,MD_TDZ_Y)
	
	--���Ŀ�곡���Ƿ����Ƶȼ�....
	for _, tmp in x300056_g_LimitTransScene do
		if ( (tmp[1] == nTarSceneId) and (GetLevel(sceneId, selfId) < tmp[2]) ) then
			local szMsg = format("�˳�����Ҫ%d�����Ϸ�������", tmp[2])
			x300056_MsgBox( sceneId, selfId, szMsg)
			return 0
		end
	end
	
	if LuaFnGetCurrentTime() - Time < 30  then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nTarSceneId, x, z)
	end

	SetMissionData(sceneId,selfId,MD_TDZ_TIME,	0)
	SetMissionData(sceneId,selfId,MD_TDZ_SCENE,0)
	SetMissionData(sceneId,selfId,MD_TDZ_X,	0)
	SetMissionData(sceneId,selfId,MD_TDZ_Y,	0)
	
end

--**********************************
-- ����Լ�ʹ����Ʒ
--**********************************
function x300056_UseItem( sceneId, selfId, nType, nItemIndex )
	
	if GetLevel(sceneId, selfId)<10  then
		x300056_MsgBox( sceneId, selfId, "�ȼ�����" )
		return
	end
	
	-- ���ز�������λ0������1
	if nType == 0  then
		x300056_SetPosition( sceneId, selfId, nItemIndex )
		
	elseif nType == 1  then
		--x300056_PlayerGoto( sceneId, selfId, nItemIndex )
	end
	
end

--**********************************
-- 
--**********************************
function x300056_OnActivateOnce( sceneId, selfId )
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	
	if bagId<0  then
		return
	end
	
	x300056_PlayerGoto( sceneId, selfId, bagId )

	--	-- �µ��޸ģ������ﵯ���Ի�����������������ͻ��Ƕ�λ��=======
	--	local	nItemIndex	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	--
	--	BeginUICommand(sceneId)
	--		UICommand_AddInt(sceneId,x300056_g_scriptId);
	--		UICommand_AddString(sceneId,"UseItem");
	--		UICommand_AddInt(sceneId,nItemIndex);
	--	EndUICommand(sceneId)
	--	DispatchUICommand(sceneId,selfId, 1008)
	
end

--**********************************
-- 
--**********************************
function x300056_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- ���ʹ����Ʒ ��λ
--**********************************
function x300056_SetPosition( sceneId, selfId, nItemIndex )

	if LuaFnGetSceneType( sceneId ) == 1 or LuaFnGetSceneType( sceneId ) == 4 then
		x300056_MsgBox( sceneId, selfId, "������������ڲ���ʹ�������鶨λ��" )
		return 0
	end
	for _, tmp in x300056_g_UselessScn do
		if tmp == sceneId then
			x300056_MsgBox( sceneId, selfId, "�˳������޷�ʹ�������鶨λ��" )
			return 0
		end
	end

	-- 0����Ʒ��ȫ�Լ��
	-- �ȼ����� nItemIndex ����Ʒ�ǲ��Ǻ͵�ǰ�Ķ�Ӧ��
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300056_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  �����ڲ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x300056_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return 0
	end

	-- 1����������Ʒ�ǲ����м�¼�������ˣ�
	-- ��Ҫ��¼�������ǣ�ʹ�ô�������λ����Id���Ѿ�����
	local nUseCount	= GetBagItemParam(sceneId, selfId, nItemIndex, 0, 2)
	local x	= GetBagItemParam(sceneId, selfId, nItemIndex, 4, 2)
	local z	= GetBagItemParam(sceneId, selfId, nItemIndex, 8, 2)

	local nTarSceneId = floor(nUseCount/100)
	local nCount = nUseCount - nTarSceneId*100
	
	if nUseCount==0 and x==0 and z==0  then
		nCount = 10
	end 
	
	-- һ���µ�û�ж�λ������Ʒ
	-- ��¼�µ�ǰ������λ�ã�����ʹ�ô���Ϊ10
	local x
	local z
	x,z = GetWorldPos(sceneId, selfId)
	
	SetBagItemParam(sceneId, selfId, nItemIndex, 0, 2, sceneId*100+nCount)
	SetBagItemParam(sceneId, selfId, nItemIndex, 4, 2, floor(x))
	SetBagItemParam(sceneId, selfId, nItemIndex, 8, 2, floor(z))
	LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )
	
	BeginEvent(sceneId)
		AddText(sceneId,"��������鶨λ�ɹ���")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
-- ����Լ��Ĵ���
--**********************************
function x300056_PlayerGoto( sceneId, selfId, nItemIndex )
	
	-- 0����Ʒ��ȫ�Լ��
	-- �ȼ����� nItemIndex ����Ʒ�ǲ��Ǻ͵�ǰ�Ķ�Ӧ��
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300056_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  �����ڲ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- ������Ӹ���״̬�£����ܴ���
	if IsTeamFollow(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "�㴦����Ӹ���״̬������ʹ�������鴫�ͣ�" )
		return 0
	end
	
	--�жϵ�ǰ״̬�Ƿ��ʹ�ö�λ��
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x300056_MsgBox( sceneId, selfId, "�����ڲ������͵�״̬������ʹ�������鴫�ͣ�" )
		return 0
	end

	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, nItemIndex, 0 ) < 0 then
		x300056_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return 0
	end

	--�����������ǲ����С���Ʊ������������оͲ���ʹ������Ĺ���
	if GetItemCount(sceneId, selfId, x300056_g_Yinpiao) >= 1  then
		x300056_MsgBox(sceneId, selfId, "�����ڲ������͵�״̬������ʹ�������鴫�ͣ�")
		return 0
	end
	
	--�������ǲ��Ǵ��ڲ������͵ĳ������������
	for _, tmp in x300056_g_NoChuangsongScn do
		if tmp == sceneId then
			x300056_MsgBox( sceneId, selfId, "�˳����ڲ���ʹ�������鴫�ͣ�" )
			return 0
		end
	end
	
	-- �������ǲ��Ǵ��ڰ�̯״̬��
	if LuaFnIsStalling(sceneId, selfId) == 1  then
		x300056_MsgBox( sceneId, selfId, "��̯״̬�£�����ʹ�������鴫�ͣ�" )
		return 0
	end
	
	--���Impact״̬פ��Ч��
	for i, ImpactId in x300056_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x300056_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	-- 1����������Ʒ�ǲ����м�¼�������ˣ�
	-- ��Ҫ��¼�������ǣ�ʹ�ô�������λ����Id���Լ�����
	local nUseCount	= GetBagItemParam(sceneId, selfId, nItemIndex, 0, 2)
	
	-- ִ�д���
	local nTarSceneId = floor(nUseCount/100)
	local nCount = nUseCount - nTarSceneId*100
	local nPointX		= GetBagItemParam(sceneId, selfId, nItemIndex, 4, 2)
	local nPointZ		= GetBagItemParam(sceneId, selfId, nItemIndex, 8, 2)
	
	if nCount==0 and nPointX==0 and nPointZ==0  then
		x300056_MsgBox( sceneId, selfId, "�����������δ��λ������ִ�д��͡�" )
		return
	end
	
	-- ���Ŀ�곡���ǲ����ܹ�����
	if sceneId ~= nTarSceneId then
		if IsCanNewWorld( sceneId, selfId, nTarSceneId, nPointX, nPointZ ) ~= 1 then
			x300056_MsgBox( sceneId, selfId, "���ܴ��͵�Ŀ�곡����" )
			return 0
		end
	end
	
	local ret = 0
	if nCount > 1  then
		-- ��Ʒ���Լ�������
		SetBagItemParam( sceneId, selfId, nItemIndex, 0, 2, nTarSceneId*100+(nCount-1) )
		LuaFnRefreshItemInfo( sceneId, selfId, nItemIndex )
		ret = 1
		
	elseif nCount <= 1  then
		-- ɾ����Ʒ
		ret = EraseItem(sceneId, selfId, nItemIndex)
	end
	
	if ret == 1  then
		-- �����Ҷ������ڸ����Ķ�Ա
		local nTeamCount = GetNearTeamCount(sceneId,selfId)
		local selfGuid = LuaFnGetGUID(sceneId,selfId)
		
		local nTarSceneName = GetSceneName(nTarSceneId)

		if nTeamCount > 0  then
			for i=0, nTeamCount-1  do
				local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
				if nPlayerId ~= selfId  then
					-- �������ҷ���һ����������
					local str = "��Ķ���" .. GetName(sceneId, selfId) .. "ʹ���������飬�ص��ˡ�" .. nTarSceneName .. "�������Ƿ�ҲҪ����һ���ͣ�ע�⣺����20����δ��������ȡ�����͡�"
					BeginUICommand(sceneId)
						UICommand_AddInt(sceneId,x300056_g_scriptId);
						UICommand_AddInt(sceneId,nItemIndex)
						UICommand_AddInt(sceneId,selfGuid)
						UICommand_AddString(sceneId,"CallMe");
						UICommand_AddString(sceneId,str);
					EndUICommand(sceneId)
					DispatchUICommand(sceneId,nPlayerId, 1009)
					
					-- ͬʱ����Щ��Ҫ���ݼ�¼��MissionData��
					SetMissionData(sceneId,nPlayerId,MD_TDZ_TIME,LuaFnGetCurrentTime())
					SetMissionData(sceneId,nPlayerId,MD_TDZ_SCENE,nTarSceneId)
					SetMissionData(sceneId,nPlayerId,MD_TDZ_X,nPointX)
					SetMissionData(sceneId,nPlayerId,MD_TDZ_Y,nPointZ)
				end
			end
		end
		
		-- �����Լ�
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nTarSceneId, nPointX, nPointZ)
	end

end
