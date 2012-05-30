--************************************************************************
--MisDescBegin

--�ű���
x889080_g_ScriptId	= 889080
x889080_TIME_2000_01_03_ = 946828868

x889080_g_LevelAwardList	=
{
--BtnText����ʾ������
--nLowLevelΪ���ĵȼ�����
--nHighLevelΪ���ĵȼ�����(�������õȼ�)
--Count�ǽ���������
--MDFlag����ScriptGlobal.lua�ﶨ���MD_ID
	{BtnText = "��ȡ120������", nLowLevel = 120, nHighLevel = 130, Count = 100, MDFlag = MD_LEVELAWARD_120},
	{BtnText = "��ȡ130������", nLowLevel = 130, nHighLevel = 140, Count = 100, MDFlag = MD_LEVELAWARD_130},
	{BtnText = "��ȡ140������", nLowLevel = 140, nHighLevel = 150, Count = 100, MDFlag = MD_LEVELAWARD_140}
}

--�������ȵ���ƷID
--x889080_g_SuperShoutItemID = 1000000

x889080_g_SuperShoutString =
{
--BtnText����ʾ������
--SendText�Ƿ��͵�����
	{BtnText = "��������<��>", SendText = "@*;SrvMsg;SCA:#b#cff00f0[%1:s]:����һ�λ�"},
	{BtnText = "��������<��>", SendText = "@*;SrvMsg;SCA:#{_INFOUSR%0:s}:����һ�λ�"},
	{BtnText = "��������<Ů>", SendText = "@*;SrvMsg;SCA:#{_INFOUSR%0:s}:����һ�λ�"},
	{BtnText = "��������<��>", SendText = "����һ�λ�"},
--	{BtnText = "bb", SendText = "����һ�λ�"}
}

x889080_g_ItemConvertList =
{
	{BtnText = "���ñ���Ƭ�����ñ�", ItemID = 30505253, TNum = 1��ConList = {
		{BtnText = "�һ����ñ�(5:1)", ItemID = 30505249,Num = 5},
		{BtnText = "�һ����ñ�(5:1)", ItemID = 30505249,Num = 5}
		}
	},
	{BtnText = "���ñһ��ֹ�����", ItemID = 30505249, TNum = 2��ConList = {
		{BtnText = "�һ�8������(1:2)", ItemID = 20500008,Num = 1},
		{BtnText = "�һ�8������(1:2)", ItemID = 20502008,Num = 1},
		{BtnText = "�һ�8���޲�(1:2)", ItemID = 20501008,Num = 1}
		}
	},
	{BtnText = "���ñһ���������", ItemID = 30505249, TNum = 1��ConList = {
		{BtnText = "�һ��ڽ�ɳ(2:1)", ItemID = 30505250,Num = 2},
		{BtnText = "�һ�����ʯ(10:1)", ItemID = 30505251,Num = 10},
		{BtnText = "����������(2:1)", ItemID = 30505252,Num = 2}
		}
	},
	{BtnText = "���ñһ���������", ItemID = 30505249, TNum = 1��ConList = {
		{BtnText = "�һ�������(5:1)", ItemID = 30501173,Num = 5},
		{BtnText = "�һ���ç���7��(20:1)", ItemID = 30505806,Num = 20},
		{BtnText = "�һ���ȱ�����7��(800:1)", ItemID = 30505706,Num = 800}
		}
	},
	{BtnText = "���ñһ��߼��ӻ�", ItemID = 30505249, TNum = 2��ConList = {
		{BtnText = "�һ�С����(1:2)", ItemID = 30505107,Num = 1},
		{BtnText = "�һ��׻�Կ��(1:2)", ItemID = 39901039,Num = 1},
		{BtnText = "�һ���ȸԿ��(1:2)", ItemID = 39901040,Num = 1},
		{BtnText = "�һ�����Կ��(1:2)", ItemID = 39901041,Num = 1}
		}
	},
}

--MisDescEnd
--************************************************************************

