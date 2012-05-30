--结婚戒指升级
--Created by zchw
--洛阳 

--任务名
--MisDescBegin
--脚本号
x808010_g_ScriptId	= 808010
--接受任务NPC属性
x808010_g_Position_X=47.0185
x808010_g_Position_Z=62.9575
x808010_g_SceneID=0
x808010_g_AccomplishNPC_Name="月老"

--任务号
x808010_g_MissionId			= 1144

--任务目标npc
x808010_g_Name 					= "月老"
--任务归类
x808010_g_MissionKind			= 11
--任务等级
x808010_g_MissionLevel		= 10000
--是否是精英任务
x808010_g_IfMissionElite	= 0
--任务是否已经完成
x808010_g_IsMissionOkFail	= 0		--任务参数的第0位

--任务文本描述
x808010_g_MissionName			= "永恒钻戒"
--任务描述
x808010_g_MissionInfo			= ""
--任务目标
x808010_g_MissionTarget		= "%f"
--未完成任务的npc对话
x808010_g_ContinueInfo		= ""
--完成任务npc说的话
x808010_g_MissionComplete	= ""

x808010_g_StrForePart = 4

--用来保存字符串格式化的数据
x808010_g_FormatList = {"请夫妻两人组队前往%s，%s，%s，用月老给的葫芦收集一些仙灵之气回来。",}
								
x808010_g_StrList = {
	"无量山的白猿石阵#{_INFOAIM53,264,6,}",
	"剑阁的剑门叠翠#{_INFOAIM130,135,7,}",
	"敦煌的瀚海求佛#{_INFOAIM260,260,8,}",
	"镜湖的玉带临风#{_INFOAIM39,261,5,}",
	"太湖的舞榭歌台#{_INFOAIM160,252,4,}",
	"嵩山的江山多娇#{_INFOAIM275,85,3,}",
	"西湖的一望虎跑#{_INFOAIM170,235,30,}",
	"洱海的百舸争流#{_INFOAIM260,270,24,}",
	"雁南的枫桥夕照#{_INFOAIM150,250,18,}",
	"龙泉的飞流直下#{_INFOAIM270,280,31,}",
	"苍山的似水年华#{_INFOAIM258,73,25,}",
	"雁北的壁立千仞#{_INFOAIM283,179,19,}",
	"武夷的烟锁二乔#{_INFOAIM54,182,32,}",
	"石林的峰峦入聚#{_INFOAIM195,53,26,}",
	"草原的狼王石阵#{_INFOAIM143,254,20,}",
	"梅岭的梅岭佛光#{_INFOAIM284,82,33,}",
	"玉溪的青眉如豆#{_INFOAIM268,116,27,}",
	"辽西的敖包相会#{_INFOAIM277,117,21,}",
	"南海的天南一柱#{_INFOAIM61,225,34,}",
	"黄龙府的天池雪景#{_INFOAIM289,66,23,}",
}

x808010_g_MaxRound	= 3
--控制脚本
x808010_g_ControlScript		= 808010

--任务完成情况,内容动态刷新,分别占用任务参数的第1位
x808010_g_Custom	= { {id="已收集仙灵之气",num=3}}
--MisDescEnd

--给永恒钻戒扣钱
x808010_g_Price  	= 1000;
--萤火虫ID
x808010_g_FlashInsect_id = 30501104;
--月光葫芦ID
x808010_g_HuLu_id = 40004465;
--永恒钻戒等级ID对应表
x808010_g_Level2RingId =
{
	[1] = {Lvl = 30, RingId = 10422125},
	[2] = {Lvl = 50, RingId = 10422126},
	[3] = {Lvl = 70, RingId = 10422127},
	[4] = {Lvl = 90, RingId = 10422128},
	[5] = {Lvl = 100, RingId = 10422129},
	[6] = {Lvl = 105, RingId = 10422130},
	[7] = {Lvl = 110, RingId = 10422131},
	[8] = {Lvl = 115, RingId = 10422132},
	[9] = {Lvl = 120, RingId = 10422132}, -- add by zchw TT:41264
}
--永恒钻戒与祝福戒指ID表
x808010_g_RingId_Mapping =
{
	[1] = {10422125, 10422126, 10422127, 10422128, 10422129, 10422130, 10422131, 10422132}, 	--永恒钻戒
	[2] = {10422133, 10422134, 10422135, 10422136, 10422137, 10422138, 10422139, 10422140},		--祝福戒指	
}

