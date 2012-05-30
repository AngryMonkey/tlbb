--鲜花的种子
--如意小子临时制作
--脚本号
x000174_g_scriptId = 000174

x000174_g_ItemId = 30309813

x000174_g_PlantingFlowersScriptId = 000175

x000174_g_minValue = 6000
x000174_g_maxValue = 9000

x000174_g_SceneMapDefine = {	
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
								 
x000174_g_GhoulMonsterTable = {
												{level=11, id=42130},{level=21, id=42131},
												{level=31, id=42132},{level=41, id=42133},
												{level=51, id=42134},{level=61, id=42135},
												{level=71, id=42136},{level=81, id=42137},
												{level=91, id=42138},{level=101, id=42139},
												{level=111, id=42140},{level=121, id=42141},
												{level=131, id=42142},{level=141, id=42143},
												{level=151, id=42144},{level=161, id=42145},
												{level=171, id=42146},{level=181, id=42147},
												{level=191, id=42148},{level=201, id=42149},
											}									 
									 
--**********************************
--得到item的参数信息
--**********************************
function x000174_GetItemParam(sceneId, selfId, BagPos)							
	--local BagPos = GetBagPosByItemSn(sceneId, selfId, x000174_g_ItemId)
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
--种植成功 --OK
--**********************************
function x000174_DiscoverGhoulMonster(sceneId, selfId)
	local humanLevel = LuaFnGetLevel(sceneId, selfId)
	local dataId = x000174_g_GhoulMonsterTable[1].id
	local ct = getn(x000174_g_GhoulMonsterTable)
	for i=1, ct do
		if humanLevel >= x000174_g_GhoulMonsterTable[i].level then
			dataId = x000174_g_GhoulMonsterTable[i].id
		end
	end

	local aifile = random(10)
	local x, z = GetWorldPos(sceneId, selfId)
	local MonsterId = LuaFnCreateMonster(sceneId, dataId, x, z-2, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, humanLevel+(random(2)-random(2)) )
	SetCharacterDieTime(sceneId, MonsterId, 60*60000)

	local strTitle, strName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "CreateTitleAndName_ForCangBaoTu", sceneId, selfId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			
		
	BeginEvent(sceneId)		
		AddText(sceneId, "鲜花幼苗种植成功");

	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
       local _, sceneName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "GetScenePosInfo", sceneId,sceneId)
		
	local playerName = GetName(sceneId,selfId)
	local strText = format("#cFF0000花仙子精灵#W手里拿着#c00ffff[波斯玫瑰]#W，正在#G%s#W得意洋洋的欣赏着，不料被#cff6633#{_INFOUSR%s}#W从美梦中惊醒！", 
				sceneName,playerName )

	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	
end

--**********************************
--根据场景Id得出对应的ID
--**********************************
function x000174_GetDataIDbySceneID(sceneId)
		for i, SceneMapInfo in x000174_g_SceneMapDefine do
			if SceneMapInfo.sceneId == sceneId then
				return SceneMapInfo.CorpseMonsterId
			end
		end
		return x000174_g_DefaultCorpseDataId
end

--**********************************
--默认事件
--**********************************
function x000174_OnDefaultEvent( sceneId, selfId, BagPos)
	
	-- /////////////////////////////////////////////////////////////////
	-- 先取出物品中数据，如果是默认值0则说明是第一次使用，立即生成数据
	-- 如果已经有数据则什么都不做
	local targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the first time .... nil nil nil")
		--立即生成数据
		CallScriptFunction(x000174_g_PlantingFlowersScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--重新获取物品数据
		targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	end
	-- 有些BT 我们再做一次检测
	if targetSceneId==nil or targetSceneId<=0
		or targetX==nil or targetX<=0
		or targetZ==nil or targetZ<=0
		or r==nil or r<=0 then
		--PrintStr("the second time .... nil nil nil")
		--立即生成数据
		CallScriptFunction(x000174_g_PlantingFlowersScriptId, "ProduceItemParamData", sceneId, selfId, BagPos)
		--重新获取物品数据
		targetSceneId, targetX, targetZ, r = x000174_GetItemParam(sceneId, selfId, BagPos)
	end
	--如果不在指定的场景, 指定的坐标就弹出对话框提示玩家去哪儿哪儿哪儿
	local sceneName = CallScriptFunction(x000174_g_PlantingFlowersScriptId, "GetSceneName", sceneId, selfId, targetSceneId)
	-- /////////////////////////////////////////////////////////////////
	
	--local sceneName = GetSceneName(targetSceneId)
	--PrintStr(sceneName)
	local strText = format("你需要把这颗鲜花的种子种在#R%s#c66ccff[%d,%d]", sceneName, targetX, targetZ)
	
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
			AddText(sceneId, "#G花匠阿里：#cffcc88鲜花种子是很有生命力的神奇精灵，需要懂得爱惜的人才能真正体会，当你得到珍贵的#c66ccff[波斯玫瑰]#cffcc88以后，你会这样想的。")
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
	--如果在使用范围, 则随机触发以下事件，无论几率多少都是种植成功的
	local ret = random(100)
	if ret < 30 then --种植成功
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 40 then --种植成功
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 80 then --种植成功
		x000174_DiscoverGhoulMonster(sceneId, selfId)
		if retval == 0 then
		  --记录统计信息
	    LuaFnAuditWaBao(sceneId, selfId)
			return
		end
	elseif ret < 85 then --种植成功
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	elseif ret < 95 then --种植成功
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	else --种植成功
		x000174_DiscoverGhoulMonster(sceneId, selfId)
	end
	
  EraseItem( sceneId, selfId, BagPos )
	
	--记录统计信息
	LuaFnAuditWaBao(sceneId, selfId)
		
end

function x000174_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
