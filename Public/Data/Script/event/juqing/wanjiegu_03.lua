-- 微笑之旅

--MisDescBegin
--脚本号
x200003_g_ScriptId = 200003

--任务号
x200003_g_MissionId = 3

--前续任务号
x200003_g_PreMissionId = 2

--目标NPC
x200003_g_Name	="钟灵"
x200003_g_Name1 ="万劫谷石敢当"

--任务归类
x200003_g_MissionKind = 51

--任务等级
x200003_g_MissionLevel = 20

--是否是精英任务
x200003_g_IfMissionElite = 0

--任务名
x200003_g_MissionName="微笑之旅"
--任务描述
x200003_g_MissionInfo="#{Mis_juqing_0003}"
--任务目标
x200003_g_MissionTarget="#{Mis_juqing_Tar_0003}"		
--提交时npc的话
x200003_g_MissionComplete="  <你在这座密不透风的石屋的前边找到一个石敢当，从石敢当旁边的缝隙里可以听到段誉的声音。>"		

x200003_g_MoneyBonus=100
x200003_g_exp=5600

x200003_g_Custom	= { {id="已护送钟灵",num=1} }

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x200003_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if IsHaveMission(sceneId,selfId,x200003_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x200003_g_Name1  then
			--需要任务完成才可以
			--local misIndex = GetMissionIndexByID(sceneId, selfId, x200003_g_MissionId)--得到任务在20个任务中的序列号
			--if GetMissionParam(sceneId, selfId, misIndex, 0) == 1	then   --如果护送完成
			if LuaFnGetCopySceneData_Param(sceneId, 11) == 7  then
				BeginEvent(sceneId)
					AddText(sceneId,x200003_g_Name)
					AddText(sceneId,x200003_g_MissionComplete)
					AddText(sceneId,"#{M_MUBIAO}#r")
					AddText(sceneId,x200003_g_MissionTarget)
				EndEvent( )
				DispatchMissionContinueInfo(sceneId, selfId, targetId, x200003_g_ScriptId, x200003_g_MissionId)
			end
		end
		
	elseif x200003_CheckAccept(sceneId,selfId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId, x200003_g_MissionName)
			AddText(sceneId, x200003_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId, x200003_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200003_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200003_g_ScriptId,x200003_g_MissionId)
	end	
end

--**********************************
--列举事件
--**********************************
function x200003_OnEnumerate( sceneId, selfId, targetId )
	if LuaFnGetCopySceneData_Param(sceneId, 11) ~= 0  then
		if GetName(sceneId, targetId) == x200003_g_Name then
			return
		end
	end

	if 0 > GetLevel(sceneId, selfId)  then
		return
	end
	
	-- 如果前续任务1没有完成，就返回
	if IsMissionHaveDone(sceneId, selfId, 2) <= 0   then
		return
	end
	-- 如果本任务已经完成，就返回
	if IsMissionHaveDone(sceneId, selfId, x200003_g_MissionId) > 0 then
   	return
	--满足任务接收条件
	elseif IsHaveMission(sceneId, selfId, x200003_g_MissionId) > 0 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x200003_g_MissionId)--得到任务在20个任务中的序列号

		if GetMissionParam(sceneId, selfId, misIndex, 0) ~= 1	then   --如果护送完成
			if GetName(sceneId, targetId) == x200003_g_Name then
				--BeginEvent(sceneId)
					AddNumText(sceneId, x200003_g_ScriptId, x200003_g_MissionName,2,-1);
				--EndEvent()	
				DispatchEventList(sceneId, selfId, targetId)
			end
		end
		
		if GetName(sceneId, targetId) == x200003_g_Name1  then
			--if GetMissionParam(sceneId, selfId, misIndex, 0) == 1	then   --如果护送完成
			if LuaFnGetCopySceneData_Param(sceneId, 11) == 7 then
				--BeginEvent(sceneId)
					AddNumText(sceneId, x200003_g_ScriptId, x200003_g_MissionName,2,0);
				--EndEvent()	
				DispatchEventList(sceneId, selfId, targetId)
			end
		end
		
	--满足任务接收条件
  elseif x200003_CheckAccept(sceneId, selfId) > 0 then
		if GetName(sceneId, targetId) == x200003_g_Name then
			--BeginEvent(sceneId)
				AddNumText(sceneId, x200003_g_ScriptId, x200003_g_MissionName,1,-1);
			--EndEvent()
			DispatchEventList(sceneId, selfId, targetId)	
		end
  end
end

--**********************************
-- 
--**********************************
function x200003_OnLockedTarget( sceneId, selfId, targetId )

end

--**********************************
--检测接受条件
--**********************************
function x200003_CheckAccept( sceneId, selfId )
	-- 接任务的条件是，人物达到20级以上，并且完成了前续任务
	if GetLevel(sceneId, selfId) < 20   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200003_g_PreMissionId ) < 1   then
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
function x200003_OnAccept( sceneId, selfId, targetId )

	if x200003_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	-- 检测玩家是不是已经完成过这个任务
	if IsMissionHaveDone(sceneId, selfId, x200003_g_MissionId) > 0   then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200003_g_MissionId, x200003_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#Y接受任务：微笑之旅",MSG2PLAYER_PARA )
	
	-- 通知副本计时器，开始护送剧情
	if LuaFnGetCopySceneData_Param(sceneId, 11) == 0 then
		LuaFnSetCopySceneData_Param(sceneId, 11, 1)
		LuaFnSetCopySceneData_Param(sceneId, 12, targetId)
	end
	
end

--**********************************
--放弃
--**********************************
function x200003_OnAbandon( sceneId, selfId )
  --将护送npc瞬移回原来位置
  DelMission(sceneId, selfId, x200003_g_MissionId)
  
end

--**********************************
--继续
--**********************************
function x200003_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200003_g_Name)
		AddText(sceneId,x200003_g_MissionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200003_g_MissionTarget)
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200003_g_ScriptId, x200003_g_MissionId)

end

--**********************************
--检测是否可以提交
--**********************************
function x200003_CheckSubmit( sceneId, selfId )

	--1, 是否有这个任务
	if IsHaveMission(sceneId,selfId,x200003_g_MissionId) < 1 then
		return 0;
	end
	
	--2, 是否已经完成这个任务
	if IsMissionHaveDone(sceneId,selfId,x200003_g_MissionId) > 0  then
		return 0;
	end

	--3, 任务特定判断
	local bComplete = LuaFnGetCopySceneData_Param(sceneId, 11)
	if bComplete > 6 then
		return 1
	else
		return 0
	end
	
end

--**********************************
--提交
--**********************************
function x200003_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- 检测是不是满足完成任务的条件
	if x200003_CheckSubmit(sceneId, selfId) < 1 then 
		return
	end

	if DelMission( sceneId,selfId, x200003_g_MissionId ) ~= 1 then
		return
	end

	--设置任务已经被完成过
	MissionCom( sceneId,selfId, x200003_g_MissionId )

	AddMoney(sceneId,selfId,x200003_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId,x200003_g_exp)
	

	Msg2Player(  sceneId, selfId,"#Y完成任务：微笑之旅",MSG2PLAYER_PARA )

	-- 调用后续任务
	CallScriptFunction((200004), "OnDefaultEvent",sceneId, selfId, targetId )
	
end

function x200003_OnHumanDie(sceneId, selfId)
end

--**********************************
--定时事件
--**********************************
function x200003_OnTimer(sceneId,selfId)
end
