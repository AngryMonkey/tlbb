--热卖元宝 NPC
--注意本脚本含有随身元宝相关功能，请一定参照现有的例子进行修改。

x181002_g_scriptId 	= 181002
x181002_g_buyrate 	= 0.5

x181002_g_shoptableindex=151 --已经废弃了，现在用188和189
x181002_g_goodact		= 1		--热卖元宝商店
x181002_g_YuanBaoIntro	= 18	--元宝介绍

--**********************************
--事件交互入口
--**********************************
function x181002_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    快来看一看啦，全城最畅销的商品，最便宜的价格，客官您赶紧挑几件吧，绝对超值，包您买回去后今夜做梦都会笑呢~"
		AddText( sceneId, strText )
		--AddNumText( sceneId, x181002_g_scriptId, "购买热卖商品", 7, x181002_g_goodact)
		--AddNumText( sceneId, x181002_g_scriptId, "元宝介绍", 11, x181002_g_YuanBaoIntro)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x181002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x181002_g_goodact then
	--新的元宝商店
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 1)
			UICommand_AddInt( sceneId, 2 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 888902)
	elseif GetNumText() == x181002_g_YuanBaoIntro	then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--按需来弹出商店，分为随身商店和NPC商店
--**********************************
function x181002_NewDispatchShopItem(sceneId,selfId,targetId,shopId)
	if targetId >= 0 then
		DispatchShopItem( sceneId, selfId,targetId, shopId )
	else
		DispatchNoNpcShopItem( sceneId, selfId, shopId )
	end
end
