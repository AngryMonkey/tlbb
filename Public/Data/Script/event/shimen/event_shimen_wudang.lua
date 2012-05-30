 --师门任务

--MisDescBegin
--脚本号
x229002_g_ScriptId = 229002

--接受任务NPC属性
x229002_g_Position_X=78.2036
x229002_g_Position_Z=95.2641
x229002_g_SceneID=12
x229002_g_AccomplishNPC_Name="张中行"

--前提任务
--g_MissionIdPre =

--任务目标npc
x229002_g_Name	= "张中行"

--任务号
x229002_g_MissionId = 1075

--任务归类
x229002_g_MissionKind = 23

--任务等级
x229002_g_MissionLevel = 10000

--是否是精英任务
x229002_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x229002_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x229002_g_MissionName="师门任务"
x229002_g_MissionInfo=""  --任务描述
x229002_g_MissionTarget = "%f"
x229002_g_ContinueInfo="干得不错"		--未完成任务的npc对话
x229002_g_MissionComplete="我交给你的事情已经做完了吗？"					--完成任务npc说话的话
x229002_g_MissionRound=17
x229002_g_DoubleExp = 48
x229002_g_AccomplishCircumstance = 1

x229002_g_ShimenTypeIndex = 1
x229002_g_Parameter_Kill_AllRandom={{id=7,numa=3,numb=3,bytenuma=0,bytenumb=1}}
x229002_g_Parameter_Item_IDRandom={{id=6,num=5}}
x229002_g_NpcIdIndicator={{key=2,npcIdIndex=5},{key=9,npcIdIndex=7}}

--用来保存字符串格式化的数据
x229002_g_FormatList = {
								"好久没有见到%n了，很是想念啊。这个%s是我的一点心意，请你把它送过去吧。#r  #e00f000小提示：#e000000#r  你可以在武当山找到#R莫太冲#W#{_INFOAIM101,136,12,莫太冲}，请他把你送往各大城市。#B#r  东西送到后，请到师门任务发布人#W张中行#{_INFOAIM78,95,12,张中行}处交还任务。#r#{SMRW_090206_01}",
								"我的%i怎么不见了？如果你能帮我找回来，我是不会亏待你的。#r  #e00f000小提示：#e000000#r  你可以在武当山找到#R莫太冲#W#{_INFOAIM101,136,12,莫太冲}，请他把你送往各大城市。#r#{SMRW_090206_01}",
								"%n为非作歹，我有心去教训一下，可惜没有时间，你能代劳吗？#r  #e00f000小提示：#e000000#r  你可以在武当山找到#R莫太冲#W#{_INFOAIM101,136,12,莫太冲}，请他把你送往各大城市。#r#{SMRW_090206_01}",
								"请你使用%s，在武当%s的%s中采集灵气。#r  #e00f000小提示：#e000000#r  当你来到需要采集灵气的地方时，你可以按#gfff0f0Alt+A#g000000可以打开物品栏，点击#gfff0f0‘任务’#g000000页面就可以打开任务物品栏，右键点击#gfff0f0紫金葫芦#g000000，就可以完成采集了。#r#{SMRW_090206_01}",
								"请你去找到%s， 他会带你去挑战%s的。#r  #e00f000小提示：#e000000#r  林灵素师兄就在武当山#{_INFOAIM58,73,12,林灵素}。#r#{SMRW_090206_01}",
								"请你帮我抓一只%p来。#B#r  #e00f000小提示：#e000000#r  #G洛阳城的云涵儿#{_INFOAIM183,155,0,云涵儿}可以送你去玄武岛，而玄武岛有一条小路通往圣兽山。你可以在玄武岛或者圣兽山上捕捉我需要的珍兽。#r#{SMRW_090206_01}",
								"请你在武当山上四处看看，帮我找来5个%s。#r  #e00f000小提示：#e000000#r  你可以在屏幕右上角的小地图上找到黄色的指示点。#r#{SMRW_090206_01}",
								"请给%s送去一个%i吧，事成之后，我会给你报酬的！#r  #e00f000小提示：#e000000#r  青冥神鹤就在武当山#{_INFOAIM102,108,12,青冥神鹤}。#r  九天神鹤就在武当山#{_INFOAIM86,84,12,九天神鹤}。#r  无极神鹤就在武当山#{_INFOAIM74,85,12,无极神鹤}。#B#r  东西送到后，请到师门任务发布人#W张中行#{_INFOAIM78,95,12,张中行}处交还任务。#r#{SMRW_090206_01}",
								"去杀死%s%s个%n。#r#{SMRW_090206_01}",
								}

--格式字符串中的索引, 表示从4开始,后多少位视SetMissionByIndex(...)的多少而定
x229002_g_StrForePart=4
x229002_g_ShimenPet_Index = 1

x229002_g_StrList = {
						"紫金葫芦",
						"金殿",
						"解剑池",
						"回龙台",
						"天阶",
						"林灵素",
						"灵性峰副本",
						"武当灵芝",
						"武当首乌",
						"武当人参",
						"青冥神鹤",
						"九天神鹤",
						"无极神鹤",
						"野生柴猫",
						"云雾",
						"0",
						"1",
						"2",
						"3",
						"4",
						"5",
						"6",
						"7",
						"8",
						"9",
						}
--MisDescEnd


--/////////////////////////////////////////////////////////////////////////////////////////////////////

--子任务的类型代号定义
x229002_g_SubMissionTypeEnum = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8,  killMonster=9,}

--定点引导
x229002_g_DingDianYinDaoList = {
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="紫金葫芦", scene=12, AreaName="金殿", subAreaName="云雾", posx1=72, posz1=39, posx2=100, posz2=65},
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="紫金葫芦", scene=12, AreaName="解剑池", subAreaName="云雾", posx1=36, posz1=170, posx2=52, posz2=190},
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="紫金葫芦", scene=12, AreaName="回龙台", subAreaName="云雾", posx1=70, posz1=127, posx2=86, posz2=149},
											 {menpai=MP_WUDANG   , itemId=40003019, itemName="紫金葫芦", scene=12, AreaName="天阶", subAreaName="云雾", posx1=42, posz1=64, posx2=50, posz2=89},
											}


