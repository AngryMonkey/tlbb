 --师门任务

--MisDescBegin
--脚本号
x229000_g_ScriptId = 229000

--接受任务NPC属性
x229000_g_Position_X=96.0000
x229000_g_Position_Z=82.0000
x229000_g_SceneID=9
x229000_g_AccomplishNPC_Name="慧方"

--前提任务
--g_MissionIdPre =

--任务目标npc
x229000_g_Name	= "慧方"

--任务号
x229000_g_MissionId = 1060

--任务归类
x229000_g_MissionKind = 20

--任务等级
x229000_g_MissionLevel = 10000

--是否是精英任务
x229000_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x229000_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x229000_g_MissionName="师门任务"
x229000_g_MissionInfo=""  --任务描述
x229000_g_MissionTarget = "%f"
x229000_g_ContinueInfo="干得不错"		--未完成任务的npc对话
x229000_g_MissionComplete="我交给你的事情已经做完了吗？"					--完成任务npc说话的话
x229000_g_MissionRound=17

x229000_g_DoubleExp = 48
x229000_g_AccomplishCircumstance = 1

x229000_g_ShimenTypeIndex = 1
x229000_g_Parameter_Kill_AllRandom={{id=7,numa=3,numb=3,bytenuma=0,bytenumb=1}}
x229000_g_Parameter_Item_IDRandom={{id=6,num=5}}
x229000_g_NpcIdIndicator={{key=2,npcIdIndex=5},{key=9,npcIdIndex=7}}

--用来保存字符串格式化的数据
x229000_g_FormatList = {
								"好久没有见到%n了，很是想念啊。这个%s是我的一点心意，请你把它送过去吧。#r  #e00f000小提示：#e000000#r  你可以在少林寺找到#R慧轮#W#{_INFOAIM92,132,9,慧轮}，请他把你送往各大城市。#B#r  东西送到后，请到师门任务发布人#W慧方#{_INFOAIM96,82,9,慧方}处交还任务。#r#{SMRW_090206_01}",
								"我的%i怎么不见了？如果你能帮我找回来，我是不会亏待你的。#r  #e00f000小提示：#e000000#r  你可以在少林寺找到#R慧轮#W#{_INFOAIM92,132,9,慧轮}，请他把你送往各大城市。#r#{SMRW_090206_01}",
								"%n为非作歹，我有心去教训一下，可惜没有时间，你能代劳吗？#r  #e00f000小提示：#e000000#r  你可以在少林寺找到#R慧轮#W#{_INFOAIM92,132,9,慧轮}，请他把你送往各大城市。#r#{SMRW_090206_01}",
								"请你使用%s，打扫少林寺%s的%s。#r  #e00f000小提示：#e000000#r  当你来到需要打扫的院子时，你可以按#gfff0f0Alt+A#g000000可以打开物品栏，点击#gfff0f0‘任务’#g000000页面就可以打开任务物品栏，右键点击#gfff0f0大扫帚#g000000，就可以完成打扫了。#r#{SMRW_090206_01}",
								"请你去找到%s， 他会带你去挑战%s的。#r  #e00f000小提示：#e000000#r  玄澄大师就在少林寺#{_INFOAIM61,62,9,玄澄}。#r#{SMRW_090206_01}",
								"请你帮我抓一只%p来。#B#r  #e00f000小提示：#e000000#r  #G洛阳城的云涵儿#{_INFOAIM183,155,0,云涵儿}可以送你去玄武岛，而玄武岛有一条小路通往圣兽山。你可以在玄武岛或者圣兽山上捕捉我需要的珍兽。#r#{SMRW_090206_01}",
								"请你在少林寺内四处看看，帮我找来5个%s。#r  #e00f000小提示：#e000000#r  你可以在屏幕右上角的小地图上找到黄色的指示点。#r#{SMRW_090206_01}",
								"请给%s送去一个%i吧，事成之后，我会给你报酬的！#r  #e00f000小提示：#e000000#r  潘玄耕师兄就在少林寺{_INFOAIM70,105,9,潘玄耕}。#r  卫玄望就在少林寺{_INFOAIM61,57,9,卫玄望}。#r  方玄劳师兄就在少林寺{_INFOAIM123,88,9,方玄劳}。#B#r  东西送到后，请到师门任务发布人#W慧方#{_INFOAIM96,82,9,慧方}处交还任务。#r#{SMRW_090206_01}",
								"不错... ... 你一直为本门的发扬光大在尽心尽力的做着工作，我再额外给你一个任务吧，%s刚给我飞鸽传书，说他们需要帮忙，你去找一下%s的%s，他会安排你的任务的。#r#{SMRW_090206_01}",
								"去杀死%s%s个%n。#r#{SMRW_090206_01}",
							}

--格式字符串中的索引, 表示从4开始,后多少位视SetMissionByIndex(...)的多少而定
x229000_g_StrForePart=4
x229000_g_ShimenPet_Index = 1

x229000_g_StrList = {
						"大扫帚",
						"大雄宝殿",
						"藏经阁",
						"山门",
						"钟楼",
						"玄澄",
						"塔林副本",
						"散落的柴火",
						"散落的蘑菇",
						"散落的松果",
						"潘玄耕",
						"卫玄望",
						"方玄劳",
						"野生柴猫",
						"地面",
						"本相", 
						"孟青青",
						"佛印", 
						"方腊", 
						"菊剑", 
						"林灵素",
						"冯阿三",
						"红玉", 
						"塔底副本",
						"桃花阵副本",
						"酒窖副本",
						"光明洞副本",
						"折梅峰副本",
						"灵性峰副",
						"谷底副本",
						"五神洞副本", 
						"少林",
						"天龙",
						"峨嵋",
						"丐帮",
						"明教",
						"天山",
						"武当",
						"逍遥",
						"星宿",
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
x229000_g_SubMissionTypeEnum = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8, killMonster=9, }

--定点引导
x229000_g_DingDianYinDaoList = {
											 {menpai=MP_SHAOLIN  , itemId=40002124, itemName="大扫帚", scene=9, AreaName="大雄宝殿", subAreaName="地面", posx1=84, posz1=64, posx2=108, posz2=86},
											 {menpai=MP_SHAOLIN  , itemId=40002124, itemName="大扫帚", scene=9, AreaName="藏经阁", subAreaName="地面", posx1=122, posz1=132, posx2=146, posz2=159},
											 {menpai=MP_SHAOLIN  , itemId=40002124, itemName="大扫帚", scene=9, AreaName="山门", subAreaName="地面", posx1=89, posz1=110, posx2=102, posz2=137},
											 {menpai=MP_SHAOLIN  , itemId=40002124, itemName="大扫帚", scene=9, AreaName="钟楼", subAreaName="地面", posx1=54, posz1=52, posx2=83, posz2=71},
											}


