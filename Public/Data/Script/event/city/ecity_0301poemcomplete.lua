-- 古诗对句任务
--MisDescBegin
-- 脚本号
x600013_g_ScriptId = 600013

--任务号
x600013_g_MissionId = 1107

--任务目标npc
x600013_g_Name = "茍写"

--任务归类
x600013_g_MissionKind = 50

--任务等级
x600013_g_MissionLevel = 10000

--是否是精英任务
x600013_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x600013_g_IsMissionOkFail = 0							-- 任务完成标记
x600013_g_MissionParam_SubId = 1						-- 子任务脚本号存放位置
x600013_g_MissionParam_PoemIssued = 2					-- 是否已经发布诗句
x600013_g_MissionParam_IsFailed = 3						-- 正确答案索引存放位置
x600013_g_MissionParam_PoemIndex = 4					-- 诗句索引存放位置
x600013_g_MissionParam_AnswerIndex = 5					-- 正确答案索引存放位置

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x600013_g_MissionName = "科技任务"
x600013_g_MissionInfo = "    今天我想要 %s 了，去帮我找来吧！"			--任务描述
x600013_g_MissionTarget = "    答对古诗对句一题。"						--任务目标
x600013_g_ContinueInfo = "    你的任务还没有完成么？"					--未完成任务的npc对话
x600013_g_SubmitInfo = "    事情进展得如何？"							--完成未提交时的npc对话
x600013_g_MissionComplete = "    干得不错，甚好甚好。"					--完成任务npc说话的话

x600013_g_StrForePart = 5
x600013_g_Offset = 140000												-- Suppose to 150000, 表里第几个物品列的偏移量

x600013_g_MissionRound = 42

-- 通用城市任务脚本
x600013_g_CityMissionScript = 600001
x600013_g_SciTechScript = 600012

--任务奖励

--MisDescEnd

x600013_g_Answer = 3

--**********************************
--任务入口函数
--**********************************
function x600013_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) > 0 then
		local bDone = x600013_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600013_g_SubmitInfo
		else
			strText = x600013_g_ContinueInfo
		end

		if bDone == 0 then												--任务未完成
			if GetNumText() == 0 then
				BeginEvent( sceneId )
					AddText( sceneId, x600013_g_MissionName )
					x600013_IssueQuiz( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			else
				x600013_CheckAnswer( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--任务已经完成
			BeginEvent( sceneId )
				AddText( sceneId, x600013_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600013_g_ScriptId, x600013_g_MissionId, bDone )
		end
	--满足任务接收条件
	elseif x600013_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600013_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600013_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600013_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) > 0 then
		AddNumText( sceneId, x600013_g_ScriptId, x600013_g_MissionName, 3, 0 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600013_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600013_g_SciTechScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--根据玩家等级得到
--**********************************
function x600013_GetMissionPoemOffset( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 55 then								-- 40 ~ 54
		nPos = 1
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nPos = 2
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nPos = 3
	else													-- 85 ~ 100
		nPos = 4
	end

	return nPos
end

--**********************************
--任务发布
--**********************************
function x600013_IssueQuiz( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local missionInfo
	if random(2) == 1 then
		missionInfo = format( "    听说你才高八斗，倒要考你一考。" )
	else
		missionInfo = format( "    有些问题我是百思不得其解，能帮我解答吗？" )
	end

	AddText( sceneId, missionInfo )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600013_g_MissionId )
	local QuizTable
	local nPoemIndex

	if GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_IsFailed ) == 1
	 or GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIssued ) ~= 1 then
		local nOffset = x600013_GetMissionPoemOffset( sceneId, selfId )
		local nPosStart = x600013_g_Offset + nOffset * 10000

		-- 使用新的接口获得题目编号
		nPoemIndex = GetRandomQuestionsIndex(2)

		-- 诗句索引存放位置
		SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIndex, nPoemIndex )
	else
		nPoemIndex = GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIndex )
	end

	local Quiz
	local Opt = {}
	local Key = {}
	Quiz, Opt[1], Opt[2], Opt[3], Opt[4], Opt[5], Opt[6],
		  Key[1], Key[2], Key[3], Key[4], Key[5], Key[6] = GetQuestionsRecord( nPoemIndex )

	AddText( sceneId, Quiz )

	local RandomOrder = { 1, 2, 3, 4, 5, 6 }
	local newPos
	local i
	for i = 1, x600013_g_Answer do
		if Key[i] == 1 then
			newPos = random( x600013_g_Answer )
			RandomOrder[i] = newPos
			RandomOrder[newPos] = i
		end
	end

	-- 正确答案索引存放位置
	SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_AnswerIndex, newPos )
	SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIssued, 1 )
	SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_IsFailed, 0 )

	for i = 1, x600013_g_Answer do
		AddNumText( sceneId, x600013_g_ScriptId, Opt[RandomOrder[i]], -1, i )		-- 9 + i 制定客户端特定的图标 (选项图标为数字项)
	end

end

--**********************************
--接受
--**********************************
function x600013_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600013_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600013_g_MissionId, x600013_g_ScriptId, 0, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600013_g_SciTechScript, "OnAccept", sceneId, selfId, targetId, x600013_g_ScriptId )

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		x600013_IssueQuiz( sceneId, selfId )
		AddText( sceneId, "#r    你接受了任务：" .. x600013_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600013_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600013_g_SciTechScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600013_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600013_g_MissionName )
		AddText( sceneId, x600013_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600013_g_ScriptId, x600013_g_MissionId )
end

--**********************************
--检查答案
--**********************************
function x600013_CheckAnswer( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600013_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600013_g_MissionId )

	BeginEvent( sceneId )
		AddText( sceneId, x600013_g_MissionName )

		local ContinueInfo = ""
		local bDone = 0
		if GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_PoemIssued ) ~= 1 then
			return
		end

		if GetNumText() == GetMissionParam( sceneId, selfId, misIndex, x600013_g_MissionParam_AnswerIndex ) then
			ContinueInfo = format( "    果然高才，小生佩服佩服。" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_IsMissionOkFail, 1 )	-- 完成
			bDone = 1
		else
			ContinueInfo = format( "    非也非也，我看也不尽然，不如再试一次。" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600013_g_MissionParam_IsFailed, 1 )	-- 失败
		end

		AddText( sceneId, ContinueInfo )
	EndEvent( )
	DispatchMissionDemandInfo( sceneId, selfId, targetId, x600013_g_ScriptId, x600013_g_MissionId, bDone )
end

--**********************************
--检测是否可以提交
--**********************************
function x600013_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600013_g_SciTechScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600013_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600013_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600013_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600013_g_SciTechScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600013_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--进入区域事件
--**********************************
function x600013_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600013_OnItemChanged( sceneId, selfId, itemdataId )
end