--场景信息表
x808010_g_select_sceneId = 
{
	[1]=  {6, 	"无量山的白猿石阵", 	53,264, 612},
	[2]=  {7, 	"剑阁的剑门叠翠",   	130,135, 711},
	[3]=  {8, 	"敦煌的瀚海求佛",			260,260, 813},
	[4]=  {5, 	"镜湖的玉带临风",			39,261, 513},
	[5]=  {4, 	"太湖的舞榭歌台",			160,252, 411},
	[6]=  {3, 	"嵩山的江山多娇",			275,85, 311},
	[7]=  {30, 	"西湖的一望虎跑",     170,235, 3011},
	[8]=  {24, 	"洱海的百舸争流",     260,270, 2411},
	[9]=  {18, 	"雁南的枫桥夕照",     150,250, 1811},
	[10]= {31, 	"龙泉的飞流直下",     270,280, 3111},
	[11]= {25, 	"苍山的似水年华",     258,73, 2513},
	[12]= {19, 	"雁北的壁立千仞",     283,179, 1912},
	[13]= {32, 	"武夷的烟锁二乔",     54,182, 3211},
	[14]= {26, 	"石林的峰峦入聚",     195,53, 2614},
	[15]= {20, 	"草原的狼王石阵",     143,254, 2012},
	[16]= {33, 	"梅岭的梅岭佛光",     284,82, 3313},
	[17]= {27, 	"玉溪的青眉如豆",     268,116, 2713},
	[18]= {21, 	"辽西的敖包相会",     277,117, 2113},
	[19]= {34, 	"南海的天南一柱",     61,225, 3411},
	[20]= {23,	"黄龙府的天池雪景",   289,66, 2313},
}

--等级对应场景抽取源数目
x808010_g_level_num =
{
	{min = 30, max = 49, num = 10},
	{min = 50, max = 69, num = 15},
	{min = 70, max = 89, num = 18},
	{min = 90, max = 120, num = 20},
}

--真心石Id
x808010_g_TrueLoveStone_id = 30700204;

--**********************************
--任务入口函数
--**********************************
function x808010_OnDefaultEvent( sceneId, selfId, targetId )
	local numText = GetNumText();
	--永恒钻戒
	if numText == 1 then
		x808010_OnClickTrueLoveRing(sceneId, selfId, targetId);
	--永恒钻戒帮助
	elseif numText == 2 then
		x808010_ReturnDlg(sceneId, selfId, targetId, "#{YHJZ_081007_48}");
	--领取永恒钻戒
	elseif numText == 11 then
		x808010_GetTrueLoveRing(sceneId, selfId, targetId);
	--升级永恒钻戒
	elseif numText == 12 then
		x808010_UpgradeTrueLoveRing(sceneId, selfId, targetId);
	--祝福永恒钻戒
	elseif numText == 13 then
	 	BeginEvent(sceneId)
			AddText(sceneId, "#{YHJZ_081007_26}");
			AddNumText(sceneId, x808010_g_ScriptId, "接受", 6, 131);
			AddNumText(sceneId, x808010_g_ScriptId, "返回", 6, 132);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	--完成任务，选择"是的"
	elseif numText == 111 then
		x808010_ConfirmSubmitMission(sceneId, selfId, targetId);
	--确定 升级钻戒
	elseif numText == 333 then
		x808010_ConfirmUpgrade(sceneId, selfId, targetId);
	--nothing
	elseif numText == 14 or numText == 444 or numText == 222 then
	 	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )	
	--接受 祝福钻戒
	elseif numText == 131 then
		x808010_BlessRing(sceneId, selfId, targetId);		
	--返回 祝福钻戒
	elseif numText == 132 then
		x808010_ListOption(sceneId, selfId, targetId);
	end