--副本列表
x229000_g_FuBen_List = {
								{menpainame="少林", menpai=MP_SHAOLIN  , NpcName="玄澄", scene=9, posx=61, posz=61, FubenName="塔林副本"},
								{menpainame="天龙", menpai=MP_DALI     , NpcName="本相", scene=13, posx=35, posz=86, FubenName="塔底副本"},
								{menpainame="峨嵋", menpai=MP_EMEI     , NpcName="孟青青", scene=15, posx=96, posz=73, FubenName="桃花阵副本"},
								{menpainame="丐帮", menpai=MP_GAIBANG  , NpcName="佛印", scene=10, posx=41, posz=144, FubenName="酒窖副本"},
								{menpainame="明教", menpai=MP_MINGJIAO , NpcName="方腊", scene=11, posx=89, posz=56, FubenName="光明洞副本"},
								{menpainame="天山", menpai=MP_TIANSHAN , NpcName="菊剑", scene=17, posx=99, posz=45, FubenName="折梅峰副本"},
								{menpainame="武当", menpai=MP_WUDANG   , NpcName="林灵素", scene=12, posx=58, posz=73, FubenName="灵性峰副本"},
								{menpainame="逍遥", menpai=MP_XIAOYAO  , NpcName="冯阿三", scene=14, posx=62, posz=68, FubenName="谷底副本"},
								{menpainame="星宿", menpai=MP_XINGSU   , NpcName="红玉", scene=16, posx=128, posz=78, FubenName="五神洞副本"},
								}       

--收集
x229000_g_ShouJiList = {
								{menpai=MP_SHAOLIN  , scene=9, itemId=40002125, itemName="散落的柴火"},-- count=5},
								{menpai=MP_SHAOLIN  , scene=9, itemId=40002126, itemName="散落的蘑菇"},-- count=5},
								{menpai=MP_SHAOLIN  , scene=9, itemId=40002127, itemName="散落的松果"},-- count=5},
							}	



--送生活技能npc列表
x229000_g_AbilityNpcList = {
										{menpai=MP_SHAOLIN  ,npcList={{name="潘玄耕", scene=9, x=70, z=105},
																					 				{name="卫玄望", scene=9, x=61, z=57},
																					 				{name="方玄劳", scene=9, x=123, z=88}}
										},
									}

										
--捕兽列表
x229000_g_PetList = {
						{petDataId=3000, petName="野生柴猫", takeLevel=10},
					}


--杀怪相关
x229000_g_MenpaiYiWuList = {
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
x229000_g_RateOfDropYiWuTable = {
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
 
x229000_g_DemandKillcountTable = 	{
							{levelBegin=10, levelEnd=19, killcount=20},
							{levelBegin=20, levelEnd=39, killcount=25},
							{levelBegin=40, levelEnd=59, killcount=30},
							{levelBegin=60, levelEnd=79, killcount=35},
							{levelBegin=80, levelEnd=99, killcount=40},
							{levelBegin=100, levelEnd=109, killcount=45},
							{levelBegin=110, levelEnd=119, killcount=50},
							{levelBegin=120, levelEnd=150, killcount=55},
}						


x229000_g_Xin_ItemId = 40002115

--//////////////////////////////////////////////////////
--杀怪相关
function x229000_GetMenpaiYiWuInfo(sceneId, selfId)
	for i, v in x229000_g_MenpaiYiWuList do
		if v.menpai == GetMenPai(sceneId, selfId) then
			return v.menpainame, v.itemName, v.itemId
		end
	end
end

function x229000_GetRateOfDropYiWu(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	for i, v in x229000_g_RateOfDropYiWuTable do
		if v.playerLevel >= playerLevel and playerLevel < v.playerLevel then
			return v.dropRate
		end
	end
end

function x229000_GetDemandKillCount(sceneId, selfId)
	local playerLevel = GetLevel(sceneId, selfId)
	for i, v in x229000_g_DemandKillcountTable do
		if playerLevel >= v.levelBegin and playerLevel <= v.levelEnd then
			return v.killcount
		end
	end
end

function x229000_KillMonster_Accept(sceneId, selfId)--杀怪
	--PrintStr("KillMonster_Accept...")
	local nMonsterId, strMonsterName, strMonsterScene, nScene, nPosX, nPosZ, strDesc, nSex, level
	local playerLevel = GetLevel(sceneId, selfId)
	for i=1, 100 do
		nMonsterId, strMonsterName, strMonsterScene, nScene, nPosX, nPosZ, strDesc, nSex, level = GetOneMissionNpc(43)
		if abs(playerLevel - level) <= 3 then
			break
		end
		if i == 100 then
			--统统送信去:((
			x229000_SongXin_Accept(sceneId, selfId)
			return
		end
	end	
	
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 1, 0, 1 )
	if bAdd < 1 then
		return
	end	
	local killcount = x229000_GetDemandKillCount(sceneId, selfId)
	
	local countpart1 = x229000_GetStrIndexByStrValue(tostring(floor(killcount / 10)) )
	local countpart2 = x229000_GetStrIndexByStrValue(tostring(floor(mod(killcount, 10))) )
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.killMonster)
	
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 0, killcount) --要求杀死的monster总数， 现在还没有赋值
	SetMissionParamByIndexEx(sceneId, selfId, misIndex, 3, 1, 0) --已经杀死的monster数量

	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 9)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, countpart1)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+2, countpart2)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+3, nMonsterId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskThePos", sceneId, selfId, nScene, nPosX, nPosZ, strMonsterName)
	
	local strMissionTarget = format("最近%s地区的%s经常扰乱周边的居民，特命你去惩戒他们。", 
						strMonsterScene, strMonsterName)
	--PrintStr(strMissionTarget)	
	AddText(sceneId, strMissionTarget)

end

--//////////////////////////////////////////////////////
function x229000_GetStrIndexByStrValue(stringV)
	for i, v in x229000_g_StrList do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("必须将%s注册到StrList中", stringV)
	--PrintStr(strText)
	return 0;
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--是否是副本任务
function x229000_IsFubenMission(sceneId,selfId, targetId)
	local shimenMissionIdList = {1080, 1090, 1065, 1070, 1060, 1100, 1075, 1085, 1095}
	for i, v in shimenMissionIdList do
		if IsHaveMission(sceneId,selfId,v) > 0	 then
			local	misIndex = GetMissionIndexByID(sceneId,selfId,v)			--得到任务的序列号
			local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			if missionType == x229000_g_SubMissionTypeEnum.FuBenZhanDou then
				local bComplete = GetMissionParam( sceneId, selfId, misIndex, 0)
				if bComplete ~= 0 then
					return 0
				else	
					return 1				
				end
			elseif	missionType == x229000_g_SubMissionTypeEnum.otherMenpaiFuben then
				local misIndex = GetMissionIndexByID(sceneId,selfId,v)
				local bComplete = GetMissionParam( sceneId, selfId, misIndex, 0)
				local npcStrIndex = GetMissionParam( sceneId, selfId, misIndex, x229000_g_StrForePart+2)
				local npcName = CallScriptFunction(229010, "GetStrValueByStrIndex",sceneId, npcStrIndex)
				if GetName(sceneId, targetId) == npcName then
					if bComplete ~= 0 then
						return 0
					else	
						return 1				
					end
				end
			end
		end
	end
	return 0
