--花车巡游任务
--MisDescBegin
--脚本号
x250036_g_ScriptId = 250036

--任务号
x250036_g_MissionId = 1020

--任务目标npc
x250036_g_TargetNpcName	="喜来乐"

--任务归类
x250036_g_MissionKind = 3

--任务等级
x250036_g_MissionLevel = 1

--是否是精英任务
x250036_g_IfMissionElite = 0

--任务限时
x250036_g_MissionLimitTime = 60 * 60 * 1000; --毫秒

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--以上是动态**************************************************************

--任务文本描述
x250036_g_MissionName="花车巡游";
x250036_g_MissionInfo="请找洛阳[177,94]的喜来乐安排花车巡游。";
x250036_g_MissionTarget="请找洛阳的喜来乐#{_INFOAIM177,94,0,喜来乐}安排花车巡游。";		--任务目标
x250036_g_ContinueInfo1="很抱歉，你预定的时间已经过去了，你只能放弃了……";
x250036_g_ContinueInfo2="这里要策划来说，谢谢。";
x250036_g_MissionComplete="那让我们开始吧。";

--任务奖励
x250036_g_MoneyBonus = 0

--MisDescEnd

x250036_g_eventId_begin = 0;	--点击花车巡游任务的事件
x250036_g_eventId_start = 1;	--点击开始巡游的事件
x250036_g_eventId_close = 2;	--点击等会再开始的事件

x250036_g_busDataIds = {3, 4, 5};	--花车的DataID
x250036_g_busPatrolPathId = 3;		--花车路径ID


--**********************************
--任务入口函数
--**********************************
function x250036_OnDefaultEvent(sceneId, selfId, targetId)	--点击该任务后执行此脚本
	local selectEventId	= GetNumText();
	
	--点击花车巡游任务的事件
	if x250036_g_eventId_begin == selectEventId then
		x250036_OnBegin(sceneId, selfId, targetId);
	--点击开始巡游的事件
	elseif x250036_g_eventId_start == selectEventId then
		x250036_OnStart(sceneId, selfId, targetId);
	--点击等会再开始的事件
	elseif x250036_g_eventId_close == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end

end

--**********************************
--列举事件
--**********************************
function x250036_OnEnumerate(sceneId, selfId, targetId)
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x250036_g_MissionId) > 0 then
		AddNumText(sceneId, x250036_g_ScriptId, x250036_g_MissionName, 6, x250036_g_eventId_begin);
    end
end

--**********************************
--检测接受条件
--**********************************
function x250036_CheckAccept(sceneId, selfId)
	return 1;
end

--**********************************
--接受
--**********************************
function x250036_OnAccept(sceneId, selfId, marryLevel)

	--加入任务到玩家列表
	AddMission(sceneId, selfId, x250036_g_MissionId, x250036_g_ScriptId, 0, 0, 0);
	misIndex = GetMissionIndexByID(sceneId, selfId, x250036_g_MissionId);			--得到任务的序列号
	if misIndex and misIndex >= 0 then
		StartMissionTimer(sceneId,selfId, x250036_g_MissionId);
		SetMissionByIndex(sceneId,selfId,misIndex, 0, 1);						--根据序列号把任务变量的第0位置0 (任务完成情况)
		SetMissionByIndex(sceneId,selfId,misIndex, 7, x250036_g_MissionLimitTime);
		SetMissionByIndex(sceneId,selfId,misIndex, 2, marryLevel);
		
		Msg2Player(sceneId, selfId,"#Y接受任务："..x250036_g_MissionName.."",MSG2PLAYER_PARA);	--聊天窗口提示
	end
end

--**********************************
--放弃
--**********************************
function x250036_OnAbandon(sceneId, selfId)
	--删除玩家任务列表中对应的任务
 	local checkMission = IsHaveMission(sceneId, selfId, x250036_g_MissionId);
	if checkMission and checkMission == 1 then
	  DelMission(sceneId, selfId, x250036_g_MissionId);
	 end
end

--**********************************
--继续
--**********************************
function x250036_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--检测是否可以提交
--**********************************
function x250036_CheckSubmit(sceneId, selfId)
	return 0;
end

--**********************************
--提交
--**********************************
function x250036_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x250036_OnKillObject(sceneId, selfId, objdataId ,objId)
end