--副本列表
x229002_g_FuBen_List = {
								{menpai=MP_WUDANG   , NpcName="林灵素", scene=12, posx=58, posz=73, FubenName="灵性峰副本"},
								}       

--收集
x229002_g_ShouJiList = {
								{menpai=MP_WUDANG   , scene=12, itemId=40003021, itemName="武当灵芝"},-- count=5},
								{menpai=MP_WUDANG   , scene=12, itemId=40003022, itemName="武当首乌"},-- count=5},
								{menpai=MP_WUDANG   , scene=12, itemId=40003023, itemName="武当人参"},-- count=5},
							}	



--送生活技能npc列表
x229002_g_AbilityNpcList = {
                    {menpai=MP_WUDANG   ,npcList={{name="青冥神鹤", scene=12, x=102, z=108},
                                                  {name="九天神鹤", scene=12, x=87, z=85},
                                                  {name="无极神鹤", scene=12, x=75, z=85}}
										},
									}

										
--捕兽列表
x229002_g_PetList = {
						{petDataId=3000, petName="野生柴猫", takeLevel=10},
					}

--杀怪相关
x229002_g_MenpaiYiWuList = {
								{menpainame="少林", menpai=MP_SHAOLIN  , itemName="少林弟子的度牒", scene=9,  itemId=40004306},
								{menpainame="天龙", menpai=MP_DALI     , itemName="天龙弟子的印章", scene=13, itemId=40004312},
								{menpainame="峨嵋", menpai=MP_EMEI     , itemName="峨嵋弟子的剑穗", scene=15, itemId=40004310},
								{menpainame="丐帮", menpai=MP_GAIBANG  , itemName="丐帮弟子的布袋", scene=10, itemId=40004307},
								{menpainame="明教", menpai=MP_MINGJIAO , itemName="明教弟子的火令", scene=11, itemId=40004308},
								{menpainame="天山", menpai=MP_TIANSHAN , itemName="天山弟子的冰牌", scene=17, itemId=40004314},
								{menpainame="武当", menpai=MP_WUDANG   , itemName="武当弟子的拂尘", scene=12, itemId=40004309},
								{menpainame="逍遥", menpai=MP_XIAOYAO  , itemName="逍遥弟子的标持", scene=14, itemId=40004313},
								{menpainame="星宿", menpai=MP_XINGSU   , itemName="星宿弟子的蛊皿", scene=16, itemId=40004311},
							}
	
--怪物掉落遗物的几率配置表
x229002_g_RateOfDropYiWuTable = {
							{playerLevel=20, dropRate=30},
							{playerLevel=30, dropRate=30},
							{playerLevel=40, dropRate=25},
							{playerLevel=50, dropRate=25},
							{playerLevel=60, dropRate=25},
							{playerLevel=70, dropRate=20},
							{playerLevel=80, dropRate=20},
							{playerLevel=90, dropRate=20},
							{playerLevel=100, dropRate=20},
							{playerLevel=110, dropRate=20},
							{playerLevel=120, dropRate=20},
							{playerLevel=130, dropRate=20},
							{playerLevel=140, dropRate=20},
							{playerLevel=150, dropRate=20},
						}
 
x229002_g_DemandKillcountTable = 	{
							{levelBegin=10, levelEnd=19, killcount=20},
							{levelBegin=20, levelEnd=39, killcount=25},
							{levelBegin=40, levelEnd=59, killcount=30},
							{levelBegin=60, levelEnd=79, killcount=35},
							{levelBegin=80, levelEnd=99, killcount=40},
							{levelBegin=100, levelEnd=109, killcount=45},
							{levelBegin=110, levelEnd=119, killcount=50},
							{levelBegin=120, levelEnd=150, killcount=55},
}						

--//////////////////////////////////////////////////////
--杀怪相关
function x229002_GetMenpaiYiWuInfo(sceneId, selfId)
	for i, v in x229002_g_MenpaiYiWuList do
		if v.menpai == GetMenPai(sceneId, selfId) then
			return v.menpainame, v.itemName, v.itemId
		end
	end
end

function x229002_GetRateOfDropYiWu(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	for i, v in x229002_g_RateOfDropYiWuTable do
		if v.playerLevel >= playerLevel and playerLevel < v.playerLevel then
			return v.dropRate
		end
	end
end
function x229002_GetDemandKillCount(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	for i, v in x229002_g_DemandKillcountTable do
		if playerLevel >= v.levelBegin and playerLevel <= v.levelEnd then
			return v.killcount
		end
	end
end


function x229002_KillMonster_Accept(sceneId, selfId)--杀怪
	
	local nMonsterId, strMonsterName, strMonsterScene, nScene, nPosX, nPosZ, strDesc, nSex, level
	local playerLevel = GetLevel(sceneId, selfId)
	for i=1, 100 do
		nMonsterId, strMonsterName, strMonsterScene, nScene, nPosX, nPosZ, strDesc, nSex, level = GetOneMissionNpc(43)
		if abs(level - playerLevel) < 3  then
			break
		end
		if i == 100 then
			--统统送信去:((
			x229002_SongXin_Accept(sceneId, selfId)
			return
		end
	end	
	
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 1, 0, 1 )
	if bAdd < 1 then
		return
	end	
	local killcount = x229002_GetDemandKillCount(sceneId, selfId)
	local countpart1 = x229002_GetStrIndexByStrValue(tostring(floor(killcount / 10)) )
	local countpart2 = x229002_GetStrIndexByStrValue(tostring(floor(mod(killcount, 10))) )
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.killMonster)
	
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 0, killcount) --要求杀死的monster总数， 现在还没有赋值
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 1, 0) --已经杀死的monster数量
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 8)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, countpart1)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, countpart2)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+3, nMonsterId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, nScene, nPosX, nPosZ, strMonsterName)
	
	local strMissionTarget = format("最近%s地区的%s经常扰乱周边的居民，特命你去惩戒他们。", 
						strMonsterScene, strMonsterName)
	AddText(sceneId, strMissionTarget)