end

--是否是副本任务
function x229000_SetFubenMissionSucc(sceneId,selfId, targetId)
	local shimenMissionIdList = {1080, 1090, 1065, 1070, 1060, 1100, 1075, 1085, 1095}
	for i, v in shimenMissionIdList do
		if IsHaveMission(sceneId,selfId,v) > 0	 then
			local	misIndex = GetMissionIndexByID(sceneId,selfId,v)			--得到任务的序列号
			local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			if missionType == x229000_g_SubMissionTypeEnum.FuBenZhanDou then
				local misIndex = GetMissionIndexByID(sceneId,selfId,v)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)						--根据序列号把任务变量的第0位置0 (任务完成情况)				
			elseif	missionType == x229000_g_SubMissionTypeEnum.otherMenpaiFuben then
				local misIndex = GetMissionIndexByID(sceneId,selfId,v)
				local npcStrIndex = GetMissionParam( sceneId, selfId, misIndex, x229000_g_StrForePart+2)
				local npcName = CallScriptFunction(229010, "GetStrValueByStrIndex",sceneId, npcStrIndex)
				if GetName(sceneId, targetId) == npcName then
					local misIndex = GetMissionIndexByID(sceneId,selfId,v)
					SetMissionByIndex(sceneId,selfId,misIndex,0,1)						--根据序列号把任务变量的第0位置0 (任务完成情况)
				end
			end
		end
	end
end

--是否是采集任务
function x229000_IsCaiJiMission(sceneId,selfId, missionId, itemId)
	local	misIndex = GetMissionIndexByID(sceneId,selfId,missionId)			--得到任务的序列号
	if	IsHaveMission(sceneId,selfId,missionId) > 0	 then
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229000_g_SubMissionTypeEnum.ShouJi then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
			local itemCount = GetItemCount(sceneId,selfId,demandItemId)
			if itemCount == 5 then
				return 0
			end
			if demandItemId == itemId then
				return 1
			end
		end
	end
	
	BeginEvent(sceneId)
		AddText(sceneId, "你没有接取本派的师门任务，不能采集。")
	EndEvent( )
	DispatchMissionTips(sceneId,selfId)
	
	return 0
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体item的详细信息
function x229000_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s物品在'MissionItem_HashTable.txt'没有找到!!", itemName)
		--PrintStr(strText)
	end
	return itemId, itemName, itemDesc
end	
--/////////////////////////////////////////////////////////////////////////////////////////////////////
--根据玩家等级得到对应MissionItem_HashTable.txt中的单元索引
function x229000_GetMissionItemIndex(sceneId, selfId)
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
	elseif nPlayerLevel >= 120 then
		return 168;
	end
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--根据玩家等级得到对应MissionPet_HashTable.txt中的单元索引
function x229000_GetMissionPetIndex(sceneId, selfId)
	local nPlayerLevel  = GetLevel(sceneId, selfId)
	if nPlayerLevel >= 10 and nPlayerLevel < 20 then
		return 1
	elseif nPlayerLevel >= 20 and nPlayerLevel < 40 then
		return 2
	elseif nPlayerLevel >= 40 and nPlayerLevel < 60 then
		return 3
	elseif nPlayerLevel >= 60 and nPlayerLevel < 80 then 
		return 4
	elseif nPlayerLevel >= 80 and nPlayerLevel < 100 then
		return 5;
	elseif nPlayerLevel >= 100 and nPlayerLevel < 120 then
		return 12;
	elseif nPlayerLevel >= 120 then
		return 13;
	end
end