--**********************************
--进入区域事件
--**********************************
function x250036_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--道具改变
--**********************************
function x250036_OnItemChanged(sceneId, selfId, itemdataId)
end

--**********************************
--定时事件
--**********************************
function x250036_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local saveTime = GetMissionParam(sceneId, selfId, misIndex, 7);
		if saveTime and saveTime > 0 then
			saveTime = saveTime - 1000;
			if saveTime <= 0 then
				StopMissionTimer(sceneId, selfId, x250036_g_MissionId);
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 2);
				saveTime = 0;
			end
			SetMissionByIndex(sceneId, selfId, misIndex, 7, saveTime);
		end
	end
end

--**********************************
--点击花车巡游任务的事件
--**********************************
function x250036_OnBegin(sceneId, selfId, targetId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250036_MessageBox(sceneId, selfId, targetId, "你们来的太迟，我安排好的轿夫都走光了，无法置办花车巡游了。");
			DelMission(sceneId, selfId, x250036_g_MissionId);
		else
			BeginEvent(sceneId);
				AddText(sceneId, "恭喜你们，轿夫都已经准备好了，请你们立即开始巡游吧。");
				AddNumText(sceneId, x250036_g_ScriptId, "现在就开始巡游", 8, x250036_g_eventId_start);
				AddNumText(sceneId, x250036_g_ScriptId, "等会再开始……", 8, x250036_g_eventId_close);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end
	end
end

--**********************************
--点击开始巡游的事件
--**********************************
function x250036_OnStart(sceneId, selfId, targetId)
	local marryLevel = 0;
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250036_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250036_MessageBox(sceneId, selfId, targetId, "你们来的太迟，我安排好的轿夫都走光了，无法置办花车巡游了。");
			DelMission(sceneId, selfId, x250036_g_MissionId);
			return 0;
		else
			marryLevel = GetMissionParam(sceneId, selfId, misIndex, 2);
		end
	else
		x250036_MessageBox(sceneId, selfId, targetId, "未找到花车巡游的任务。");
		return 0;
	end
		
	local szMsg = "如果想花车巡游，请男女双方2人组成一队再来找我。"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "队伍必须只能由夫妻双方组成，队伍中不能有其他人员。"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "只有2人都走到我身边才可以开始花车巡游。"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "不是夫妻不能开始花车巡游。"
	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses > 0 then
	else
		x250036_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	--zchw
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		if LuaFnIsStalling(sceneId, memId) == 1 then
			x250036_MessageBox(sceneId, selfId, targetId, "#{CWHL_081208_1}")
			return 0;
		end
	end
	
	local busIndex = 1;
	if marryLevel and marryLevel > -1 and marryLevel < 3 then
		busIndex = marryLevel + 1;
	else
		busIndex = 1;
	end
	
	local busObjID = LuaFnCreateBusByPatrolPathId(sceneId, x250036_g_busDataIds[busIndex], x250036_g_busPatrolPathId, 0);
	if busObjID and busObjID ~= -1 then
		local succeeded, strText;
		succeeded = 0;
		local addPassergerRet = LuaFnBusAddPassengerList(sceneId, busObjID, targetId, 1, 2, maleId, femaleId);
		if addPassergerRet and addPassergerRet == OR_OK then
			local busStartRet = LuaFnBusStart(sceneId, busObjID);
			if busStartRet and busStartRet == 1 then
				BeginUICommand(sceneId);
				EndUICommand(sceneId);
				DispatchUICommand(sceneId, selfId, 1000);
				DelMission(sceneId, selfId, x250036_g_MissionId);
				CallScriptFunction(250037, "OnAccept", sceneId, selfId, marryLevel);
				succeeded = 1;
			else
				strText = "内部错误(start failed)，花车巡游启动失败，请与GM联系。"
			end
		end
		
		if succeeded and succeeded == 1 then
		else
			LuaFnBusRemoveAllPassenger(sceneId, busObjID);
			LuaFnDeleteBus(sceneId, busObjID);
			if strText then
				x250036_MessageBox(sceneId, selfId, targetId, strText);
			end
		end
	end

end

--**********************************
--对话窗口信息提示
--**********************************
function x250036_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

