--使用藏宝图

--脚本号
x300022_g_scriptId = 300022

x300022_g_ItemId = 30000000

x300022_g_NpcScriptID = 807001

x300022_g_DefaultCorpseDataId = 3510

x300022_g_ChengxiongdatuScriptId = 229020

x300022_g_DiaorubaozangScriptId = 229021

x300022_g_minValue = 6000
x300022_g_maxValue = 9000

x300022_g_MissionIndex10 = 24
x300022_g_MissionIndex20 = 43
x300022_g_MissionIndex30 = 44
x300022_g_MissionIndex40 = 45
x300022_g_MissionIndex50 = 46
x300022_g_MissionIndex60 = 47
x300022_g_MissionIndex70 = 48
x300022_g_MissionIndex80 = 49
x300022_g_MissionIndex90 = 50

--g_ItemTable = {
--							{sn=30001001, name="行血散"},
--							{sn=30002007, name="仙丹秋月"},
--							{sn=30007003, name="王母仙丹"},
--							{sn=30101017, name="饺子"},
--							{sn=30402016, name="高级加速技能书"},
--							{sn=30505004, name="烟花"},
--							{sn=30505001, name="速行鞋"},
--							{sn=30701009, name="坐骑：白虎"},
--							{sn=30701007, name="坐骑：鹿"}
--							}


x300022_g_CorpseMonsterPosTable = {
													{x=104, z=221},
													{x=104, z=201},
													{x=79, z=222}
													}

x300022_g_SceneMapDefine = {	
										{sceneId=18,	sceneName="雁南",	CorpseMonsterId=3512},
										{sceneId=19,	sceneName="雁北",	CorpseMonsterId=3513},
										{sceneId=20,	sceneName="草原",	CorpseMonsterId=3515},
										{sceneId=21,	sceneName="辽西",	CorpseMonsterId=3516},
										{sceneId=22,	sceneName="长白山",	CorpseMonsterId=3518},
										{sceneId=23,	sceneName="黄龙府",	CorpseMonsterId=3519},
										{sceneId=24,	sceneName="洱海",	CorpseMonsterId=3511},
										{sceneId=25,	sceneName="苍山",	CorpseMonsterId=3513},
										{sceneId=26,	sceneName="石林",	CorpseMonsterId=3514},
										{sceneId=27,	sceneName="玉溪",	CorpseMonsterId=3516},
										{sceneId=28,	sceneName="南诏",	CorpseMonsterId=3517},
										{sceneId=29,	sceneName="苗疆",	CorpseMonsterId=3518},
										{sceneId=30,	sceneName="西湖",	CorpseMonsterId=3511},
										{sceneId=31,	sceneName="龙泉",	CorpseMonsterId=3512},
										{sceneId=32,	sceneName="武夷",	CorpseMonsterId=3514},
										{sceneId=33,	sceneName="梅岭",	CorpseMonsterId=3515},
										{sceneId=34,	sceneName="南海",	CorpseMonsterId=3517},
										{sceneId=35,	sceneName="琼州",	CorpseMonsterId=3518},
									}
								 
x300022_g_GhoulMonsterTable = {
												{level=11, id=3520},{level=21, id=3521},
												{level=31, id=3522},{level=41, id=3523},
												{level=51, id=3524},{level=61, id=3525},
												{level=71, id=3526},{level=81, id=3527},
												{level=91, id=3528},{level=101, id=3529},
											}									 
									 
--**********************************
--得到item的参数信息
--**********************************
function x300022_GetItemParam(sceneId, selfId, BagPos)							
	--local BagPos = GetBagPosByItemSn(sceneId, selfId, x300022_g_ItemId)
	--PrintNum(BagPos)
	local targetsceneId = GetBagItemParam(sceneId, selfId, BagPos, 1, 1)
	--PrintNum(targetsceneId)
	local targetX = GetBagItemParam(sceneId, selfId, BagPos, 3, 1)
	--PrintNum(targetX)
  local targetZ = GetBagItemParam(sceneId, selfId, BagPos, 5, 1)
  --PrintNum(targetZ)
  local r = GetBagItemParam(sceneId, selfId, BagPos, 7, 1)
  return targetsceneId, targetX, targetZ, r
