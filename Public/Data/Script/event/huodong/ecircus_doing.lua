--马戏团活动

--脚本号
x808005_g_ScriptId			= 808005
x808005_g_ScriptId_Ctrl	= 808006	--回调脚本

x808005_g_PrizeBase			= 8000		--获得大奖的几率基数
x808005_g_PrizeMoney		= 1000		--金钱奖励
x808005_g_Prize0				= 10141041--坐骑
x808005_g_Prize1				= 30308024--骑术
x808005_g_RoundMax			= 50			--一天中可以领取的最大环数

--操作集
x808005_g_Key	=
{
	["chg"]			= 100,		--提交珍兽，兑换奖励
	["inf"]			= 101,		--关于
}

--字串集
x808005_g_Str	=
{
	--不包含转义字符的字串
	["inf2"]		= "  #W此外只要提交珍兽宝宝即可，至于吃的芮斯会在你身上携带的指定食品中随机挑选一个。",
	["ful"]			= "  真的不好意思，今天让您为了找了这么多的珍兽宝宝和食品，我这边差不多已经够了。欢迎下次来找我。",
	["bty1"]		= "  #W谢谢您提供的珍兽和食品，这里是我的一点小意思，还请您收下。",
	["bty2"]		= "  #W谢谢您为我做了这么多的事情，这里有一头大象和一本教您如何学习骑乘大象的书本，就一并给你了。大象在我们国家是特别受到珍重的，请您一定要善待他。#r  #G还有在骑乘之前一定要记得先学习如何骑乘大象的方法#W。",

	--包含转义字符的字串
	["inf1"]		= "  #W每周的周二和周六带着珍兽宝宝和食物来找芮斯。每次交珍兽宝宝的时候芮斯也会从您身上携带的指定食物中收取一件，每交出一件宝宝和一件食物将会获得#{_MONEY"..x808005_g_PrizeMoney.."}，另外有一定几率将会获得特殊双人骑乘#G大象#W。",
	["inf_pet"]	= "  #W芮斯收购的珍兽宝宝有：#r  #G%s#W。",
	["inf_itm"]	= "  #W另外请记得，在带来宝宝的同时记得带以下的食品任意一件，否则芮斯将会拒绝接受珍兽宝宝。#r  #W芮斯需要的食品有：#r  #G%s#W。",
	["ned_pet"]	= "  #W我只需要以下的这些宝宝：#r  #G%s#W。",
	["ned_itm"]	= "  #W您给我的珍兽宝宝是对了，但是我还需要以下任意一种的食品：#r  #G%s#W。",
	["msg_bty"]	= "#R#{_INFOUSR%s}带给马戏团使者的珍兽宝宝和食物让其大为赞赏，作为奖励，其给了#{_INFOUSR%s}一头#{_INFOMSG%s}和一本骑乘技能书。",
}

--珍兽集
x808005_g_Pet	=
{
	[1]	= { id = 3099, name = "蜥蜴宝宝" },
	[2]	= { id = 3129, name = "鳄鱼宝宝" },
	[3]	= { id = 3109, name = "蝙蝠宝宝" },
	[4]	= { id = 3119, name = "大螳螂宝宝" },
	[5]	= { id = 3139, name = "猫头鹰宝宝" },
	[6]	= { id = 3149, name = "獾宝宝" },
	[7]	= { id = 3159, name = "老虎宝宝" },
	[8]	= { id = 3169, name = "野猪宝宝" },
}

--物品集
x808005_g_Itm	=
{
	[1]	= { id = 30101064, name = "杏仁酥" },
	[2]	= { id = 30101054, name = "苕糕" },
	[3]	= { id = 30101065, name = "清明粑" },
	[4]	= { id = 30101055, name = "糯米糕" },
	[5]	= { id = 30101066, name = "芭蕉碱饭" },
	[6]	= { id = 30101056, name = "香菇菜包" },
	[7]	= { id = 30101084, name = "灌汤包" },
	[8]	= { id = 30101074, name = "浇汁鱼片" },
	[9]	= { id = 30101085, name = "辣烧香螺" },
	[10]= { id = 30101075, name = "蚂蚁上树" },
	[11]= { id = 30101086, name = "粉蒸鸭肉" },
	[12]= { id = 30101076, name = "八珍炖鸡汤" },
}

