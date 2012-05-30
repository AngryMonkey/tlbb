--找人任务
--云飘飘寻找赵天师
--MisDescBegin
--脚本号
x210216_g_ScriptId = 210216

--接受任务NPC属性
x210216_g_Position_X=160.0895
x210216_g_Position_Z=156.9309
x210216_g_SceneID=2
x210216_g_AccomplishNPC_Name="赵天师"

--任务号
x210216_g_MissionId = 456

--上一个任务的ID
x210216_g_MissionIdPre = 455

--目标NPC
x210216_g_Name	="赵天师"

--任务归类
x210216_g_MissionKind = 13

--任务等级
x210216_g_MissionLevel = 5

--是否是精英任务
x210216_g_IfMissionElite = 0

--任务名
x210216_g_MissionName="第五封推荐信"
x210216_g_MissionInfo="#{event_dali_0024}"
x210216_g_MissionTarget="    回#G大理城五华坛#W找到#G赵天师#W#{_INFOAIM160,157,2,赵天师}。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"
x210216_g_MissionComplete="  你越来越像个大侠了，我真是看在眼里，喜在心头啊。"
x210216_g_MoneyBonus=24
x210216_g_SignPost = {x = 160, z = 156, tip = "赵天师"}
x210216_g_ItemBonus={{id=40002108,num=1}}

x210216_g_Custom	= { {id="已找到赵天师",num=1} }
x210216_g_IsMissionOkFail = 1		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210216_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x210216_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210216_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210216_g_Name then
			x210216_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x210216_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210216_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210216_g_MissionName)
				AddText(sceneId,x210216_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210216_g_MissionTarget)
				for i, item in x210216_g_ItemBonus do
					AddItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x210216_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210216_g_ScriptId,x210216_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210216_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210216_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210216_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210216_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210216_g_Name then
			AddNumText(sceneId, x210216_g_ScriptId,x210216_g_MissionName,2,-1);
		end
    --满足任务接收条件
    elseif x210216_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210216_g_Name then
			AddNumText(sceneId,x210216_g_ScriptId,x210216_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210216_CheckAccept( sceneId, selfId )
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
function x210216_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210216_g_MissionId, x210216_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y接受任务：第五封推荐信",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210216_g_SignPost.x, x210216_g_SignPost.z, x210216_g_SignPost.tip )

	-- 设置任务完成标志
	local misIndex = GetMissionIndexByID(sceneId,selfId,x210216_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x210216_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210216_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210216_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210216_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210216_g_MissionName)
		AddText(sceneId,x210216_g_MissionComplete)
		AddMoneyBonus( sceneId, x210216_g_MoneyBonus )
		for i, item in x210216_g_ItemBonus do
			AddItemBonus( sceneId,item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210216_g_ScriptId,x210216_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210216_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210216_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x210216_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210216_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	BeginAddItem(sceneId)
			for i, item in x210216_g_ItemBonus do
				AddItem( sceneId,item.id, item.num )
			end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
			if ret > 0 then
					AddMoney(sceneId,selfId,x210216_g_MoneyBonus );
					LuaFnAddExp( sceneId, selfId,500)
					ret = DelMission( sceneId, selfId, x210216_g_MissionId )
				if ret > 0 then
					MissionCom( sceneId, selfId, x210216_g_MissionId )
					AddItemListToHuman(sceneId,selfId)
					Msg2Player(  sceneId, selfId,"#Y完成任务：第五封推荐信",MSG2PLAYER_PARA )
				end
			else
				--任务奖励没有加成功
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
function x210216_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210216_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210216_OnItemChanged( sceneId, selfId, itemdataId )
end