end

--**********************************
--挖到银两 --OK
--**********************************
function x300022_DiscoverMoney(sceneId, selfId)
		--PrintStr("DiscoverMoney...")
		local Bonus = random(x300022_g_maxValue-x300022_g_minValue) + x300022_g_minValue
		local str = "你挖到#{_MONEY" .. tostring(Bonus) .. "}"
		AddMoney(sceneId, selfId, Bonus)
		Msg2Player(  sceneId, selfId, str, MSG2PLAYER_PARA )
		BeginEvent(sceneId)
			AddText(sceneId, str);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************
--遇盗墓贼 --OK
--**********************************
function x300022_DiscoverGhoulMonster(sceneId, selfId)
	local humanLevel = LuaFnGetLevel(sceneId, selfId)
	local dataId = x300022_g_GhoulMonsterTable[1].id
	local ct = getn(x300022_g_GhoulMonsterTable)
	for i=1, ct do
		if humanLevel >= x300022_g_GhoulMonsterTable[i].level then
			dataId = x300022_g_GhoulMonsterTable[i].id
		end
	end

	local aifile = random(10)
	local x, z = GetWorldPos(sceneId, selfId)
	local MonsterId = LuaFnCreateMonster(sceneId, dataId, x, z-2, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, humanLevel+(random(2)-random(2)) )
	SetCharacterDieTime(sceneId, MonsterId, 60*60000)

	local strTitle, strName = CallScriptFunction(x300022_g_ChengxiongdatuScriptId, "CreateTitleAndName_ForCangBaoTu", sceneId, selfId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			

		
	BeginEvent(sceneId)		
		AddText(sceneId, "小心! 盗墓贼");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--获得物品 --OK
--**********************************
function x300022_DiscoverItem(sceneId, selfId)
	
		--tableIndex = random(9)
		--ItemSn = g_ItemTable[tableIndex].sn
		--ItemName = g_ItemTable[tableIndex].name
		--PrintStr("DiscoverItem...")
		local ItemSn, ItemName, _, bBroadCast
		local playerLevel = LuaFnGetLevel(sceneId, selfId)
		if playerLevel <= 10 then
		 ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex10)
		elseif  playerLevel <= 20 then
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex20)
		elseif  playerLevel <= 30 then
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex30)
		elseif  playerLevel <= 40 then
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex40)
		elseif  playerLevel <= 50 then
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex50)
		elseif  playerLevel <= 60 then
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex60)
		elseif  playerLevel <= 70 then
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex70)
		elseif  playerLevel <= 80 then
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex80)
		else
			ItemSn, ItemName, _, bBroadCast = GetOneMissionBonusItem(x300022_g_MissionIndex90)
		end
		
		BeginAddItem(sceneId)
			AddItem( sceneId, ItemSn, 1 )
		local canAdd = EndAddItem(sceneId,selfId)
		
		if canAdd > 0 then
			--奖励统计
			local itemName;
			_,itemName,_ = GetItemInfoByItemId(ItemSn)
			LuaFnAuditItemCreate(sceneId,selfId,1,ItemSn,itemName,"挖宝")

		AddItemListToHuman(sceneId,selfId)
		local strText = format("你获得了%s", ItemName)
		
		BeginEvent(sceneId)
			AddText(sceneId, strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local PlayName = GetName(sceneId,selfId)
		local x, z = GetWorldPos(sceneId,selfId)

		local _, sceneName = CallScriptFunction(x300022_g_ChengxiongdatuScriptId, "GetScenePosInfo", sceneId,sceneId)
		ItemName = GetItemTransfer(sceneId,selfId,0)
		strText = format("#W#{_INFOUSR%s}#P在#G%s#P挖宝时幸运的得到了#W#{_INFOMSG%s}", PlayName, sceneName, ItemName)
		--PrintNum(bBroadCast)
			BroadMsgByChatPipe(sceneId, selfId, strText, bBroadCast)
		else
			BeginEvent(sceneId)
				AddText(sceneId, "你的背包已满！")
			EndEvent()	
			DispatchMissionTips(sceneId, selfId)
			return 0
		end	
		return 1
end

--**********************************
--根据场景Id得出对应的怪物的ID
--**********************************
function x300022_GetDataIDbySceneID(sceneId)
		for i, SceneMapInfo in x300022_g_SceneMapDefine do
			if SceneMapInfo.sceneId == sceneId then
				return SceneMapInfo.CorpseMonsterId
			end
		end
		return x300022_g_DefaultCorpseDataId
end

--**********************************
--放出僵尸
--**********************************
function x300022_DiscoverCorpseMonster(sceneId, selfId)

		local corpseMonsterId = x300022_GetDataIDbySceneID(sceneId)
		for i=1, 10 do
			local _, sceneName, x, z, _ = CallScriptFunction(x300022_g_ChengxiongdatuScriptId, "GetScenePosInfo", sceneId,sceneId)
			--至少保证在玩家身边出现一个夺宝马贼
			if i == 1 then
				x, z = GetWorldPos(sceneId,selfId)
				x = x + 2
			end	
			
			corpseMonsterId = corpseMonsterId or x300022_g_DefaultCorpseDataId
			local aifile = random(10)
			local MonsterId = LuaFnCreateMonster(sceneId, corpseMonsterId, x, z, 0, aifile, x300022_g_NpcScriptID)
			SetCharacterDieTime(sceneId, MonsterId, 60*60000)
			--设置对怪为友好的 目前是0号是友好的，如果有人改变了相应的势力声望那我就惨了！！:-(((
			SetUnitReputationID(sceneId, selfId, MonsterId, 0)
			local  monsterLevel = GetLevel(sceneId, MonsterId)
			SetLevel(sceneId, MonsterId, monsterLevel+i-1)
			--如果怪物的最大等级超过玩家最大等级上限，则怪物等级等于玩家最大等级上限
			local PlayerMaxLevel = GetHumanMaxLevelLimit()
			if monsterLevel+i-1 > PlayerMaxLevel then
				SetLevel(sceneId, MonsterId, PlayerMaxLevel)
			end
		end
		
		BeginEvent(sceneId)
			AddText(sceneId, "放夺宝马贼");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		local _, sceneName = CallScriptFunction(x300022_g_ChengxiongdatuScriptId, "GetScenePosInfo", sceneId,sceneId)
		
		local playerName = GetName(sceneId,selfId)
		local strText = format("#W#{_INFOUSR%s}#P在挖宝时不慎泄漏消息，在#G%s#P引来了一伙#{_BOSS48}。江湖志士只要去剿灭马贼，就能获得马贼的藏宝！", 
					playerName, sceneName)

		BroadMsgByChatPipe(sceneId, selfId, strText, 4)

end

--**********************************
--掉入宝藏
--**********************************
function x300022_DiscoverInstance(sceneId, selfId)
		BeginEvent(sceneId)
			AddText(sceneId, "掉入宝藏");
			CallScriptFunction(x300022_g_DiaorubaozangScriptId, "MakeCopyScene",sceneId, selfId, 0)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************
--遭遇机关 --OK
--**********************************
function x300022_DiscoverTrap(sceneId, selfId)
		local nHp = GetHp(sceneId, selfId)
		local nMp = GetHp(sceneId, selfId)
		local nHp = nHp * 0.3 --0.05
		local nMp = nMp * 0.3 --0.05
		
		if nHp < 1 then
			nHp = 1
		end
		if nMp < 1 then
			nMp = 1
		end
		
		SetHp(sceneId, selfId, nHp)
		SetMp(sceneId, selfId, nMp)
		
		BeginEvent(sceneId)
			AddText(sceneId, "遭遇机关");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end

--**********************************
--默认事件
--**********************************
function x300022_OnDefaultEvent( sceneId, selfId, BagPos)
	--PrintStr("cangbaotu...x300022_OnDefaultEvent...")
	
	--未满30级时轻涉宝藏恐有性命之虞啊
	if GetLevel(sceneId, selfId) < 30 then
		BeginEvent(sceneId)
			AddText(sceneId, "未满30级时轻涉宝藏恐有性命之虞啊")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return
	end	
	
	-- /////////////////////////////////////////////////////////////////
	-- 先取出物品中数据，如果是默认值0则说明是第一次使用，立即生成数据
	-- 如果已经有数据则什么都不做
	local targetSceneId, targetX, targetZ, r = x300022_GetItemParam(sceneId, selfId, BagPos)
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the first time .... nil nil nil")
		--立即生成数据
		CallScriptFunction(x300022_g_ChengxiongdatuScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--重新获取物品数据
		targetSceneId, targetX, targetZ, r = x300022_GetItemParam(sceneId, selfId, BagPos)
	end
	-- 有些BT 我们再做一次检测
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the second time .... nil nil nil")
		--立即生成数据
		CallScriptFunction(x300022_g_ChengxiongdatuScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--重新获取物品数据
		targetSceneId, targetX, targetZ, r = x300022_GetItemParam(sceneId, selfId, BagPos)
	end
	--如果不在指定的场景, 指定的坐标就弹出对话框提示玩家去哪儿哪儿哪儿
	local sceneName = CallScriptFunction(x300022_g_ChengxiongdatuScriptId, "GetSceneName", sceneId, selfId, targetSceneId)
	-- /////////////////////////////////////////////////////////////////
	
	--local sceneName = GetSceneName(targetSceneId)
	--PrintStr(sceneName)
	local strText = format("你到%s的[%d,%d]才能使用", sceneName, targetX, targetZ)
	
	--取得玩家当前坐标
	local PlayerX = GetHumanWorldX(sceneId, selfId)
	local PlayerZ = GetHumanWorldZ(sceneId, selfId)
	--计算玩家与目标点的距离
	local Distance = floor(sqrt((targetX-PlayerX)*(targetX-PlayerX)+(targetZ-PlayerZ)*(targetZ-PlayerZ)))
	--print(PlayerX,PlayerZ)

	if targetSceneId ~= sceneId or Distance > r then
		--print(sceneId,selfId,targetId)
		BeginEvent(sceneId)
			AddText(sceneId, strText);
			AddText(sceneId, "#e00f000小提示：#e000000有的时候藏宝图会出现在#gfff0f0高于您目前等级的地图#g000000这些地图上面怪物等级较高，#gfff0f0请千万小心#g000000，您可以将藏宝图出售给其他玩家或者留待自己等级上升之后再来使用。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)

		--test code begin
		--EraseItem( sceneId, selfId, BagPos )
		--test cod end
		return
	end	
	
	--删除该物品
	if LuaFnIsItemAvailable(sceneId, selfId, BagPos) <= 0 then
		BeginEvent(sceneId)
			AddText(sceneId, "您的物品现在不可用或已被锁定。")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)	
		return	
	end	
	
	--PrintStr("begin random...")
	--如果在使用范围, 则随机触发以下事件
	local ret = random(100)
	if ret < 30 then --挖到银两
		x300022_DiscoverMoney(sceneId, selfId)
	elseif ret < 40 then --放出僵尸
		x300022_DiscoverCorpseMonster(sceneId, selfId)
	elseif ret < 80 then --获得物品
		local retval = x300022_DiscoverItem(sceneId, selfId)
		if retval == 0 then
		  --记录统计信息
	    LuaFnAuditWaBao(sceneId, selfId)
			return
		end
	elseif ret < 85 then --遇盗墓贼
		x300022_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 95 then --掉入宝藏
		x300022_DiscoverInstance(sceneId, selfId)
	else --遭遇机关
		x300022_DiscoverTrap(sceneId, selfId)
	end
	
  EraseItem( sceneId, selfId, BagPos )
	
	--记录统计信息
	LuaFnAuditWaBao(sceneId, selfId)
		
end

function x300022_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
