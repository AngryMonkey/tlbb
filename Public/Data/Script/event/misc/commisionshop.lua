-- 寄售商店
-- 脚本号

x800116_g_ScriptId = 800116  -- 代码中也使用这个编号了。严禁修改

-- 寄售商店UI 19850424

-- 寄售商店信息
x800116_g_CShopInfo = {
	-- 0 号商店，这样的话最好不要出现两个 Server 一个 ShopID 的现象，否则还要改这个数据结构
	[0] = {
		name = "#G洛阳（160，181）#R汀汀",
		type = {
			-- 元宝
			[0] = {
				name = "元宝",
				sellFmtValueStr = "#G%d点元宝#l",
				sellFmtPriceStr = "#G#{_MONEY%d}#l",
				sellInfo = "#G我要购买元宝#l",
				buyFmtValueStr = "%d点元宝",
				buyFmtPriceStr = "#{_MONEY%d}",
			},
			-- 金钱
			[1] = {
				name = "金币",
				sellFmtValueStr = "#G#{_MONEY%d}#l",
				sellFmtPriceStr = "#G%d点元宝#l",
				sellInfo = "#G我要购买金币#l",
				buyFmtValueStr = "#{_MONEY%d}",
				buyFmtPriceStr = "%d点元宝",
			}
		}
	},
	-- 1 号商店，这样的话最好不要出现两个 Server 一个 ShopID 的现象，否则还要改这个数据结构
	[1] = {
		name = "#G洛阳（158，181）#R冬冬",
		type = {
			-- 元宝
			[0] = {
				name = "元宝",
				sellFmtValueStr = "#G%d点元宝#l",
				sellFmtPriceStr = "#G#{_MONEY%d}#l",
				sellInfo = "#G我要购买元宝#l",
				buyFmtValueStr = "%d点元宝",
				buyFmtPriceStr = "#{_MONEY%d}",
			},
			-- 金钱
			[1] = {
				name = "金币",
				sellFmtValueStr = "#G#{_MONEY%d}#l",
				sellFmtPriceStr = "#G%d点元宝#l",
				sellInfo = "#G我要购买金币#l",
				buyFmtValueStr = "#{_MONEY%d}",
				buyFmtPriceStr = "%d点元宝",
			}
		}
	}
}

--**********************************
-- 列举事件
--**********************************
function x800116_OnEnumerate( sceneId, selfId, targetId )
--AddNumText( sceneId, x800116_g_ScriptId, "我想购买金币", 5, 1 )       --Del by Houzf in 20080811 because of TT 37697
	AddNumText( sceneId, x800116_g_ScriptId, "我想购买元宝", 5, 2 )
	if IsShutout( sceneId, selfId, ONOFF_T_CSHOP ) == 0 then
		if GetConfigInfo( sceneId, "IsCloseYuanBaoSell" ) ~= 1 then
			AddNumText( sceneId, x800116_g_ScriptId, "我想寄售元宝", 5, 3 )
		end
	--	if GetConfigInfo( sceneId, "IsCloseGoldCoinSell" ) ~= 1 then       --Del byHouzf in 20080818
	--		AddNumText( sceneId, x800116_g_ScriptId, "我想寄售金币", 5, 4 )
	--	end
	end
	AddNumText( sceneId, x800116_g_ScriptId, "收取元宝或金币", 5, 6 )
	AddNumText( sceneId, x800116_g_ScriptId, "收取介绍", 11, 7 )
	AddNumText( sceneId, x800116_g_ScriptId, "寄售介绍", 11, 5 )
end