--根据玩家等级得到对应的师门任务的阶段
function x229000_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
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
function x229000_RandomSubMission(sceneId, selfId)
 
	
	--寻物（1/4）、送信（1/16）、收集（1/16）、开光（1/16）、定点引导（1/16）、战斗副本（1/4）、捕捉（1/4）
	local nRet = 1 + LuaFnGetHumanShimenRandom(sceneId, selfId);
	if nRet then
		if nRet <= 4 then
			x229000_XunWu_Accept(sceneId, selfId)
		elseif nRet <= 5 then
			x229000_SongXin_Accept(sceneId, selfId)
		elseif nRet <= 6 then
			x229000_ShouJi_Accept(sceneId, selfId)
		elseif nRet <= 7 then
			x229000_SongXin_Accept(sceneId, selfId)
		elseif nRet <= 8 then
			x229000_DingDianYinDao_Accept(sceneId, selfId)
		elseif nRet <= 12 then
			x229000_FuBenZhanDou_Accept(sceneId, selfId)
		elseif nRet <= 16 then
			x229000_BuZhuo_Accept(sceneId, selfId)
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
function x229000_DoSomethingByPlayerLevel(sceneId, selfId, scriptId)
	--PrintStr("...DoSomethingByPlayerLevel")
	--if 1==1 then
	--	CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)
	----得到环数
  --
	--	local round = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)
	--
	----PrintStr("round="..round)
	----环数增加1
	--
	--	round = round + 1
	--
	--	if	round >= 21 then
	--
	--		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, 1)
	--
	--	else
	--	--PrintStr("round="..round)
	--		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, round)
	--
	--	end
	--	return
	--end	
	
	------------------------------------------------------------------

	local find = CallScriptFunction( 500501, "CheckAccept_Necessary", sceneId, selfId)

	-------------------------------------------------------------------
	if find == -2 then
		BeginEvent(sceneId)
			AddText(sceneId, x229000_g_MissionName)
			AddText(sceneId, "师门任务一天只能做60次，还是稍安勿躁吧。")
		EndEvent( )
		DispatchEventList(sceneId, selfId, -1)
		return
	elseif find == -1 then
		BeginEvent(sceneId)
			AddText(sceneId, x229000_g_MissionName)
			AddText(sceneId, "在15分钟内你不能接收新的任务!")
		EndEvent( )
		DispatchEventList(sceneId, selfId, -1)
		return
	end
	
	-- [ QUFEI 2007-11-08 16:40 UPDATE BugID 25313 ]
	local nPhase = x229000_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	local round = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)
	
	if nPhase == 0 then
		--寻物	送信	收集	本门派副本	定点引导	捕捉	打野怪
		--根据环数决定任务类型
		if round >= 0 and round <= 4 then
			--几率 0	50	0  10  40  0  0
			local nRet = random(100)
			
			if nRet <= 0 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 50 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 50 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 60 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 5 and round <= 9 then
			--几率 20	45	0  10  25  0  0
			local nRet = random(100)
			
			if nRet <= 20 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 65 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 65 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 75 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 10 and round <= 14 then
			--几率	40	30	0	10	20	0	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 70 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 70 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 80 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 15 then
			--几率	60	15	0	10	15	0	0
			local nRet = random(100)
			
			if nRet <= 60 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 75 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 75 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 85 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		end
	elseif nPhase == 1 then
		--寻物	送信	收集	本门派副本	定点引导	捕捉	打野怪
		--根据环数决定任务类型
		if round >= 0 and round <= 4 then
			--几率 0	25	30	5	40	0	0
			local nRet = random(100)
			
			if nRet <= 0 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 25 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 55 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 60 then
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 5 and round <= 9 then
			--几率 20	22	23	10	25	0	0
			local nRet = random(100)
			
			if nRet <= 20 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 42 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 65 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 75 then
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 10 and round <= 14 then
			--几率 35	22	20	5	18	0	0
			local nRet = random(100)
			
			if nRet <= 35 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 57 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 77 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 82 then
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 15 then
			--几率 45	19	7	20	9	0	0
			local nRet = random(100)
			
			if nRet <= 45 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 64 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 71 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 91 then
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		end
	elseif nPhase == 2 then
		--寻物	送信	收集	本门派副本	定点引导	捕捉	打野怪
		--根据环数决定任务类型
		if round >= 0 and round <= 4 then
			--几率 0	15	25	32	28	0	0
			local nRet = random(100)
			
			if nRet <= 0 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 15 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 72 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 5 and round <= 9 then
			--几率 13	15	15	20	14	23	0
			local nRet = random(100)
			
			if nRet <= 13 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 28 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 43 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 63 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 77 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 10 and round <= 14 then
			--几率 17	5	8	20	10	40	0
			local nRet = random(100)
			
			if nRet <= 17 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 22 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 30 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 50 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 60 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 15 then
			--几率 30	5	0	8	0	57	0
			local nRet = random(100)
			
			if nRet <= 30 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 35 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 35 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 43 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 43 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		end

	elseif nPhase == 3 then
		--寻物	送信	收集	本门派副本	定点引导	捕捉	打野怪
		--根据环数决定任务类型
		if round >= 0 and round <= 4 then
			--几率 5	15	20	40	20	0	0
			local nRet = random(100)
			
			if nRet <= 5 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 20 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 80 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 5 and round <= 9 then
			--几率 33	5	5	10	10	37	0
			local nRet = random(100)
			
			if nRet <= 33 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 38 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 43 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 53 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 63 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 10 and round <= 14 then
			--几率 34	0	3	10	2	51	0
			local nRet = random(100)
			
			if nRet <= 34 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 34 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 37 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 47 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 49 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 15 then
			--几率 40	0	0	8	0	52	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 48 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 48 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		end
	elseif nPhase == 4 then
		--寻物	送信	收集	本门派副本	定点引导	捕捉	打野怪
		--根据环数决定任务类型
		if round >= 0 and round <= 4 then
			--几率 15	15	15	25	15	15	0
			local nRet = random(100)
			
			if nRet <= 15 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 30 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 45 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 70 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 85 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 5 and round <= 9 then
			--几率 33	5	5	5	10	42	0
			local nRet = random(100)
			
			if nRet <= 33 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 38 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 43 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 48 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 58 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 10 and round <= 14 then
			--几率 40	0	0	5	7	48	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 45 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 52 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 15 then
			--几率 40	0	0	5	0	55	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 45 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 45 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		end
	elseif nPhase == 243 then
		--寻物	送信	收集	本门派副本	定点引导	捕捉	打野怪
		--根据环数决定任务类型
		if round >= 0 and round <= 4 then
			--几率 15	15	15	25	15	15	0
			local nRet = random(100)
			
			if nRet <= 15 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 30 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 45 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 70 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 85 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 5 and round <= 9 then
			--几率 33	5	5	5	10	42	0
			local nRet = random(100)
			
			if nRet <= 33 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 38 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 43 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 48 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 58 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 10 and round <= 14 then
			--几率 40	0	0	5	7	48	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 45 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 52 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 15 then
			--几率 40	0	0	5	0	55	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 45 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 45 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		end
	elseif nPhase == 244 then
		--寻物	送信	收集	本门派副本	定点引导	捕捉	打野怪
		--根据环数决定任务类型
		if round >= 0 and round <= 4 then
			--几率 15	15	15	25	15	15	0
			local nRet = random(100)
			
			if nRet <= 15 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 30 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 45 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 70 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 85 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 5 and round <= 9 then
			--几率 33	5	5	5	10	42	0
			local nRet = random(100)
			
			if nRet <= 33 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 38 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 43 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 48 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 58 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 10 and round <= 14 then
			--几率 40	0	0	5	7	48	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 45 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 52 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		elseif round >= 15 then
			--几率 40	0	0	5	0	55	0
			local nRet = random(100)
			
			if nRet <= 40 then
				CallScriptFunction(scriptId, "XunWu_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "SongXin_Accept", sceneId, selfId)
			elseif nRet <= 40 then
				CallScriptFunction(scriptId, "ShouJi_Accept", sceneId, selfId)
			elseif nRet <= 45 then	
				CallScriptFunction(scriptId, "FuBenZhanDou_Accept", sceneId, selfId)
			elseif nRet <= 45 then
				CallScriptFunction(scriptId, "DingDianYinDao_Accept", sceneId, selfId)
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "BuZhuo_Accept", sceneId, selfId)	
			elseif nRet <= 100 then
				CallScriptFunction(scriptId, "KillMonster_Accept", sceneId, selfId)	
			end
		end		
		
	end
	
        x229000_FixupShimenHuan(sceneId, selfId)
end

function x229000_FixupShimenHuan(sceneId, selfId)
	local round = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)
	round = round + 1
	--10～19级，10次为1轮。前10次奖励为双倍经验。
	--20～29级，15次为1轮。前15次奖励为双倍经验。
	--30～100级，20次为1轮。前20次奖励为双倍经验。
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel < 20 then
		if	round >= 11 then
			SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, 1)
		else
			SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, round)
		end
	elseif playerLevel < 30 then
		if	round >= 16 then
			SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, 1)
		else
			SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, round)
		end
	elseif playerLevel <= PlayerMaxLevel then
		if	round >= 21 then
			SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, 1)
		else
			SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, round)
		end
	end
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229000_XunWu_Accept(sceneId, selfId)--寻物
	----PrintStr("XunWu_Accept..")
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 1 )
	if bAdd < 1 then
		return
	end	
	
	local nitemId, strItemName, strItemDesc = GetOneMissionItem(x229000_GetMissionItemIndex(sceneId, selfId))
	Msg2Player(sceneId, selfId, "#Y接受任务：师门任务", MSG2PLAYER_PARA )
	--print(nitemId, strItemName, strItemDesc)
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.XunWu)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 1)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, nitemId)
	
	local strMissionTarget = format("我的%s怎么不见了？如果你能帮我找回来，我是不会亏待你的。", strItemName)
	AddText(sceneId, strMissionTarget)
	
	--检测玩家身上的道具是否已经满足完成条件
	local bHaveItem = HaveItem(sceneId, selfId, nitemId)
	if bHaveItem == 1 then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1
		ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 2)
	end	
	
