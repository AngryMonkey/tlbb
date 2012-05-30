--送货任务
--蒲良送货给杜子腾
--MisDescBegin
--脚本号
x210201_g_ScriptId = 210201

x210201_g_Position_X=110.0841
x210201_g_Position_Z=158.7671
x210201_g_SceneID=2
x210201_g_AccomplishNPC_Name="杜子腾"

--任务号
x210201_g_MissionId = 441

--上一个任务的ID
x210201_g_MissionIdPre = 440

--目标NPC
x210201_g_Name	="杜子腾"

--任务道具编号
x210201_g_ItemId = 40002110

--任务道具需求数量
x210201_g_ItemNeedNum = 1

--任务归类
x210201_g_MissionKind = 13

--任务等级
x210201_g_MissionLevel = 1

--是否是精英任务
x210201_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x210201_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务名
x210201_g_MissionName="第一次送货"
x210201_g_MissionInfo="#{event_dali_0003}"
x210201_g_MissionTarget="把#Y一箱厨具#W送给#G大理城西边西大街#Y酒店#W的老板#R杜子腾#W#{_INFOAIM110,159,2,杜子腾}。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"
x210201_g_MissionComplete="  你真是解了我的燃眉之急啊，我正急需这箱#Y厨具#W呢！"
x210201_g_MoneyBonus=1
x210201_g_SignPost = {x = 110, z = 159, tip = "杜子腾"}

x210201_g_DemandItem={{id=40002110,num=1}}		--变量第1位
x210201_g_IsMissionOkFail = 1		--变量的第0位

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210201_OnDefaultEvent( sceneId, selfId, targetId )
    --如果玩家完成过这个任务
    if (IsMissionHaveDone(sceneId,selfId,x210201_g_MissionId) > 0 ) then
    	return
	elseif( IsHaveMission(sceneId,selfId,x210201_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x210201_g_Name then
			x210201_OnContinue( sceneId, selfId, targetId )
		end
    --满足任务接收条件
    elseif x210201_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210201_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210201_g_MissionName)
				AddText(sceneId,x210201_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210201_g_MissionTarget)
				AddMoneyBonus( sceneId, x210201_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210201_g_ScriptId,x210201_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x210201_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210201_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210201_g_MissionId) > 0 then
    	return 
    --如果已接此任务
    elseif IsHaveMission(sceneId,selfId,x210201_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x210201_g_Name then
			AddNumText(sceneId, x210201_g_ScriptId,x210201_g_MissionName,2,-1);
		end
    --满足任务接收条件
    elseif x210201_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x210201_g_Name then
			AddNumText(sceneId,x210201_g_ScriptId,x210201_g_MissionName,1,-1);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x210201_CheckAccept( sceneId, selfId )
	--需要1级才能接
	if GetLevel( sceneId, selfId ) >= 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210201_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210201_g_MissionId, x210201_g_ScriptId, 0, 0, 0 )
	BeginAddItem(sceneId)
		--添加信件类物品
		AddItem( sceneId,x210201_g_ItemId, x210201_g_ItemNeedNum )
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
	if ret > 0 then
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y接受任务：第一次送货",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210201_g_SignPost.x, x210201_g_SignPost.z, x210201_g_SignPost.tip )

		-- 设置任务完成标志
		local misIndex = GetMissionIndexByID(sceneId,selfId,x210201_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

	else
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "背包已满,无法接受任务"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--放弃
--**********************************
function x210201_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    res = DelMission( sceneId, selfId, x210201_g_MissionId )
	if res > 0 then
		--移去任务物品
		for i, item in x210201_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end
		CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210201_g_SignPost.tip )
	end
end

--**********************************
--继续
--**********************************
function x210201_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210201_g_MissionName)
		AddText(sceneId,x210201_g_MissionComplete)
		AddMoneyBonus( sceneId, x210201_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210201_g_ScriptId,x210201_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210201_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210201_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	for i, item in x210201_g_DemandItem do
		itemCount = GetItemCount( sceneId, selfId, item.id )
		if itemCount < item.num then
			return 0
		end
	end
	return 1
end

--**********************************
--提交
--**********************************
function x210201_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x210201_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--扣除任务物品
		for i, item in x210201_g_DemandItem do
			DelItem( sceneId, selfId, item.id, item.num )
		end
		DelMission( sceneId,selfId,  x210201_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x210201_g_MissionId )
		--添加任务奖励
		AddMoney(sceneId,selfId,x210201_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,15)
		--设置任务已经被完成过
		Msg2Player(  sceneId, selfId,"#Y完成任务：第一次送货",MSG2PLAYER_PARA )
		CallScriptFunction( 210202, "OnDefaultEvent",sceneId, selfId, targetId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210201_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210201_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210201_OnItemChanged( sceneId, selfId, itemdataId )
end
