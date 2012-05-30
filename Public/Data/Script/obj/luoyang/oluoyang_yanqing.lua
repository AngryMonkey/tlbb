--洛阳NPC
--燕青
--普通

--脚本号
x000034_g_ScriptId = 000034

--所拥有的事件ID列表
x000034_g_eventList={250507, 808101, 808102, 808103, 808093}


x000034_g_DarkSkillName = { [40] = {name = "暗器投掷", id = 274, needmoney = 20000},
                            [70] = {name = "暗器打穴", id = 275, needmoney = 100000},
                            [90] = {name = "暗器护体", id = 276, needmoney = 500000},
                          }                
x000034_g_DarkSkillTips = { [40] = "#{FBSJ_090106_89}",
                            [70] = "#{FBSJ_090106_90}",
                            [90] = "#{FBSJ_090106_91}",
                          }  
x000034_g_DarkBreachPointNeedMoney = 
{
	[39] = 40000,
	[49] = 50000,
	[59] = 60000,
	[69] = 70000,
	[79] = 80000,
	[89] = 90000,
	[99] = 100000,
	[109] = 110000,
	[119] = 120000,
	[129] = 130000,
}  --突破瓶颈需要金钱


--**********************************
--事件列表
--**********************************
function x000034_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"#{FBYQ_090204_01}"..PlayerSex.."#{FBYQ_090204_02}")
		for i, eventId in x000034_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_05}",6,7)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_06}",6,8)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_01}",6,9)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_07}",6,10)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090311_01}",6,11)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_08}",6,31)
		AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_09}",11,28)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000034_OnDefaultEvent( sceneId, selfId,targetId )
	x000034_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000034_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000034_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	local NumText = GetNumText();
	if NumText == 6 then  --取消了
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	elseif NumText == 7 then  --突破暗器瓶颈
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_10}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_11}",6,12)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
			
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	elseif NumText == 8 then  --学习暗器手法
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_20}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_21}",6,14)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_22}",6,15)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_23}",6,16)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 9 then   --重洗暗器属性
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_31}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_32}",6,21)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_33}",6,22)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_34}",6,23)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_35}",6,24)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_36}",6,25)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 10 then  --重洗暗器技能
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 6 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 11 then  --重置暗器
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_84}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090311_03}",6,26)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090311_04}",6,27)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_081209_12}",8,13)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 12 then                   --我要突破当前瓶颈
		if (x000034_CheckDarkReachPoint(sceneId, selfId, targetId) == 1) then
			BeginEvent(sceneId)
				local nDarkLevel = GetDarkLevel(sceneId, selfId);
				local nNeedMoney = x000034_g_DarkBreachPointNeedMoney[nDarkLevel];
				if (nNeedMoney == nil or nNeedMoney <= 0) then
					nNeedMoney = 100000;         --以防万一，并没什么用
				end
				local strInfo = format("  突破瓶颈需要#{_EXCHG%d}。", nNeedMoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,20)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
		
	elseif NumText == 13 then
		x000034_OnDefaultEvent( sceneId, selfId,targetId )
	elseif NumText == 14 then
		
			BeginEvent(sceneId)
				local strInfo = format("  学习%s手法需要#{_EXCHG%d}。", x000034_g_DarkSkillName[40].name, x000034_g_DarkSkillName[40].needmoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,17)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 15 then
			BeginEvent(sceneId)
				local strInfo = format("  学习%s手法需要#{_EXCHG%d}。", x000034_g_DarkSkillName[70].name, x000034_g_DarkSkillName[70].needmoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,18)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 16 then
			BeginEvent(sceneId)
				local strInfo = format("  学习%s手法需要#{_EXCHG%d}。", x000034_g_DarkSkillName[90].name, x000034_g_DarkSkillName[90].needmoney);
				AddText(sceneId,strInfo)
				AddNumText(sceneId,x000034_g_ScriptId,"#{INTERFACE_XML_557}",6,19)
				AddNumText(sceneId,x000034_g_ScriptId,"#{Agreement_Info_No}",8,6)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 17 then
		if x000034_CheckStudyDarkSkills(sceneId, selfId, targetId, 40) == 1 then
			x000034_StudyDarkSkills(sceneId, selfId, targetId, 40);
		end
	elseif NumText == 18 then
		if x000034_CheckStudyDarkSkills(sceneId, selfId, targetId, 70) == 1 then
			x000034_StudyDarkSkills(sceneId, selfId, targetId, 70);
		end
	elseif NumText == 19 then
		if x000034_CheckStudyDarkSkills(sceneId, selfId, targetId, 90) == 1 then
			x000034_StudyDarkSkills(sceneId, selfId, targetId, 90);
		end
	elseif NumText == 20 then
		x000034_BreachDarkPoint(sceneId, selfId, targetId);
	elseif NumText == 21 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 1 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 22 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 2 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 23 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 3 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 24 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 4 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 25 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 5 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 26 then
	 	BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 7 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 27 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 8 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	elseif NumText == 28 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_081209_69}")
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090304_02}",11,29)
			AddNumText(sceneId,x000034_g_ScriptId,"#{FBSJ_090304_01}",11,30)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 29 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_03}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 30 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{FBSJ_090304_04}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 31 then
		BeginUICommand(sceneId)
		UICommand_AddInt( sceneId, 9 )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 800034)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000034_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000034_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			x000034_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000034_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000034_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000034_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000034_OnDie( sceneId, selfId, killerId )
end




--**********************************
--判断是否能够学习
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x000034_CheckStudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return 0;
	end
	
	--判断玩家等级是否够了
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x000034_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	return 1;
	
end

