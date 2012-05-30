-- 212220
-- 兑换物品
x212220_g_scriptId = 212220

x212220_g_Stone = {	{level=50,id=20310000,num=15},
										{level=60,id=20310000,num=30},
										{level=70,id=20310000,num=60},}
										
x212220_g_Stone2 = {	{level=50,id=20310003,num=15},
										{level=60,id=20310003,num=30},
										{level=70,id=20310003,num=60},}


x212220_g_Item = {
	{level=50,id=10410001},{level=50,id=10422013},{level=50,id=10420004},{level=50,id=10423021},
	{level=60,id=10410002},{level=60,id=10422014},{level=60,id=10420005},{level=60,id=10423022},
	{level=70,id=10410003},{level=70,id=10422015},{level=70,id=10420006},{level=70,id=10423023},
}

x212220_g_BossItem = {
	{item=10401002,boss="#{_BOSS33}",scene=0},
	{item=10403002,boss="#{_BOSS33}",scene=0},
	{item=10405001,boss="#{_BOSS33}",scene=0},
	{item=10404002,boss="#{_BOSS33}",scene=0},
				
	{item=10401003,boss="#{_BOSS37}",scene=0},
	{item=10403003,boss="#{_BOSS37}",scene=0},
	{item=10405002,boss="#{_BOSS37}",scene=0},
	{item=10404003,boss="#{_BOSS37}",scene=0},
	
	{item=10401004,boss="#{_BOSS41}",scene=0},
	{item=10403004,boss="#{_BOSS41}",scene=0},
	{item=10405003,boss="#{_BOSS41}",scene=0},
	{item=10404004,boss="#{_BOSS41}",scene=0},
}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212220_OnDefaultEvent( sceneId, selfId, targetId )

	local nNum = GetNumText()
	if nNum == 50 or nNum == 60 or nNum == 70   then
		
		local str
		
		if nNum == 50  then
			str = "你如果舍得将15个燕弦玉交给我就可以从下面装备中挑选一件："
		elseif nNum == 60  then
			str = "你如果舍得将30个燕弦玉交给我就可以从下面装备中挑选一件："
		elseif nNum == 70  then
			str = "你如果舍得将60个燕弦玉交给我就可以从下面装备中挑选一件："
	
		end
		BeginEvent(sceneId)
			AddText(sceneId,str);
			for i, temp in x212220_g_Item do
				if temp.level == nNum  then
					AddRadioItemBonus( sceneId, temp.id, 1 )
				end
			end
		EndEvent( )
		DispatchMissionContinueInfo(sceneId,selfId,targetId,x212220_g_scriptId,0)
	end
	

end

--**********************************
--列举事件
--**********************************
function x212220_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x212220_g_scriptId, "兑换50级套装", 6, 50 )
	AddNumText( sceneId, x212220_g_scriptId, "兑换60级套装", 6, 60 )
	AddNumText( sceneId, x212220_g_scriptId, "兑换70级套装", 6, 70 )
	
end

