-- 大进军

--MisDescBegin
--脚本号
x200007_g_ScriptId = 200007

--任务号
x200007_g_MissionId = 7

--前续任务
x200007_g_PreMissionId = 6

--目标NPC
x200007_g_Name	="段正淳"
x200007_g_Name1 ="段正明"

--任务归类
x200007_g_MissionKind = 51

--任务等级
x200007_g_MissionLevel = 20

--是否是精英任务
x200007_g_IfMissionElite = 0

--任务名
x200007_g_MissionName="大进军"
--任务描述
x200007_g_MissionInfo="#{Mis_juqing_0007}"
--任务目标
x200007_g_MissionTarget="#{Mis_juqing_Tar_0007}"		

x200007_g_MissionContinue="  你找我有什么事情吗？"
--提交时npc的话
x200007_g_MissionComplete="  你们终于来了。"

x200007_g_MoneyBonus=1580
x200007_g_exp=12000

x200007_g_Custom	= { {id="已护送段正淳",num=1} }

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x200007_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )	--点击该任务后执行此脚本
	
	if IsHaveMission(sceneId,selfId,x200007_g_MissionId) > 0 then
		BeginEvent(sceneId)
			AddText(sceneId, x200007_g_MissionName)
			AddText(sceneId, x200007_g_MissionContinue)
			--AddText(sceneId,"#{M_SHOUHUO}#r")
			--AddMoneyBonus( sceneId, x200007_g_MoneyBonus )
		EndEvent( )
		local bDone = x200007_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200007_g_ScriptId,x200007_g_MissionId,bDone)
	elseif x200007_CheckAccept(sceneId,selfId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId, x200007_g_MissionName)
			AddText(sceneId, x200007_g_MissionInfo)
			AddText(sceneId, "#{M_MUBIAO}#r")
			AddText(sceneId, x200007_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200007_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200007_g_ScriptId,x200007_g_MissionId)
	end	
end

--**********************************
--列举事件
--**********************************
function x200007_OnEnumerate( sceneId, selfId, targetId )
	if 0 > GetLevel(sceneId, selfId)  then
		return
	end
	
	-- 如果前续任务1没有完成，就返回
	if IsMissionHaveDone(sceneId, selfId, 6) <= 0   then
		return
	end
	-- 如果本任务已经完成，就返回
	if IsMissionHaveDone(sceneId, selfId, x200007_g_MissionId) > 0 then
   	return
	--满足任务接收条件
	elseif IsHaveMission(sceneId, selfId, x200007_g_MissionId) > 0 then

		if GetName(sceneId, targetId) == x200007_g_Name1  then
			--local misIndex = GetMissionIndexByID(sceneId, selfId, x200007_g_MissionId) 
			--if GetMissionParam(sceneId, selfId, misIndex, 0) == 1 	then   --如果护送完成
			if LuaFnGetCopySceneData_Param(sceneId, 11) >= 4   then
				AddNumText(sceneId, x200007_g_ScriptId, x200007_g_MissionName,2,0);
			end
		end

	--满足任务接收条件
  elseif x200007_CheckAccept(sceneId, selfId) > 0 then
		if GetName(sceneId, targetId) == x200007_g_Name then
			AddNumText(sceneId, x200007_g_ScriptId, x200007_g_MissionName,1,-1);
		end
  end
end

--**********************************
-- 
--**********************************
function x200007_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

end

--**********************************
--检测接受条件
--**********************************
function x200007_CheckAccept( sceneId, selfId )
	-- 接任务的条件是，人物达到20级以上，并且完成了前续任务
	if GetLevel(sceneId, selfId) < 20   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200007_g_PreMissionId ) < 1   then
		return 0
	end
	
	-- 如果护送已经开始，就不能再接这个任务
	if LuaFnGetCopySceneData_Param(sceneId, 25) == 1   then
		return 0
	end

	return 1

end

--**********************************
--接受
--**********************************
function x200007_OnAccept( sceneId, selfId, targetId )

	if x200007_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x200007_g_MissionId) > 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200007_g_MissionId, x200007_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：大进军",MSG2PLAYER_PARA )

	-- 通知副本场景计时器，开启护送剧情
	if LuaFnGetCopySceneData_Param(sceneId, 11) == 0 then
		LuaFnSetCopySceneData_Param(sceneId, 11, 1)
		LuaFnSetCopySceneData_Param(sceneId, 12, targetId)
	end
	
	-- 开始护送后，删除  万劫谷卫兵 
	local nMonsterNum1 = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum1-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		if GetName(sceneId, nMonsterId)  == "万劫谷卫兵"  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end

	LuaFnSetCopySceneData_Param(sceneId, 25, 1)

end

--**********************************
--放弃
--**********************************
function x200007_OnAbandon( sceneId, selfId )
  --将护送npc瞬移回原来位置
  DelMission(sceneId, selfId, x200007_g_MissionId)
  
end

--**********************************
--继续
--**********************************
function x200007_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200007_g_MissionName)
		AddText(sceneId,x200007_g_MissionComplete)
	EndEvent( )
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200007_g_ScriptId, x200007_g_MissionId)

end

--**********************************
--检测是否可以提交
--**********************************
function x200007_CheckSubmit( sceneId, selfId )
	
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x200007_g_MissionId) 
	--local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)
	
	--1, 是否有这个任务
	if IsHaveMission(sceneId,selfId,x200007_g_MissionId) < 1 then
		return 0;
	end
	
	--2, 是否已经完成这个任务
	if IsMissionHaveDone(sceneId,selfId,x200007_g_MissionId) > 0  then
		return 0;
	end

	--3, 任务特定判断	
	local bComplete = LuaFnGetCopySceneData_Param(sceneId, 11)
	if bComplete >=4  then
		return 1
	else
		return 0
	end
	
end

--**********************************
--提交
--**********************************
function x200007_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )

	-- 检测是不是满足完成任务的条件
	if x200007_CheckSubmit(sceneId, selfId ) ~= 1   then
		return
	end

	if DelMission( sceneId,selfId, x200007_g_MissionId ) ~= 1 then
		return
	end

	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x200007_g_MissionId )
	AddMoney(sceneId,selfId,x200007_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200007_g_exp)
	
	Msg2Player(  sceneId, selfId,"#Y完成任务：大进军",MSG2PLAYER_PARA )

	-- 调用后续任务
	CallScriptFunction((200008), "OnDefaultEvent",sceneId, selfId, targetId )

end

function x200007_OnHumanDie(sceneId, selfId)

end

--**********************************
--定时事件
--**********************************
function x200007_OnTimer(sceneId,selfId)--,missionIndex)

end