--**********************************
--玩家找NPC学习暗器使用技能
--nSkillIndex参数可能值为：40，70，90，分别学习对应级别的技能
--**********************************
function x000034_StudyDarkSkills( sceneId, selfId, targetId, nSkillIndex )
	
	if (nSkillIndex ~= 40 and nSkillIndex ~= 70 and nSkillIndex ~= 90) then
		return
	end
	
	--判断玩家等级是否够了
	local strNotice = "";
	local nLevel = GetLevel(sceneId, selfId);
	if ( nLevel < nSkillIndex) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_24}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_27}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_29}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断是否已经学会了对应技能
	if  (HaveSkill(sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].id) > 0 ) then
		if (nSkillIndex == 40) then
			strNotice = "#{FBSJ_081209_26}";
		elseif (nSkillIndex == 70) then
			strNotice = "#{FBSJ_081209_28}";
		elseif (nSkillIndex == 90) then
			strNotice = "#{FBSJ_081209_30}";
		end
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--判断玩家身上是否有足够的钱
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < x000034_g_DarkSkillName[nSkillIndex].needmoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return
	end
	
	--上面判断都通过，可以扣钱给技能了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].needmoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	AddSkill(  sceneId, selfId, x000034_g_DarkSkillName[nSkillIndex].id)
	x000034_ShowNotice(sceneId, selfId, targetId, x000034_g_DarkSkillTips[nSkillIndex]);
	x000034_NotifyTips( sceneId, selfId, x000034_g_DarkSkillTips[nSkillIndex] )
	
	x000034_StudySkillImpact(sceneId, selfId)
	DarkOperateResult(sceneId, selfId, 5, 1);    --让技能按钮闪烁
	
end


--**********************************
-- 屏幕中间信息提示
--**********************************
function x000034_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end


--**********************************
--玩家是否满足暗器瓶颈条件
--返回值：0或者1，1为满足，0
--**********************************
function x000034_CheckDarkReachPoint(sceneId, selfId, targetId)
		
		local strInfo = "";
		--判断玩家身上是否装备有暗器
		local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
		if ( bHaveDarkEquip ~= 1) then
			strInfo = "#{FBSJ_081209_13}";
			x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上暗器是否达到瓶颈
		local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
		if (bNeedNPC ~= 1) then
			strInfo = "#{FBSJ_081209_14}";
			x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家等级是否和暗器等级相等或者没有暗器等级高
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nCharLevel = GetLevel(sceneId, selfId);
		if (nDarkLevel >= nCharLevel) then
			strInfo = "#{FBSJ_081209_15}";
			x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
			return 0;
		end
		
		--判断玩家身上是否有足够的钱
		local nDarkLevel = GetDarkLevel(sceneId, selfId);
		local nNeedMoney = x000034_g_DarkBreachPointNeedMoney[nDarkLevel];
		if (nNeedMoney == nil or nNeedMoney <= 0) then
			nNeedMoney = 100000;         --以防万一，并没什么用
		end
		local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
		if (nHaveMoney < nNeedMoney) then    --10金
			strNotice = "#{FBSJ_081209_25}";
			x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
			return 0;
		end
				
		return 1;
end


function x000034_BreachDarkPoint(sceneId, selfId, targetId)

	local strInfo = "";
	--判断玩家身上是否装备有暗器
	local bHaveDarkEquip = HaveDarkEquiped(sceneId, selfId);
	if ( bHaveDarkEquip ~= 1) then
		strInfo = "#{FBSJ_081209_13}";
		x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家身上暗器是否达到瓶颈
	local bNeedNPC = IsDarkNeedLevelUpByNpcNow(sceneId, selfId);
	if (bNeedNPC ~= 1) then
		strInfo = "#{FBSJ_081209_14}";
		x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
	--判断玩家等级是否和暗器等级相等或者没有暗器等级高
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nCharLevel = GetLevel(sceneId, selfId);
	if (nDarkLevel >= nCharLevel) then
		strInfo = "#{FBSJ_081209_15}";
		x000034_ShowNotice(sceneId, selfId, targetId, strInfo);
		return 0;
	end
		
			--判断玩家身上是否有足够的钱
	local nDarkLevel = GetDarkLevel(sceneId, selfId);
	local nNeedMoney = x000034_g_DarkBreachPointNeedMoney[nDarkLevel];
	if (nNeedMoney == nil or nNeedMoney <= 0) then
		nNeedMoney = 100000;         --以防万一，并没什么用
	end
	local nHaveMoney = GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId);
	if (nHaveMoney < nNeedMoney) then    --10金
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--上面判断都通过，可以扣钱突破了
	local nRet, nRetJB = LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney);
	if (nRet == -1) then
		strNotice = "#{FBSJ_081209_25}";
		x000034_ShowNotice(sceneId, selfId, targetId, strNotice);
		return 0;
	end
	
	--突破瓶颈，让暗器升级
	local bDarkLevelup = DarkLevelUp(sceneId, selfId);
	if (bDarkLevelup == 1) then
		x000034_ShowNotice(sceneId, selfId, targetId, "#{FBSJ_081209_18}");
		--突破成功，记录统计日志
			local guid = LuaFnObjId2Guid(sceneId, selfId);
			local sLog = format("dark level now: %d", nDarkLevel + 1); 
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_ANQITUPO, guid, sLog);
	else
		x000034_ShowNotice(sceneId, selfId, targetId, "突破失败");
	end
	
	return
end

function x000034_ShowNotice( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x000034_StudySkillImpact(sceneId, playerId)
	--显示学习到新技能的特效 目前使用升级特效
	LuaFnSendSpecificImpactToUnit(sceneId, playerId, playerId, playerId, 32407, 0 )
end
