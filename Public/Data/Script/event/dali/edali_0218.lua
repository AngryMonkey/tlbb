--特殊任务 给新手一只兔子
--角色等级小于10级就给一只兔子，一个角色一次
--MisDescBegin
--脚本号
x210218_g_ScriptId = 210218

--任务号
x210218_g_MissionId = 458

--任务目标npc
x210218_g_Name	="云飘飘" 

--任务归类
x210218_g_MissionKind = 13

--任务等级
x210218_g_MissionLevel = 1

--是否是精英任务
x210218_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
--任务是否已经完成
x210218_g_IsMissionOkFail = 0		--变量的第0位

--以上是动态**************************************************************

x210218_g_PetDataID = 3000

--任务文本描述
x210218_g_MissionName="我想要只兔子"
x210218_g_MissionInfo="好吧，看你是新来的，就给你一只兔子吧，你要好好的爱护它。"  --任务描述
x210218_g_MissionTarget="    叫我一声飘飘姐。"		--任务目标
x210218_g_ContinueInfo="这是我养的兔子中最可爱的一只，你要好好照顾它。"		--未完成任务的npc对话
x210218_g_MissionComplete="在大理好好玩。"					--完成任务npc说话的话

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x210218_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果玩家完成过这个任务（实际上如果完成了任务这里就不会显示，但是再检测一次比较安全）
    if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
		return
	end
	
	local ret, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, x210218_g_PetDataID, -1, 0) --给玩家生成一只珍兽
	if ret == 1 then 
		--下个窗口，提示玩家一些话
		BeginEvent(sceneId)
		AddText(sceneId,x210218_g_ContinueInfo)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		--完成任务
		MissionCom( sceneId,selfId, x210218_g_MissionId )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不能携带更多珍兽了。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--列举事件
--**********************************
function x210218_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x210218_g_MissionId) > 0 then
   	return 
	end
  --如果已接此任务
  --else
  if IsHaveMission(sceneId,selfId,x210218_g_MissionId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName,2,-1);
    --满足任务接收条件
    elseif x210218_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210218_g_ScriptId,x210218_g_MissionName,1,-1);
  end
end

--**********************************
--检测接受条件
--**********************************
function x210218_CheckAccept( sceneId, selfId )
	--需要8级才能接
	if GetLevel( sceneId, selfId ) >= 8  then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x210218_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x210218_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x210218_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x210218_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x210218_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210218_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x210218_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210218_OnItemChanged( sceneId, selfId, itemdataId )
end
