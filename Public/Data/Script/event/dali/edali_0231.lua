--杀怪任务
--小木人巷
--小木人巷杀木人任务
--MisDescBegin
--脚本号
x210231_g_ScriptId  = 210231

--上一个任务的ID
x210231_g_MissionIdPre = 710

--任务号
x210231_g_MissionId = 711

--目标NPC
x210231_g_Name	="黄眉僧"

--任务归类
x210231_g_MissionKind = 13

--任务等级
x210231_g_MissionLevel = 9

--是否是精英任务
x210231_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x210231_g_IsMissionOkFail = 0		--变量的第0位

--任务需要杀死的怪
x210231_g_DemandKill ={{id=703,num=5}}		--变量第1位

--以上是动态**************************************************************

--任务文本描述
x210231_g_MissionName="小木人巷"
x210231_g_MissionInfo="  施主，这小木人巷虽然比不得少林寺木人巷，但里边的怪物也是骁勇异常。请施主修炼时量力而行。#r  施主只要杀死5只木头人，就完成了这次修炼。一次没有打完也不要紧，施主可以反复出入木人巷，直到完成为止。" --任务描述
x210231_g_MissionTarget="在#G小木人巷#W中杀死5只#R木头人#W，然后回到#R黄眉僧#W#{_INFOAIM275,49,2,黄眉僧}那里。#b#G（请用左键点选带下划线的坐标，帮助您找到该NPC）#l"	--任务目标
x210231_g_ContinueInfo="你已经杀死了5个木头人了吗？"	--未完成任务的npc对话
x210231_g_MissionComplete="  施主的修炼非常成功，片刻不见，武功精进了不少啊。"	--完成任务npc说话的话
x210231_g_SignPost = {x = 275, z = 50, tip = "黄眉僧"}
--任务奖励
x210231_g_MoneyBonus=200
--x210231_g_ItemBonus={{id=40002108,num=1},{id=30101001,num=5}}

x210231_g_DemandTrueKill ={{name="木头人",num=5}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210231_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x210231_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210231_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210231_g_MissionName)
			AddText(sceneId,x210231_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210231_g_MoneyBonus )
		EndEvent( )
		bDone = x210231_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210231_g_ScriptId ,x210231_g_MissionId,bDone)
    --满足任务接收条件
    elseif x210231_CheckAccept(sceneId,selfId) > 0 then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210231_g_MissionName)
				AddText(sceneId,x210231_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210231_g_MissionTarget)
				--for i, item in x210231_g_ItemBonus do
				--	AddItemBonus( sceneId, item.id, item.num )
				--end
				AddMoneyBonus( sceneId, x210231_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210231_g_ScriptId ,x210231_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210231_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210231_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210231_g_MissionId) > 0 then
    	return
	end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x210231_g_MissionId) > 0 then
		AddNumText(sceneId,x210231_g_ScriptId ,x210231_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x210231_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210231_g_ScriptId ,x210231_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210231_CheckAccept( sceneId, selfId )
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
function x210231_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210231_g_MissionId, x210231_g_ScriptId , 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x210231_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：小木人巷",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210231_g_SignPost.x, x210231_g_SignPost.z, x210231_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210231_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210231_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210231_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210231_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210231_g_MissionName)
		AddText(sceneId,x210231_g_MissionComplete)
		AddMoneyBonus( sceneId, x210231_g_MoneyBonus )
		--for i, item in x210231_g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210231_g_ScriptId ,x210231_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210231_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210231_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210231_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,1)
    if num == x210231_g_DemandTrueKill[1].num then
			return 1
		end
	return 0
end

--**********************************
--提交
--**********************************
function x210231_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210231_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		ret = 1
		--添加任务奖励
		if ret > 0 then
			AddMoney(sceneId,selfId,x210231_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,1620)
			--扣除任务物品
			--for i, item in g_DemandItem do
			--	DelItem( sceneId, selfId, item.id, item.num )
			--end
			ret = DelMission( sceneId, selfId, x210231_g_MissionId )
			if ret > 0 then
				MissionCom( sceneId, selfId, x210231_g_MissionId )
				--AddItemListToHuman(sceneId,selfId)
				Msg2Player(  sceneId, selfId,"#Y完成任务：小木人巷",MSG2PLAYER_PARA )
				CallScriptFunction( 210232, "OnDefaultEvent",sceneId, selfId, targetId)
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
function x210231_OnKillObject( sceneId, selfId, objdataId ,objId)
	
	if GetName(sceneId,objId) == x210231_g_DemandTrueKill[1].name	  then
		-- 获得所有人
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			
			-- 看有没有这个任务
			if IsHaveMission(sceneId, humanObjId, x210231_g_MissionId) > 0 then
				local misIndex = GetMissionIndexByID(sceneId,humanObjId,x210231_g_MissionId)
				local nNum = GetMissionParam(sceneId,humanObjId,misIndex,1)

	 			if nNum < x210231_g_DemandTrueKill[1].num then
	 				if nNum == x210231_g_DemandTrueKill[1].num - 1 then
	 					SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
	 				end
	 				
			    SetMissionByIndex(sceneId,humanObjId,misIndex,1,nNum+1)
			  	BeginEvent(sceneId)
					strText = format("已杀死木头人%d/5", GetMissionParam(sceneId,humanObjId,misIndex,1) )
					AddText(sceneId,strText);
			  	EndEvent(sceneId)
			  	DispatchMissionTips(sceneId,humanObjId)
	 			end
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x210231_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210231_OnItemChanged( sceneId, selfId, itemdataId )
end