end

--//////////////////////////////////////////////////////


function x229002_GetStrIndexByStrValue(stringV)
	for i, v in x229002_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("必须将%s注册到StrList中", stringV)
	----PrintStr(strText)
	return 0;
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体item的详细信息
function x229002_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s物品在'MissionItem_HashTable.txt'没有找到!!", itemName)
		PrintStr(strText)
	end
	return itemId, itemName, itemDesc
end	
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--根据玩家等级得到对应MissionItem_HashTable.txt中的单元索引
function x229002_GetMissionItemIndex(sceneId, selfId)
	local nPlayerLevel  = GetLevel(sceneId, selfId)
	if nPlayerLevel >= 10 and nPlayerLevel < 20 then
		return 0;
	elseif nPlayerLevel >= 20 and nPlayerLevel < 30 then
		return 1;
	elseif nPlayerLevel >= 30 and nPlayerLevel < 40 then
		return 2;
	elseif nPlayerLevel >= 40 and nPlayerLevel < 60 then
		return 3;
	elseif nPlayerLevel >= 60 and nPlayerLevel < 80 then
		return 4;
	elseif nPlayerLevel >= 80 and nPlayerLevel < 100 then
		return 5;
	elseif nPlayerLevel >= 100 and nPlayerLevel < 120 then
		return 167;
	elseif nPlayerLevel >= 100 then
		return 168;
	end
end

--根据玩家等级得到对应的师门任务的阶段
--根据玩家等级得到对应MissionNPC_HashTable.txt中的单元索引
function x229002_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	local nPlayerLevel  = GetLevel(sceneId, selfId)
	if nPlayerLevel >= 10 and nPlayerLevel < 20 then
		return 0
	elseif nPlayerLevel >= 20 and nPlayerLevel < 40 then
		return 1
	elseif nPlayerLevel >= 40 and nPlayerLevel < 60 then
		return 2
	elseif nPlayerLevel >= 60 and nPlayerLevel < 80 then 
		return 3
	elseif nPlayerLevel >= 80 and nPlayerLevel < 100 then 
		return 4
	elseif nPlayerLevel >= 100 and nPlayerLevel < 120 then 
		return 243
	elseif nPlayerLevel >= 120 then
		return 244
	end
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_RandomSubMission(sceneId, selfId)
 
	--寻物（1/4）、送信（1/16）、收集（1/16）、开光（1/16）、定点引导（1/16）、战斗副本（1/4）、捕捉（1/4）
	local nRet = 1 + LuaFnGetHumanShimenRandom(sceneId, selfId);
	if nRet then
		if nRet <= 4 then
			x229002_XunWu_Accept(sceneId, selfId)
		elseif nRet <= 5 then
			x229002_SongXin_Accept(sceneId, selfId)
		elseif nRet <= 6 then
			x229002_ShouJi_Accept(sceneId, selfId)
		elseif nRet <= 7 then
			x229002_SongXin_Accept(sceneId, selfId)
		elseif nRet <= 8 then
			x229002_DingDianYinDao_Accept(sceneId, selfId)
		elseif nRet <= 12 then
			x229002_FuBenZhanDou_Accept(sceneId, selfId)
		elseif nRet <= 16 then
			x229002_BuZhuo_Accept(sceneId, selfId)
		else
			return -1
		end
	else
		return -1;
	end
end
--**********************************
--根据玩家等级得出任务的等级阶段(1~5)
--**********************************
function x229002_DoSomethingByPlayerLevel(sceneId, selfId)
	CallScriptFunction(229000, "DoSomethingByPlayerLevel", sceneId, selfId, x229002_g_ScriptId)
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_XunWu_Accept(sceneId, selfId)--寻物
	------PrintStr("XunWu_Accept..")
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 1 )
	if bAdd < 1 then
		return
	end	
	
	
	local nitemId, strItemName, strItemDesc = GetOneMissionItem(x229002_GetMissionItemIndex(sceneId, selfId))
	Msg2Player(sceneId, selfId, "#Y接受任务：师门任务", MSG2PLAYER_PARA )
	--print(nitemId, strItemName, strItemDesc)
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.XunWu)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 1)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, nitemId)
	
	local strMissionTarget = format("我的%s怎么不见了？如果你能帮我找回来，我是不会亏待你的。", strItemName)
	AddText(sceneId, strMissionTarget)
	
	--检测玩家身上的道具是否已经满足完成条件
	local bHaveItem = HaveItem(sceneId, selfId, nitemId)
	if bHaveItem == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1
		ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
	end	
	
