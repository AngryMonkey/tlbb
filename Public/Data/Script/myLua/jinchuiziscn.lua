--鲜花种植任务
--如意小子临时制作
--脚本号
x000177_g_ScriptId = 000177

x000177_g_NeedItemId = 30309825     --在CommonItem.txt新加的鲜花的种子代码

x000177_g_scenePosInfoList = {
	{sceneId=0, sceneName="洛阳", minL=30, maxL=45,  posList={
																						{x=256, z=252, r=10},
		}
	},
}

										
--下列的monsterID依次对应于的等级为11, 21, 31, 41, 51, 61, 71, 81, 91, 101...201
x000177_g_MonsterConfigTable = {
												{level=11, id=42130},{level=21, id=42131},
												{level=31, id=42132},{level=41, id=42133},
												{level=51, id=42134},{level=61, id=42135},
												{level=71, id=42136},{level=81, id=42137},
												{level=91, id=42138},{level=101, id=42139},
												-- add by zchw for chengxiong
												{level=111, id=42140},{level=121, id=42141},
												{level=131, id=42142},{level=141, id=42143},
												{level=151, id=42144},{level=161, id=42145},
												{level=171, id=42146},{level=181, id=42147},
												{level=191, id=42148},{level=201, id=42149},
											 }
                    
--HP、外功伤害、内功伤害、外功防御、内功防御
x000177_g_RefixValueOfMonsterAttr = {
											{attr_enum=5,  refixrate=10},
											{attr_enum=17, refixrate=10},
											{attr_enum=19, refixrate=10},
											{attr_enum=18, refixrate=10},
											{attr_enum=20, refixrate=10},		
														}
														
x000177_g_TitleTableOfMonster = {
		{part2="种植的幼苗"},
						}
						
x000177_g_NameTableOfMonster = {
	{part1="花仙子", part2="精", part3="灵"},
					}						


function x000177_GetSceneNameById(sceneId)
	for i, v in x000177_g_scenePosInfoList do
		if v.sceneId == sceneId then
			return v.sceneName
		end
	end
end

function x000177_GetSceneName(sceneId, selfId, targetSceneId)
	return x000177_GetSceneNameById(targetSceneId)
end

function x000177_GetSceneIdByPlayerLevel(playerLevel)
	if playerLevel >= 100 then -- 大于等于100级的玩家则所有的场景都是随机的
		local index = random(getn(x000177_g_scenePosInfoList))
		return x000177_g_scenePosInfoList[index].sceneId
	else
	local j = 1
	local sceneTable = {}
	for i, v in x000177_g_scenePosInfoList do
		if playerLevel >= v.minL and playerLevel <= v.maxL then
			sceneTable[j] = v.sceneId
			j = j + 1
		end
	end
	local index = random(getn(sceneTable))
	return sceneTable[index]
end
end

function x000177_GetScenePosInfo(sceneId,selectSceneId)

	local index = random(getn(x000177_g_scenePosInfoList))
	local subIndex = random(getn(x000177_g_scenePosInfoList[index].posList))
		
	local sceneId = x000177_g_scenePosInfoList[index].sceneId
	local sceneName = x000177_g_scenePosInfoList[index].sceneName
	local x		 	= x000177_g_scenePosInfoList[index].posList[subIndex].x
	local z 		= x000177_g_scenePosInfoList[index].posList[subIndex].z
	local r 		= x000177_g_scenePosInfoList[index].posList[subIndex].r
	
	if selectSceneId >=0 and selectSceneId ~= -1 then
		for i, v in x000177_g_scenePosInfoList do
			if v.sceneId == selectSceneId then
				local index = random(getn(v.posList))
				--PrintStr("..." .. v.sceneName)
				sceneId, sceneName, x, z, r = v.sceneId, v.sceneName, v.posList[index].x, v.posList[index].z, v.posList[index].r
			end
		end
	end
	
	if nil==sceneId or nil==sceneName
	 or nil==x or nil==z or nil==r then
		local logstr = "GetScenePosInfo..selectSceneId=" .. selectSceneId .. "impossible!!!"
		MissionLog(sceneId, logstr);
	end	

	return sceneId, sceneName, x, z, r	
		
end