end	

--/////////////////////////////////////////////////////////////////////////////////////////////////////

function x229000_SongXin_Accept(sceneId, selfId)--送信

  local roll = random(3)
	--随机选出本门派的特产编号，每个门派3种特产
	local shoujiItemId = x229000_g_ShouJiList[ roll ].itemId
		
	--任务奖励相关			
	BeginAddItem(sceneId)
		AddItem(sceneId, shoujiItemId, 1)
	local bAdd = EndAddItem(sceneId, selfId)
	if bAdd < 1 then
		return 
	end	

	--加入任务到玩家列表
	bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end
	AddItemListToHuman(sceneId, selfId)		
	--寻物, 送信则设置锁定目标NPC的事件Flag
	SetMissionEvent(sceneId, selfId, x229000_g_MissionId, 4)
	
	local nPhase = x229000_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(nPhase)
	--print(nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc)
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, nPosX, nPosZ, strNpcName)
		
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.SongXin)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 0)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, nNpcId)

	local ListIndex = x229000_GetStrIndexByStrValue( x229000_g_ShouJiList[ roll ].itemName )
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+2, ListIndex )

  SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+3, shoujiItemId )

	local strMissionTarget = format("好久没有见%s%s了，请你帮我把这个%s交给他。", strNpcScene, strNpcName, x229000_g_ShouJiList[ roll ].itemName )
	AddText(sceneId, strMissionTarget)
	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229000_DingDianYinDao_Accept(sceneId, selfId)--定点引导
	--获得玩家的门派
	local playerMenpai = GetMenPai(sceneId, selfId)
	local a = {}
	local index = 1
	--用一个临时表来存储对应门派在x229000_g_DingDianYinDaoList中的全部索引
	for i, v in x229000_g_DingDianYinDaoList do
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
		AddItem(sceneId, x229000_g_DingDianYinDaoList[a[ret]].itemId, 1)
	local bAdd = EndAddItem(sceneId, selfId)
	if bAdd < 1 then
		return 
	end	

	--加入任务到玩家列表
	bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	AddItemListToHuman(sceneId, selfId)
	Msg2Player(  sceneId, selfId,"#Y你得到了一个" .. x229000_g_DingDianYinDaoList[a[ret]].itemName, MSG2PLAYER_PARA )
		
	local strIndex_Area = x229000_GetStrIndexByStrValue(x229000_g_DingDianYinDaoList[a[ret]].AreaName)
	local strIndex_Item = x229000_GetStrIndexByStrValue(x229000_g_DingDianYinDaoList[a[ret]].itemName)
	local strIndex_subArea = x229000_GetStrIndexByStrValue(x229000_g_DingDianYinDaoList[a[ret]].subAreaName)                                                                            
	
	local x1 = x229000_g_DingDianYinDaoList[a[ret]].posx1
	local x2 = x229000_g_DingDianYinDaoList[a[ret]].posx2
	local z1 = x229000_g_DingDianYinDaoList[a[ret]].posz1
	local z2 = x229000_g_DingDianYinDaoList[a[ret]].posz2
	local scene = x229000_g_DingDianYinDaoList[a[ret]].scene
	local tip = x229000_g_DingDianYinDaoList[a[ret]].AreaName .. x229000_g_DingDianYinDaoList[a[ret]].subAreaName
	local x = x1 + (x2-x1)/2
	local z = z1 + (z2-z1)/2
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.DingDianYinDao)
	SetMissionByIndex(sceneId, selfId, misIndex, 2, a[ret]) --设置定点引导列表中的索引
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 3)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, strIndex_Item)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+2, strIndex_Area)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+3, strIndex_subArea)
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, scene, x, z, tip)

	local strMissionTarget = format("请你使用%s，打扫少林寺%s的%s。", 
		x229000_g_DingDianYinDaoList[a[ret]].itemName,
		x229000_g_DingDianYinDaoList[a[ret]].AreaName, 
		x229000_g_DingDianYinDaoList[a[ret]].subAreaName) 
		
	AddText(sceneId, strMissionTarget)
	
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229000_FuBenZhanDou_Accept(sceneId, selfId)--战斗副本
	local playerMenpai = GetMenPai(sceneId, selfId)
	if playerMenpai == MP_WUMENPAI then
		return 0
	end	

	local npcName, fubenName, nSceneId, posx, posz
	for i, v in x229000_g_FuBen_List do
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
	local bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	local nFormatIndex = GetMissionCacheData(sceneId, selfId, 0)
	local i = GetMissionCacheData(sceneId, selfId, 2)
	local NpcNameIndex = x229000_GetStrIndexByStrValue(npcName)
	local FubenNameIndex = x229000_GetStrIndexByStrValue(fubenName)
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.FuBenZhanDou)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 4)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, NpcNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+2, FubenNameIndex)
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, posx, posz, npcName)

	local strMissionTarget = format("请你去找到%s， 他会带你去挑战%s的。", npcName, fubenName)
	AddText(sceneId, strMissionTarget)
end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229000_BuZhuo_Accept(sceneId, selfId)--捕捉
	--PrintStr("BuZhuo_Accept...")
	local playerLevel = GetLevel(sceneId, selfId)
	local petId, petName, petDesc, takeLevel
	local petHashIndex = x229000_GetMissionPetIndex(sceneId, selfId)
	for i = 1, 100 do
		petId, petName, petDesc = GetOneMissionPet(petHashIndex)
		takeLevel = GetPetTakeLevel(petId)
		--PrintNum(takeLevel)
		if playerLevel > takeLevel then
			break
		end
		if i == 100 then
			--统统送信去:((
			x229000_SongXin_Accept(sceneId, selfId)
			return
		end
	end	

	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	SetMissionEvent(sceneId, selfId, x229000_g_MissionId, 3)
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.BuZhuo)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 5)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, petId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	
	local strMissionTarget = format("请你帮我抓一只%s来。", petName)
	AddText(sceneId, strMissionTarget)
	
	--检测玩家身上的道具是否已经满足完成条件
	for i=0, 6 do
		local petDataId = LuaFnGetPet_DataID(sceneId,selfId,i)
		if petDataId == petId then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)					--把任务完成标志置为1

			ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 3)
			break
		end	
	end	