end	

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function x229002_SongXin_Accept(sceneId, selfId)--送信

  local roll = random(3)
	--随机选出本门派的特产编号，每个门派3种特产
	x229002_g_Xin_ItemId = x229002_g_ShouJiList[ roll ].itemId
	
	--任务奖励相关			
	BeginAddItem(sceneId)
		AddItem(sceneId, x229002_g_Xin_ItemId, 1)
	local bAdd = EndAddItem(sceneId, selfId)
	if bAdd < 1 then
		return
	end	
	
	--加入任务到玩家列表
	bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	AddItemListToHuman(sceneId, selfId)
	--寻物, 送信则设置锁定目标NPC的事件Flag
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)
	

	local nPhase = x229002_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(nPhase)
	--print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc)
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)
		
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.SongXin)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 0)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, nNpcId)

	local ListIndex = x229002_GetStrIndexByStrValue( x229002_g_ShouJiList[ roll ].itemName )
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, ListIndex )

  SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+3, x229002_g_Xin_ItemId )
  
	local strMissionTarget = format("好久没有见%s%s了，请你帮我把这个%s交给他。", strNpcScene, strNpcName, x229002_g_ShouJiList[ roll ].itemName )
	AddText(sceneId, strMissionTarget)
	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_DingDianYinDao_Accept(sceneId, selfId)--定点引导
	--获得玩家的门派
	local playerMenpai = GetMenPai(sceneId, selfId)
	local a = {}
	local index = 1
	--用一个临时表来存储对应门派在x229002_g_DingDianYinDaoList中的全部索引
	for i, v in x229002_g_DingDianYinDaoList do
		if v.menpai == playerMenpai then
			a[index] = i
			index = index + 1
		end
	end
	
	local ct = getn(a)
	if ct <= 0 then
		return 0
	end
		
	local ret = random(ct)
	BeginAddItem(sceneId)
		AddItem(sceneId, x229002_g_DingDianYinDaoList[a[ret]].itemId, 1)
	local bAdd = EndAddItem(sceneId,selfId)
	if bAdd < 1 then
		return
	end	
	
	--加入任务到玩家列表
	bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return 
	end	
	AddItemListToHuman(sceneId, selfId)
	Msg2Player(  sceneId, selfId,"#Y你得到了一个" .. x229002_g_DingDianYinDaoList[a[ret]].itemName, MSG2PLAYER_PARA )
	
	local strIndex_Area = x229002_GetStrIndexByStrValue(x229002_g_DingDianYinDaoList[a[ret]].AreaName)
	local strIndex_Item = x229002_GetStrIndexByStrValue(x229002_g_DingDianYinDaoList[a[ret]].itemName)
	local	strIndex_subArea = x229002_GetStrIndexByStrValue(x229002_g_DingDianYinDaoList[a[ret]].subAreaName)
	
	local x1 = x229002_g_DingDianYinDaoList[a[ret]].posx1
	local x2 = x229002_g_DingDianYinDaoList[a[ret]].posx2
	local z1 = x229002_g_DingDianYinDaoList[a[ret]].posz1
	local z2 = x229002_g_DingDianYinDaoList[a[ret]].posz2
	local scene = x229002_g_DingDianYinDaoList[a[ret]].scene
	local tip = x229002_g_DingDianYinDaoList[a[ret]].AreaName .. x229002_g_DingDianYinDaoList[a[ret]].subAreaName
	local x = x1 + (x2-x1)/2
	local z = z1 + (z2-z1)/2
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.DingDianYinDao)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, a[ret]) --设置定点引导列表中的索引
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 3)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, strIndex_Item)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, strIndex_Area)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+3, strIndex_subArea)
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, scene, x, z, tip)

	local strMissionTarget = format("请你使用%s，在武当%s的%s中采集灵气。", 
		x229002_g_DingDianYinDaoList[a[ret]].itemName,
		x229002_g_DingDianYinDaoList[a[ret]].AreaName,
		x229002_g_DingDianYinDaoList[a[ret]].subAreaName )   
		
	AddText(sceneId, strMissionTarget)
	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_FuBenZhanDou_Accept(sceneId, selfId)--战斗副本
	local playerMenpai = GetMenPai(sceneId, selfId)
	if playerMenpai == MP_WUMENPAI then
		return 0
	end	

	local npcName, fubenName, nSceneId, posx, posz
	for i, v in x229002_g_FuBen_List do
		if v.menpai == GetMenPai(sceneId, selfId) then
			npcName =  v.NpcName
			fubenName =  v.FubenName
			nSceneId = v.scene
			posx = v.posx
			posz = v.posz
			break
		end
	end

	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	
	local nFormatIndex = GetMissionCacheData(sceneId, selfId, 0)
	local i = GetMissionCacheData(sceneId, selfId, 2)
	local NpcNameIndex = x229002_GetStrIndexByStrValue(npcName)
	local FubenNameIndex = x229002_GetStrIndexByStrValue(fubenName)
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.FuBenZhanDou)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 4)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, NpcNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, FubenNameIndex)
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, posx, posz, npcName)

	local strMissionTarget = format("请你去找到%s， 他会带你去挑战%s的。", npcName, fubenName)
	AddText(sceneId, strMissionTarget)
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_BuZhuo_Accept(sceneId, selfId)--捕捉
	local playerLevel = GetLevel(sceneId, selfId)
	local petId, petName, petDesc, takeLevel
	local petHashIndex = CallScriptFunction(229000, "GetMissionPetIndex", sceneId, selfId)
	for i = 1, 100 do
		petId, petName, petDesc = GetOneMissionPet(petHashIndex)
		takeLevel = GetPetTakeLevel(petId)
		if playerLevel > takeLevel  then
			break
		end
		if i == 100 then
			--统统送信去:((
			x229002_SongXin_Accept(sceneId, selfId)
		end
	end	
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 3)
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.BuZhuo)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 5)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, petId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	
	local strMissionTarget = format("请你帮我抓一只%s来。", petName)
	AddText(sceneId, strMissionTarget)
	
	--检测玩家身上的道具是否已经满足完成条件
	for i=0, 6 do
		local petDataId = LuaFnGetPet_DataID(sceneId,selfId,i)
		if petDataId == petId then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1

			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 3)
			break
		end	
	end	

