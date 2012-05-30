--领CD-KEY、查询点数、购买元宝

x888899_g_scriptId = PRIZE_SCRIPT_ID

x888899_g_prizeGems = {
50101001,
50101002,
50102001,
50102002,
50102003,
50102004,
50103001,
50104002,
50111001,
50111002,
50112001,
50112002,
50112003,
50112004,
50113001,
50113002,
50113003,
50113004,
50113005,
50114001
};



--**********************************
-- 检查 CDKey
--**********************************
function x888899_AskCDKey( sceneId, selfId )
	GetCharPrize( sceneId, selfId, 1, 980,0,0 )					--领CD-KEY (980是CD-KEY在Billing的物品类型)
end

--**********************************
-- 检查 财富卡
--**********************************
function x888899_AskNewUserCard( sceneId, selfId, card, op)
	NewUserCard( sceneId, selfId, card, op)									--领财富卡/体育竞猜卡 (card是卡号字符串)
end

--**********************************
-- 购买 元宝
--**********************************
function x888899_AskYuanBao( sceneId, selfId, nYuanBao, nPoint )
	GetCharPrize(sceneId,selfId,3,999,nYuanBao,nPoint);	--买nYuanBao个共nPoint点的元宝
end

--**********************************
-- 查询 点数
--**********************************
function x888899_AskPoint( sceneId, selfId )
	GetCharPrize(sceneId,selfId,2,0,0,0);								--查询人物点数
end

--**********************************
-- 抽奖
--**********************************
function x888899_AskPrize( sceneId, selfId )
	GetCharPrize(sceneId,selfId,6,0,0,0);								--先查询人物奖品
end

--**********************************
-- 检查 CDKey 的返回回调函数
-- ntype 请参考 enum PRIZE_TYPE_ENUM
--**********************************
function x888899_PrizeRet( sceneId, selfId, ntype, nserial, num )
--	另外，这里没有 targetId，不知道写 -1 会不会有问题
	local targetId = -1

	--CD-KEY
	if( 1 == ntype ) then
		SetMissionFlag( sceneId, selfId, MF_GetAwardFlag, 1 )
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    你已经成功激活你的领奖条件，你可以到我这里来领取奖励物品。" )
	--财富卡
	elseif( 3 == ntype ) then
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经成功启动财富卡，到达一定等级之后可以到大理都大爽（157,164）处领取奖励。" )
	--赠点
	elseif( 4 == ntype ) then
		ZengDian(sceneId,selfId,-1,1,nserial*num)
	--物品
	elseif( 5 == ntype ) then
		LuaFnBeginAddItem( sceneId )
			LuaFnAddItem( sceneId, nserial, num)
		local ret = LuaFnEndAddItem( sceneId, selfId )
		if 1 == ret then
			AddItemListToHuman(sceneId,selfId)
			--神笛一个玩家只能参加一次活动
			if( nserial == 30309052 ) then
				SetMissionFlag( sceneId, selfId, MF_ActiveWenZhouCard, 1 )
				BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:恭喜您成功领取了活动奖励，请查收", 0);
			end
			x888899_NotifyFailBox( sceneId, selfId, targetId, "物品换取成功！感谢您对《天龙八部》的支持！" )
		end
	--体育竞猜卡
	elseif( 6 == ntype ) then
		local prizeItem = x888899_GetSportsPrize()
		if prizeItem then
			LuaFnBeginAddItem( sceneId )
				LuaFnAddItem( sceneId, prizeItem, 1)
			local ret = LuaFnEndAddItem( sceneId, selfId )
			if 1 == ret then
				AddItemListToHuman(sceneId,selfId)
				SetMissionFlag( sceneId, selfId, MF_ActiveSportsCard, 1 )
				--x888899_NotifyFailBox( sceneId, selfId, targetId, "    恭喜您成功领取了活动奖励，请查收。" )
				BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:恭喜您成功领取了活动奖励，请查收", 0);
			end
		end
	--网聚活动卡
	elseif( 7 == ntype ) then
		LuaFnBeginAddItem( sceneId )
		LuaFnAddItem( sceneId, 30505108, 1 )
		local ret = LuaFnEndAddItem( sceneId, selfId )
		if 1 == ret then
			AddItemListToHuman( sceneId, selfId )
			SetMissionFlag( sceneId, selfId, MF_ActiveJuCard, 1 )
			BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:恭喜您成功领取了活动奖励，请查收", 0);
		end
		
	elseif( 8 == ntype ) then	
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666, 1 )
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经成功启动超级大力卡，到达一定等级之后可以到大理都大爽（157,164）处领取奖励。" )
	end

	return