end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229000_ShouJi_Accept(sceneId, selfId)--收集
	--PrintStr("ShouJi_Accept...")
	local playerMenpai = GetMenPai(sceneId, selfId)
	if playerMenpai == MP_WUMENPAI then
		return 0
	end	
	--PrintStr("playerMenpai="..playerMenpai)
	local a = {}
	local index = 1
	for i, v in x229000_g_ShouJiList do
		if v.menpai == playerMenpai then
			--PrintStr("find...")
			a[index] = i
			index = index + 1
		end	
	end
	local ct = getn(a)
	--PrintStr("ct="..ct)
	if ct <= 0 then
		return 0
	end
	
	local ret = random(ct)
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 1 )
	if bAdd < 1 then
		return
	end	
	
	local itemNameIndex = x229000_GetStrIndexByStrValue(x229000_g_ShouJiList[a[ret]].itemName)
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.ShouJi)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 6)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, itemNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+2, x229000_g_ShouJiList[a[ret]].itemId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	
	local strMissionTarget = format("请你帮我弄5个%s来。", x229000_g_ShouJiList[a[ret]].itemName)
	AddText(sceneId, strMissionTarget)
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////
function x229000_Ability_Accept(sceneId, selfId)--开光
	----PrintStr("Ability_Accept...")
	--local nPhase = x229000_GetShiMenPhaseByPlayerLevel(sceneId, selfId)
	--local nNpcId, strNpcName, strNpcScene, nSceneId, nPosX, nPosZ, strNPCDesc = GetOneMissionNpc(nPhase-1)
	local strNpcName, scene, x, z
	for i, v in x229000_g_AbilityNpcList do
		if v.menpai == GetMenPai(sceneId, selfId) then
			local ct = getn(v.npcList)
			local index = random(ct)
			strNpcName = v.npcList[index].name
			scene = v.npcList[index].scene
			x = v.npcList[index].x
			z = v.npcList[index].z
		end
	end
	
	local strNpcIndex = x229000_GetStrIndexByStrValue(strNpcName)
	local itemId, itemName = GetMenpaiItem(sceneId, selfId)


	----PrintStr("itemId="..itemId.."  itemName="..itemName)
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	SetMissionEvent(sceneId, selfId, x229000_g_MissionId, 2)
	SetMissionEvent(sceneId, selfId, x229000_g_MissionId, 4)
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.KaiGuang)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 7)--formet字符串索引
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, strNpcIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+2, itemId)
		
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, scene, x, z, strNpcName)
	
	local strMissionTarget = format("请给%s送一个%s吧, 我会给你报酬的！", strNpcName, itemName)
	AddText(sceneId, strMissionTarget)

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--**********************************
--任务入口函数
--**********************************
function x229000_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	----PrintStr("OnDefaultEvent...")
	--发送任务需求的信息
	if IsHaveMission(sceneId,selfId,x229000_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x229000_g_Name then
			--发送任务需求的信息
			BeginEvent(sceneId)
				AddText(sceneId, x229000_g_MissionName)
				AddText(sceneId, "我交给你的事情已经做完了吗？")
			EndEvent( )
			bDone = x229000_CheckSubmit( sceneId, selfId )
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229000_g_ScriptId, x229000_g_MissionId, bDone)
		else
			local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
			
			local demandItemId =0
			local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			if missionType == x229000_g_SubMissionTypeEnum.SongXin then
			    demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+3)
			else
			    demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
			end				
	
			
			local _, strDemandItemName, _ = x229000_GetItemDetailInfo(demandItemId)
			
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
				ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 4)
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
	elseif x229000_CheckAccept(sceneId,selfId) > 0 then
		BeginEvent(sceneId)
		
			AddText(sceneId,x229000_g_MissionName)
			AddText(sceneId,x229000_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			
			x229000_DoSomethingByPlayerLevel(sceneId, selfId, x229000_g_ScriptId)
			--保证第一次接到的任务总是固定不变的
			--ResetMissionCacheData(sceneId, selfId)
			--SetMissionCacheData(sceneId, selfId, 0, 0) --formet字符串索引
			--SetMissionCacheData(sceneId, selfId, 1, x229000_g_SubMissionTypeEnum.SongXin)
			--SetMissionCacheData(sceneId, selfId, 2, 100001) --设置human身上第0位缓存数据
			--SetMissionCacheData(sceneId, selfId, 7, 1) --是否是第一次
			
			--strMissionTarget = format("好久没有见%s了，请代我问候一下他去", "frankwu")
			--AddText(sceneId, strMissionTarget)

			--加入任务到玩家列表
			--AddMission( sceneId,selfId, x229000_g_MissionId, x229000_g_ScriptId, 0, 0, 0 )
			--寻物, 送信则设置锁定目标NPC的事件Flag
			--SetMissionEvent(sceneId, selfId, x229000_g_MissionId, 4)

			--local _, strNpcName, strNpcScene, PosX, PosZ, _ = GetNpcInfoByNpcId(sceneId,100001)
			--Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
			--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, PosX, PosZ, strNpcName)
				
			--得到任务在20个任务中的序列号
			--local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
			
			--SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
			--SetMissionByIndex(sceneId, selfId, misIndex, 1, x229000_g_SubMissionTypeEnum.SongXin)
			
			--SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart, 0)--formet字符串索引
			--SetMissionByIndex(sceneId, selfId, misIndex, x229000_g_StrForePart+1, 100001)
		
			
		EndEvent( )
		DispatchEventList(sceneId,selfId,targetId)
	end
	
end

--**********************************
--列举事件
--**********************************
function x229000_OnEnumerate( sceneId, selfId, targetId )
	--PrintStr("229000...OnEnumerate")
--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x229000_g_MissionId) > 0 then
  	return
--满足任务接收条件
	elseif IsHaveMission(sceneId,selfId,x229000_g_MissionId) > 0 then
		local strNpcName = x229000_g_Name -- temp code
		if GetName(sceneId,targetId) == strNpcName then
			AddNumText(sceneId, x229000_g_ScriptId,x229000_g_MissionName,4,-1);
		end
--满足任务接收条件
  elseif x229000_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) == x229000_g_Name then
			AddNumText(sceneId,x229000_g_ScriptId,x229000_g_MissionName,3,-1);
		end
  end
end
--**********************************
--接受
--**********************************
function x229000_OnAccept( sceneId, selfId )
	--PrintStr("OnAccept...")
	--local nMissionType = GetMissionCacheData(sceneId, selfId, 1)
	--if nMissionType == x229000_g_SubMissionTypeEnum.XunWu then
	--	x229000_XunWu_Accept(sceneId, selfId)
	--elseif nMissionType == x229000_g_SubMissionTypeEnum.SongXin then
	--	x229000_SongXin_Accept(sceneId, selfId)
	--elseif nMissionType == x229000_g_SubMissionTypeEnum.DingDianYinDao then
	--	x229000_DingDianYinDao_Accept(sceneId, selfId)
	--elseif nMissionType == x229000_g_SubMissionTypeEnum.FuBenZhanDou then
	--	x229000_FuBenZhanDou_Accept(sceneId, selfId)
	--elseif nMissionType == x229000_g_SubMissionTypeEnum.BuZhuo then
	--	x229000_BuZhuo_Accept(sceneId, selfId)
	--end
end

--**********************************
--检测接受条件
--**********************************
function x229000_CheckAccept( sceneId, selfId )
	local nLevel = GetLevel(sceneId, selfId)
	--玩家等级>=10级
	if nLevel < 10 then
		return 0
	else
		local playerMenpai = GetMenPai(sceneId, selfId)
		if playerMenpai ~= MP_SHAOLIN then
			return 0
		end	
	end
	return 1;