--**********************************
-- 事件列表选中一项
--**********************************
function x800116_OnDefaultEvent( sceneId, selfId, targetId, eventId )

	local opt = GetNumText()

	if opt == 1 then
		x800116_OpenShop( sceneId, selfId, targetId, 3 )
		return
	elseif opt == 2 then
		x800116_OpenShop( sceneId, selfId, targetId, 0 )
		return
	elseif opt == 3 or opt ==4 then
		local _yes = LuaFnOpenPWBox(sceneId,selfId)
		if(_yes==1)then 
			return
		end
	elseif opt == 5 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_095}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif opt == 6 then
		LuaFnAskNpcScriptMail(sceneId, selfId, MAIL_COMMISIONSHOP)
		return
	elseif opt == 7 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_099}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	local	UserName	= GetName( sceneId, selfId )
	local	i, _			= strfind( UserName, "*" )
	if i == nil then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, opt )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19850424 )		
	else
		BeginEvent( sceneId )
			AddText( sceneId, "您的名字中含有“*”，需要先改名才能正常使用寄售功能。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	return
end

--**********************************
-- 打开某个商店
--**********************************
function x800116_OpenShop( sceneId, selfId, targetId, Grade )
	GetCommisionShop( sceneId, selfId, targetId, Grade )
end

--**********************************
-- 购入
--**********************************
function x800116_Buy( sceneId, selfId, targetId, Grade, SerialNumber )
	local ret, shopId, type, value, price, seller = CommisionShopBuy( sceneId, selfId, targetId, Grade, SerialNumber )

	if ret == 1 then
		if x800116_g_CShopInfo[shopId] and x800116_g_CShopInfo[shopId].type[type] and x800116_g_CShopInfo[shopId].name then
			local typeInfo = x800116_g_CShopInfo[shopId].type[type]
			local nameInfo = x800116_g_CShopInfo[shopId].name
			local strGUID = LuaFnGetGUID( sceneId, selfId )
			local len = strlen(strGUID)
			strGUID = strsub( strGUID, len-3 )
			local str = format( "#I某人[ID:****%s]在#R%s#I处花费了#Y%s#I购买了#Y%s#I。",
				strGUID,
				nameInfo,
				typeInfo.buyFmtPriceStr,
				typeInfo.buyFmtValueStr
				 )
			str = format( str, price, value )
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
			
			local sellstr = format("您寄售的%s已#Y成功售出#W，请找到寄售NPC选择“收取元宝或金币”即可获得您的元宝或金币。#r#G注意：为了保障您的财产安全，请尽量在一周内领取您的元宝和金币，如果您一周后仍没有领取的话，元宝或金币可能会丢失。",
			  typeInfo.buyFmtValueStr)
			sellstr = format( sellstr, value)
			LuaFnSendSystemMail(sceneId,seller,sellstr)
		end
	end
end

--**********************************
-- 寄售
--**********************************
function x800116_Sell( sceneId, selfId, targetId, Grade, Price )
	local ret, shopId, type, value, price = CommisionShopSell( sceneId, selfId, targetId, Grade, Price )

	if ret == 1 then
		if x800116_g_CShopInfo[shopId] and x800116_g_CShopInfo[shopId].type[type] and x800116_g_CShopInfo[shopId].name then
			local typeInfo = x800116_g_CShopInfo[shopId].type[type]
			local nameInfo = x800116_g_CShopInfo[shopId].name
			local strGUID = LuaFnGetGUID( sceneId, selfId )
			local len = strlen(strGUID)
			strGUID = strsub( strGUID, len-3 )
			local str = format( "#I某人[ID:****%s]在#R%s#I处寄售了#Y%s，#I售价#Y%s，#I有意购买的玩家请赶回#G洛阳#I吧。",
				strGUID,
				nameInfo,
				typeInfo.buyFmtValueStr,
				typeInfo.buyFmtPriceStr,
				typeInfo.sellInfo,
				typeInfo.name )
			str = format( str, value, price )
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	end
end

function x800116_TimeOutCommission(sceneId,shopId,itemserial)
	local ret,type,value,price,seller = GetCommisionShopItem(sceneId,shopId,itemserial)
	
	if ret == 1 then
		if x800116_g_CShopInfo[shopId] and x800116_g_CShopInfo[shopId].type[type] then
			local typeInfo = x800116_g_CShopInfo[shopId].type[type]
			
			local sellstr = format("您寄售的%s#Y没有售出#W，请找到寄售NPC选择“收取元宝或金币”即可获得您的元宝或金币。#r#G注意：为了保障您的财产安全，请尽量在一周内领取您的元宝和金币，如果您一周后仍没有领取的话，元宝或金币可能会丢失。",
			  typeInfo.buyFmtValueStr)
			sellstr = format( sellstr, value)
			LuaFnSendSystemMail(sceneId,seller,sellstr)
		end
	end
end
