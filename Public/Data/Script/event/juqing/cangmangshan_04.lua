-- 运筹帷幄  回苍茫山找耶律洪基，把耶律余睹的作战计划告诉他。


--************************************************************************
--MisDescBegin
--脚本号
x200033_g_ScriptId = 200033

--任务号
x200033_g_MissionId = 29

--前续任务号
x200033_g_PreMissionId = 28

--目标NPC
x200033_g_Name = "耶律洪基"

--是否是精英任务
x200033_g_IfMissionElite = 1

--任务等级
x200033_g_MissionLevel = 50

--任务归类
x200033_g_MissionKind = 52

--任务文本描述
x200033_g_MissionName="运筹帷幄"
x200033_g_MissionInfo="#{Mis_juqing_0029}"
x200033_g_MissionTarget="#{Mis_juqing_Tar_0029}"	--任务目标
x200033_g_MissionComplete="  #{TM_20080313_01}"	--完成任务npc说话的话

x200033_g_MoneyBonus=18000
x200033_g_exp=24000

x200033_g_Custom	= { {id="已找到耶律洪基",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200033_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200033_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200033_g_MissionId) > 0)  then
		-- 检测是不是在副本，再检测是不是，如果是就可以直完成任务，^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型是副本
			-- 检测下名字，安全点点
			if GetName(sceneId, targetId) == x200033_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200033_g_MissionName)
				AddText(sceneId,x200033_g_MissionComplete)
				AddMoneyBonus( sceneId, x200033_g_MoneyBonus )
		    EndEvent( )
		    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200033_g_ScriptId,x200033_g_MissionId)
			end
		end
	
	--满足任务接收条件
	elseif x200033_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
		AddText(sceneId,x200033_g_MissionName)
		AddText(sceneId,x200033_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200033_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200033_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200033_g_ScriptId,x200033_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200033_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200033_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200033_g_MissionId) > 0 then
		--需要在副本才可以
		local sceneType = LuaFnGetSceneType(sceneId) ;
		if sceneType == 1 then --场景类型是副本
			AddNumText(sceneId, x200033_g_ScriptId,x200033_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200033_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200033_g_ScriptId,x200033_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200033_CheckAccept( sceneId, selfId )
	--判定条件
	--1，前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200033_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200033_g_MissionId) > 0  then
		return 0
	end
	
	--2，等级达到20
	if GetLevel(sceneId, selfId) < x200033_g_MissionLevel   then
		return 0
	end

	--3，场景不是副本
	local sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType == 1 then --场景类型是副本
		return 0
	end
	
	return 1
end


--**********************************
--接受
--**********************************
function x200033_OnAccept( sceneId, selfId, targetId )

	if x200033_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200033_g_MissionId, x200033_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#{TM_20080313_02}" , MSG2PLAYER_PARA )
		return
	end
	
	Msg2Player(  sceneId, selfId,"#{TM_20080313_03}",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200033_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--放弃
--**********************************
function x200033_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200033_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200033_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200033_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x200033_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交的条件判定
	-- 1，有这个任务，
	if( IsHaveMission(sceneId,selfId,x200033_g_MissionId) > 0)  then
		--添加任务奖励
		AddMoney(sceneId,selfId,x200033_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200033_g_exp)

		DelMission( sceneId,selfId,  x200033_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200033_g_MissionId )
		Msg2Player(  sceneId, selfId,"#{TM_20080313_04}",MSG2PLAYER_PARA )

		-- 调用后续任务
		CallScriptFunction((200035), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200033_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200033_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200033_OnItemChanged( sceneId, selfId, itemdataId )
	
end