--**********************************
--任务入口函数
--**********************************
function x808005_OnDefaultEvent( sceneId, selfId, targetId )

	--选择按钮
	local	key	= GetNumText()

	--提交珍兽和食物
	if key == x808005_g_Key["chg"] then
		if CallScriptFunction( x808005_g_ScriptId_Ctrl, "IsActivityDoing", sceneId ) == 1 then
			--打开珍兽界面
			str_1	= format( "  #W我只需要以下这些宝宝：#r  #G%s#W。", x808005_MyGetBuyList( 0 ) )
			str_2	= format( "  #W以及以下这些食物：#r  #G%s#W。", x808005_MyGetBuyList( 1 ) )
			BeginEvent( sceneId )
				AddText( sceneId, str_1 )
				AddText( sceneId, str_2 )
			EndEvent( sceneId )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x808005_g_ScriptId, -1, 2 )
		else
			x808005_MyNotifyTip( sceneId, selfId, "现在不是活动时间！" )
		end

	--关于
	elseif key == x808005_g_Key["inf"] then
		str_1	= format( x808005_g_Str["inf_pet"], x808005_MyGetBuyList( 0 ) )
		str_2	= format( x808005_g_Str["inf_itm"], x808005_MyGetBuyList( 1 ) )
		BeginEvent( sceneId )
			AddText( sceneId, x808005_g_Str["inf1"] )
			if str_1 ~= nil then
				AddText( sceneId, str_1 )
			end
			if str_2 ~= nil then
				AddText( sceneId, str_2 )
			end
			AddText( sceneId, x808005_g_Str["inf2"] )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--列举事件
--**********************************
function x808005_OnEnumerate( sceneId, selfId, targetId )

	if CallScriptFunction( x808005_g_ScriptId_Ctrl, "IsActivityDoing", sceneId ) == 1 then
		AddNumText( sceneId, x808005_g_ScriptId, "我这里有你要的珍兽宝宝", 6, x808005_g_Key["chg"] )
	end
	AddNumText( sceneId, x808005_g_ScriptId, "关于马戏团活动", 11, x808005_g_Key["inf"] )

end