--**********************************
--������ں���
--**********************************
function x889080_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddNumText( sceneId, x889080_g_ScriptId, "�ȼ���ȡ����", 5, 1 )
		AddNumText( sceneId, x889080_g_ScriptId, "�������Ⱥ���", 5, 100 )
		AddNumText( sceneId, x889080_g_ScriptId, "��Ʒ�һ�<��>", 5, 200 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889080_OnEventRequest( sceneId, selfId, targetId, eventId )
	local Key = GetNumText()
	local LevelAwardListCount = getn(x889080_g_LevelAwardList)
	local ConvertItemCount = getn(x889080_g_ItemConvertList)
	if Key == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "��ѡ����ȡ���ʵĵȼ�:" )
			for i = 1, LevelAwardListCount do
				AddNumText( sceneId, x889080_g_ScriptId, x889080_g_LevelAwardList[i].BtnText, 5, Key + i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif (Key > 1) and (Key <= LevelAwardListCount + 1) then
		local ChooseIndex = Key - 1
		if (ChooseIndex > 0) and (ChooseIndex <= LevelAwardListCount) then
			local nLevel = GetLevel(sceneId, selfId)
			if (nLevel >= x889080_g_LevelAwardList[ChooseIndex].nLowLevel) and (nLevel < x889080_g_LevelAwardList[ChooseIndex].nHighLevel) then
				local nPreTime = GetMissionData(sceneId, selfId, x889080_g_LevelAwardList[ChooseIndex].MDFlag)
				local nCurTime = LuaFnGetCurrentTime()
				if (nCurTime - nPreTime  >= 3600*24) or (floor((nCurTime-x889080_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x889080_TIME_2000_01_03_)/(3600*24))) then
					ZengDian(sceneId, selfId, targetId, 1, x889080_g_LevelAwardList[ChooseIndex].Count)
					SetMissionData(sceneId, selfId, x889080_g_LevelAwardList[ChooseIndex].MDFlag, nCurTime)
				else
					x889080_NotifyFailTips(sceneId, selfId, "������Ѿ���ȡ����")
					return
				end
			else
				x889080_NotifyFailTips(sceneId, selfId, "��ĵȼ�������")
				return
			end
		end
	elseif Key == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "��ѡ��Ҫ���͵����:" )
			for i = 1, getn(x889080_g_SuperShoutString) do
				AddNumText( sceneId, x889080_g_ScriptId, x889080_g_SuperShoutString[i].BtnText, 5, Key + i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif (Key > 100) and (Key < 110) then
		if DelItem ( sceneId, selfId, x889080_g_SuperShoutItemID, 1 ) > 0 then
			local ChooseIndex = Key - 100
			local playername = GetName(sceneId, selfId)
	    local	guildName	= LuaFnGetGuildName( sceneId, selfId )
			local strText = format(x889080_g_SuperShoutString[ChooseIndex].SendText, playername, guildName)
			BeginEvent( sceneId )
				BroadMsgByChatPipe(sceneId, selfId, strText, 4)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId )
		else
			x889080_NotifyFailTips(sceneId, selfId, "���İ�����û����Ӧ�ĵ���")
			return
		end
	elseif Key == 200 then
		BeginEvent( sceneId )
			AddText( sceneId, "��ѡ�������һ�����Ʒ:" )
			for i = 1, ConvertItemCount do
				AddNumText( sceneId, x889080_g_ScriptId, x889080_g_ItemConvertList[i].BtnText, 5, Key + i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif (Key > 200) and (Key <= ConvertItemCount + 200) then
		local ChooseIndex = Key - 200
		if (ChooseIndex > 0) and (ChooseIndex <= ConvertItemCount) then
			BeginEvent( sceneId )
				AddText( sceneId, "��ѡ��һ�����Ʒ:" )
				for i = 1, getn(x889080_g_ItemConvertList[ChooseIndex].ConList) do
					AddNumText( sceneId, x889080_g_ScriptId, x889080_g_ItemConvertList[ChooseIndex].ConList[i].BtnText, 5, ConvertItemCount + 200 + i + ChooseIndex * 10 )
				end
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	elseif (Key > ConvertItemCount + 200) then
		local ChooseIndex = floor((Key - 200 - ConvertItemCount) / 10)
		local ChooseIndex2 = mod(Key - 200 - ConvertItemCount, 10)
		if (ChooseIndex > 0) and (ChooseIndex <= ConvertItemCount) then
			local nItemIndex = x889080_g_ItemConvertList[ChooseIndex].ItemID
			local nItemIndex2 = x889080_g_ItemConvertList[ChooseIndex].ConList[ChooseIndex2].ItemID
			BeginAddItem(sceneId)
				AddItem( sceneId, nItemIndex2, 1 )
				if EndAddItem(sceneId,selfId) < 1 then
					x889080_NotifyFailTips( sceneId, selfId, "�����������޷��һ���" )
					return
				end
			if DelItem(sceneId, selfId, nItemIndex) > 0 then
				AddItemListToHuman(sceneId,selfId)
			else
				x889080_NotifyFailTips(sceneId, selfId, "��û�и���Ʒ")
				return
			end
		else
			x889080_NotifyFailTips(sceneId, selfId, "�ű�����.ѡ���ID����"..Key..":"..ConvertItemCount.." "..ChooseIndex..":"..ChooseIndex2)
			return
		end
	end
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x889080_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