end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_ShouJi_Accept(sceneId, selfId)--收集
	----PrintStr("ShouJi_Accept...")
	local playerMenpai = GetMenPai(sceneId, selfId)
	if playerMenpai == MP_WUMENPAI then
		return 0
	end	
	----PrintStr("playerMenpai="..playerMenpai)
	local a = {}
	local index = 1
	for i, v in x229002_g_ShouJiList do
		if v.menpai == playerMenpai then
			----PrintStr("find...")
			a[index] = i
			index = index + 1
		end	
	end
	local ct = getn(a)
	----PrintStr("ct="..ct)
	if ct <= 0 then
		return 0
	end
	
	local ret = random(ct)
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 1 )
	if bAdd < 1 then
		return
	end	
	
	
	local itemNameIndex = x229002_GetStrIndexByStrValue(x229002_g_ShouJiList[a[ret]].itemName)
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.ShouJi)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 6)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, itemNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, x229002_g_ShouJiList[a[ret]].itemId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	
	local strMissionTarget = format("请你帮我弄5个%s来。", x229002_g_ShouJiList[a[ret]].itemName)
	AddText(sceneId, strMissionTarget)
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229002_Ability_Accept(sceneId, selfId)--开光
	----PrintStr("Ability_Accept...")
	--local nPhase = x229002_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	--local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(nPhase-1)
	local strNpcName, scene, x, z
	for i, v in x229002_g_AbilityNpcList do
		if v.menpai == GetMenPai(sceneId, selfId) then
			local ct = getn(v.npcList)
			local index =	random(ct)
			strNpcName = v.npcList[index].name
			scene = v.npcList[index].scene
			x = v.npcList[index].x
			z = v.npcList[index].z
		end
	end
	
	local strNpcIndex = x229002_GetStrIndexByStrValue(strNpcName)
	local itemId, itemName = GetMenpaiItem(sceneId, selfId)


	------PrintStr("itemId="..itemId.."  itemName="..itemName)
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)		
	SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.KaiGuang)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 7)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, strNpcIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+2, itemId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, scene, x, z, strNpcName)
	
	local strMissionTarget = format("请给%s送一个%s吧, 我会给你报酬的！", strNpcName, itemName)
	AddText(sceneId, strMissionTarget)

end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--任务入口函数
--**********************************
function x229002_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	------PrintStr("OnDefaultEvent...")
	--发送任务需求的信息
	if IsHaveMission(sceneId,selfId,x229002_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x229002_g_Name then
			--发送任务需求的信息
			BeginEvent(sceneId)
				AddText(sceneId, x229002_g_MissionName)
				AddText(sceneId, "我交给你的事情已经做完了吗？")
			EndEvent( )
			bDone = x229002_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229002_g_ScriptId, x229002_g_MissionId, bDone)
		else
			local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
			
			local demandItemId =0
			local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			if missionType == x229002_g_SubMissionTypeEnum.SongXin then
			    demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+3)
			else
			    demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
			end	
			
			local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
			
			local bHaveItem = HaveItem(sceneId, selfId, demandItemId)
			if bHaveItem == 1 then
				if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 1 then
				DelItem(sceneId, selfId, demandItemId, 1)
				BeginEvent(sceneId)
					AddText(sceneId, "请你回去给你师傅说，我也很想你师傅了，谢谢你师傅给我送来的东西，这是我正急想要的。")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)	
				--设置任务已经完成
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1)
				ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)
				return 1;
			else
				BeginEvent(sceneId)
						AddText(sceneId, "您的物品现在不可用或已被锁定。")
					EndEvent( )
					DispatchMissionTips(sceneId,selfId)	
					return	
				end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "我要的东西给我带来了吗？")
				EndEvent()
				DispatchEventList(sceneId, selfId, targetId)	
				return 1;					
			end
		end
	elseif x229002_CheckAccept(sceneId,selfId) > 0 then
		BeginEvent(sceneId)
		
			AddText(sceneId,x229002_g_MissionName)
			AddText(sceneId,x229002_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			
			x229002_DoSomethingByPlayerLevel(sceneId, selfId)
			--保证第一次接到的任务总是固定不变的
			--ResetMissionCacheData(sceneId, selfId)
			--SetMissionCacheData(sceneId, selfId, 0, 0) --formet字符串索引
			--SetMissionCacheData(sceneId, selfId, 1, x229002_g_SubMissionTypeEnum.SongXin)
			--SetMissionCacheData(sceneId, selfId, 2, 100001) --设置human身上第0位缓存数据
			--SetMissionCacheData(sceneId, selfId, 7, 1) --是否是第一次
			
			--strMissionTarget = format("好久没有见%s了，请代我问候一下他去", "frankwu")
			--AddText(sceneId, strMissionTarget)

			--加入任务到玩家列表
			--AddMission( sceneId,selfId, x229002_g_MissionId, x229002_g_ScriptId, 0, 0, 0 )
			--寻物, 送信则设置锁定目标NPC的事件Flag
			--SetMissionEvent(sceneId, selfId, x229002_g_MissionId, 4)

			--local _, strNpcName, strNpcScene, PosX, PosZ, _ = GetNpcInfoByNpcId(sceneId,100001)
			--Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
			--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, PosX, PosZ, strNpcName)
				
			--得到任务在20个任务中的序列号
			--local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
			
			--SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
			--SetMissionByIndex(sceneId, selfId, misIndex, 1, x229002_g_SubMissionTypeEnum.SongXin)
			
			--SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart, 0)--formet字符串索引
			--SetMissionByIndex(sceneId, selfId, misIndex, x229002_g_StrForePart+1, 100001)
		
			
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end

--**********************************
--列举事件
--**********************************
function x229002_OnEnumerate( sceneId, selfId, targetId )
	------PrintStr("807002...OnEnumerate")
--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x229002_g_MissionId) > 0 then
  	return
--满足任务接收条件
	elseif IsHaveMission(sceneId,selfId,x229002_g_MissionId) > 0 then
		local strNpcName = x229002_g_Name -- temp code
		if GetName(sceneId,targetId) == strNpcName then
			AddNumText(sceneId, x229002_g_ScriptId,x229002_g_MissionName,4,-1);
		end
--满足任务接收条件
  elseif x229002_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x229002_g_Name then
			AddNumText(sceneId,x229002_g_ScriptId,x229002_g_MissionName,3,-1);
		end
  end