end

--**********************************
--夫妻组队判断
--**********************************
function x808010_IsCoupleMakeTeam(sceneId,selfId,type)
	--1.是否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		if type == 1 then
			return 0, "#{YHJZ_081007_9}";
		elseif type == 2 then
			return 0, "#{YHJZ_081007_14}";
		else
			return 0, "#{YHJZ_081007_27}";
		end
	end	
	--2.是否俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		if type == 1 then
			return 0, "#{YHJZ_081007_9}";
		elseif type == 2 then
			return 0, "#{YHJZ_081007_14}";
		else
			return 0, "#{YHJZ_081007_9}";
		end
	end	
	--3.是否在附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		if type == 1 then
			return 0, "#{YHJZ_081007_9}";
		elseif type == 2 then
			return 0, "#{YHJZ_081007_15}";
		else
			return 0, "#{YHJZ_081007_28}";
		end
	end	
	--4.是否是夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,selfId)<=0 then
		if type == 1 then
			return 0, "#{YHJZ_081007_8}";
		elseif type == 2 then
			return 0, "#{YHJZ_081007_14}"
		else
			return 0, "#{YHJZ_081007_27}";
		end
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
			if type == 1 then
				return 0, "#{YHJZ_081007_9}";
			elseif type == 2 then
				return 0, "#{YHJZ_081007_14}";
			else
				return 0, "#{YHJZ_081007_27}";
			end
		end
	end	
	--ok
	return 1, "ok";
end

--**********************************
--列举选项
--**********************************
function x808010_ListOption(sceneId, selfId, targetId)
	BeginEvent(sceneId)
		AddText(sceneId, "#{YHJZ_081007_3}")
		AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_4}", 1, 11); 			--我要领取永恒钻戒
		AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_5}", 1, 12); 			--我想升级永恒钻戒
		AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_6}", 1, 13); 			--我想祝福永恒钻戒
		AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_7}", 9, 14);	  		--我没什么事...
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--列举事件
--**********************************
function x808010_OnEnumerate( sceneId, selfId, targetId )
	AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_1}", 6, 1);				--永恒钻戒
	AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_2}", 11, 2);				--关于永恒钻戒
end

