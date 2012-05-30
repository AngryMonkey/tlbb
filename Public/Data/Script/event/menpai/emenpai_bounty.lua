--门派奖励装备与珍兽

--脚本号
x808004_g_ScriptId			= 808004

--操作集
x808004_g_Key			=
{
	["eqp"]					= 100,	--领取装备
	["pet"]					= 101,	--领取珍兽
	["menpai"]				= 102,	--领取门派时装
}

--装备奖励
x808004_g_EqpNum	= 9
x808004_g_Eqp			=
{
	[0]	= { weapon = 10430010, armor = 10443010, menpai=10124000 },	--少林
	[1]	= { weapon = 10431110, armor = 10443110, menpai=10124001 },	--明教
	[2]	= { weapon = 10431210, armor = 10443210, menpai=10124002 },	--丐帮
	[3]	= { weapon = 10432010, armor = 10443410, menpai=10124004 },	--武当
	[4]	= { weapon = 10432110, armor = 10443310, menpai=10124003 },	--峨嵋
	[5]	= { weapon = 10433210, armor = 10443510, menpai=10124005 },	--星宿
	[6]	= { weapon = 10435210, armor = 10443810, menpai=10124008 },	--天龙
	[7]	= { weapon = 10434010, armor = 10443610, menpai=10124006 },	--天山
	[8] = { weapon = 10435110, armor = 10443710, menpai=10124007 },	--逍遥
}

--珍兽奖励
x808004_g_PetNum	= 3
x808004_g_Pet			=
{
	itemRcvErrMsg = "    在送你珍兽时，同时还要给你珍兽玩具与珍兽的食品，请在物品背包中留出两个空格，再来找我。",
	[1]	= { id = 3030, name = "狗",   itemList = { { id = 30601001, num = 20 }, { id = 30602001, num = 20 } } },
	[2]	= { id = 3040, name = "刺猬", itemList = { { id = 30601001, num = 20 }, { id = 30604001, num = 20 } } },
	[3]	= { id = 3050, name = "猴子", itemList = { { id = 30601001, num = 20 }, { id = 30605001, num = 20 } } },
}

--**********************************
--任务入口函数
--**********************************
function x808004_OnDefaultEvent( sceneId, selfId, targetId, menpai )
	local	mp	= GetMenPai( sceneId, selfId )
	if mp < 0 or mp >= x808004_g_EqpNum then
		x808004_MsgBox( sceneId, selfId, targetId, "  你还没有加入门派！" )
		return
	end
	if mp ~= menpai then
		x808004_MsgBox( sceneId, selfId, targetId, "  你不是本门弟子！" )
		return
	end

	local	flag	= GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY )
	local	fEqp	= floor( flag / 10 )
	local	fPet	= flag - fEqp * 10
	local	str

	--选择按钮
	local	key	= GetNumText()
	local	rnd
	
		
	if key == x808004_g_Key["eqp"] then
		if fEqp > 0 then
			return
		end

		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x808004_MsgBox( sceneId, selfId, targetId, "  你的背包空间不够了，整理后再来找我。" )
			return
		end
		if TryRecieveItem( sceneId, selfId, x808004_g_Eqp[mp].weapon, 1 ) >= 0 then
			str		= "#Y你获得了"..GetItemName( sceneId, x808004_g_Eqp[mp].weapon ).."。"
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
		end
		if TryRecieveItem( sceneId, selfId, x808004_g_Eqp[mp].armor, 1 ) >= 0 then
			str		= "#Y你获得了"..GetItemName( sceneId, x808004_g_Eqp[mp].armor ).."。"
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
		end
		x808004_MsgBox( sceneId, selfId, targetId, "  看看背包，你得到了装备奖励。" )
		fEqp		= 1
	elseif key == x808004_g_Key["pet"] then
		if fPet > 0 then
			return
		end

		rnd			= random( getn( x808004_g_Pet ) )

		local itemList = x808004_g_Pet[rnd].itemList
		if not itemList then
			return
		end

		LuaFnBeginAddItem( sceneId )
			for i, item in itemList do
				LuaFnAddItem( sceneId, item.id, item.num )
			end
		local nRet = LuaFnEndAddItem( sceneId, selfId )
		if nRet ~= 1 then
			x808004_MsgBox( sceneId, selfId, targetId, x808004_g_Pet.itemRcvErrMsg )
			return
		end

		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, x808004_g_Pet[rnd].id, 10, 0);
		if createPetRet and createPetRet == 1 then
			LuaFnAddItemListToHuman( sceneId, selfId )
			str		= "#Y你获得了一只"..x808004_g_Pet[rnd].name.."。"
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
			x808004_MsgBox( sceneId, selfId, targetId, "  看看你的宠物栏，你得到了宠物奖励。" )
			fPet	= 1
		else
			x808004_MsgBox( sceneId, selfId, targetId, "  你已经不能携带更多的宠物了。你可以选择放生宠物来空出一个宠物栏位。\n  打开宠物介面，选择宠物清单中你要丢弃的宠物，点击放生就可以放弃此宠物了。" )
		end
	elseif key == x808004_g_Key["menpai"] then
		if GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY_SHIZHUANG ) > 0 then
			return
		end

		if GetItemCount(sceneId,selfId, x808004_g_Eqp[mp].menpai) > 0 then
			x808004_MsgBox( sceneId, selfId, targetId, "您身上已经有了门派时装，无法再次领取。" )
			return
		end
		
		if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x808004_MsgBox( sceneId, selfId, targetId, "  你的背包空间不够了，整理后再来找我。" )
			return
		end
		if TryRecieveItem( sceneId, selfId, x808004_g_Eqp[mp].menpai, 1 ) >= 0 then
			str		= "#Y你获得了"..GetItemName( sceneId, x808004_g_Eqp[mp].menpai ).."。"
			Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
			x808004_NotifyTip( sceneId, selfId, str )
		end
		SetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY_SHIZHUANG, 1 )		
		return
	end
	
	--门派奖励的标记
	SetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY, floor( fEqp * 10 + fPet ) )
end

--**********************************
--列举事件
--**********************************
function x808004_OnEnumerate( sceneId, selfId, targetId )
	--设置门派奖励的标记，此任务只能接取一次
	local	flag		= GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY )
	local	bShiZhuang	= GetMissionData( sceneId, selfId, MD_MENPAI_BOUNTY_SHIZHUANG )
	local	fEqp	= floor( flag / 10 )
	local	fPet	= flag - fEqp * 10
	if fEqp == 0 then
		AddNumText( sceneId, x808004_g_ScriptId, "领取装备", 4, x808004_g_Key["eqp"] )
	end
	if fPet == 0 then
		AddNumText( sceneId, x808004_g_ScriptId, "领取珍兽", 4, x808004_g_Key["pet"] )
	end
	if bShiZhuang <= 0 then
		AddNumText( sceneId, x808004_g_ScriptId, "领取门派时装", 4, x808004_g_Key["menpai"] )
	end
	
end

--**********************************
--对话框提示
--**********************************
function x808004_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目提示
--**********************************
function x808004_NotifyTip( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