--**********************************
--活动奖励
--**********************************
function x808005_MyOnBounty( sceneId, selfId, targetId, indexitm, indexpet )

	local	num_chg	= 0
	local	num_bty	= 0
	
	--当天的环数控制
	--100000的倍数是当前完成的环数，小于100000的数是时间
	--begin modified by zhangguoxin 090207
	local iDayCount	= GetMissionData( sceneId, selfId, MD_CIRCUS_DAYCOUNT )
	if iDayCount == nil or iDayCount < 0 then
		iDayCount			= 0
	end
	local iTime			= iDayCount - floor( iDayCount/100000 ) * 100000
	--local iDayTime	= floor( iTime/100 )									--上一次交或放弃任务的时间(天数)
	local iDayTime	= iTime																	--上一次交或放弃任务的时间(天数)
	--local iQuaTime	= iTime - floor( iTime/100 ) * 100			--上一次交或放弃任务的时间(刻)
	local iDayHuan	= floor( iDayCount/100000 )							--当天内完成的任务次数
	--local CurTime		= GetHourTime()													--当前时间
	--local CurDaytime= floor( CurTime/100 )									--当前时间(天)
	local CurDaytime = GetDayTime()														--当前时间(天)
	--local CurQuaTime = CurTime - floor( CurTime/100 ) * 100	--当前时间(刻)
	
	--上次完成任务是同一天内
	if CurDaytime == iDayTime then
		iDayHuan			= iDayHuan + 1
		--iQuarterTime	= CurQuaTime
	--上次完成任务不在同一天，重置
	else
		iDayTime			= CurDaytime
		iQuarterTime	= 0
		iDayHuan			= 0
	end
	if iDayHuan > x808005_g_RoundMax then
		x808005_MyMsgBox( sceneId, selfId, targetId, x808005_g_Str["ful"] )
		return 0
	else
		--iDayCount			= iDayHuan * 100000 + iDayTime * 100 + iQuarterTime
		iDayCount			= iDayHuan * 100000 + iDayTime;
	end
	--end modified by zhangguoxin 090207
	
	--要在保证珍兽、物品提交都正确的情形下，再进行逐一删除
	if indexpet < 0 or indexpet >= 255 or LuaFnIsPetAvailable( sceneId, selfId, indexpet ) ~= 1 then
		x808005_MyNotifyTip( sceneId, selfId, "无效珍兽！" )
		return 0
	end
	if indexitm < 0 or indexitm >= 255 or LuaFnIsItemAvailable( sceneId, selfId, indexitm ) ~= 1 then
		x808005_MyNotifyTip( sceneId, selfId, "无效食物！" )
		return 0
	end
	--检查是否是所需珍兽
	local	pet_id		= LuaFnGetPet_DataID( sceneId, selfId, indexpet )
	local	pet_ret		= 0
	local	pet_unt
	for i = 1, getn( x808005_g_Pet ) do
		pet_unt				= x808005_g_Pet[ i ]
		if pet_id == pet_unt.id then
			pet_ret			= 1
			break
		end
	end
	if pet_ret ~= 1 then
		str	= format( x808005_g_Str["ned_pet"], x808005_MyGetBuyList( 0 ) )
		x808005_MyMsgBox( sceneId, selfId, targetId, str )
		return 0
	end
	--检查是否是所需物品
	local	itm_id		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, indexitm )
	local	itm_ret		= 0
	local	itm_unt
	for i = 1, getn( x808005_g_Itm ) do
		itm_unt				= x808005_g_Itm[ i ]
		if itm_id == itm_unt.id then
			itm_ret			= 1
			break
		end
	end
	if itm_ret ~= 1 then
		str	= format( x808005_g_Str["ned_itm"], x808005_MyGetBuyList( 1 ) )
		x808005_MyMsgBox( sceneId, selfId, targetId, str )
		return 0
	end

	--珍兽提交
	if LuaFnDeletePet( sceneId, selfId, indexpet, 1 ) > 0 then
		x808005_MyNotifyTip( sceneId, selfId, "您提交了一只"..pet_unt.name.."。" )
	else
		return 0
	end
	--物品提交
	if HaveItemInBag( sceneId, selfId, itm_id ) > 0 and
		LuaFnGetAvailableItemCount( sceneId, selfId, itm_id ) >= 1 and
		DelItem( sceneId, selfId, itm_id, 1 ) > 0 then
		x808005_MyNotifyTip( sceneId, selfId, "您提交了一个"..itm_unt.name.."。" )
	else
		return 0
	end

	if pet_ret == 1 and itm_ret == 1 then
		--成功兑换一次，计数无上限
		num_chg			= CallScriptFunction( x808005_g_ScriptId_Ctrl, "OnSuccChange", sceneId )
		--钱奖励
		AddMoney( sceneId, selfId, x808005_g_PrizeMoney )
		--成功送出
		x808005_MyMsgBox( sceneId, selfId, targetId, x808005_g_Str["bty1"] )
		--成功送出后设置环数
		SetMissionData( sceneId, selfId, MD_CIRCUS_DAYCOUNT, iDayCount )
		--Add Log
		LogInfo			= format( "[CIRCUS]: x808005_MyOnBounty( sceneId=%d, GUID=%0X ), pet=%d, itm=%d, num_chg=%d, num_bty=%d, PRIZE_MONEY(%d)",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			pet_id, itm_id, num_chg, num_bty, x808005_g_PrizeMoney )
		MissionLog( sceneId, LogInfo )
	else
		return 0
	end

	--大象几率奖励
	if random( x808005_g_PrizeBase ) == 1 and LuaFnGetPropertyBagSpace( sceneId, selfId ) >= 2 then
		--成功大奖一次，计数无上限
		num_bty			= CallScriptFunction( x808005_g_ScriptId_Ctrl, "OnSuccPrize", sceneId )
		if num_bty > 0 then
			local	idBag0	= LuaFnTryRecieveItem( sceneId, selfId, x808005_g_Prize0, 1 )	--坐骑
			local	idBag1	= LuaFnTryRecieveItem( sceneId, selfId, x808005_g_Prize1, 1 )	--骑术
			local	szTran
			if idBag0 >= 0 and idBag1 >= 0 then
				szTran			= GetBagItemTransfer( sceneId, selfId, idBag0 )
				--成功送出
				x808005_MyMsgBox( sceneId, selfId, targetId, x808005_g_Str["bty2"] )
				if szTran ~= nil then
					str				= format( x808005_g_Str["msg_bty"], GetName( sceneId, selfId ), GetName( sceneId, selfId ), szTran )
					x808005_MyGlobalNews( sceneId, str )
				end
				--Add Log
				LogInfo			= format( "[CIRCUS]: x808005_MyOnBounty( sceneId=%d, GUID=%0X ), pet=%d, itm=%d, num_chg=%d, num_bty=%d, PRIZE_ITEM(%d,%d)",
					sceneId,
					LuaFnObjId2Guid( sceneId, selfId ),
					pet_id, itm_id, num_chg, num_bty, x808005_g_Prize0, x808005_g_Prize1 )
				MissionLog( sceneId, LogInfo )
			end
		end
	end
	return 1

end

--**********************************
--玩家提交珍兽后的回调函数
--**********************************
function x808005_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )

	if indexpet >= 255 then
		--索引值返回255表示空，没提交珍兽
		x808005_MyNotifyTip( sceneId, selfId, "请把珍兽拖动到窗口中！" )
	elseif index1 < 0 or index1 >= 255 then
		x808005_MyNotifyTip( sceneId, selfId, "请把食物拖动到第一个物品格中！" )
	else
		x808005_MyOnBounty( sceneId, selfId, npcid, index1, indexpet )
	end

end

--**********************************
--获取收购列表
--**********************************
function x808005_MyGetBuyList( type )

	local	str	= ""
	local	lst
	if type == 0 then
		lst			= x808005_g_Pet
	else
		lst			= x808005_g_Itm
	end

	for i = 1, getn( lst ) do
		if i ~= 1 then
			str		= str..", "
		end
		str		= str..lst[i].name
	end
	return str

end

--**********************************
--对话框提示
--**********************************
function x808005_MyMsgBox( sceneId, selfId, targetId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--醒目提示
--**********************************
function x808005_MyNotifyTip( sceneId, selfId, str )

	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--全球公告
--**********************************
function x808005_MyGlobalNews( sceneId, str )

	if str == nil then
		return
	end
	AddGlobalCountNews( sceneId, str )

end