--**********************************
--检测接受条件
--**********************************
function x808010_CheckAccept( sceneId, selfId, type )
  if type == 1 then 		--领取
  	--等级达到30？
  	if GetLevel(sceneId, selfId) < 30 then
  		return 0, "#{YHJZ_081007_47}";
  	end
		--夫妻2人组队？
		local ret, msg = x808010_IsCoupleMakeTeam(sceneId, selfId, 1);
		if ret == 0 then
			return 0, msg;
		end
	 	--有永恒钻戒 or 祝福钻戒？
	 	for i=1, 2 do
	 		for j, subTab in x808010_g_RingId_Mapping[i] do
		 		if LuaFnGetItemCount(sceneId, selfId, subTab) >= 1 then
		 			return 0, "#{YHJZ_081007_10}";
		 		end
	 		end
	 	end
	 	--有10银？
	 	if GetMoney(sceneId, selfId) < x808010_g_Price then
	 		return 0, "#{YHJZ_081007_11}";
	 	end
	 	--背包道具栏满？
	 	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
	 		return 0, "#{YHJZ_081007_12}"
	 	end
	 	--检测通过
	 	return 1, "ok";
	elseif type == 2 then  --升级
		--夫妻2人组队？
		local ret, msg = x808010_IsCoupleMakeTeam(sceneId, selfId, 2);
		if ret == 0 then
			return 0, msg;
		end	
	 	--有40只萤火虫
	 	if LuaFnGetAvailableItemCount(sceneId, selfId, x808010_g_FlashInsect_id) < 40 then
	 		return 0, "#{YHJZ_081007_16}";
	 	end
	 	--达到30级？
	 	if GetLevel(sceneId, selfId) < 30 then
	 		return 0, "#{YHJZ_081007_17}";
	 	end
	 	--装备了永恒钻戒？
	 	local ringCount = 0;
	 	local ringAvailCount = 0;
	 	local tempRingId = 0;
	 	local tempIndex = 0;
	 	
	 	for i=1, 2 do
	 		for j, Ring_Id in x808010_g_RingId_Mapping[i] do
		 		ringCount = ringCount + LuaFnGetItemCount(sceneId, selfId, Ring_Id);
		 		local num = LuaFnGetAvailableItemCount(sceneId, selfId, Ring_Id);
		 		if num > 0 then
		 			ringAvailCount = ringAvailCount + num;
		 			tempRingId = Ring_Id;
		 			tempIndex = j;
		 		end	 			
	 		end
	 	end

	 	if ringCount < 1 then 							--无戒指
	 		return 0, "#{YHJZ_081007_19}";
	 	end
		if ringAvailCount < ringCount then	--装备上 or 锁定了
			return 0, "#{YHJZ_081007_18}";
		end		
	 	--钻戒唯一？
		if ringAvailCount > 1 then
			return 0, "#{YHJZ_081007_20}";
		end
	 	--换人了？
	 	local bagPos = GetBagPosByItemSn(sceneId, selfId, tempRingId);
	 	local _, name = LuaFnGetItemCreator(sceneId, selfId, bagPos);
	 	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
	 	local spouseObjid = LuaFnGuid2ObjId(sceneId, spouseGuid);
	 	local spouseName = GetName(sceneId, spouseObjid);
	 	if name ~= spouseName then
	 		return 0, "#{YHJZ_081007_21}";
	 	end
	 	--已有该等级戒指？
	 	local myLvl = GetLevel(sceneId, selfId);
	 	local index = x808010_GetTblIdx(myLvl);
	 	if tempIndex == index then
	 		local msg = format("#{YHJZ_081007_22}%d#{YHJZ_081007_23}", x808010_g_Level2RingId[index+1].Lvl);
	 		return 0, msg;
	 	end
	 	--背包道具栏满？
	 	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
	 		return 0, "#{YHJZ_081007_24}";
	 	end
	 	--检测通过
	 	return 1, "OK";
	elseif type == 3 then		--祝福
		--夫妻组队？
		local ret, msg = x808010_IsCoupleMakeTeam(sceneId, selfId, 3);
		if ret == 0 then
			return 0, msg;
		end
		--玩家是否有永恒戒指？
		local ret_Ring_id = 0;
		local sum = 0;
		local sumAvail = 0;
		for i=1, 2 do
			for j, Ring_Id in x808010_g_RingId_Mapping[i] do
				sum = sum + GetItemCount(sceneId, selfId, Ring_Id);
				local count = LuaFnGetAvailableItemCount(sceneId, selfId, Ring_Id);
				if count > 0 then
					ret_Ring_id = Ring_Id;
					sumAvail = sumAvail + count;
				end
			end				
		end
		if sum == 0 then
			return 0, "#{YHJZ_081007_29}"
		end
		--佩戴 上锁？
		if sum > sumAvail then
			return 0, "#{YHJZ_081007_18}";
		end
		--唯一？
		if sumAvail > 1 then
			return 0, "#{YHJZ_081007_20}";
		end
		--是否祝福过？
		for i, Ring_Id in x808010_g_RingId_Mapping[2] do
			if ret_Ring_id == Ring_Id then
				return 0, "#{YHJZ_081103_1}";
			end
		end
		--玩家有真心石？
		if LuaFnGetAvailableItemCount(sceneId, selfId, x808010_g_TrueLoveStone_id) < 1 then
			return 0, "#{YHJZ_081007_30}";
		end
		--ok
		return 1, ret_Ring_id;
	end
end

--**********************************
--取得玩家等级对应到x808010_g_Level2RingId的索引
--**********************************
function x808010_GetTblIdx( level )
	for i, record in x808010_g_Level2RingId do
		if level >= record["Lvl"] and level < x808010_g_Level2RingId[i+1]["Lvl"] then
			return i;
		end
	end
	return 0;
end