end

--**********************************
--放弃
--**********************************
function x229000_OnAbandon( sceneId, selfId )
	----PrintStr("OnAbandon...")
	if IsHaveMission(sceneId, selfId, x229000_g_MissionId) > 0 then	
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)		--得到任务在20个任务中的序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		if missionType == x229000_g_SubMissionTypeEnum.SongXin then
			local missionItem = GetMissionParam(sceneId, selfId, misIndex,x229000_g_StrForePart+3)
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
		elseif missionType == x229000_g_SubMissionTypeEnum.DingDianYinDao	then
			local index = GetMissionParam(sceneId, selfId, misIndex,2)
			if HaveItem(sceneId, selfId, x229000_g_DingDianYinDaoList[index].itemId) == 1 then
			if LuaFnGetAvailableItemCount(sceneId, selfId, x229000_g_DingDianYinDaoList[index].itemId) >= 1 then
			DelItem(sceneId, selfId,x229000_g_DingDianYinDaoList[index].itemId,1)
			else
				BeginEvent(sceneId)
					AddText(sceneId, "您的物品现在不可用或已被锁定。")
				EndEvent( )
				DispatchMissionTips(sceneId,selfId)	
				return	
			end
			end	
		elseif missionType == x229000_g_SubMissionTypeEnum.ShouJi then
			local itemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
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
	  DelMission( sceneId, selfId, x229000_g_MissionId )
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
function x229000_OnContinue( sceneId, selfId, targetId )
	----PrintStr("OnContinue...")
	if x229000_CheckAccept(sceneId,selfId) > 0 then
		BeginEvent(sceneId)
		
			AddText(sceneId,x229000_g_MissionName)
			AddText(sceneId,x229000_g_MissionComplete)
			
		  --x229000_DoSomethingByPlayerLevel(sceneId, selfId)
		  
		EndEvent( )
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x229000_g_ScriptId, x229000_g_MissionId)
	end	
end

--**********************************
--检测是否可以提交
--**********************************
function x229000_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x229000_g_MissionId ) <= 0 then
		return 0
	end

	--在此判断提交条件是否符合，并给予相应奖励
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	
	if missionType == x229000_g_SubMissionTypeEnum.XunWu then
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
		if GetItemCount(sceneId,selfId,demandItemId) <= 0 then --没有索要的物品
			return 0
		end
		if IsEquipItem(demandItemId) == 1 and IsWhiteEquip(demandItemId) ~= 1 then
			return 2
		else
			return 1
		end		
	elseif missionType == x229000_g_SubMissionTypeEnum.ShouJi then
	 	local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
	 	if GetItemCount(sceneId,selfId,demandItemId) < 5 then --没有索要的物品
	 		return 0
	 	else
	 		return 1	
	 	end
	elseif missionType == x229000_g_SubMissionTypeEnum.BuZhuo then
		return 2
	elseif GetMissionParam(sceneId, selfId, misIndex, 0) > 0 then	--察看任务是否完成
		return 1
	end

	return 0
end

function x229000_OnLockedTarget(sceneId, selfId, objId )
	--PrintStr("OnLockedTarget...")
	if GetName(sceneId, objId) == x229000_g_Name  then
		return 0
	end
	-- 判断是不是锁定的Npc
	if IsHaveMission(sceneId, selfId, x229000_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)		--得到任务在20个任务中的序列号
		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		
		local nNpcId, strNpcName, strNpcScene, PosX, PosZ, desc
		if missionType == x229000_g_SubMissionTypeEnum.KaiGuang then
			nNpcIndex = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
			strNpcName = x229000_g_StrList[nNpcIndex+1]
		else
			nNpcId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
			nNpcId, strNpcName, strNpcScene, PosX, PosZ, desc = GetNpcInfoByNpcId(sceneId,nNpcId)
		end
		--PrintStr(strNpcName)
		--PrintStr(GetName(sceneId, objId))
		if GetName(sceneId, objId) == strNpcName then
			TAddNumText(sceneId,x229000_g_ScriptId,x229000_g_MissionName,4,-1,x229000_g_ScriptId);
		end

	end
	
	return 0;

end

function x229000_CheckCondition_UseItem( sceneId, selfId, targetId, eventId )
	------PrintStr("OnUseItem...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229000_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType ~= x229000_g_SubMissionTypeEnum.DingDianYinDao then
		return 0
	end
	
	local index = GetMissionParam(sceneId, selfId, misIndex, 2)
	local targetSceneId = x229000_g_DingDianYinDaoList[index].scene
	--PrintNum(sceneId)
	if sceneId ~= targetSceneId then
		BeginEvent(sceneId)

			AddText(sceneId,"似乎在这个场景不能施放")

		EndEvent(sceneId)

		DispatchMissionTips(sceneId,selfId)

		return 0
	end
	
	local posx1 = x229000_g_DingDianYinDaoList[index].posx1
	local posz1 = x229000_g_DingDianYinDaoList[index].posz1
	local posx2 = x229000_g_DingDianYinDaoList[index].posx2
	local posz2 = x229000_g_DingDianYinDaoList[index].posz2

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
function x229000_Active_UseItem( sceneId, selfId, param0 )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229000_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType ~= x229000_g_SubMissionTypeEnum.DingDianYinDao then
		return 0
	end
	local index = GetMissionParam(sceneId, selfId, misIndex, 2)
	if LuaFnGetAvailableItemCount(sceneId, selfId, x229000_g_DingDianYinDaoList[index].itemId) >= 1 then
		DelItem( sceneId, selfId, x229000_g_DingDianYinDaoList[index].itemId, 1 )
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
function x229000_OnItemChanged( sceneId, selfId, itemdataId )
	--PrintStr("OnItemChanged")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229000_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229000_g_SubMissionTypeEnum.XunWu then
		local _, strItemName, _ = x229000_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
		local _, strDemandItemName, _ = x229000_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)

				
				strText = format("已得到%s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 2)
		end
	elseif missionType == x229000_g_SubMissionTypeEnum.KaiGuang then
		local _, strItemName, _ = x229000_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
		local _, strDemandItemName, _ = x229000_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				strText = format("已得到%s", strItemName)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 2)
		end
	elseif missionType == x229000_g_SubMissionTypeEnum.ShouJi then
		--PrintStr("ShouJi...")
		local itemCount = GetItemCount(sceneId,selfId,itemdataId)
		local _, strItemName, _ = x229000_GetItemDetailInfo(itemdataId)
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
		local _, strDemandItemName, _ = x229000_GetItemDetailInfo(demandItemId)
		
		if strItemName == strDemandItemName then
			BeginEvent(sceneId)
				local _, strItemName, _ = x229000_GetItemDetailInfo(itemdataId)
				strText = format("已得到%s%d/5", strItemName, itemCount)
				AddText(sceneId,strText)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			if itemCount == 5 then
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 2)
			end
		end
	elseif missionType == x229000_g_SubMissionTypeEnum.killMonster then
		local _, _, itemId = x229000_GetMenpaiYiWuInfo(sceneId, selfId)
		if itemdataId == itemId  then
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 0)
			ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 2)
		end
	end

