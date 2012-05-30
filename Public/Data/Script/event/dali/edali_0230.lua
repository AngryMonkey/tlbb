--找人任务
--赵天师寻找黄眉僧
--MisDescBegin
--脚本号
x210230_g_ScriptId = 210230

--接受任务NPC属性
x210230_g_Position_X=275.2234
x210230_g_Position_Z=49.2906
x210230_g_SceneID=2
x210230_g_AccomplishNPC_Name="黄眉僧"

--任务号
x210230_g_MissionId = 710

--上一个任务的ID
--g_MissionIdPre =

--目标NPC
x210230_g_Name	="黄眉僧"

--任务归类
x210230_g_MissionKind = 13

--任务等级
x210230_g_MissionLevel = 9

--是否是精英任务
x210230_g_IfMissionElite = 0

--任务名
x210230_g_MissionName="打木人巷啦"
x210230_g_MissionInfo="#{event_dali_0043}"
x210230_g_MissionTarget="去#G大理城东北角的拈花寺#W找到#R黄眉僧#W#{_INFOAIM275,49,2,黄眉僧}。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"
x210230_g_MissionComplete="  施主，我们又见面了。请施主准备好修炼用的装备和药品，进入#G小木人巷#W。"
x210230_g_MoneyBonus=72
x210230_g_SignPost = {x = 275, z = 50, tip = "黄眉僧"}

x210230_g_Custom	= { {id="已找到黄眉僧",num=1} }
x210230_g_IsMissionOkFail = 1		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210230_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x210230_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210230_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210230_g_Name then
			x210230_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x210230_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210230_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210230_g_MissionName)
				AddText(sceneId,x210230_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210230_g_MissionTarget)
				AddMoneyBonus( sceneId, x210230_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210230_g_ScriptId,x210230_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210230_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210230_g_MissionId) > 0 then
    	return
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210230_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210230_g_Name then
			AddNumText(sceneId, x210230_g_ScriptId,x210230_g_MissionName,2,-1);
		end
    --满足任务接收条件
    elseif x210230_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210230_g_Name then
			AddNumText(sceneId,x210230_g_ScriptId,x210230_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210230_CheckAccept( sceneId, selfId )
	--需要9级才能接
	if GetLevel( sceneId, selfId ) >= 9 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210230_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210230_g_MissionId, x210230_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：打小木人巷啦",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210230_g_SignPost.x, x210230_g_SignPost.z, x210230_g_SignPost.tip )

	-- 设置任务完成标志
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210230_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x210230_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x210230_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210230_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210230_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210230_g_MissionName)
		AddText(sceneId,x210230_g_MissionComplete)
		AddMoneyBonus( sceneId, x210230_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210230_g_ScriptId,x210230_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210230_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210230_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210230_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210230_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId,x210230_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,300)
		DelMission( sceneId,selfId,  x210230_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x210230_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：打小木人巷啦",MSG2PLAYER_PARA )
		CallScriptFunction( 210231, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210230_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210230_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210230_OnItemChanged( sceneId, selfId, itemdataId )
end