--**********************************
--检测是否可以提交
--**********************************
function x808010_CheckSubmit( sceneId, selfId )
	--夫妻组队 在附近 
	
	--1.是否组队
	local teamId = GetTeamId(sceneId,selfId)
	if teamId<0 then
		return 0, "#{YHJZ_081007_27}";
	end	
	--2.是否俩人
	if GetTeamSize(sceneId,selfId)~=2 then
		return 0, "#{YHJZ_081007_27}";
	end	
	--3.是否在附近
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		return 0, "#{YHJZ_081007_28}";
	end	
	--4.是否是夫妻
	local tid1 = GetNearTeamMember(sceneId,selfId,0)
	local tid2 = GetNearTeamMember(sceneId,selfId,1)
	if LuaFnIsMarried(sceneId,selfId)<=0 then
			return 0, "#{YHJZ_081007_27}";
	else
		if LuaFnGetSpouseGUID(sceneId,tid1) ~= LuaFnGetGUID(sceneId,tid2) or LuaFnGetSpouseGUID(sceneId,tid2) ~= LuaFnGetGUID(sceneId,tid1) then
				return 0, "#{YHJZ_081007_27}";
		end
	end	
		
 	local ringCount = 0;
 	local ringAvailCount = 0;
 	local tempRingId = 0;
	
	for i=1, 2 do
	 	for j, Ring_id in x808010_g_RingId_Mapping[i] do
	 		local count = LuaFnGetItemCount(sceneId, selfId, Ring_id);
	 		if count > 0 then
	 			ringCount = ringCount + count;
	 		end
	 		local num = LuaFnGetAvailableItemCount(sceneId, selfId, Ring_id);
	 		if num > 0 then
	 			ringAvailCount = ringAvailCount + num;
	 			tempRingId = Ring_id;
	 		end
	 	end
	end

 	if ringCount < 1 then 							--无永恒钻戒
 		return 0, "#{YHJZ_081007_40}";
 	end
 	if ringCount ~= 1 then 							--钻戒唯一
 		return 0, "#{YHJZ_081007_20}";
 	end
	if ringAvailCount < ringCount then	--装备 or 锁定
		return 0, "#{YHJZ_081007_18}";
	end		
 	--换人了？
 	local bagPos = GetBagPosByItemSn(sceneId, selfId, tempRingId);
 	local _, name = LuaFnGetItemCreator(sceneId, selfId, bagPos);
 	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
 	local spouseObjid = LuaFnGuid2ObjId(sceneId, spouseGuid);
 	local spouseName = GetName(sceneId, spouseObjid);
 	if name ~= spouseName then
 		return 0, "#{YHJZ_081007_21}";
 	end
 	return 1, tempRingId;
end

--**********************************
--提交
--**********************************
function x808010_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--确定完成任务
--**********************************
function x808010_ConfirmSubmitMission(sceneId, selfId, targetId)
	local ret, msg = x808010_CheckSubmit(sceneId, selfId);
	if ret == 0 then
		x808010_ReturnDlg(sceneId, selfId, targetId, msg);
		return 		
	end
	local bFlag = 0;
	--祝福 提示
	for i, RingId in x808010_g_RingId_Mapping[2] do
		if msg == RingId then
			bFlag = 1;
		end
	end
	--打孔 刻铭 强化 提示
	local bagPos = GetBagPosByItemSn(sceneId, selfId, msg);
	if bagPos >= 0 then
		if GetGemEmbededCount(sceneId, selfId, bagPos) > 0 or
				LuaFnIsMarkOrEnhance(sceneId, selfId, bagPos, 1) > 0 or
				LuaFnIsMarkOrEnhance(sceneId, selfId, bagPos, 2) > 0 then
			bFlag = 1;
		end
	end
	
	if bFlag == 1 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{YHJZ_081007_41}");
			AddNumText(sceneId, x808010_g_ScriptId, "#{INTERFACE_XML_557}", 6, 333);
			AddNumText(sceneId, x808010_g_ScriptId, "#{INTERFACE_XML_542}", 6, 444);
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)	
		return
	end	
	x808010_ConfirmUpgrade(sceneId, selfId, targetId);
end

