-- 200035 四面楚歌

--耶律洪基 让玩家和 对话， 在完成任务的时候，会有剧情（对话剧情）
--运筹帷幄  回苍茫山找耶律洪基，把耶律余睹的作战计划告诉他。

--************************************************************************
--MisDescBegin
--脚本号
x200035_g_ScriptId = 200035

--任务号
x200035_g_MissionId = 30

--前续任务号
x200035_g_PreMissionId = 29

--目标NPC
x200035_g_Name = "萧峰"

--是否是精英任务
x200035_g_IfMissionElite = 1

--任务等级
x200035_g_MissionLevel = 50

--任务归类
x200035_g_MissionKind = 52

--任务文本描述
x200035_g_MissionName="四面楚歌"
x200035_g_MissionInfo="#{Mis_juqing_0030}"
x200035_g_MissionTarget="#{Mis_juqing_Tar_0030}"	--任务目标
x200035_g_MissionComplete="  离开？不可能！我是不会走的，我和义兄义结金兰之时，对天盟誓，有福同享，有难同当，在这危机关头弃他与不顾，我萧峰是绝对不会做的。"	--完成任务npc说话的话

x200035_g_MoneyBonus=1800
x200035_g_exp=1440

x200035_g_Custom	= { {id="已找到萧峰",num=1} }
--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200035_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0)  then
		-- 检测是不是在副本，再检测是不是，如果是就可以直完成任务，^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型是副本
			-- 检测下名字，安全点点
			if GetName(sceneId, targetId) == x200035_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200035_g_MissionName)
				AddText(sceneId,x200035_g_MissionComplete)
				AddMoneyBonus( sceneId, x200035_g_MoneyBonus )
		    EndEvent( )
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200035_g_ScriptId,x200035_g_MissionId)
			end
		end
	
	--满足任务接收条件
	elseif x200035_CheckAccept(sceneId, selfId, targetId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
		AddText(sceneId,x200035_g_MissionName)
		AddText(sceneId,x200035_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200035_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200035_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200035_g_ScriptId,x200035_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200035_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0 then
		--需要在副本才可以
		if GetName(sceneId, targetId) == x200035_g_Name    then
			AddNumText(sceneId, x200035_g_ScriptId,x200035_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200035_CheckAccept(sceneId,selfId,targetId) > 0 then	
		AddNumText(sceneId,x200035_g_ScriptId,x200035_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200035_CheckAccept( sceneId, selfId, targetId )
	--判定条件
	--1，前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200035_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200035_g_MissionId) > 0  then
		return 0
	end
	
	--2，等级达到50
	if GetLevel(sceneId, selfId) < x200035_g_MissionLevel   then
		return 0
	end
	
	--检测是不是皇帝
	if GetName(sceneId, targetId) ~= "耶律洪基"    then
		return 0
	end
	
	return 1
end


--**********************************
--接受
--**********************************
function x200035_OnAccept( sceneId, selfId, targetId )

	if x200035_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200035_g_MissionId, x200035_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y接受任务：四面楚歌",MSG2PLAYER_PARA )

	-- 这里有喊话的剧情，需要添加
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200035_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)

end

--**********************************
--放弃
--**********************************
function x200035_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200035_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200035_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200035_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200035_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交的条件判定
	-- 1，有这个任务，
	if( IsHaveMission(sceneId,selfId,x200035_g_MissionId) > 0)  then
		AddMoney(sceneId,selfId,x200035_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200035_g_exp)
		DelMission( sceneId,selfId,  x200035_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200035_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：四面楚歌",MSG2PLAYER_PARA )
		
		-- 第一段剧情，楚王喊话后，按照路线走。
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 1  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 1)
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		end
		
	end
end

--**********************************
--定时事件
--**********************************
function x200035_OnTimer(sceneId,selfId)

end

--**********************************
--杀死怪物或玩家
--**********************************
function x200035_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200035_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200035_OnItemChanged( sceneId, selfId, itemdataId )
	
end

