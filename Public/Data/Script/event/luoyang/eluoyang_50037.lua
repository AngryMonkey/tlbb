--拜天地任务
--MisDescBegin
--脚本号
x250037_g_ScriptId = 250037

--任务号
x250037_g_MissionId = 1021

--任务目标npc
x250037_g_TargetNpcName	="喜来乐"

--任务归类
x250037_g_MissionKind = 3

--任务等级
x250037_g_MissionLevel = 1

--是否是精英任务
x250037_g_IfMissionElite = 0

--任务限时
x250037_g_MissionLimitTime = 60 * 60 * 1000; --毫秒

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************

--以上是动态**************************************************************

--任务文本描述
x250037_g_MissionName="拜天地";
x250037_g_MissionInfo="请找洛阳[177,94]的喜来乐安排拜天地。";
x250037_g_MissionTarget="    找洛阳喜来乐#{_INFOAIM177,94,0,喜来乐}安排拜天地。";		--任务目标
x250037_g_ContinueInfo1="你们来的实在太晚了，吉时已过，我也没办法了。";
x250037_g_ContinueInfo2="这里要策划来说，谢谢。";
x250037_g_MissionComplete="那让我们开始吧。";

--任务奖励
x250037_g_MoneyBonus = 0

--MisDescEnd

x250037_g_eventId_begin = 0;	--点击拜天地任务的事件
x250037_g_eventId_start = 1;	--点击开始拜天地的事件
x250037_g_eventId_close = 2;	--点击等会再开始的事件


--**********************************
--任务入口函数
--**********************************
function x250037_OnDefaultEvent(sceneId, selfId, targetId)	--点击该任务后执行此脚本
	local selectEventId	= GetNumText();
	
	--点击拜天地任务的事件
	if x250037_g_eventId_begin == selectEventId then
		x250037_OnBegin(sceneId, selfId, targetId);
	--点击开始拜天地的事件
	elseif x250037_g_eventId_start == selectEventId then
		x250037_OnStart(sceneId, selfId, targetId);
	--点击等会再开始的事件
	elseif x250037_g_eventId_close == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end

end

--**********************************
--列举事件
--**********************************
function x250037_OnEnumerate(sceneId, selfId, targetId)
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x250037_g_MissionId) > 0 then
		AddNumText(sceneId, x250037_g_ScriptId, x250037_g_MissionName, 3, x250037_g_eventId_begin);
    end
end

--**********************************
--检测接受条件
--**********************************
function x250037_CheckAccept(sceneId, selfId)
	return 1;
end

--**********************************
--接受
--**********************************
function x250037_OnAccept(sceneId, selfId, marryLevel)

	--加入任务到玩家列表
	AddMission(sceneId, selfId, x250037_g_MissionId, x250037_g_ScriptId, 0, 0, 0);
	misIndex = GetMissionIndexByID(sceneId, selfId, x250037_g_MissionId);			--得到任务的序列号
	if misIndex and misIndex >= 0 then
		StartMissionTimer(sceneId,selfId, x250037_g_MissionId);
		SetMissionByIndex(sceneId,selfId,misIndex, 0, 1);						--根据序列号把任务变量的第0位置0 (任务完成情况)
		SetMissionByIndex(sceneId,selfId,misIndex, 7, x250037_g_MissionLimitTime);
		SetMissionByIndex(sceneId,selfId,misIndex, 2, marryLevel);
		
		Msg2Player(sceneId, selfId,"#Y接受任务："..x250037_g_MissionName.."",MSG2PLAYER_PARA);	--聊天窗口提示
	end
end

--**********************************
--放弃
--**********************************
function x250037_OnAbandon(sceneId, selfId)
	--删除玩家任务列表中对应的任务
 	local checkMission = IsHaveMission(sceneId, selfId, x250037_g_MissionId);
	if checkMission and checkMission == 1 then
		DelMission(sceneId, selfId, x250037_g_MissionId);
	end
end

--**********************************
--继续
--**********************************
function x250037_OnContinue(sceneId, selfId, targetId)
end

--**********************************
--检测是否可以提交
--**********************************
function x250037_CheckSubmit(sceneId, selfId)
	return 0;
end

--**********************************
--提交
--**********************************
function x250037_OnSubmit(sceneId, selfId, targetId,selectRadioId)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x250037_OnKillObject(sceneId, selfId, objdataId ,objId)
end

--**********************************
--进入区域事件
--**********************************
function x250037_OnEnterArea(sceneId, selfId, zoneId)
end

--**********************************
--道具改变
--**********************************
function x250037_OnItemChanged(sceneId, selfId, itemdataId)
end

--**********************************
--定时事件
--**********************************
function x250037_OnTimer(sceneId,selfId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250037_g_MissionId);
	if misIndex and misIndex >= 0 then
		local saveTime = GetMissionParam(sceneId, selfId, misIndex, 7);
		if saveTime and saveTime > 0 then
			saveTime = saveTime - 1000;
			if saveTime <= 0 then
				StopMissionTimer(sceneId, selfId, x250037_g_MissionId);
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 2);
				saveTime = 0;
			end
			SetMissionByIndex(sceneId, selfId, misIndex, 7, saveTime);
		end
	end
end

--**********************************
--点击拜天地任务的事件
--**********************************
function x250037_OnBegin(sceneId, selfId, targetId)
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250037_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250037_MessageBox(sceneId, selfId, targetId, x250037_g_ContinueInfo1);
			DelMission(sceneId, selfId, x250037_g_MissionId);
		else
			BeginEvent(sceneId);
				AddText(sceneId, "巡游也热热闹闹的结束了，现在该开始拜天地啦。");
				AddNumText(sceneId, x250037_g_ScriptId, "恩，现在就开始", 8, x250037_g_eventId_start);
				AddNumText(sceneId, x250037_g_ScriptId, "我们还要等一会……", 8, x250037_g_eventId_close);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
		end
	end
end

--**********************************
--点击开始拜天地的事件
--**********************************
function x250037_OnStart(sceneId, selfId, targetId)
	local marryLevel = 0;
	local misIndex = GetMissionIndexByID(sceneId,selfId,x250037_g_MissionId);
	if misIndex and misIndex >= 0 then
		local stateCode = GetMissionParam(sceneId, selfId, misIndex, 0);
		if stateCode and stateCode == 2 then
			x250037_MessageBox(sceneId, selfId, targetId, x250037_g_ContinueInfo1);
			DelMission(sceneId, selfId, x250037_g_MissionId);
			return 0;
		else
			marryLevel = GetMissionParam(sceneId, selfId, misIndex, 2);
		end
	else
		x250037_MessageBox(sceneId, selfId, targetId, "未找到拜天地的任务。");
		return 0;
	end
		
	local szMsg = "如果想拜天地，请男女双方2人组成一队再来找我。"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	szMsg = "队伍必须只能由夫妻双方组成，队伍中不能有其他人员。"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "只有2人都走到我身边才可以开始拜天地。"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end

	szMsg = "不是夫妻不能开始拜天地。"
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
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end
	
	local isSpouses = LuaFnIsSpouses(sceneId, maleId, femaleId);
	if isSpouses and isSpouses > 0 then
	else
		x250037_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0;
	end


	DelMission(sceneId, selfId, x250037_g_MissionId);

	CallScriptFunction(401030, "Create", sceneId, maleId, femaleId, marryLevel);

end

--**********************************
--对话窗口信息提示
--**********************************
function x250037_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end