function x000177_CreateTitleAndName(sceneId, selfId)			
	--设置monster的称号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x000177_g_MissionId)
	local ct = getn(x000177_g_TitleTableOfMonster)
	local ret = random(ct)
	local part1 = x000177_g_TitleTableOfMonster[ret].part1
	ret = random(ct)
	local part2 = x000177_g_TitleTableOfMonster[ret].part2
	local strTitle = format("%s%s", part1, part2)
	--设置monster的name
	
	local logstr = "CreateTitleAndName.."
	ct = getn(x000177_g_NameTableOfMonster)
	ret = random(ct)
	logstr = logstr .. "part1index=" .. ret
	local part1 = x000177_g_NameTableOfMonster[ret].part1
	SetMissionByIndex(sceneId,selfId,misIndex,5,ret)
	
	local LogInfo	= format( "[ChengXiong]: x000177_CreateTitleAndName( sceneId=%d, GUID=%0X ), ret01=%d, misIndex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ret,
														misIndex)	
	MissionLog(sceneId, LogInfo)	
	
	ret = random(ct)
	logstr = logstr .. ",part2index=" .. ret
	local part2 = x000177_g_NameTableOfMonster[ret].part2
	SetMissionByIndex(sceneId,selfId,misIndex,6,ret)
	
	local LogInfo	= format( "[ChengXiong]: x000177_CreateTitleAndName( sceneId=%d, GUID=%0X ), ret02=%d, misIndex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ret,
														misIndex)	
	MissionLog(sceneId, LogInfo)	
	
	ret = random(ct)
	logstr = logstr .. ",part3index=" .. ret .. "\n"
	local part3 = x000177_g_NameTableOfMonster[ret].part3
	SetMissionByIndex(sceneId,selfId,misIndex,7,ret)
	
	local LogInfo	= format( "[ChengXiong]: x000177_CreateTitleAndName( sceneId=%d, GUID=%0X ), ret03=%d, misIndex=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														ret,
														misIndex)	
	MissionLog(sceneId, LogInfo)	
	
	local strName = format("%s%s%s", part1, part2, part3)
	
	MissionLog(sceneId, logstr)
		
	return strTitle, strName

end

function x000177_CreateTitleAndName_ForCangBaoTu(sceneId, selfId)

	--设置生成monster的称号
	local ct = getn(x000177_g_TitleTableOfMonster)
	local ret = random(ct)
	local part1 = x000177_g_TitleTableOfMonster[ret].part1
	ret = random(ct)
	local part2 = x000177_g_TitleTableOfMonster[ret].part2
       local PlayerName=GetName(sceneId,selfId)	     --取得正在种植的玩家名字
	local strTitle = format("%s%s", PlayerName, part2)     --然后添加到召唤出的幼苗称号里面

	--设置生成monster的name
	ct = getn(x000177_g_NameTableOfMonster)
	ret = random(ct)
	local part1 = x000177_g_NameTableOfMonster[ret].part1
	ret = random(ct)
	local part2 = x000177_g_NameTableOfMonster[ret].part2
	ret = random(ct)
	local part3 = x000177_g_NameTableOfMonster[ret].part3
	local strName = format("%s%s%s", part1, part2, part3)

	return strTitle, strName

end

--**********************************
--根据玩家等级对应生成monster的ID
--**********************************
function x000177_CreateMonsterbyHumanLevel(sceneId, selfId, x, z)
	local humanLevel = LuaFnGetLevel(sceneId, selfId)
	local dataId = x000177_g_MonsterConfigTable[1].id
	local ct = getn(x000177_g_MonsterConfigTable)
	for i=1, ct do
		if humanLevel >= x000177_g_MonsterConfigTable[i].level then
			if i+1 <= ct then
				if humanLevel < x000177_g_MonsterConfigTable[i+1].level then
					dataId = x000177_g_MonsterConfigTable[i].id
					break
				end	
			end	
		end
	end
	
	local aifile = random(10)
	local MonsterId = LuaFnCreateMonster(sceneId, dataId, x, z, 0, aifile, -1)
	SetLevel(sceneId, MonsterId, humanLevel+(random(2)-random(2)) )
	SetCharacterDieTime(sceneId, MonsterId, 20*60000)
	
	local strTitle, strName = x000177_CreateTitleAndName(sceneId,selfId)
	SetCharacterTitle(sceneId, MonsterId, strTitle)
	SetCharacterName(sceneId, MonsterId, strName)			
	
end
			
function x000177_ProduceItemParamData(sceneId, selfId, BagPos)
	local index = random(getn(x000177_g_scenePosInfoList))
	local sId = x000177_g_scenePosInfoList[index].sceneId
	local scene, sceneName, x, z, r = x000177_GetScenePosInfo(sceneId,sId)

	if nil == BagPos or BagPos < 0 then
		local logstr = "chengxiongdatu::x000177_ProduceItemParamData.. BagPos=" .. BagPos 
		MissionLog(sceneId, logstr)
		return
	end
	if scene == nil or sceneName == nil 
		or x == nil or z == nil or r == nil then
		local logstr = "chengxiongdatu::x000177_ProduceItemParamData.."
			.. "scene=" .. type(scene) .. ",sceneName=" .. type(sceneName)
			.. "x=" .. type(x) .. ",z=" .. type(z) .. ",r=" .. type(r)
		
		MissionLog(sceneId, logstr)
		return
	end
	
	local LogInfo	= format( "[ChengXiong]: x000177_ProduceItemParamData( sceneId=%d, GUID=%0X ), Scene=%d, SceneName=%s, MissionX=%d, MissionZ=%d, MissionR=%d",
														sceneId,
														LuaFnObjId2Guid( sceneId, selfId ),
														scene,
														sceneName,
														x,
														z,
														r)	
	MissionLog(sceneId, LogInfo)	
	
	SetBagItemParam(sceneId, selfId, BagPos, 0, 0, 1)
	SetBagItemParam(sceneId, selfId, BagPos, 1, 1, scene)
	SetBagItemParam(sceneId, selfId, BagPos, 3, 1, x)
	SetBagItemParam(sceneId, selfId, BagPos, 5, 1, z)
	SetBagItemParam(sceneId, selfId, BagPos, 7, 1, r)

end
