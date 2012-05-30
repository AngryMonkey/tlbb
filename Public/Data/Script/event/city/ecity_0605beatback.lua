-- 反击战
--MisDescBegin
-- 脚本号
x600044_g_ScriptId = 600044

--任务号
x600044_g_MissionId = 1109

--任务目标npc
x600044_g_Name = "武大威"

--任务归类
x600044_g_MissionKind = 50

--任务等级
x600044_g_MissionLevel = 10000

--是否是精英任务
x600044_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x600044_g_IsMissionOkFail			= 0									--0 任务完成标记[值不能变]
x600044_g_MissionParam_SubId		= 1									--1 子任务脚本号存放位置[值不能变]

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号

--任务文本描述
x600044_g_MissionName = "国防任务"
x600044_g_MissionInfo = "    国防任务"									--任务描述
x600044_g_MissionTarget = "    你的任务是杀死%n。"						--任务目标
x600044_g_ContinueInfo = "    你的任务还没有完成么？"					--未完成任务的npc对话
x600044_g_SubmitInfo = "    事情进展得如何？"							--完成未提交时的npc对话
x600044_g_MissionComplete = "    干得不错，甚好甚好。"					--完成任务npc说话的话

x600044_g_StrForePart = 4

x600044_g_MissionRound = 79

x600044_g_Parameter_Kill_AllRandom = { { id = 4, numNeeded = 5, numKilled = 6 } }

-- 通用城市任务脚本
x600044_g_CityMissionScript = 600001
x600044_g_MilitaryScript = 600030

--任务奖励

--MisDescEnd

x600044_g_MonsterOffset = 43											-- Suppose to 43, 表里第几列 Monster 的偏移量

x600044_g_MissionParam_MonsterId = x600044_g_StrForePart
x600044_g_MissionParam_MonsterNeeded = x600044_g_StrForePart + 1
x600044_g_MissionParam_MonsterKilled = x600044_g_StrForePart + 2

--**********************************
--任务入口函数
--**********************************
function x600044_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) > 0 then
		--发送任务需求的信息
		local bDone = x600044_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600044_g_SubmitInfo
		else
			strText = x600044_g_ContinueInfo
		end

		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x600044_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600044_g_ScriptId, x600044_g_MissionId, bDone )
	--满足任务接收条件
	elseif x600044_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600044_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1 then
			x600044_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600044_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) > 0 then
		AddNumText( sceneId, x600044_g_ScriptId, x600044_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600044_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600044_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--接受
--**********************************
function x600044_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	local myLevel = GetLevel( sceneId, selfId )

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600044_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
		return
	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600044_g_MissionId, x600044_g_ScriptId, 1, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600044_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600044_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600044_g_MissionId )
	local nMonsterId, strMonsterName, strMonsterSceneDesc = LuaFnGetLevelMatchingMonster( x600044_g_MonsterOffset, myLevel )

	local count = floor( myLevel/10 ) * 5 + 5
	SetMissionByIndex( sceneId, selfId, misIndex, x600044_g_MissionParam_MonsterId, nMonsterId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600044_g_MissionParam_MonsterNeeded, count )

	strMonsterSceneDesc = gsub( strMonsterSceneDesc, "的", "" )

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		local missionInfo
		missionInfo = format( "    本城市在初建之时，常常遭到%s的%s的侵略，当时我们国小民贫，势单力薄，只能任%s们宰割。#r    现在，%s，我们已经拥有了足够的力量！去%s杀死%d个%s，打一个漂亮的反击战！",
				strMonsterSceneDesc, strMonsterName, strMonsterName, GetName( sceneId, selfId ),
				strMonsterSceneDesc, count, strMonsterName )

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    你接受了任务：" .. x600044_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x600044_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600044_g_MilitaryScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x600044_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600044_g_MissionName )
		AddText( sceneId, x600044_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600044_g_ScriptId, x600044_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600044_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600044_g_MilitaryScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600044_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then			--判断该npc是否是对应任务的npc
		return
	end

	if x600044_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600044_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600044_OnKillObject( sceneId, selfId, objdataId, objId )	--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--取得这个怪物死后拥有分配权的人数
	local curOwner, misIndex
	local nNpcId, strNpcName, nNeeded, nKilled
	local MonsterName = GetName( sceneId, objId )

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--取得拥有分配权的人的objId
		if IsHaveMission( sceneId, curOwner, x600044_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600044_g_MissionId ) == x600044_g_ScriptId then		--如果这个人拥有任务
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600044_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId( sceneId, nNpcId )

			if MonsterName == strNpcName then
				nNeeded = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterNeeded )
				nKilled = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterKilled )
				nKilled = nKilled + 1

				SetMissionByIndex( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterKilled, nKilled )
				CallScriptFunction( x600044_g_CityMissionScript, "NotifyFailTips", sceneId, curOwner,
					format( "已杀死%s：%d/%d", MonsterName, nKilled, nNeeded ) )

				if nNeeded <= nKilled then
					SetMissionByIndex( sceneId, curOwner, misIndex, x600044_g_IsMissionOkFail, 1 )
					ResetMissionEvent( sceneId, curOwner, x600044_g_MissionId, 0 )	-- 不再关心杀怪
				end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x600044_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600044_OnItemChanged( sceneId, selfId, itemdataId )
end