end

--**********************************
-- 抽奖成功后给玩家提示信息
--**********************************
function x888899_PrizeRetEnd( sceneId, selfId, retId )
	if retId and retId == 15 then
		x888899_NotifyFailBox( sceneId, selfId, -1, "    恭喜您成功领取了活动奖励，请查收。" )
	elseif( retId == 12 ) then
	  x888899_NotifyFailBox( sceneId, selfId, -1, "    恭喜您成功领取了活动奖励，请查收。" )
	end
end

--**********************************
-- 新手卡或体育抽奖卡检查
--**********************************
function x888899_OpenCard(sceneId,selfId,card)
	if nil == card then return end
	--PrintStr(card)
	local targetId = -1
	local firstbyte = strbyte(card)
	--'k' 体育卡
	if 107 == firstbyte then
		if GetMissionFlag( sceneId, selfId, MF_ActiveSportsCard ) == 1 then
			x888899_NotifyFailBox( sceneId, selfId, targetId, "    你已经领取过活动奖励，不能重复领取。" )
			return
		end
	--'t' 新手卡
	elseif 116 == firstbyte or 115 == firstbyte then
		if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
			x888899_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过财富卡，无法再次激活领取条件。" )
			return
		end
	elseif 99 == firstbyte then
		if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) == 1 then
			x888899_NotifyFailBox( sceneId, selfId, targetId, "    你已经启动过超级大力卡，无法再次启动领取条件。" )
			return
		end
	end
	
	x888899_AskNewUserCard( sceneId, selfId, card, 0)
end

--**********************************
-- 购买 元宝 的返回回调函数
-- ntype 请参考 enum PRIZE_TYPE_ENUM
-- 1 代表 OPT_YUANBAO_ADD 增加元宝
--**********************************
function x888899_BuyRet( sceneId, selfId, ntype, nYuanBao, nLeftPoint )
--	另外，这里没有 targetId，不知道写 -1 会不会有问题
	local targetId = -1

	if( 2 == ntype ) then
		YuanBao(sceneId,selfId,targetId,1,nYuanBao)
		BuyYuanBaoCount(sceneId,selfId,targetId,1,nYuanBao)
		x888899_NotifyLeftPoint(sceneId,selfId,nLeftPoint)
		
		--给客户端提示信息
		local strText = ""
		BeginEvent(sceneId)
			strText = "您成功的兑换了"..tostring(nYuanBao).."点元宝。"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		LuaFnMsg2Player( sceneId, selfId,strText,MSG2PLAYER_PARA)
		
		--大于等于1200元宝给神秘彩袜
		local curTime = GetHourTime()
	--活动时间1月21日——2月26日
	--if (curTime>75100 and curTime<78750) then
		if (nYuanBao and nYuanBao >=1200) then
			local BagIndex = TryRecieveItem( sceneId, selfId, 30504085, QUALITY_MUST_BE_CHANGE )
				
				if BagIndex == -1 then
					return
				end
				
				LuaFnItemBind(sceneId, selfId,BagIndex)
				
				BeginEvent(sceneId);
					AddText(sceneId, "恭喜您获赠嘉年华转蛋，请查收。");
				EndEvent(sceneId);
				DispatchMissionTips(sceneId, selfId);
		end
	--end	

		--200+元宝给3级红宝石-绑定
		
		if nYuanBao and nYuanBao >= 200 then
			local countPrize = GetMissionData(sceneId, selfId, MD_YUANBAO_PRIZE_GEM_COUNT);
			if countPrize and countPrize == 0 then
				local BagIndex = TryRecieveItem( sceneId, selfId, 50313004, QUALITY_MUST_BE_CHANGE )
				
				if BagIndex == -1 then
					return
				end
				
				LuaFnItemBind(sceneId, selfId,BagIndex)
					SetMissionData(sceneId, selfId, MD_YUANBAO_PRIZE_GEM_COUNT, countPrize + 1);
				
				BeginEvent(sceneId);
					AddText(sceneId, "恭喜您获赠宝石一颗，请查收。");
				EndEvent(sceneId);
				DispatchMissionTips(sceneId, selfId);
			end
		end
	end
	return	

