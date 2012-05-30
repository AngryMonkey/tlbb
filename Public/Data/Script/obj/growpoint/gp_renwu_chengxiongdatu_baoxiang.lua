
--每次打开必定获得的产品
x715031_g_MainItemId = 20103008
--可能得到的产品
x715031_g_SubItemId = 50112003
--角色身上必须有的物品
x715031_g_MustHaveItemId = 20309009

function 	x715031_OnCreate(sceneId,growPointType,x,y)
	local targetId  = ItemBoxEnterScene(x,y,growPointType,sceneId,QUALITY_MUST_BE_CHANGE,1,x715031_g_MainItemId)
	
	--80%几率，宝箱里出现1个物品，出现的物品的判定等于挖宝的时候出现物品的判定。
	if random(100) <= 80 then
		local ItemSn, ItemName, bBroadCast = GetItemSnByDropRateOfItemTable()
		AddItemToBox(sceneId,targetId,QUALITY_MUST_BE_CHANGE,1,ItemSn)
	end	
	
end


--打开前函数开始&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x715031_OnOpen(sceneId,selfId,targetId)
--返回类型
-- 0 表示打开成功
	--PrintStr("OnOpen...")
	if HaveItem(sceneId,selfId, x715031_g_MustHaveItemId) > 0 then
		local Bagpos = GetBagPosByItemSn(sceneId,selfId,x715031_g_MustHaveItemId)
		if LuaFnIsItemAvailable(sceneId,selfId,Bagpos) == 1 then
			return OR_OK
		else
			Msg2Player(  sceneId, selfId,"宝藏主人的钥匙现在似乎不可用。" ,MSG2PLAYER_PARA )	
			BeginEvent(sceneId)
				AddText(sceneId, "宝藏主人的钥匙现在似乎不可用。")
			EndEvent()
			DispatchMissionTips(sceneId,selfId)
			return OR_ERROR	
		end
	else
		BeginEvent(sceneId)
			AddText(sceneId, "需要宝藏主人的钥匙才能打开");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return OR_STUFF_LACK	
	end
end
--打开前函数结束&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


function	x715031_OnProcOver(sceneId,selfId,targetId)
	--PrintStr("OnProcOver...")
	--打开宝箱会100%获得钱，直接加在玩家身上即可。
	--钱数=114＋（boss等级－30）×16 -->bosslevel == playerlevel
	if 1 == LuaFnDelAvailableItem(sceneId,selfId, x715031_g_MustHaveItemId, 1) then
		local BonusMoney = 114 + (GetLevel(sceneId, selfId)-20) * 16
		AddMoney(sceneId, selfId, BonusMoney)
		Msg2Player(  sceneId, selfId,"你得到了#{_MONEY" .. tostring(BonusMoney) .. "}" ,MSG2PLAYER_PARA )	
	else
		Msg2Player(  sceneId, selfId,"宝藏主人的钥匙现在似乎不可用。" ,MSG2PLAYER_PARA )	
		return OR_ERROR
	end
	return OR_OK
end

--回收函数开始########################################################################
function	 x715031_OnRecycle(sceneId,selfId,targetId)
		return OR_OK
end
--回收函数结束########################################################################

function x715031_OnTickCreateFinish( sceneId, growPointType, tickCount )
end