--**********************************
--返回对话
--**********************************
function x808010_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x808010_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--领取永恒钻戒
--**********************************
function x808010_GetTrueLoveRing(sceneId, selfId, targetId)
	local ret, msg = x808010_CheckAccept(sceneId, selfId, 1) ;
	--检测失败
	if ret == 0 then
		x808010_ReturnDlg(sceneId, selfId, targetId, msg);
		return 		
	end
	--通过		
	if CostMoney(sceneId, selfId, x808010_g_Price) == -1 then
		return
	end
	--给予初级永恒戒指
	local bagPos = TryRecieveItem( sceneId, selfId, x808010_g_Level2RingId[1].RingId, QUALITY_MUST_BE_CHANGE);
	if bagPos == -1 then
		return
	end
	--刻名字
	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
	local spouseObjId = LuaFnGuid2ObjId(sceneId, spouseGuid);
	local spouseName = GetName(sceneId, spouseObjId);
	LuaFnSetItemCreator(sceneId, selfId, bagPos, spouseName);
	--统计
	AuditUpgradeRing(sceneId, selfId, x808010_g_Level2RingId[1].RingId, 1);
 	--提示信息
 	x808010_ReturnDlg(sceneId, selfId, targetId, "#{YHJZ_081007_13}"); 	
 	
end

--**********************************
--确定升级永恒钻戒
--**********************************
function x808010_ConfirmUpgrade(sceneId, selfId, targetId)
	--再次判断
	local ret, msg = x808010_CheckSubmit(sceneId, selfId); --成功返回1， 戒指id； 失败返回0， 消息
	if ret == 0 then
		x808010_ReturnDlg(sceneId, selfId, targetId, msg);
		return 		
	end	
	--扣除葫芦
	if LuaFnDelAvailableItem(sceneId, selfId, x808010_g_HuLu_id, 1) == 0 then
		return
	end
	--扣除旧戒指
	LuaFnDelAvailableItem(sceneId, selfId, msg, 1);
	--根据玩家等级计算戒指id	
	local index = x808010_GetTblIdx( GetLevel(sceneId, selfId) )
	if index == 0 then 
		return
	end
	--得新戒指
	local bagPos = TryRecieveItem( sceneId, selfId, x808010_g_Level2RingId[index]["RingId"], QUALITY_MUST_BE_CHANGE);
	--铭刻名字
	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
	local spouseObjId = LuaFnGuid2ObjId(sceneId, spouseGuid);
	local spouseName = GetName(sceneId, spouseObjId);
	LuaFnSetItemCreator(sceneId, selfId, bagPos, spouseName);	
	--删除任务
  if IsHaveMission(sceneId, selfId, x808010_g_MissionId) == 1 then  	
  	DelMission( sceneId, selfId, x808010_g_MissionId );
  end	
  --统计
  AuditUpgradeRing(sceneId, selfId, x808010_g_Level2RingId[index]["RingId"], 2);
	--返回信息
	x808010_ReturnDlg(sceneId, selfId, targetId, "#{YHJZ_081007_42}");
	--tips
	x808010_Tips(sceneId, selfId, "#{YHJZ_081007_43}");
	--播放公告
	local myName = GetName(sceneId, selfId);
	local sTran	= GetBagItemTransfer( sceneId, selfId, bagPos );
	local str = format("#{_INFOUSR%s}#{YHJZ_081007_44}#{_INFOUSR%s}#{YHJZ_081007_45}#{_INFOMSG%s}#{YHJZ_081007_46}", myName, spouseName, sTran);
	AddGlobalCountNews(sceneId, str);
end