end
--**********************************
--接受
--**********************************
function x229002_OnAccept( sceneId, selfId )
	----PrintStr("OnAccept...")
	--local nMissionType = GetMissionCacheData(sceneId, selfId, 1)
	--if nMissionType == x229002_g_SubMissionTypeEnum.XunWu then
	--	x229002_XunWu_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.SongXin then
	--	x229002_SongXin_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.DingDianYinDao then
	--	x229002_DingDianYinDao_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.FuBenZhanDou then
	--	x229002_FuBenZhanDou_Accept(sceneId, selfId)
	--elseif nMissionType == x229002_g_SubMissionTypeEnum.BuZhuo then
	--	x229002_BuZhuo_Accept(sceneId, selfId)
	--end
end

--**********************************
--检测接受条件
--**********************************
function x229002_CheckAccept( sceneId, selfId )
	local nLevel = GetLevel(sceneId, selfId)
	--玩家等级>=10级
	if nLevel < 10 then
		return 0
	else
		local playerMenpai = GetMenPai(sceneId, selfId)
		if playerMenpai ~= MP_WUDANG then
			return 0
		end	
	end
	return 1;
end

--**********************************
--放弃
--**********************************
function x229002_OnAbandon( sceneId, selfId )
	----PrintStr("OnAbandon...")
	if IsHaveMission(sceneId, selfId, x229002_g_MissionId) > 0 then	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)		--得到任务在20个任务中的序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		if missionType == x229002_g_SubMissionTypeEnum.SongXin then
			local missionItem = GetMissionParam(sceneId, selfId, misIndex,x229002_g_StrForePart+3)
			if HaveItem(sceneId, selfId, missionItem) == 1 then
			if LuaFnGetAvailableItemCount(sceneId, selfId, missionItem) >= 1 then
			DelItem(sceneId, selfId, missionItem, 1)		
			else
				BeginEvent(sceneId)
					AddText(sceneId, "您的物品现在不可用或已被锁定。")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
			end
		elseif missionType == x229002_g_SubMissionTypeEnum.DingDianYinDao	then
			local index = GetMissionParam(sceneId, selfId, misIndex,2)
			if HaveItem(sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId) == 1 then
			if LuaFnGetAvailableItemCount(sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId) >= 1 then
			DelItem(sceneId, selfId,x229002_g_DingDianYinDaoList[index].itemId,1)
			else
				BeginEvent(sceneId)
					AddText(sceneId, "您的物品现在不可用或已被锁定。")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
			end	
		elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
			local itemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
			if HaveItem(sceneId, selfId, itemId) == 1 then
			if LuaFnGetAvailableItemCount(sceneId, selfId, itemId) >= 5 then
			DelItem(sceneId, selfId,itemId,5)
			else
				BeginEvent(sceneId)
					AddText(sceneId, "您的物品现在不可用或已被锁定。")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
		end
		end
		--删除玩家任务列表中对应的任务
	  DelMission( sceneId, selfId, x229002_g_MissionId )
	  SetMissionData(sceneId,selfId,MD_SHIMEN_HUAN,0)	--环数清0
	end	
 	--调用通用放弃接口
	------------------------------------------------------------------
	 CallScriptFunction( 500501, "Abandon_Necessary", sceneId, selfId )
	-------------------------------------------------------------------
end

--**********************************
--继续
--**********************************
function x229002_OnContinue( sceneId, selfId, targetId )
	------PrintStr("OnContinue...")
	if x229002_CheckAccept(sceneId,selfId) > 0 then
		BeginEvent(sceneId)
		
			AddText(sceneId,x229002_g_MissionName)
			AddText(sceneId,x229002_g_MissionComplete)
			
		  --x229002_DoSomethingByPlayerLevel(sceneId, selfId)
		  
		EndEvent( )
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x229002_g_ScriptId, x229002_g_MissionId)
	end	
end

--**********************************
--检测是否可以提交
--**********************************
function x229002_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x229002_g_MissionId ) <= 0 then
		return 0
	end

	--在此判断提交条件是否符合，并给予相应奖励
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	
	if missionType == x229002_g_SubMissionTypeEnum.XunWu then
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		if GetItemCount(sceneId,selfId,demandItemId) <= 0 then --没有索要的物品
			return 0
		end
		if IsEquipItem(demandItemId) == 1 and IsWhiteEquip(demandItemId) ~= 1 then
			return 2
		else
			return 1
		end		
	elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
	 	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
	 	if GetItemCount(sceneId,selfId,demandItemId) < 5 then --没有索要的物品
	 		return 0
	 	else
	 		return 1	
	 	end
	elseif missionType == x229002_g_SubMissionTypeEnum.BuZhuo then
		return 2
	elseif GetMissionParam(sceneId, selfId, misIndex, 0) > 0 then	--察看任务是否完成
		return 1
	end

	return 0
end

function x229002_OnLockedTarget(sceneId, selfId, objId )
	------PrintStr("OnLockedTarget...")
	if GetName(sceneId, objId) == x229002_g_Name  then
		return 0
	end
	
	-- 判断是不是锁定的Npc
	if IsHaveMission(sceneId, selfId, x229002_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)		--得到任务在20个任务中的序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		local nNpcId, strNpcName, strNpcScene, PosX, PosZ, desc
		if missionType == x229002_g_SubMissionTypeEnum.KaiGuang then
			nNpcIndex = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
			strNpcName = x229002_g_StrList[nNpcIndex+1]
		else
			nNpcId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
			nNpcId, strNpcName, strNpcScene, PosX, PosZ, desc = GetNpcInfoByNpcId(sceneId,nNpcId)
		end
			 
		if GetName(sceneId, objId) == strNpcName then
			TAddNumText(sceneId,x229002_g_ScriptId,x229002_g_MissionName,4,-1,x229002_g_ScriptId);
		end
		
	end
	
	return 0;

end

