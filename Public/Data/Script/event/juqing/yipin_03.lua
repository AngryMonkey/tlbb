-- 200052 环佩空归月夜魂
-- 将李秋水去世的消息通知洛阳城的赫连铁树。

--************************************************************************
--MisDescBegin
--脚本号
x200052_g_ScriptId = 200052

--任务号
x200052_g_MissionId = 42

--前续任务号
x200052_g_PreMissionId = 41

--任务目标NPC属性
x200052_g_Position_X=113
x200052_g_Position_Z=64
x200052_g_SceneID=0
x200052_g_AccomplishNPC_Name="赫连铁树"

--目标NPC
x200052_g_Name = "赫连铁树"

--是否是精英任务
x200052_g_IfMissionElite = 1

--任务等级
x200052_g_MissionLevel = 70

--任务归类
x200052_g_MissionKind = 49

--任务文本描述
x200052_g_MissionName="环佩空归月夜魂"
x200052_g_MissionInfo="#{Mis_juqing_0042}"
x200052_g_MissionTarget="#{Mis_juqing_Tar_0042}"	--任务目标
x200052_g_MissionComplete="  啊，皇太妃竟然薨于道路……皇上必定悲痛欲绝啊。"


x200052_g_MoneyBonus=10800
x200052_g_exp=21600

x200052_g_Custom	= { {id="已找到赫连铁树",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200052_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200052_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200052_g_MissionId) > 0)  then
		-- 检测是不是在副本，再检测是不是，如果是就可以直完成任务，^_^
			-- 检测下名字，安全点点
		if GetName(sceneId, targetId) == x200052_g_Name  then
		    BeginEvent(sceneId)
					AddText(sceneId,x200052_g_MissionName)
					AddText(sceneId,x200052_g_MissionComplete)
					AddMoneyBonus( sceneId, x200052_g_MoneyBonus )
		    EndEvent( )
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x200052_g_ScriptId,x200052_g_MissionId)
		end
	
	--满足任务接收条件
	elseif x200052_CheckAccept(sceneId, selfId, targetId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200052_g_MissionName)
			AddText(sceneId,x200052_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200052_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200052_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200052_g_ScriptId,x200052_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200052_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200052_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200052_g_MissionId) > 0 then
		--需要在副本才可以
		if GetName(sceneId, targetId) == x200052_g_Name    then
			AddNumText(sceneId, x200052_g_ScriptId,x200052_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200052_CheckAccept(sceneId,selfId,targetId) > 0 then	
		if GetName(sceneId, targetId) == "虚竹"    then
			AddNumText(sceneId,x200052_g_ScriptId,x200052_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200052_CheckAccept( sceneId, selfId, targetId )
	--判定条件
	--1，前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200052_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200052_g_MissionId) > 0  then
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
function x200052_OnAccept( sceneId, selfId, targetId )

	if x200052_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200052_g_MissionId, x200052_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y接受任务：环佩空归月夜魂",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200052_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)

end

--**********************************
--定时事件
--**********************************
function x200052_OnTimer(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x200052_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200052_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200052_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200052_CheckSubmit( sceneId, selfId, selectRadioId )

end

--**********************************
--提交
--**********************************
function x200052_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交的条件判定
		--添加任务奖励
		AddMoney(sceneId,selfId, x200052_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200052_g_exp)

		DelMission( sceneId, selfId, x200052_g_MissionId )
		MissionCom( sceneId, selfId, x200052_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y完成任务：环佩空归月夜魂", MSG2PLAYER_PARA )
	--给奖励和金钱

		-- 调用后续任务
		CallScriptFunction((200053), "OnDefaultEvent",sceneId, selfId, targetId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200052_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200052_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200052_OnItemChanged( sceneId, selfId, itemdataId )
	
end


