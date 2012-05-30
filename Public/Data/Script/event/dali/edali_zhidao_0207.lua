--问答任务
--钱龙要你连续答对12个问题
--MisDescBegin
--脚本号
x210207_g_ScriptId = 210207

--接受任务NPC属性
x210207_g_Position_X=147.4986
x210207_g_Position_Z=146.2925
x210207_g_SceneID=2
x210207_g_AccomplishNPC_Name="钱龙"

--任务号
x210207_g_MissionId = 447

--上一个任务的ID
x210207_g_MissionIdPre = 445

--目标NPC
x210207_g_Name	="钱龙"

--任务道具编号
--g_ItemId = 20101001

--任务道具需求数量
--g_ItemNeedNum = 1

--任务归类
x210207_g_MissionKind = 13

--任务等级
x210207_g_MissionLevel = 2

--是否是精英任务
x210207_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x210207_g_IsMissionOkFail = 0		--变量的第0位
x210207_g_Custom	= { {id="已连续答对钱龙的五个问题",num=1} }

--以上是动态**************************************************************

--任务名
x210207_g_MissionName="第一次问答"
x210207_g_MissionInfo="#{event_dali_0010}"
x210207_g_MissionTarget="连续答对#R钱龙#W#{_INFOAIM145,139,2,钱龙}的五个问题。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"
x210207_g_MissionComplete="  子曾经曰过的，孺子可教啊。恭喜你过关了！这些钱是我送你行走江湖的盘缠。"
x210207_g_MoneyBonus=210
x210207_g_SignPost = {x = 145, z = 138, tip = "钱龙"}
x210207_g_ItemBonus={{id=10110000,num=1}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210207_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x210207_g_MissionId) > 0 then
	--	return
	--end
    --如果已接此任务
		if IsHaveMission(sceneId,selfId,x210207_g_MissionId) > 0 then
			misIndex = GetMissionIndexByID(sceneId,selfId,x210207_g_MissionId)
			num = GetMissionParam(sceneId,selfId,misIndex,1)
			if num < 1 then
				CallScriptFunction( 311100, "OnDefaultEvent",sceneId, selfId, targetId )
			else
				--发送任务需求的信息
				BeginEvent(sceneId)
				AddText(sceneId,x210207_g_MissionName)
				AddText(sceneId,x210207_g_MissionComplete)
				AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
				EndEvent( )
				bDone = x210207_CheckSubmit( sceneId, selfId )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId,bDone)
			end
		--满足任务接收条件
		elseif x210207_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210207_g_MissionName)
				AddText(sceneId,x210207_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210207_g_MissionTarget)
				for i, item in x210207_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId)
		end
end

--**********************************
--列举事件
--**********************************
function x210207_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210207_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210207_g_MissionId) > 0 then
    	return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x210207_g_MissionId) > 0 then
		AddNumText(sceneId,x210207_g_ScriptId,x210207_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x210207_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210207_g_ScriptId,x210207_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210207_CheckAccept( sceneId, selfId )
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= 2 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210207_OnAccept( sceneId, selfId, targetId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210207_g_MissionId, x210207_g_ScriptId, 0, 0, 0 )
	CallScriptFunction( 311100, "OnDefaultEvent",sceneId, selfId, targetId )
	Msg2Player(  sceneId, selfId,"#Y接受任务：第一次问答",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210207_g_SignPost.x, x210207_g_SignPost.z, x210207_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210207_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210207_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210207_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210207_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210207_g_MissionName)
		AddText(sceneId,x210207_g_MissionComplete)
		AddMoneyBonus( sceneId, x210207_g_MoneyBonus )
		for i, item in x210207_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210207_g_ScriptId,x210207_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210207_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210207_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210207_g_MissionId)
	num = GetMissionParam(sceneId,selfId,misIndex,1)
	if num < 1 then
		return 0
	else
		return 1
	end
end

--**********************************
--提交
--**********************************
function x210207_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210207_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210207_g_ItemBonus do
				AddItem( sceneId, item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		if ret > 0 then
			AddMoney(sceneId,selfId,x210207_g_MoneyBonus );
			LuaFnAddExp(sceneId, selfId,100)
			ret = DelMission( sceneId, selfId, x210207_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210207_g_MissionId )
				AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y完成任务：第一次问答",MSG2PLAYER_PARA )
				CallScriptFunction( 210208, "OnDefaultEvent",sceneId, selfId, targetId)
			end
		else
			BeginEvent(sceneId)
				strText = "背包已满,无法完成任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210207_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210207_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210207_OnItemChanged( sceneId, selfId, itemdataId )
end
