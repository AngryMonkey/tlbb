--找人任务
--赵天师寻找云飘飘
--MisDescBegin
--脚本号
x210214_g_ScriptId = 210214

--接受任务NPC属性
x210214_g_Position_X=265.4445
x210214_g_Position_Z=128.5832
x210214_g_SceneID=2
x210214_g_AccomplishNPC_Name="云飘飘"

--任务号
x210214_g_MissionId = 454

--上一个任务的ID
--g_MissionIdPre = 

--目标NPC
x210214_g_Name	="云飘飘"

--任务归类
x210214_g_MissionKind = 13

--任务等级
x210214_g_MissionLevel = 5

--是否是精英任务
x210214_g_IfMissionElite = 0

--任务名
x210214_g_MissionName="第一只珍兽"
x210214_g_MissionInfo="#{event_dali_0020}"
x210214_g_MissionTarget="去#G大理城东边东大街#W的#Y虫鸟坊#W找到坊主#R云飘飘#W#{_INFOAIM265,129,2,云飘飘}。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"
x210214_g_MissionComplete="  我可不是随便和一般的人做朋友的，不过你是四大善人的朋友，那我就告诉你点好玩的事情吧。"
x210214_g_MoneyBonus=72
x210214_g_SignPost = {x = 263, z = 129, tip = "云飘飘"}

x210214_g_Custom	= { {id="已找到云飘飘",num=1} }
x210214_g_IsMissionOkFail = 1		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210214_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x210214_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210214_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210214_g_Name then
			x210214_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x210214_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210214_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210214_g_MissionName)
				AddText(sceneId,x210214_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210214_g_MissionTarget)
				AddMoneyBonus( sceneId, x210214_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210214_g_ScriptId,x210214_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210214_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210214_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210214_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210214_g_Name then
			AddNumText(sceneId, x210214_g_ScriptId,x210214_g_MissionName,2,-1);
		end
    --满足任务接收条件
    elseif x210214_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210214_g_Name then
			AddNumText(sceneId,x210214_g_ScriptId,x210214_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210214_CheckAccept( sceneId, selfId )
	--需要5级才能接
	if GetLevel( sceneId, selfId ) >= 5 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210214_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210214_g_MissionId, x210214_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：第一只珍兽",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210214_g_SignPost.x, x210214_g_SignPost.z, x210214_g_SignPost.tip )

	-- 设置任务完成标志
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210214_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x210214_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210214_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210214_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210214_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210214_g_MissionName)
		AddText(sceneId,x210214_g_MissionComplete)
		AddMoneyBonus( sceneId, x210214_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210214_g_ScriptId,x210214_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210214_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210214_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210214_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210214_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId,x210214_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,400)
		DelMission( sceneId,selfId,  x210214_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x210214_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：第一只珍兽",MSG2PLAYER_PARA )
		CallScriptFunction( 210215, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210214_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210214_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210214_OnItemChanged( sceneId, selfId, itemdataId )
end
