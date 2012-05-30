-- 200055 我的爱情不是梦
-- 将李秋水去世的消息通知洛阳城的赫连铁树。

--************************************************************************
--MisDescBegin
--脚本号
x200055_g_ScriptId = 200055

--任务号
x200055_g_MissionId = 44

--前续任务号
x200055_g_PreMissionId = 43

--目标NPC
x200055_g_Name = "虚竹"

--是否是精英任务
x200055_g_IfMissionElite = 1

--任务等级
x200055_g_MissionLevel = 70

--任务归类
x200055_g_MissionKind = 49

--任务文本描述
x200055_g_MissionName="我的爱情不是梦"
x200055_g_MissionInfo="#{Mis_juqing_0044}"
x200055_g_MissionTarget="#{Mis_juqing_Tar_0044}"	--任务目标
x200055_g_MissionComplete="  啊？什么，我被选中了？"


x200055_g_MoneyBonus=9000
x200055_g_exp=17280

x200055_g_Custom	= { {id="已找到虚竹",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200055_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200055_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200055_g_MissionId) > 0)  then
		-- 检测是不是在副本，再检测是不是，如果是就可以直完成任务，^_^
			-- 检测下名字，安全点点
		if GetName(sceneId, targetId) == x200055_g_Name  then
	    BeginEvent(sceneId)
				AddText(sceneId,x200055_g_MissionName)
				AddText(sceneId,x200055_g_MissionComplete)
				AddMoneyBonus( sceneId, x200055_g_MoneyBonus )
	    EndEvent( )
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x200055_g_ScriptId,x200055_g_MissionId)
		end
	
	--满足任务接收条件
	elseif x200055_CheckAccept(sceneId, selfId, targetId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200055_g_MissionName)
			AddText(sceneId,x200055_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200055_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200055_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200055_g_ScriptId,x200055_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200055_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200055_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200055_g_MissionId) > 0 then
		--需要在副本才可以
		if GetName(sceneId, targetId) == x200055_g_Name    then
			AddNumText(sceneId, x200055_g_ScriptId,x200055_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200055_CheckAccept(sceneId,selfId,targetId) > 0 then	
		if GetName(sceneId, targetId) == "晓蕾"    then
			AddNumText(sceneId,x200055_g_ScriptId,x200055_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200055_CheckAccept( sceneId, selfId, targetId )

	--判定条件
	--1，前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200055_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200055_g_MissionId) > 0  then
		return 0
	end
	
	if LuaFnGetCopySceneData_Param(sceneId, 15) ~= 1 then
		return 0
	end
	
	--2，等级达到50
	if GetLevel(sceneId, selfId) < 70   then
		return 0
	end
	
	return 1
end


--**********************************
--接受
--**********************************
function x200055_OnAccept( sceneId, selfId, targetId )

	if x200055_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200055_g_MissionId, x200055_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y接受任务：我的爱情不是梦",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200055_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--定时事件
--**********************************
function x200055_OnTimer(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x200055_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200055_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200055_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200055_CheckSubmit( sceneId, selfId, selectRadioId )
  local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200055_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200055_g_MissionId)--得到任务在20个任务中的序列号
	local bDone = GetMissionParam( sceneId,selfId,misIndex,0 )
	
	if bDone == 1  then
		return 1
	end
	return 0
	
end

--**********************************
--提交
--**********************************
function x200055_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交的条件判定
	if x200055_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		if DelMission( sceneId, selfId, x200055_g_MissionId ) ~=1 then
			return
		end
		MissionCom( sceneId, selfId, x200055_g_MissionId )
		--添加任务奖励
		AddMoney(sceneId,selfId, x200055_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200055_g_exp)

		Msg2Player( sceneId, selfId, "#Y完成任务：我的爱情不是梦", MSG2PLAYER_PARA )
	
		--给奖励和金钱

		-- 调用后续任务
		CallScriptFunction((200056), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200055_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200055_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200055_OnItemChanged( sceneId, selfId, itemdataId )
	
end


