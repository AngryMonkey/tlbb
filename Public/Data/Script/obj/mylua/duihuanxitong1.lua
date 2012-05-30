--************************************************************************
--MisDescBegin

--脚本号
x889080_g_ScriptId	= 889080
x889080_TIME_2000_01_03_ = 946828868

x889080_g_LevelAwardList	=
{
--BtnText是显示的文字
--nLowLevel为检测的等级下限
--nHighLevel为检测的等级上限(不包含该等级)
--Count是奖励的数量
--MDFlag是在ScriptGlobal.lua里定义的MD_ID
	{BtnText = "领取120级奖励", nLowLevel = 120, nHighLevel = 130, Count = 100, MDFlag = MD_LEVELAWARD_120},
	{BtnText = "领取130级奖励", nLowLevel = 130, nHighLevel = 140, Count = 100, MDFlag = MD_LEVELAWARD_130},
	{BtnText = "领取140级奖励", nLowLevel = 140, nHighLevel = 150, Count = 100, MDFlag = MD_LEVELAWARD_140}
}

--超级喇叭的物品ID
--x889080_g_SuperShoutItemID = 1000000

x889080_g_SuperShoutString =
{
--BtnText是显示的文字
--SendText是发送的文字
	{BtnText = "帮派收人<超>", SendText = "@*;SrvMsg;SCA:#b#cff00f0[%1:s]:这是一段话"},
	{BtnText = "征婚启事<男>", SendText = "@*;SrvMsg;SCA:#{_INFOUSR%0:s}:这是一段话"},
	{BtnText = "征婚启事<女>", SendText = "@*;SrvMsg;SCA:#{_INFOUSR%0:s}:这是一段话"},
	{BtnText = "家族收人<超>", SendText = "这是一段话"},
--	{BtnText = "bb", SendText = "这是一段话"}
}

x889080_g_ItemConvertList =
{
	{BtnText = "永久币碎片换永久币", ItemID = 30505253, TNum = 1，ConList = {
		{BtnText = "兑换永久币(5:1)", ItemID = 30505249,Num = 5},
		{BtnText = "兑换永久币(5:1)", ItemID = 30505249,Num = 5}
		}
	},
	{BtnText = "永久币换手工材料", ItemID = 30505249, TNum = 2，ConList = {
		{BtnText = "兑换8级精铁(1:2)", ItemID = 20500008,Num = 1},
		{BtnText = "兑换8级秘银(1:2)", ItemID = 20502008,Num = 1},
		{BtnText = "兑换8级棉布(1:2)", ItemID = 20501008,Num = 1}
		}
	},
	{BtnText = "永久币换顶级材料", ItemID = 30505249, TNum = 1，ConList = {
		{BtnText = "兑换黑金沙(2:1)", ItemID = 30505250,Num = 2},
		{BtnText = "兑换神亦石(10:1)", ItemID = 30505251,Num = 10},
		{BtnText = "超级打造书(2:1)", ItemID = 30505252,Num = 2}
		}
	},
	{BtnText = "永久币换神器材料", ItemID = 30505249, TNum = 1，ConList = {
		{BtnText = "兑换天玑珠(5:1)", ItemID = 30501173,Num = 5},
		{BtnText = "兑换新莽神符7级(20:1)", ItemID = 30505806,Num = 20},
		{BtnText = "兑换残缺的神节7级(800:1)", ItemID = 30505706,Num = 800}
		}
	},
	{BtnText = "永久币换高级杂货", ItemID = 30505249, TNum = 2，ConList = {
		{BtnText = "兑换小喇叭(1:2)", ItemID = 30505107,Num = 1},
		{BtnText = "兑换白虎钥匙(1:2)", ItemID = 39901039,Num = 1},
		{BtnText = "兑换朱雀钥匙(1:2)", ItemID = 39901040,Num = 1},
		{BtnText = "兑换玄武钥匙(1:2)", ItemID = 39901041,Num = 1}
		}
	},
}

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x889080_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddNumText( sceneId, x889080_g_ScriptId, "等级领取工资", 5, 1 )
		AddNumText( sceneId, x889080_g_ScriptId, "超级喇叭喊话", 5, 100 )
		AddNumText( sceneId, x889080_g_ScriptId, "物品兑换<点>", 5, 200 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x889080_OnEventRequest( sceneId, selfId, targetId, eventId )
	local Key = GetNumText()
	local LevelAwardListCount = getn(x889080_g_LevelAwardList)
	local ConvertItemCount = getn(x889080_g_ItemConvertList)
	if Key == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "请选择领取工资的等级:" )
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
					x889080_NotifyFailTips(sceneId, selfId, "你今天已经领取过了")
					return
				end
			else
				x889080_NotifyFailTips(sceneId, selfId, "你的等级不符合")
				return
			end
		end
	elseif Key == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "请选择要发送的语句:" )
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
			x889080_NotifyFailTips(sceneId, selfId, "您的包裹内没有相应的道具")
			return
		end
	elseif Key == 200 then
		BeginEvent( sceneId )
			AddText( sceneId, "请选择用来兑换的物品:" )
			for i = 1, ConvertItemCount do
				AddNumText( sceneId, x889080_g_ScriptId, x889080_g_ItemConvertList[i].BtnText, 5, Key + i )
			end
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif (Key > 200) and (Key <= ConvertItemCount + 200) then
		local ChooseIndex = Key - 200
		if (ChooseIndex > 0) and (ChooseIndex <= ConvertItemCount) then
			BeginEvent( sceneId )
				AddText( sceneId, "请选择兑换的物品:" )
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
					x889080_NotifyFailTips( sceneId, selfId, "背包已满，无法兑换。" )
					return
				end
			if DelItem(sceneId, selfId, nItemIndex) > 0 then
				AddItemListToHuman(sceneId,selfId)
			else
				x889080_NotifyFailTips(sceneId, selfId, "您没有该物品")
				return
			end
		else
			x889080_NotifyFailTips(sceneId, selfId, "脚本错误.选择的ID错误"..Key..":"..ConvertItemCount.." "..ChooseIndex..":"..ChooseIndex2)
			return
		end
	end
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x889080_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
