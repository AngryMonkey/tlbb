--人之初--把一件衣服送给小乞丐
--段延庆
--MisDescBegin
--脚本号
x210227_g_ScriptId = 210227

--任务号
x210227_g_MissionId = 707

--上一个任务的ID
x210227_g_MissionIdPre = 706

--目标NPC
x210227_g_Name	="段延庆"

--任务归类
x210227_g_MissionKind = 13

--任务等级
x210227_g_MissionLevel = 8

--是否是精英任务
x210227_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x210227_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

--任务文本描述
x210227_g_MissionName="送布衣"
x210227_g_MissionInfo="#{event_dali_0038}"
x210227_g_MissionTarget="#{event_dali_0039}"
x210227_g_ContinueInfo="  [你已经把#Y布衣#W送到#R小乞丐#W手中了吗？]"
x210227_g_MissionComplete="  [嗯，看来你这个年轻人很不简单啊。]"
x210227_g_SignPost = {x = 199, z = 256, tip = "小乞丐"}
x210227_g_Custom	= { {id="给小乞丐送布衣！",num=1} }
--任务奖励
x210227_g_MoneyBonus=100
--g_ItemBonus={{id=40002108,num=1}}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210227_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    --if IsMissionHaveDone(sceneId,selfId,x210227_g_MissionId) > 0 then
	--	return
	--end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210227_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210227_g_MissionName)
			AddText(sceneId,x210227_g_ContinueInfo)
			--for i, item in g_DemandItem do
			--	AddItemDemand( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210227_g_MoneyBonus )
		EndEvent()
		bDone = x210227_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210227_g_ScriptId,x210227_g_MissionId,bDone)		
    --满足任务接收条件
    elseif x210227_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210227_g_MissionName)
			AddText(sceneId,x210227_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}")
			AddText(sceneId,x210227_g_MissionTarget)
			--for i, item in g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
			--for i, item in g_RadioItemBonus do
			--	AddRadioItemBonus( sceneId, item.id, item.num )
			--end
			AddMoneyBonus( sceneId, x210227_g_MoneyBonus )
			EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210227_g_ScriptId,x210227_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210227_OnEnumerate( sceneId, selfId, targetId )
    --如果玩家还未完成上一个任务
    if 	IsMissionHaveDone(sceneId,selfId,x210227_g_MissionIdPre) <= 0 then
    	return
    end
    --如果玩家完成过这个任务
    if IsMissionHaveDone(sceneId,selfId,x210227_g_MissionId) > 0 then
    	return 
	end
    --如果已接此任务
    if IsHaveMission(sceneId,selfId,x210227_g_MissionId) > 0 then
		AddNumText(sceneId,x210227_g_ScriptId,x210227_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x210227_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210227_g_ScriptId,x210227_g_MissionName,1,-1);
	end
end

--**********************************
--检测接受条件
--**********************************
function x210227_CheckAccept( sceneId, selfId )
	--需要8级才能接
	if GetLevel( sceneId, selfId ) >= 8 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210227_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	AddMission( sceneId,selfId, x210227_g_MissionId, x210227_g_ScriptId, 1, 0, 0 )		--添加任务
	misIndex = GetMissionIndexByID(sceneId,selfId,x210227_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：送布衣",MSG2PLAYER_PARA )
	CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210227_g_SignPost.x, x210227_g_SignPost.z, x210227_g_SignPost.tip )
end

--**********************************
--放弃
--**********************************
function x210227_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210227_g_MissionId )
	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x210227_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x210227_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x210227_g_MissionName)
		AddText(sceneId,x210227_g_MissionComplete)
		AddMoneyBonus( sceneId, x210227_g_MoneyBonus )
		--for i, item in g_ItemBonus do
		--	AddItemBonus( sceneId, item.id, item.num )
		--end
		--for i, item in g_RadioItemBonus do
		--	AddRadioItemBonus( sceneId, item.id, item.num )
		--end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x210227_g_ScriptId,x210227_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x210227_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210227_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x210227_g_MissionId)
    num = GetMissionParam(sceneId,selfId,misIndex,0)
    if num == 1 then
		return 1
	end
	return 0
end

--**********************************
--提交
--**********************************
function x210227_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x210227_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
    	--BeginAddItem(sceneId)
		--	for i, item in g_ItemBonus do
		--		AddItem( sceneId,item.id, item.num )
		--	end
		--ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		--if ret > 0 then
		--else
		--任务奖励没有加成功
		--	BeginEvent(sceneId)
		--		strText = "背包已满,无法完成任务"
		--		AddText(sceneId,strText);
		--	EndEvent(sceneId)
		--	DispatchMissionTips(sceneId,selfId)
		--end
		AddMoney(sceneId,selfId,x210227_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, 500)
		--扣除任务物品
		--for i, item in g_DemandItem do
		--	DelItem( sceneId, selfId, item.id, item.num )
		--end
		ret = DelMission( sceneId, selfId, x210227_g_MissionId )
		if ret > 0 then
			MissionCom( sceneId, selfId, x210227_g_MissionId )
			--AddItemListToHuman(sceneId,selfId)
			Msg2Player(  sceneId, selfId,"#Y完成任务：送布衣",MSG2PLAYER_PARA )
			CallScriptFunction( 210228, "OnDefaultEvent",sceneId, selfId, targetId)
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210227_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210227_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210227_OnItemChanged( sceneId, selfId, itemdataId )
end
