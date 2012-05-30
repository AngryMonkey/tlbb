--找人任务
--赵天师寻找云飘飘
--MisDescBegin
--脚本号
x210220_g_ScriptId = 210220

--接受任务NPC属性
x210220_g_Position_X=265.4445
x210220_g_Position_Z=128.5832
x210220_g_SceneID=2
x210220_g_AccomplishNPC_Name="云飘飘"

--任务号
x210220_g_MissionId = 700

--上一个任务的ID
--g_MissionIdPre = 

--目标NPC
x210220_g_Name	="云飘飘"

--任务归类
x210220_g_MissionKind = 13

--任务等级
x210220_g_MissionLevel = 7

--是否是精英任务
x210220_g_IfMissionElite = 0

--任务名
x210220_g_MissionName="怎么捉珍兽啊"
x210220_g_MissionInfo="#{event_dali_0027}"
x210220_g_MissionTarget="    去#G大理城东的东大街#W的#Y虫鸟坊#W找到坊主#R云飘飘#W#{_INFOAIM265,129,2,云飘飘}。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"
x210220_g_MissionComplete="#{event_dali_0028}"
x210220_g_MoneyBonus=72
x210220_g_SignPost = {x = 263, z = 129, tip = "云飘飘"}


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210220_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x210220_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210220_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210220_g_Name then
			x210220_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x210220_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210220_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210220_g_MissionName)
				AddText(sceneId,x210220_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210220_g_MissionTarget)
				AddMoneyBonus( sceneId, x210220_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210220_g_ScriptId,x210220_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210220_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    --if 	IsMissionHaveDone(sceneId,selfId,g_MissionIdPre) <= 0 then
    --	return
    --end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210220_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210220_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210220_g_Name then
			AddNumText(sceneId, x210220_g_ScriptId,x210220_g_MissionName,2,-1);
		end
    --满足任务接收条件
    elseif x210220_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210220_g_Name then
			AddNumText(sceneId,x210220_g_ScriptId,x210220_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210220_CheckAccept( sceneId, selfId )
	--需要7级才能接
	if GetLevel( sceneId, selfId ) >= 7 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210220_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210220_g_MissionId, x210220_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：怎么捉珍兽啊",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210220_g_SignPost.x, x210220_g_SignPost.z, x210220_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210220_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210220_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210220_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210220_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210220_g_MissionName)
		AddText(sceneId,x210220_g_MissionComplete)
		AddMoneyBonus( sceneId, x210220_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210220_g_ScriptId,x210220_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210220_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210220_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210220_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId,x210220_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,500)
		DelMission( sceneId,selfId,  x210220_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x210220_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：怎么捉珍兽啊",MSG2PLAYER_PARA )
		CallScriptFunction( 210221, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210220_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210220_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210220_OnItemChanged( sceneId, selfId, itemdataId )
end