--**********************************
--检测接受条件
--**********************************
function x212220_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x212220_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x212220_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x212220_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x212220_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x212220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- 检测传过来的这个值是不是有效的
	local logNum1 = 0
	local logNum2 = 0
	local item
	local stone
	local stone2
	local bHaveItem = 0
	local bHaveStone = 0
	local temp
	local temp1
	for i, temp in x212220_g_Item do
		if temp.id == selectRadioId  then
			item = temp
			bHaveItem = 1
		end
	end
	
	-- 提交的物品不对应，直接返回，不做处理
	if bHaveItem == 0  then
		return
	end
	
	for i, temp1 in x212220_g_Stone do
		if temp1.level == item.level   then
			stone = temp1
			bHaveStone = 1
		end
	end
	
	--检测有没有第二种石头
	for i, temp1 in x212220_g_Stone2 do
		if temp1.level == item.level   then
			stone2 = temp1
			bHaveStone = 1
		end
	end
	
	-- 找不到对应的石头，直接返回
	if bHaveStone == 0    then
		return
	end
	
	-- 1，检测玩家身上是不是有位置能够放下物品
	BeginAddItem(sceneId)
		AddItem( sceneId, item.id, 1 )
	local ret = EndAddItem(sceneId,selfId)

	if ret < 1 then
		BeginEvent(sceneId)
			strText = "背包已满,无法兑换。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 2，计算石头数量
	local selfStoneCount = GetItemCount(sceneId,selfId, stone.id) + GetItemCount(sceneId,selfId, stone2.id)
	if stone.num > selfStoneCount   then
		BeginEvent(sceneId)
			strText = "你没有足够的材料来换取这个物品。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
		
	end
	
	-- 3，检测背包中，如果有石头上锁，就不让执行下去
	if LuaFnGetAvailableItemCount( sceneId, selfId, stone.id ) + LuaFnGetAvailableItemCount( sceneId, selfId, stone2.id ) < stone.num  then
		BeginEvent(sceneId)
			strText = "交换失败，请检查你提交的物品是不是上锁了。"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end	
	
	-- 4，删除物品 先删除绑定的
	local BangdingNum = LuaFnGetAvailableItemCount( sceneId, selfId, stone.id );
	if(BangdingNum >= stone.num) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone.id, stone.num)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "删除失败，请检查你提交的物品是不是上锁了。"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum1 = stone.num;
	elseif(BangdingNum == 0) then
		
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone2.id, stone2.num)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "删除失败，请检查你提交的物品是不是上锁了。"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum2 = stone2.num;	
	
	else
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone.id, BangdingNum)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "删除失败，请检查你提交的物品是不是上锁了。"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum1 = BangdingNum;
		
		--删没绑定的
		local Delete = stone.num - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, stone2.id, Delete)
		if ret1 < 1  then
			BeginEvent(sceneId)
				strText = "删除失败，请检查你提交的物品是不是上锁了。"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		logNum2 = Delete;
	end
	
	-- 给奖励
	AddItemListToHuman(sceneId,selfId)

	-- 记录Log
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone.id, logNum1, item.id)
	LuaFnAuditYanXuanYuExchange(sceneId, selfId, stone2.id, logNum2, item.id)
	
	--兑换成功，播放特效
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	
	-- 发世界公告
	local szItem = GetItemTransfer(sceneId,selfId,0)
	local randMessage = random(3);

	if randMessage == 1 then
   	message = format("#Y穆岛#P把鼻子凑到#W#{_INFOUSR%s}#P带来的#Y燕弦玉#P旁深吸一口气。片刻后点头道：一级货，这个#{_INFOMSG%s}#P归你了。", 
   										GetName(sceneId, selfId), szItem);

	elseif randMessage == 2 then		
		message = format("#Y穆岛#P向#W#{_INFOUSR%s}#P带来的#Y燕弦玉#P吹了口气，在耳旁倾听后点头道：纯度不错，这个#{_INFOMSG%s}#P归你了。", 
											GetName(sceneId, selfId), szItem);
	else
		message = format("#Y穆岛#P拿着#W#{_INFOUSR%s}#P带来的#Y燕弦玉#P，对着阳光仔细看了片刻，点头道：是真的，这个#{_INFOMSG%s}#P归你了。", 
											GetName(sceneId, selfId), szItem);
	end
	
	AddGlobalCountNews( sceneId, message )
	
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212220_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x212220_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212220_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--杀死BOSS拾取装备的世界公告
--**********************************
function x212220_ItemBulletin( sceneId, selfId, itemId, bagidx, bGem )
	local bHaveItem = 0
	local bossitem
	for i, temp in x212220_g_BossItem do
		if temp.item == itemId  then
			bossitem = temp
			bHaveItem = 1
		end
	end
	
	if bHaveItem == 0  then
		return
	end
	
	if sceneId ~= 167 then --by hukai 2008.10.06 BugID38192
		return
	end
	
	local szItem = GetBagItemTransfer(sceneId, selfId, bagidx)
	
	local randMessage = random(3);
	
	randMessage =3
	
	
	if randMessage == 1 then
   	message = format("#{_INFOUSR%s}#P在#G%s#P以一记“窝心脚”踢中#Y%s#P腿部，大获全胜，得到了一件#{_INFOMSG%s}。", 
   										GetName(sceneId, selfId), GetSceneName(sceneId), bossitem.boss, szItem );

	elseif randMessage == 2 then		
		message = format("#{_INFOUSR%s}#P在#G%s#P一招“六脉神剑”击倒#Y%s#P，拾起#Y%s#P掉下的#{_INFOMSG%s}#P大笑而去。", 
											GetName(sceneId, selfId), GetSceneName(sceneId), bossitem.boss, bossitem.boss, szItem);
	else
		message = format("#Y%s#P在#G%s#P被#W#{_INFOUSR%s}#P从身后一记猛拳打伤，只得交出一件#{_INFOMSG%s}#P求饶。", 
											bossitem.boss, GetSceneName(sceneId), GetName(sceneId, selfId), szItem);
	end
	
	AddGlobalCountNews( sceneId, message )
	
end