function x229002_CheckCondition_UseItem( sceneId, selfId, targetId, eventId )
	------PrintStr("OnUseItem...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType ~= x229002_g_SubMissionTypeEnum.DingDianYinDao then
		return 0
	end
	
	local index = GetMissionParam(sceneId, selfId, misIndex, 2)
	local targetSceneId = x229002_g_DingDianYinDaoList[index].scene
	--PrintNum(sceneId)
	if sceneId ~= targetSceneId then
		BeginEvent(sceneId)

			AddText(sceneId,"似乎在这个场景不能施放")

		EndEvent(sceneId)

		DispatchMissionTips(sceneId,selfId)

		return 0
	end
	
	local posx1 = x229002_g_DingDianYinDaoList[index].posx1
	local posz1 = x229002_g_DingDianYinDaoList[index].posz1
	local posx2 = x229002_g_DingDianYinDaoList[index].posx2
	local posz2 = x229002_g_DingDianYinDaoList[index].posz2

	--取得玩家当前坐标

	local PlayerX = GetHumanWorldX(sceneId,selfId)

	local PlayerZ = GetHumanWorldZ(sceneId,selfId)

	
	--计算玩家与目标点的距离
	if PlayerX >= posx1 and PlayerX < posx2 then
		------PrintStr("PlayerX >= posx1 and PlayerX < posx2...")
		if PlayerZ >= posz1 and PlayerZ < posz2 then
			------PrintStr("PlayerZ >= posz1 and PlayerZ < posz2...")
			return 1
		end
	end	

	BeginEvent(sceneId)

		AddText(sceneId, "你必须在指定的区域才能使用!")

	EndEvent(sceneId)

	DispatchMissionTips(sceneId,selfId)
	return 0

end

--**********************************
--道具使用
--**********************************
function x229002_Active_UseItem( sceneId, selfId, param0 )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType ~= x229002_g_SubMissionTypeEnum.DingDianYinDao then
		return 0
	end
	
	local index = GetMissionParam(sceneId, selfId, misIndex, 2)
	if LuaFnGetAvailableItemCount(sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId) >= 1 then
		DelItem( sceneId, selfId, x229002_g_DingDianYinDaoList[index].itemId, 1 )
	--把任务状态变量设置为1,表示已经完成
	SetMissionByIndex(sceneId,selfId,misIndex,0,1)
	else
		BeginEvent(sceneId)
			AddText(sceneId, "您的物品现在不可用或已被锁定。")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)	
		return	
	end
end

--**********************************
--道具改变
--**********************************
function x229002_OnItemChanged( sceneId, selfId, itemdataId )
	------PrintStr("OnItemChanged")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229002_g_SubMissionTypeEnum.XunWu then
		local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)

				
				strText = format("已得到%s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.KaiGuang then
		local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				strText = format("已得到%s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
		end
		
	elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
		local itemCount = GetItemCount(sceneId,selfId,itemdataId)
		local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				local _, strItemName, _ = x229002_GetItemDetailInfo(itemdataId)
				strText = format("已得到%s%d/5", strItemName, itemCount)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			if itemCount == 5 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
			end	
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.killMonster then
		local _, _, itemId = x229002_GetMenpaiYiWuInfo(sceneId, selfId)
		if itemdataId == itemId  then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 0)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 2)
		end
	
	end

end

--**********************************
--珍兽改变
--**********************************
function x229002_OnPetChanged( sceneId, selfId, petDataId)
	------PrintStr("OnPetChanged...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229002_g_SubMissionTypeEnum.BuZhuo then
		local demandPetDataId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		
		if petDataId == demandPetDataId then
			BeginEvent(sceneId)
				local strText = format("已得到%s", GetPetName(petDataId))
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229002_g_MissionId, 3)
		end
	end
end
--**********************************
--提交
--**********************************
function x229002_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	------PrintStr("OnSubmit...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	if x229002_CheckSubmit( sceneId, selfId, selectRadioId )>=1 then

		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229002_g_SubMissionTypeEnum.XunWu then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
			----PrintStr("demandItemId"..demandItemId)
			if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 1 then
			local ret = DelItem(sceneId, selfId, demandItemId, 1)
			if ret <= 0 then
				BeginEvent(sceneId)
					AddText(sceneId, "没有足够的所需物品，任务无法提交")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "您的物品现在不可用或已被锁定。")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end	
--		elseif missionType == x229002_g_SubMissionTypeEnum.killMonster then
--			local _, _, demandItemId  = x229002_GetMenpaiYiWuInfo(sceneId, selfId)
--			local ret = DelItem(sceneId, selfId, demandItemId, 1)
--			if ret <= 0 then
--				BeginEvent(sceneId)
--					AddText(sceneId, "没有足够的所需物品，任务无法提交")
--				EndEvent()
--				DispatchMissionTips(sceneId, selfId)
--				return
--			end
		elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
			if LuaFnGetAvailableItemCount(sceneId, selfId, demandItemId) >= 5 then
			local ret = DelItem(sceneId, selfId, demandItemId, 5)
			if ret <= 0 then
				BeginEvent(sceneId)
					AddText(sceneId, "没有足够的所需物品，任务无法提交")
				EndEvent()
				DispatchMissionTips(sceneId, selfId)
				return
			end
			else
				BeginEvent(sceneId)
					AddText(sceneId, "您的物品现在不可用或已被锁定。")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end
		end

		DelMission( sceneId, selfId, x229002_g_MissionId )
		--调用通用提交任务接口接口

		------------------------------------------------------------------
		local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, targetId )
		if Reward_Append == 2 and MissionRound == 20 then
			CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId, targetId)
		end
		-------------------------------------------------------------------

		--x229002_OnDefaultEvent( sceneId, selfId, targetId )
		
	end
end