--		local randidx = random(100)
--		兑换元宝给宝石
-- 		只有50%的几率获得宝石
--		if nYuanBao and nYuanBao >= 600 then
--			local countPrize = GetMissionData(sceneId, selfId, MD_YUANBAO_PRIZE_GEM_COUNT);
--			if countPrize and countPrize == 0 then
--				if randidx <= 50 then
--					local maxIndex = getn(x888899_g_prizeGems);
--					local randIndex = random(maxIndex) - 1;
--					if not x888899_g_prizeGems[randIndex] then
--						randIndex = 0;
--					end
--					local itemDataId = x888899_g_prizeGems[randIndex];
--					LuaFnBeginAddItem(sceneId);
--					LuaFnAddItem(sceneId, itemDataId, 1);
--					local addItemRet = LuaFnEndAddItem(sceneId, selfId);
--					if addItemRet and addItemRet == 1 then
--						SetMissionData(sceneId, selfId, MD_YUANBAO_PRIZE_GEM_COUNT, countPrize + 1);
--						
--						LuaFnAddItemListToHuman(sceneId, selfId);
--						BeginEvent(sceneId);
--							AddText(sceneId, "恭喜您获赠宝石一颗，请查收。");
--						EndEvent(sceneId);
--						DispatchMissionTips(sceneId, selfId);
--					else
--						BeginEvent(sceneId);
--							AddText(sceneId, "对不起，您的背包没有足够空间容纳赠送的宝石。");
--						EndEvent(sceneId);
--						DispatchMissionTips(sceneId, selfId);
--					end
--				else
--					SetMissionData(sceneId, selfId, MD_YUANBAO_PRIZE_GEM_COUNT, countPrize + 1);
--				end
--			end
--		end
end

--**********************************
-- 查询点数 的返回回调函数
--**********************************
function x888899_PointRet( sceneId, selfId, nLeftPoint )
	x888899_NotifyLeftPoint(sceneId,selfId,nLeftPoint)
end

--**********************************
-- 检查奖品 开始的回调函数
--**********************************
function x888899_CheckRetBegin(sceneId,selfId)
	LuaFnBeginAddItem( sceneId )
end
--**********************************
-- 检查奖品 添加检查物品的回调函数
--**********************************
function x888899_CheckAddItem(sceneId,selfId,itemid,num)
	LuaFnAddItem( sceneId, itemid, num)
end

--**********************************
-- 检查奖品 结束的回调函数
--**********************************
function x888899_CheckRetEnd(sceneId,selfId)
	local ret = LuaFnEndAddItem( sceneId, selfId )
	if 1 == ret then
		--检查成功，开始抽奖
		x888899_NotifyFailBox( sceneId, selfId, -1, "    检查成功，请稍等……正在领取奖品。" )
		GetCharPrize(sceneId,selfId,4,0,0,0);		--查询人物现在拥有的奖品
	else
		x888899_NotifyFailBox( sceneId, selfId, -1, "    对不起，您没有足够的物品栏空间，请整理后再来领取。" )
	end
end

--**********************************
-- 卡片检查奖品 结束的回调函数
--**********************************
function x888899_CardCheckRetEnd(sceneId,selfId)
	local ret = LuaFnEndAddItem( sceneId, selfId )
	if 1 == ret then
		--检查成功，开始开卡
		x888899_NotifyFailBox( sceneId, selfId, -1, "    检查成功，请稍等……正在领取奖品。" )
		x888899_AskNewUserCard( sceneId, selfId, "MagicString", 1);
	else
		x888899_NotifyFailBox( sceneId, selfId, -1, "    对不起，您没有足够的物品栏空间，请整理后再来领取。" )
	end