end

--**********************************
--珍兽改变
--**********************************
function x229000_OnPetChanged( sceneId, selfId, petDataId)
	----PrintStr("OnPetChanged...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229000_g_MissionId)

	--获得该任务的任务类型
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229000_g_SubMissionTypeEnum.BuZhuo then
		local demandPetDataId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
		
		if petDataId == demandPetDataId then
			BeginEvent(sceneId)
				local strText = format("已得到%s", GetPetName(petDataId))
				AddText(sceneId,strText)
			EndEvent(sceneId)

			DispatchMissionTips(sceneId,selfId)
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
			ResetMissionEvent(sceneId, selfId, x229000_g_MissionId, 3)
		end
	end
end
--**********************************
--提交
--**********************************
function x229000_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	--PrintStr("OnSubmit...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229000_g_MissionId)

	if x229000_CheckSubmit( sceneId, selfId, selectRadioId )>=1 then

		local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
		if missionType == x229000_g_SubMissionTypeEnum.XunWu then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
			--PrintStr("demandItemId"..demandItemId)
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
--		elseif missionType == x229000_g_SubMissionTypeEnum.killMonster then
--			local _, _, demandItemId  = x229000_GetMenpaiYiWuInfo(sceneId, selfId)
--			local ret = DelItem(sceneId, selfId, demandItemId, 1)
--			if ret <= 0 then
--				BeginEvent(sceneId)
--					AddText(sceneId, "没有足够的所需物品，任务无法提交")
--				EndEvent()
--				DispatchMissionTips(sceneId, selfId)
--				return
--			end
		elseif missionType == x229000_g_SubMissionTypeEnum.ShouJi then
			local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
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

		DelMission( sceneId, selfId, x229000_g_MissionId )
		--调用通用提交任务接口接口

		------------------------------------------------------------------
		local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, targetId )
		if Reward_Append == 2 and MissionRound == 20 then
			CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229000_g_MissionId, targetId)
		end
		-------------------------------------------------------------------

		--x229000_OnDefaultEvent( sceneId, selfId, targetId )
		
	end
end

function x229000_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, petindex )
  if x229000_CheckSubmit( sceneId, selfId) < 1 then
    return 0
  end

	----PrintStr("OnMissionCheck...")
	local misIndex = GetMissionIndexByID(sceneId, selfId, x229000_g_MissionId)

	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
	if missionType == x229000_g_SubMissionTypeEnum.XunWu then
		local demandItemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
		local _, strDemandItemName, _ = x229000_GetItemDetailInfo(demandItemId)
		--PrintStr("strDemandItemName="..strDemandItemName)
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

			DelMission( sceneId, selfId, x229000_g_MissionId )

			--调用通用提交任务接口接口

			------------------------------------------------------------------
			local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId,-1 )
			if Reward_Append == 2 and MissionRound == 20 then
				CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229000_g_MissionId)
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
	elseif missionType == x229000_g_SubMissionTypeEnum.BuZhuo then
		----PrintStr("OnMissionCheck...BuZhuo...")
		local demandPetId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+1)
		local petId = LuaFnGetPet_DataID(sceneId, selfId, petindex)
		if petId == demandPetId then
			if LuaFnIsPetAvailable(sceneId, selfId, petindex) >= 1 then
				LuaFnDeletePet(sceneId, selfId, petindex)
				----PrintStr("DeletePet"..petId..demandPetId)
				DelMission( sceneId, selfId, x229000_g_MissionId )

				--调用通用提交任务接口接口

				------------------------------------------------------------------
				local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId,-1 )
				if Reward_Append == 2 and MissionRound == 20 then
					CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229000_g_MissionId)
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
function x229000_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思：场景号、玩家objId、怪物表位置号、怪物
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	local nMonsterId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+3)
	local _, strMonsterName = GetNpcInfoByNpcId(sceneId,nMonsterId)
	--PrintStr("strMonsterName" .. strMonsterName)
	local monsterName = GetMonsterNamebyDataId(objdataId)
	--PrintStr("monsterName" .. monsterName)
	
	if strMonsterName == monsterName  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for i=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,i)
			--PrintStr("humanObjId=" .. humanObjId)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x229000_g_MissionId) > 0 then
				-- 先判断是不是已经满足了完成标志
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x229000_g_MissionId)
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
					if killedCount >= demandKillCount then
						SetMissionByIndex(sceneId, humanObjId, misIndex, 0, 1)
       end
				end --if
			end --if
		end --for				
  end --if
end


--**********************************
--同门相助....直接完成当前环....
--**********************************
function x229000_HelpFinishOneHuan( sceneId, selfId, targetId )

	--是否是本门派弟子....
	if MP_SHAOLIN ~= GetMenPai( sceneId, selfId ) then
		return
	end

	--是否接了师门任务....
	if IsHaveMission(sceneId,selfId,x229000_g_MissionId) <= 0 then
		return
	end

	--检测并扣除同门相助所需的师门贡献....
	local ret = CallScriptFunction( 229011, "CheckAndDepleteHelpFinishMenPaiPoint", sceneId, selfId, targetId )
	if ret == 0 then
		return
	end

	--获取师门任务的类型....
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229000_g_MissionId)
	local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)

	--清除任务物品....
	local itemId = -1
	local itemCount = -1

	if missionType == x229000_g_SubMissionTypeEnum.SongXin then
		itemId = GetMissionParam(sceneId, selfId, misIndex,x229000_g_StrForePart+3)
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount >= 1 then
			DelItem(sceneId, selfId, itemId, 1)
		end
	elseif missionType == x229000_g_SubMissionTypeEnum.DingDianYinDao	then
		local index = GetMissionParam(sceneId, selfId, misIndex,2)
		itemId = x229000_g_DingDianYinDaoList[index].itemId
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount >= 1 then
			DelItem(sceneId, selfId, itemId, 1)
		end
	elseif missionType == x229000_g_SubMissionTypeEnum.ShouJi then
		itemId = GetMissionParam(sceneId, selfId, misIndex, x229000_g_StrForePart+2)
		itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, itemId)
		if itemCount > 5 then
			itemCount = 5
		end
		if itemCount > 0 then
			DelItem(sceneId, selfId, itemId, itemCount)
		end
	end

	--删除玩家任务列表中对应的任务....
	DelMission( sceneId, selfId, x229000_g_MissionId )

	--调用通用提交任务接口接口....
	local Reward_Append, MissionRound = CallScriptFunction( 500501, "OnSubmit_Necessary", sceneId, selfId, targetId, 1 )

	if Reward_Append == 2 and MissionRound == 20 then
		--奖励玩家一个去别的门派副本的师门任务....
		CallScriptFunction(229010, "AddOtherMenpaiFubenMission", sceneId, selfId, x229000_g_MissionId, targetId)
	end

end
