--捉珍兽任务

--************************************************************************
--MisDescBegin

--脚本号
x210221_g_ScriptId = 210221

--上一个任务的ID
x210221_g_MissionIdPre = 700

--任务号
x210221_g_MissionId = 701

--任务目标npc
x210221_g_Name	="云飘飘"

--任务归类
x210221_g_MissionKind = 13

--任务等级
x210221_g_MissionLevel = 7

--是否是精英任务
x210221_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--任务是否已经完成
x210221_g_IsMissionOkFail = 0		--变量的第0位
--**********************************以上是动态****************************

--任务文本描述
x210221_g_MissionName="捉住珍兽啦"
x210221_g_MissionInfo="#{event_dali_0029}"  --任务描述
x210221_g_MissionTarget="#{event_dali_0030}"		--任务目标
x210221_g_ContinueInfo="你已经捉到小鸭子了？"		--未完成任务的npc对话
x210221_g_MissionComplete="#{event_dali_0031}"					--完成任务npc说话的话
x210221_g_SignPost = {x = 275, z = 50, tip = "黄眉僧"}

--任务奖励
x210221_g_MoneyBonus=20

--MisDescEnd
--************************************************************************

--角色Mission变量说明
x210221_g_Param_ok=0	--0号：当前任务是否完成(0未完成；1完成)
--1号：未用
--2号：未用
--3号：未用
--4号：未用
--5号：未用
--6号：未用
--7号：未用
x210221_g_PetDataID=558	--任务珍兽的编号


--任务入口函数
--**********************************
function x210221_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if IsHaveMission(sceneId,selfId,x210221_g_MissionId) > 0 then	--如果已接此任务
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210221_g_MissionName)
			AddText(sceneId,x210221_g_ContinueInfo)
			AddMoneyBonus( sceneId, x210221_g_MoneyBonus )
		EndEvent( )
		bDone = x210221_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210221_g_ScriptId,x210221_g_MissionId,bDone)
	elseif x210221_CheckAccept(sceneId,selfId) > 0 then		--满足任务接收条件
		--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x210221_g_MissionName)
				AddText(sceneId,x210221_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}")
				AddText(sceneId,x210221_g_MissionTarget)
				--for i, item in g_ItemBonus do
				--	AddItemBonus( sceneId, item.id, item.num )
				--end
				AddMoneyBonus( sceneId, x210221_g_MoneyBonus )
				EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210221_g_ScriptId,x210221_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x210221_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210221_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x210221_g_MissionId) > 0 then
		return
	end
    if IsHaveMission(sceneId,selfId,x210221_g_MissionId) > 0 then
			AddNumText(sceneId,x210221_g_ScriptId,x210221_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x210221_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x210221_g_ScriptId,x210221_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210221_CheckAccept( sceneId, selfId )
	--接收条件
	if GetLevel( sceneId, selfId ) >= x210221_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210221_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMissionEx( sceneId,selfId, x210221_g_MissionId, x210221_g_ScriptId )		--添加任务
	SetMissionEvent(sceneId,selfId, x210221_g_MissionId,3)	--设置任务事件，3表示珍兽变化事件

	misIndex = GetMissionIndexByID(sceneId,selfId,x210221_g_MissionId)	--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,x210221_g_Param_ok,0)	--根据序列号把任务变量的第0位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：捉住珍兽啦",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210221_g_SignPost.x, x210221_g_SignPost.z, x210221_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210221_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210221_g_MissionId )
	petcount = LuaFnGetPetCount(sceneId, selfId) --取得珍兽数量
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --取得珍兽编号
		if petdataid==x210221_g_PetDataID then
			LuaFnDeletePet(sceneId, selfId, i)
		end
	end
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210221_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210221_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210221_g_MissionName)
		AddText(sceneId,x210221_g_MissionComplete)
		AddMoneyBonus( sceneId, x210221_g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210221_g_ScriptId,x210221_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210221_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210221_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	-- 检查玩家身上是不是有这样的宠物
	local nPetCount = LuaFnGetPetCount(sceneId, selfId)
	
	for i=0, nPetCount-1  do
		local nPetId = LuaFnGetPet_DataID(sceneId, selfId, i)
		
		if nPetId==558   then
			return 1
		end
	end

	return 0
end

--**********************************
--提交
--**********************************
function x210221_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	--
	if x210221_CheckSubmit( sceneId, selfId ) < 1  then
		return
	end	
	
--	local ret1 = LuaFnDeletePet(sceneId, selfId, selectRadioId ) --删除珍兽
--	if ret1 > 0 then
		local ret0 = DelMission( sceneId, selfId, x210221_g_MissionId ) --删除任务
		if ret0>0  then
			AddMoney(sceneId,selfId,x210221_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,700)
			MissionCom( sceneId,selfId, x210221_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y完成任务：捉住珍兽啦",MSG2PLAYER_PARA )
			CallScriptFunction( 210223, "OnDefaultEvent",sceneId, selfId, targetId)
			BeginEvent(sceneId)
				strText = "完成任务：捉住珍兽啦"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
--	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210221_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x210221_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210221_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--珍兽改变
--**********************************
function x210221_OnPetChanged( sceneId, selfId, petdataId )
	if petdataId==x210221_g_PetDataID then --是任务珍兽
		misIndex = GetMissionIndexByID(sceneId,selfId,x210221_g_MissionId)	--得到任务的序列号
		SetMissionByIndex(sceneId,selfId,misIndex,x210221_g_Param_ok,1)	--根据序列号把任务变量的第0位置1

		BeginEvent(sceneId)
			strText = "捉到珍兽啦，任务完成!"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--玩家提交的物品及珍兽
--**********************************
function x210221_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end

--**********************************
--玩家提交的物品及珍兽
--**********************************
function x210221_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
end