end
--**********************************
-- 卡片检查奖品 结束的回调函数,对天使礼包放出做特殊日志 By Vega 20090121
--**********************************
function x888899_CardCheckRetEndTSLB(sceneId,selfId)
	local ret = LuaFnEndAddItem( sceneId, selfId )
	if 1 == ret then
		--检查成功，开始开卡
		x888899_NotifyFailBox( sceneId, selfId, -1, "    检查成功，请稍等……正在领取奖品。" )
		x888899_AskNewUserCard( sceneId, selfId, "MagicString", 1);

		local guid = LuaFnObjId2Guid(sceneId, selfId);
		
		if guid ~= nil then
			--local LogInfo = format("0X%08X,", guid);
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_TSLBOUT, guid);
		end
	else
		x888899_NotifyFailBox( sceneId, selfId, -1, "    对不起，您没有足够的物品栏空间，请整理后再来领取。" )
	end
end

--**********************************
-- 检查 CDKey 的出错返回回调函数
--**********************************
function x888899_PrizeRetErr( sceneId, selfId, retId )
--enum	UserPrizeResult
--{
--	UPR_SUCCESS,							//抽奖信息成功
--	UPR_ASKPOINT_SUCCESS,			//查询点数成功
--	UPR_ASKBUY_SUCCESS,				//购买成功
--
--	UPR_ERR_NO_PRIZE,					//没有中奖
--	UPR_ERR_PRE_REQUEST,			//正在处理上次的请求信息
--	UPR_ERR_PRIZE_BUSY,				//等待处理的领奖信息过多
--	UPR_ERR_TIME_OUT,					//处理领奖信息超时
--	UPR_ERR_EXPIRE_PRIZE,			//奖品过期
--	UPR_ERR_CANT_NOW,					//现在不能处理抽奖请求
--	UPR_ERR_NOENOUGH_POINT,		//点数不足
--	UPR_ERR_GOODSCODE_ERR,		//物品代码错误
--	UPR_ERR_ALREADYGET_PRIZE,	//已经领奖
--	UPR_NEWUSERCARD_SUCCESS,	//财富卡成功
--	UPR_ERR_WRONGCARDNUMBER,	//卡号错误
--	UPR_ERR_OTHERUSERUSE,		//其他人已经使用
--	};
	local targetId = -1

	if retId == 3 then								-- 没有 CD-Key
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    你的CDK没有激活，请您登陆http://tl.gameone.com/查看。" )
	elseif retId == 4 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    正在处理中，请稍候。" )
	elseif retId == 5 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    系统忙，请稍候再重试。" )
	elseif retId == 6 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    处理超时，请稍候重试。" )
	elseif retId == 9 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    你的点数不足。" )
	elseif retId == 11 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    你的帐号已经领取过奖励，无法再次启动领取条件。" )  --帐号  to  账号
	elseif retId == 13 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    对不起，你输入的卡序列号为无效序列号，请确认之后再次输入。" )
	elseif retId == 14 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    你的卡序列号已经被使用过，请确认。" )
	elseif retId == 16 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    本服务器未开通抽奖功能，请确认。" )
	elseif retId == 17 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    此用户已经过10级，不能再使用财富卡。" )
	elseif retId == 20 then
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    对不起，您当前没有可领取的奖励。" )
	else
		x888899_NotifyFailBox( sceneId, selfId, targetId, "    处理故障，请稍候再试，如无法成功操作请联系客服人员进行处理。" )
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x888899_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 通知客户端剩余点数
--**********************************
function x888899_NotifyLeftPoint(sceneId,selfId,nLeftPoint)
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, nLeftPoint)
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2003 )
end

--**********************************
-- 体育竞猜卡随机获得奖品
--**********************************
function x888899_GetSportsPrize()
	local total = getn(SPORTS_CARD_PRIZE)
	if total and total >= 1 then
		local idx = random(1,total)
		return SPORTS_CARD_PRIZE[idx]
	else
		return nil
	end
end