function x229002_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex )
  if x229002_CheckSubmit( sceneId, selfId) < 1 then
    return 0
  end

	----PrintStr("OnMissionCheck...")
	print(sceneId, selfId, npcid, scriptId, index1, index2, index3, petindex)
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229002_g_MissionId)

	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229002_g_SubMissionTypeEnum.XunWu then
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		local _, strDemandItemName, _ = x229002_GetItemDetailInfo(demandItemId)
		----PrintStr("strDemandItemName="..strDemandItemName)
		--调用通用提交任务接口接口

		------------------------------------------------------------------

		local find = CallScriptFunction( 500501, "OnMissionCheck_NecessaryEx", sceneId, selfId, index1, index2, index3, demandItemId )

		-------------------------------------------------------------------


		if find < 0 then

			BeginEvent(sceneId)

				local strText = format("你怎么没把%s拿到手就回来了呢？", strDemandItemName)
				AddText(sceneId,strText)
				AddItemBonus( sceneId, demandItemId, 1 )
			EndEvent(sceneId)

			DispatchEventList(sceneId,selfId,-1)

			return
		end
		
		local ret = EraseItem( sceneId, selfId, find )
		if	ret > 0 then

			DelMission( sceneId, selfId, x229002_g_MissionId )

			--调用通用提交任务接口接口

			------------------------------------------------------------------
			local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, -1 )
			if Reward_Append == 2 and MissionRound == 20 then
				CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId)
			end
			-------------------------------------------------------------------

		else
			BeginEvent(sceneId)

				local strText = format("你怎么没把%s拿到手就回来了呢？", strDemandItemName)
				AddText(sceneId,strText)
				AddItemBonus( sceneId, demandItemId, 1 )
			EndEvent(sceneId)

			DispatchEventList(sceneId,selfId,-1)
		end	
	elseif missionType == x229002_g_SubMissionTypeEnum.BuZhuo then
		------PrintStr("OnMissionCheck...BuZhuo...")
		local demandPetId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+1)
		local petId = LuaFnGetPet_DataID(sceneId, selfId, petindex)
		if petId == demandPetId then
			if LuaFnIsPetAvailable(sceneId, selfId, petindex) >= 1 then
				LuaFnDeletePet(sceneId, selfId, petindex)
				------PrintStr("DeletePet"..petId..demandPetId)
				DelMission( sceneId, selfId, x229002_g_MissionId )

				--调用通用提交任务接口接口

				------------------------------------------------------------------
				local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, -1 )
				if Reward_Append == 2 and MissionRound == 20 then
					CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId)
				end
				-------------------------------------------------------------------
			end	
		else
			BeginEvent(sceneId)
				AddText(sceneId, "你怎么没把我要的珍兽拿到手就回来了呢？")
			EndEvent(sceneId)

			DispatchEventList(sceneId,selfId,-1)

		end

	end -- endif
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x229002_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思：场景号、玩家objId、怪物表位置号、怪物
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	local nMonsterId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+3)
	local _, strMonsterName = GetNpcInfoByNpcId(sceneId,nMonsterId)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	
	if strMonsterName == monsterName  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for i=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
			--PrintStr("humanObjId=" .. humanObjId)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x229002_g_MissionId) > 0 then
				-- 先判断是不是已经满足了完成标志
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x229002_g_MissionId)
				if GetMissionParam(sceneId, humanObjId, misIndex, 0) <=0  then
					--SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 0, 30)
					local demandKillCount = GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 0)
					--PrintStr("demandKillCount=" .. demandKillCount)
					local killedCount =	GetMissionParamEx(sceneId, humanObjId, misIndex, 3, 1)
					killedCount = killedCount + 1
					SetMissionParamByIndexEx(sceneId, humanObjId, misIndex, 3, 1, killedCount)
					--PrintStr("killedCount=" .. killedCount)
					BeginEvent(sceneId)
						local str = format("已经杀死%d/%d%s", killedCount, demandKillCount, monsterName)
						AddText(sceneId, str)
					EndEvent()
					DispatchMissionTips(sceneId, humanObjId)
					if killedCount == demandKillCount then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 0, 1)
		end
				end --if
			end --if
		end --for				
	end
end


--**********************************
--同门相助....直接完成当前环....
--**********************************
function x229002_HelpFinishOneHuan( sceneId, selfId, targetId )

	--是否是本门派弟子....
	if MP_WUDANG ~= GetMenPai( sceneId, selfId ) then
		return
	end

	--是否接了师门任务....
	if IsHaveMission(sceneId,selfId,x229002_g_MissionId) <= 0 then
		return
	end

	--检测并扣除同门相助所需的师门贡献....
	local ret = CallScriptFunction( 229011, "CheckAndDepleteHelpFinishMenPaiPoint", sceneId, selfId, targetId )
	if ret == 0 then
		return
	end

	--获取师门任务的类型....
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229002_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)

	--清除任务物品....
	local itemId = -1
	local itemCount = -1

	if missionType == x229002_g_SubMissionTypeEnum.SongXin then
		itemId = GetMissionParam(sceneId, selfId, misIndex,x229002_g_StrForePart+3)
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount >= 1 then
			DelItem(sceneId, selfId, itemId, 1)
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.DingDianYinDao	then
		local index = GetMissionParam(sceneId, selfId, misIndex,2)
		itemId = x229002_g_DingDianYinDaoList[index].itemId
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount >= 1 then
			DelItem(sceneId, selfId, itemId, 1)	
		end
	elseif missionType == x229002_g_SubMissionTypeEnum.ShouJi then
		itemId = GetMissionParam(sceneId, selfId, misIndex, x229002_g_StrForePart+2)
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount > 5 then
			itemCount = 5
		end
		if itemCount > 0 then
			DelItem(sceneId, selfId, itemId, itemCount)
		end
	end

	--删除玩家任务列表中对应的任务....
	DelMission( sceneId, selfId, x229002_g_MissionId )

	--调用通用提交任务接口接口....
	local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, targetId, 1 )

	if Reward_Append == 2 and MissionRound == 20 then
		--奖励玩家一个去别的门派副本的师门任务....
		CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229002_g_MissionId, targetId)
	end

end
