-- 210243
-- 银皑雪原兑换时装

x210243_g_ScriptId = 210243

x210243_g_ItemId = {
										{mp=0,Item=10124009,mpname="少林派"},
										{mp=1,Item=10124010,mpname="明教"},
										{mp=2,Item=10124011,mpname="丐帮"},
										{mp=4,Item=10124012,mpname="峨嵋派"},
										{mp=3,Item=10124013,mpname="武当派"},
										{mp=5,Item=10124014,mpname="星宿派"},
										{mp=7,Item=10124015,mpname="天山派"},
										{mp=8,Item=10124016,mpname="逍遥派"},
										{mp=6,Item=10124017,mpname="天龙派"},
										{mp=9,Item=0},
}

x210243_g_Stone = {id=30505122, num=20} --绑定的
x210243_g_Stone2 = {id=30505135, num=20} --没绑定的

--**********************************
--任务入口函数
--**********************************
function x210243_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y领取门派高级时装" );
			AddText(sceneId, "  有一位旅行家曾经惊奇的发现，银皑雪原上的一些怪物身上可能携带有神秘的#Y怪物日记本#W。如果你能帮他找来20本#Y怪物日记本#W，就可以得到他赠予的一件门派高级时装。#r    怎么样，你打算交换吗？" );
			AddNumText(sceneId, x210243_g_ScriptId,"兑换", 8, 3);
			AddNumText(sceneId, x210243_g_ScriptId,"取消", 8, 4);
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 3   then
		-- 0，看玩家是不是有正确的门派
		local nMenpai = GetMenPai(sceneId,selfId)
		if nMenpai<0 or nMenpai>8   then
			BeginEvent(sceneId)
				AddText(sceneId, "  你还没有加入一个门派，只有九大门派的弟子才能兑换门派高级时装啊。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 1，检测玩家身上是不是有足够的石头
		local HaveAllItem = 1
		if (GetItemCount(sceneId, selfId, x210243_g_Stone.id) + GetItemCount(sceneId, selfId, x210243_g_Stone2.id)) < x210243_g_Stone.num   then
			HaveAllItem = 0
		end
	
		
		if HaveAllItem == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "  你需要拿20个怪物日记本才能兑换门派高级时装。" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 2，检测玩家的这套碎片是不是都能够删除
		local AllItemCanDelete = 1
		local Stone1_Num = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone.id)
		local Stone2_Num = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone2.id)

		if Stone1_Num+Stone2_Num < x210243_g_Stone.num   then
			AllItemCanDelete = 0
		end
		
		if AllItemCanDelete == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    扣除你身上的物品失败，请检测你是否对物品加锁，或者物品处于交易状态。" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		--扣除物品前获得物品
		local	bagpos = -1
		if Stone1_Num > 0 then
		  bagpos = GetBagPosByItemSn(sceneId, selfId, x210243_g_Stone.id)
		elseif Stone1_Num == 0 and Stone2_Num > 0 then
		  bagpos = GetBagPosByItemSn(sceneId, selfId, x210243_g_Stone2.id)
		end
		
		local GemItemInfo
		if bagpos ~= -1 then
		  GemItemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
		end

		
		-- 3，检测玩家身上是不是有空间放奖励
		local nItemId = 0
		local nMenpaiName = ""
		for i=1, 10  do
			if nMenpai == x210243_g_ItemId[i].mp  then
				nItemId = x210243_g_ItemId[i].Item
				nMenpaiName = x210243_g_ItemId[i].mpname
			end
		end
		
		if nItemId==0  then
			return
		end

	 	BeginAddItem(sceneId)
			AddItem( sceneId, nItemId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		local delret = 1
		if ret == 1  then
		--开始扣除物品
			local DeleteNum = LuaFnGetAvailableItemCount(sceneId, selfId, x210243_g_Stone.id);
			if(DeleteNum >= x210243_g_Stone.num) then
			--扣除绑定的
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone.id, x210243_g_Stone.num) == 0   then
					delret = 0
				end
			elseif(DeleteNum == 0) then
			--扣除没有绑定的
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone2.id, x210243_g_Stone.num) == 0   then
					delret = 0
				end
			else
			--先扣除没绑定的再扣除绑定的
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone.id, DeleteNum) == 0   then
					delret = 0
				end
				
				DeleteNum = x210243_g_Stone.num - DeleteNum;  --还要删除的
				if LuaFnDelAvailableItem(sceneId, selfId, x210243_g_Stone2.id, DeleteNum) == 0   then
					delret = 0
				end
				
			end
			
			if delret == 1  then
				AddItemListToHuman(sceneId,selfId)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
				
				-- 提示玩家
				BeginEvent(sceneId)
					AddText(sceneId, "您获得了" .. nMenpaiName .. "的高级门派套装一件。" );
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
				-- 发世界公告
				local str = ""
				local rand = random(3)
				
				if rand == 1  then
					str = format("#P突然！天昏地暗，众人皆不知所措，原来是#{_INFOUSR%s}使用#G20本#{_INFOMSG%s}#P换取到了无出其右羡煞旁人的#G %s高级门派时装#P！", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				elseif rand == 2  then
					str = format("#P哇呀！#{_INFOUSR%s}使用#G20本#{_INFOMSG%s}#P换到了#G %s高级门派时装#P，穿上后真是惊人的耀眼！", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				else
					str = format("#P#{_INFOUSR%s}使用#G20本#{_INFOMSG%s}#P换到了#G %s高级门派时装#P！恭喜！恭喜！再恭喜！", GetName(sceneId,selfId), GemItemInfo, nMenpaiName)
				end
				
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
				
				-- 关闭窗口
				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
				return
			end
		end
		return

	end
	
	if GetNumText() == 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "#{function_help_094}" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--列举事件
--**********************************
function x210243_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText(sceneId, x210243_g_ScriptId,"领取门派高级时装", 6, 1);
	AddNumText(sceneId, x210243_g_ScriptId,"领取高级门派时装介绍", 0, 2);

end

--**********************************
--检测接受条件
--**********************************
function x210243_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x210243_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x210243_OnAbandon( sceneId, selfId )
end


--**********************************
--检测是否可以提交
--**********************************
function x210243_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x210243_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--进入区域事件
--**********************************
function x210243_OnEnterZone( sceneId, selfId, zoneId )
end

