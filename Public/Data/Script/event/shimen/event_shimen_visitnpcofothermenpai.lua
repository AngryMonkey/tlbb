 --师门任务

--MisDescBegin
--脚本号
x229010_g_ScriptId = 229010

--任务号
x229010_g_MissionId = 1060

--任务归类
x229010_g_MissionKind = 2

--任务等级
x229010_g_MissionLevel = 10000

--是否是精英任务
x229010_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x229010_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x229010_g_MissionName="师门任务"
x229010_g_MissionInfo=""  --任务描述
x229010_g_MissionTarget = "不错... ... 你一直为本门的发扬光大在尽心尽力的做着工作，我再额外给你一个任务吧，#G%s#W刚给我飞鸽传书，说他们需要帮忙，你去找一下#G%s#W的#Y%s#W，他（她）会安排你的任务的。#r#{SMRW_090206_01}"
x229010_g_ContinueInfo="干得不错"		--未完成任务的npc对话
x229010_g_MissionComplete="我交给你的事情已经做完了吗？"					--完成任务npc说话的话
x229010_g_MissionRound=17

x229010_g_DoubleExp = 48
x229010_g_AccomplishCircumstance = 1

--格式字符串中的索引, 表示从4开始,后多少位视SetMissionByIndex(...)的多少而定
x229010_g_StrForePart=4

x229010_g_StrList = {
						"玄澄#{_INFOAIM61,61,9,玄澄}",
						"塔林副本",
						"本相#{_INFOAIM35,86,13,本相}",
						"孟青青#{_INFOAIM96,73,15,孟青青}",
						"佛印#{_INFOAIM41,144,10,佛印}",
						"方腊#{_INFOAIM89,56,11,方腊}",
						"菊剑#{_INFOAIM99,45,17,菊剑}",
						"林灵素#{_INFOAIM58,73,12,林灵素}",
						"冯阿三#{_INFOAIM62,68,14,冯阿三}",
						"红玉#{_INFOAIM128,78,16,红玉}", 
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
						}
						
--MisDescEnd

--add by xindefeng
--x229010_GetStrIndexByStrValue(),x229010_GetStrValueByStrIndex()函数使用x229010_g_StrList来查找Index和NPC名字,而加上自动寻路信息后,无法找到正确Index,因此建立
--此表给x229010_GetStrIndexByStrValue(),x229010_GetStrValueByStrIndex()使用来找到正确Index和NPC名字
x229010_g_StrList2 = {
						"玄澄",
						"塔林副本",
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
						}
						
--/////////////////////////////////////////////////////////////////////////////////////////////////////
            
--子任务的类型代号定义
x229010_g_SubMissionTypeEnum = {XunWu=1, SongXin=2, DingDianYinDao=3, FuBenZhanDou=4, BuZhuo=5, ShouJi=6, KaiGuang=7, otherMenpaiFuben=8}

--副本列表
x229010_g_FuBen_List = {
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
	
--changed by xindefeng                								
function x229010_GetStrIndexByStrValue(stringV)
	for i, v in x229010_g_StrList2 do
		if v == stringV then
			return i-1
		end
	end
	local strText = format("必须将%s注册到StrList中", stringV)
	--PrintStr(strText)
	return 0;
end

--changed by xindefeng
--被x229000_IsFubenMission(),x229000_SetFubenMissionSucc()调用
function x229010_GetStrValueByStrIndex(sceneId, index)
	if index+1 >= 1 and index+1 <= getn(x229010_g_StrList2) then
		return x229010_g_StrList2[index+1]	
	end
	return ""
end

function x229010_AddOtherMenpaiFubenMission(sceneId, selfId, missionId, targetId)
	local index	= 1
	local a = {}
		
	for i, v in x229010_g_FuBen_List do
		if v.menpai ~= GetMenPai(sceneId, selfId) then
			a[index] = i
			index = index + 1
		end	
	end
	
	index = a[random(getn(a))]
	
	local menpaiName = x229010_g_FuBen_List[index].menpainame
	local npcName =  x229010_g_FuBen_List[index].NpcName
	local fubenName =  x229010_g_FuBen_List[index].FubenName
	local nSceneId = x229010_g_FuBen_List[index].scene
	local posx = x229010_g_FuBen_List[index].posx
	local posz = x229010_g_FuBen_List[index].posz
	
	--增加接收任务的必要判断
	CallScriptFunction( 500501, "CheckAccept_Necessary", sceneId, selfId)
	
	--加入任务到玩家列表
	local bAdd = AddMission( sceneId,selfId, missionId, x229010_g_ScriptId, 0, 0, 0 )
	if bAdd < 1 then
		return
	end	
	
	local nFormatIndex = GetMissionCacheData(sceneId, selfId, 0)
	local NpcNameIndex = x229010_GetStrIndexByStrValue(npcName)
	local MenpaiNameIndex = x229010_GetStrIndexByStrValue(menpaiName)
	
	--得到任务在20个任务中的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,missionId)
		
	SetMissionByIndex(sceneId, selfId, misIndex, 0, 0) --设置任务是否完成（未完成）
	SetMissionByIndex(sceneId, selfId, misIndex, 1, x229010_g_SubMissionTypeEnum.otherMenpaiFuben)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart, MenpaiNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart+1, MenpaiNameIndex)
	SetMissionByIndex(sceneId, selfId, misIndex, x229010_g_StrForePart+2, NpcNameIndex)
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：师门任务", MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, nSceneId, posx, posz, npcName)

	local strMissionTarget = format("不错... ... 你一直为本门的发扬光大在尽心尽力的做着工作，我再额外给你一个任务吧，%s刚给我飞鸽传书，说他们需要帮忙，你去找一下%s的%s，他会安排你的任务的。",
			menpaiName, menpaiName, npcName)
			
	BeginEvent(sceneId)
		AddText(sceneId, strMissionTarget)
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)	
	
	--得到环数
	local round = GetMissionData(sceneId,selfId,MD_SHIMEN_HUAN)

	round = round + 1

	if	round >= 21 then
		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, 1)
	else
		SetMissionData(sceneId, selfId, MD_SHIMEN_HUAN, round)
	end
	
end

--**********************************
--列举事件
--**********************************
function x229010_OnEnumerate( sceneId, selfId, targetId )
	return
end

--**********************************
--放弃
--**********************************
function x229010_OnAbandon( sceneId, selfId )
	local shimenMissionIdList = {1080, 1090, 1065, 1070, 1060, 1100, 1075, 1085, 1095}
	for i, v in shimenMissionIdList do
		if IsHaveMission(sceneId,selfId,v) > 0	 then
			--删除玩家任务列表中对应的任务
	  	DelMission( sceneId, selfId, v )
	  	SetMissionData(sceneId,selfId,MD_SHIMEN_HUAN,0)	--环数清0
 			--调用通用放弃接口
			------------------------------------------------------------------
		  CallScriptFunction( 500501, "Abandon_Necessary", sceneId, selfId )
			-------------------------------------------------------------------
			break
		end	
	end
end

