--找人任务
--赵天师寻找孙八爷
--MisDescBegin
--脚本号
x210210_g_ScriptId = 210210

--接受任务NPC属性
x210210_g_Position_X=172.7304
x210210_g_Position_Z=146.4640
x210210_g_SceneID=2
x210210_g_AccomplishNPC_Name="孙八爷"

--任务号
x210210_g_MissionId = 450

--上一个任务的ID
--g_MissionIdPre = 

--目标NPC
x210210_g_Name	="孙八爷"

--任务归类
x210210_g_MissionKind = 13

--任务等级
x210210_g_MissionLevel = 3

--是否是精英任务
x210210_g_IfMissionElite = 0

--任务名
x210210_g_MissionName="做一次大侠"
x210210_g_MissionInfo_1="#{event_dali_0012}"
x210210_g_MissionInfo_2="#W，难道你不应该去帮帮他吗？"
x210210_g_MissionTarget="在#G大理城五华坛#W找到四大善人之一的#R孙八爷#W#{_INFOAIM173,146,2,孙八爷}。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"
x210210_g_MissionComplete="  哎呀，我的老朋友，我就知道你会来帮我的。"
x210210_g_MoneyBonus=72
x210210_g_SignPost = {x = 173, z = 147, tip = "孙八爷"}

x210210_g_Custom	= { {id="已找到孙八爷",num=1} }

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210210_OnDefaultEvent( sceneId, selfId, targetId )
  --如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210210_g_Name then
			x210210_OnContinue( sceneId, selfId, targetId )
		end
		
	--满足任务接收条件
	elseif x210210_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210210_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x210210_g_MissionName)
				AddText(sceneId,x210210_g_MissionInfo_1..PlayerName..x210210_g_MissionInfo_2)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210210_g_MissionTarget)
				AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x210210_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210210_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210210_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210210_g_Name then
			AddNumText(sceneId, x210210_g_ScriptId,x210210_g_MissionName,2,-1);
		end
    --满足任务接收条件
    elseif x210210_CheckAccept(sceneId,selfId) > 0 then
			if GetName(sceneId,targetId) ~= x210210_g_Name then
				AddNumText(sceneId,x210210_g_ScriptId,x210210_g_MissionName,1,-1);
			end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210210_CheckAccept( sceneId, selfId )
	--需要3级才能接
	if GetLevel( sceneId, selfId ) >= 3 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210210_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210210_g_MissionId, x210210_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：做一次大侠",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210210_g_SignPost.x, x210210_g_SignPost.z, x210210_g_SignPost.tip )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x210210_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--放弃
--**********************************
function x210210_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210210_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210210_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210210_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210210_g_MissionName)
		AddText(sceneId,x210210_g_MissionComplete)
		AddMoneyBonus( sceneId, x210210_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210210_g_ScriptId,x210210_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210210_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210210_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210210_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210210_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId,x210210_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,100)
		DelMission( sceneId,selfId,  x210210_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x210210_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：做一次大侠",MSG2PLAYER_PARA )
		CallScriptFunction( 210211, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210210_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210210_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210210_OnItemChanged( sceneId, selfId, itemdataId )
end