--**********************************
--祝福钻戒
--**********************************
function x808010_BlessRing(sceneId, selfId, targetId)
	local ret, msg = x808010_CheckAccept(sceneId, selfId, 3);
	if ret == 0 then
		x808010_ReturnDlg(sceneId, selfId, targetId, msg);
		return
	end 
	--通过检测，扣物品
	if LuaFnDelAvailableItem(sceneId, selfId, msg, 1) == 0 then			--检查成功msg返回戒指Id
		x808010_Tips(sceneId, selfId, "扣除永恒钻戒失败！");
	  return
	end	
	local stone_pos = GetBagPosByItemSn(sceneId, selfId, x808010_g_TrueLoveStone_id);
	local stone_sTran	= GetBagItemTransfer( sceneId, selfId, stone_pos );
	if LuaFnDelAvailableItem(sceneId, selfId, x808010_g_TrueLoveStone_id, 1) == 0 then
		x808010_Tips(sceneId, selfId, "扣除真心石失败！");
	  return
	end	
	--给祝福戒指
	local index = 0;
	for i, subTab in x808010_g_RingId_Mapping[1] do
		if subTab == msg then
			index = i;
			break;
		end
	end
	if index == 0 then
		return
	end
	local bagPos = TryRecieveItem( sceneId, selfId, x808010_g_RingId_Mapping[2][index], QUALITY_MUST_BE_CHANGE);
	if bagPos == -1 then
		x808010_Tips(sceneId, selfId, "给祝福戒指失败！");		
		return
	end
	--刻名字
	local spouseGuid = LuaFnGetSpouseGUID(sceneId, selfId);
	local spouseObjId = LuaFnGuid2ObjId(sceneId, spouseGuid);
	local spouseName = GetName(sceneId, spouseObjId);
	LuaFnSetItemCreator(sceneId, selfId, bagPos, spouseName);	
	--统计
	AuditUpgradeRing(sceneId, selfId, x808010_g_RingId_Mapping[2][index], 3);	
	x808010_Tips(sceneId, selfId, "祝福成功！");

	local blessRing_sTran	= GetBagItemTransfer( sceneId, selfId, bagPos );
	local myName = GetName(sceneId, selfId);
	local msg = format("#{_INFOUSR%s}#{JZSJ_1}#{_INFOMSG%s}#{JZSJ_2}#{_INFOMSG%s}#{JZSJ_3}", myName, stone_sTran, blessRing_sTran);
	AddGlobalCountNews(sceneId, msg);
	--关闭对话框	
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )	
end

--**********************************
--升级永恒钻戒
--**********************************
function x808010_UpgradeTrueLoveRing(sceneId, selfId, targetId)
 	local ret, msg = x808010_CheckAccept(sceneId, selfId, 2) ;
	--检测失败
	if ret == 0 then
		x808010_ReturnDlg(sceneId, selfId, targetId, msg);
		return 		
	end	 
	--场景选择
	local i, j, k = x808010_SelectScene( GetLevel(sceneId, selfId) );
	if i == -1 then
		x808010_ReturnDlg(sceneId, selfId, targetId, "出错啦！");
		return 		
	end		
	if IsMissionFull(sceneId, selfId) == 1 then
		x808010_ReturnDlg(sceneId, selfId, targetId, "任务已满！");
		return
	end
	--添加任务
	AddMission( sceneId,selfId, x808010_g_MissionId, x808010_g_ScriptId, 0, 1, 0 );
	--记录场景
	local misIndex = GetMissionIndexByID(sceneId, selfId, x808010_g_MissionId);
	
	SetMissionByIndex(sceneId, selfId, misIndex, 4, 0);  --读x808010_g_FormatList第一行
	
	SetMissionByIndex(sceneId, selfId, misIndex, 5, i-1);
	SetMissionByIndex(sceneId, selfId, misIndex, 6, j-1);
	SetMissionByIndex(sceneId, selfId, misIndex, 7, k-1);
	
	--扣萤火虫
	LuaFnDelAvailableItem(sceneId, selfId, x808010_g_FlashInsect_id, 40);
	--给葫芦
	TryRecieveItem( sceneId, selfId, x808010_g_HuLu_id, QUALITY_MUST_BE_CHANGE);
	--返回对话
	local text = format("#{YHJZ_081007_25}%s，%s，%s", x808010_g_StrList[i], x808010_g_StrList[j], x808010_g_StrList[k]);
	x808010_ReturnDlg(sceneId, selfId, targetId, text);
end

