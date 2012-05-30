-- 200094 
-- 送信任务 

--MisDescBegin

--脚本号
x200094_g_ScriptId = 200094

--接受任务NPC属性
x200094_g_Position_X=125.5508
x200094_g_Position_Z=144.8913
x200094_g_SceneID=14
x200094_g_AccomplishNPC_Name="苏星河"

--任务号
x200094_g_MissionId = 33

--前续任务
x200094_g_PreMissionId = 32

--目标NPC
x200094_g_Name	="苏星河"

--任务归类
x200094_g_MissionKind = 53

--任务等级
x200094_g_MissionLevel = 60

--是否是精英任务
x200094_g_IfMissionElite = 0

--任务名
x200094_g_MissionName="珍珑棋会"
x200094_g_MissionInfo="#{Mis_juqing_0033}"
x200094_g_MissionTarget="#{Mis_juqing_Tar_0033}"
x200094_g_MissionComplete="  久闻$N大侠之名，今日一见果真是仪表非凡，长江后浪推前浪啊！"

x200094_g_MoneyBonus=18000
x200094_g_exp=37500

x200094_g_Custom	= { {id="已找到苏星河",num=1} }
x200094_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200094_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200094_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200094_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200094_g_Name then
			x200094_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x200094_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200094_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200094_g_MissionName)
				AddText(sceneId,x200094_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200094_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200094_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200094_g_ScriptId,x200094_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200094_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200094_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200094_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200094_g_Name then
			AddNumText(sceneId, x200094_g_ScriptId,x200094_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x200094_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200094_g_Name then
			AddNumText(sceneId,x200094_g_ScriptId,x200094_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200094_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200094_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel( sceneId, selfId ) < x200094_g_MissionLevel then
		return 0
	end
	
	-- 前续任务的完成情况
	if IsMissionHaveDone(sceneId,selfId,x200094_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--接受
--**********************************
function x200094_OnAccept( sceneId, selfId, targetId )
	if x200094_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200094_g_MissionId, x200094_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y接受任务：珍珑棋会",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200094_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x200094_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200094_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200094_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200094_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200094_g_MissionName)
		AddText(sceneId,x200094_g_MissionComplete)
		AddMoneyBonus( sceneId, x200094_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200094_g_ScriptId,x200094_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200094_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200094_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200094_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200094_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId,x200094_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200094_g_exp)
		DelMission( sceneId,selfId,  x200094_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200094_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：珍珑棋会",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200041), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200094_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200094_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200094_OnItemChanged( sceneId, selfId, itemdataId )
end
