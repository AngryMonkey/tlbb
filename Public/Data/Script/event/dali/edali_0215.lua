--练珍兽任务

--************************************************************************
--MisDescBegin

--脚本号
x210215_g_ScriptId = 210215

--上一个任务的ID
x210215_g_MissionIdPre = 454

--任务号
x210215_g_MissionId = 455

--任务目标npc
x210215_g_Name	="云飘飘"

--任务归类
x210215_g_MissionKind = 13

--任务等级
x210215_g_MissionLevel = 5

--是否是精英任务
x210215_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******

--**********************************以上是动态****************************

--任务文本描述
x210215_g_MissionName="珍兽升级啦"
x210215_g_MissionInfo="#{event_dali_0021}"  --任务描述
x210215_g_MissionTarget="#{event_dali_0022}"		--任务目标
x210215_g_ContinueInfo="  小兔子升到2级了吗？"		--未完成任务的npc对话
x210215_g_MissionComplete="#{event_dali_0023}"					--完成任务npc说话的话
x210215_g_SignPost = {x = 263, z = 129, tip = "云飘飘"}

--任务奖励
x210215_g_MoneyBonus=20

--MisDescEnd
--************************************************************************

--角色Mission变量说明
--0号：未用
--1号：未用
--2号：未用
--3号：未用
--4号：未用
--5号：未用
--6号：未用
--7号：未用
x210215_g_PetNeedLevel=2	--需要将珍兽练到的等级
x210215_g_PetDataID=559	--任务珍兽的编号

--**********************************
--任务入口函数
--**********************************
function x210215_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	if IsHaveMission(sceneId,selfId,x210215_g_MissionId) > 0 then --如果已接此任务
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210215_g_MissionName)
			AddText(sceneId,x210215_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
		EndEvent( )
		bDone = x210215_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId,bDone)
	elseif x210215_CheckAccept(sceneId,selfId) > 0 then --满足任务接收条件
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210215_g_MissionName)
			AddText(sceneId,x210215_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210215_g_MissionTarget)
			AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210215_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210215_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210215_g_MissionId) > 0 then
		return
	end
    if IsHaveMission(sceneId,selfId,x210215_g_MissionId) > 0 then
			AddNumText(sceneId,x210215_g_ScriptId,x210215_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x210215_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210215_g_ScriptId,x210215_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210215_CheckAccept( sceneId, selfId )

	if IsMissionHaveDone(sceneId,selfId,x210215_g_MissionId) > 0 then
		return 0
	end
	--接收条件
	if GetLevel( sceneId, selfId ) >= x210215_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210215_OnAccept( sceneId, selfId )

	if x210215_CheckAccept(sceneId, selfId) ~= 1 then
		return
	end
	
	local ret, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, x210215_g_PetDataID, -1, 0) --给玩家生成一只珍兽
	if ret==1 then
		--加入任务到玩家列表
		AddMission( sceneId,selfId, x210215_g_MissionId, x210215_g_ScriptId, 0, 0, 0 )	--添加任务
		BeginEvent(sceneId)
			strText = "你得到了一个珍兽!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y接受任务：珍兽升级啦",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210215_g_SignPost.x, x210215_g_SignPost.z, x210215_g_SignPost.tip )
	end
end

--**********************************
--放弃
--**********************************
function x210215_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210215_g_MissionId )
    --删除任务珍兽
	petcount = LuaFnGetPetCount(sceneId, selfId) --取得珍兽数量
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --取得珍兽编号
		if petdataid==x210215_g_PetDataID then
			local ret0 = LuaFnDeletePet(sceneId, selfId, i)
		end
   end
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210215_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210215_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210215_g_MissionName)
		AddText(sceneId,x210215_g_MissionComplete)
		AddMoneyBonus( sceneId, x210215_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210215_g_ScriptId,x210215_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210215_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210215_g_MissionId )

	-- 看玩家是不是有一个等级为2级的宠物，有就OK
	local nPetCount = LuaFnGetPetCount(sceneId, selfId)
	
	for i=0, nPetCount-1  do
		local nPetId = LuaFnGetPet_DataID(sceneId, selfId, i)
		local nPetLevel = LuaFnGetPet_Level(sceneId, selfId, i)
		
		if nPetId==559 and nPetLevel>=2  then
			return 1
		end
	end

	return 0
end

--**********************************
--提交
--**********************************
function x210215_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	--检测玩家是不是完成了
	if x210215_CheckSubmit( sceneId, selfId ) ~= 1   then
		return
	end

	AddMoney(sceneId,selfId,x210215_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,810)
	local ret0 = DelMission( sceneId, selfId, x210215_g_MissionId ) --删除任务
	if ret0>0  then
		MissionCom( sceneId,selfId, x210215_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：珍兽升级啦",MSG2PLAYER_PARA )
		CallScriptFunction( 210216, "OnDefaultEvent",sceneId, selfId, targetId)
	end

	BeginEvent(sceneId)
		strText = "完成任务"
		AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210215_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x210215_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210215_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--玩家提交的物品及珍兽
--**********************************
function x210215_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
end