--**********************************
--场景抽取
--**********************************
function x808010_SelectScene(level)
	local num = 0;
	for i, subTab in x808010_g_level_num do
		if level >= subTab.min and level <= subTab.max then
			num = subTab.num;
			break;
		end
	end
	local i = 0; 
	local j = 0; 
	local k = 0;
	--没找到等级对应的场景源数目
	if num == 0 then
		return -1, -1, -1;
	end
	--得到第一个场景
	local temp = mod( floor(random(100000)), num )+1;
	i = temp;
	--得到第二个场景
	while 1 do
		temp =  mod( floor(random(100000)), num )+1;
		if temp ~= i then
			j = temp;
			break;
		end
	end
	--得到第三个场景
	while 1 do
		temp =  mod( floor(random(100000)), num )+1;
		if temp ~= i and temp ~= j then
			k = temp;
			break;
		end
	end	
	return i, j, k;
end

--**********************************
--点击永恒钻戒
--**********************************
function x808010_OnClickTrueLoveRing(sceneId, selfId, targetId)
	if IsHaveMission(sceneId, selfId, x808010_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x808010_g_MissionId);
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 0 then
			x808010_ReturnDlg(sceneId, selfId, targetId, "#{YHJZ_081007_36}");
			return 
		else
			BeginEvent(sceneId)
				AddText(sceneId, "#{YHJZ_081007_37}")
				AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_38}", 6, 111);	--是的
				AddNumText(sceneId, x808010_g_ScriptId, "#{YHJZ_081007_39}", 6, 222); --还没准备好。。。
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId);
			return
		end
	else
		x808010_ListOption(sceneId, selfId, targetId);
	end
end

--**********************************
--放弃
--**********************************
function x808010_OnAbandon( sceneId, selfId )
  if IsHaveMission(sceneId, selfId, x808010_g_MissionId) == 1 then  	
  	--扣除月老葫芦
  	local num = LuaFnGetItemCount(sceneId, selfId, x808010_g_HuLu_id);
  	local availNum = LuaFnGetAvailableItemCount(sceneId, selfId, x808010_g_HuLu_id)
  	if availNum < num then
  		x808010_Tips(sceneId, selfId, "请对月老葫芦解锁！")
  		return
  	end
  	if availNum > 0 then
  		LuaFnDelAvailableItem(sceneId, selfId, x808010_g_HuLu_id, availNum);
  	end
  	--删除任务
  	DelMission( sceneId, selfId, x808010_g_MissionId );
  end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x808010_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x808010_OnEnterArea( sceneId, selfId, zoneId )
	
	if IsHaveMission( sceneId, selfId, x808010_g_MissionId ) <= 0 then
		return 0;
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x808010_g_MissionId)	
	local order = {};
	order[1] = GetMissionParam(sceneId, selfId, misIndex, 5)+1;
	order[2] = GetMissionParam(sceneId, selfId, misIndex, 6)+1;
	order[3] = GetMissionParam(sceneId, selfId, misIndex, 7)+1;
	local bCompleted = GetMissionParam(sceneId, selfId, misIndex, 0);
	local place1 = GetMissionParam(sceneId, selfId, misIndex, 2); --2,3参数用于记录收集过仙气的场景号
	local place2 = GetMissionParam(sceneId, selfId, misIndex, 3);
	local bFlag = 0;	
	for i=1, 3 do
		if sceneId == x808010_g_select_sceneId[order[i]][1] and zoneId == x808010_g_select_sceneId[order[i]][5] 
			 and place1 ~= sceneId and place2 ~= sceneId and bCompleted ~= 1 then
			bFlag = order[i];
		end		
	end	
	if bFlag == 0 then	
		return 0;
	end	
	local nposX = random(3)
	local nposY = random(3)
	CreateSpecialObjByDataIndex(sceneId, selfId, 67, x808010_g_select_sceneId[bFlag][3]+nposX, x808010_g_select_sceneId[bFlag][4]+nposY, 0)
end

--**********************************
--道具改变
--**********************************
function x808010_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接受
--**********************************
function x808010_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x808010_g_MissionId, x808010_g_ScriptId, 0, 0, 0 )
end

--**********************************
--继续
--**********************************
function x808010_OnContinue( sceneId, selfId, targetId )

end

