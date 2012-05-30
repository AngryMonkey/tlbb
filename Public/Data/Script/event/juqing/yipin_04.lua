-- 200053 酒罢问君三语
-- 将李秋水去世的消息通知洛阳城的赫连铁树。

--************************************************************************
--MisDescBegin
--脚本号
x200053_g_ScriptId = 200053

--任务号
x200053_g_MissionId = 43

--前续任务号
x200053_g_PreMissionId = 42

--目标NPC
x200053_g_Name = "晓蕾"

--是否是精英任务
x200053_g_IfMissionElite = 1

--任务等级
x200053_g_MissionLevel = 70

--任务归类
x200053_g_MissionKind = 49

--任务文本描述
x200053_g_MissionName="酒罢问君三语"
x200053_g_MissionInfo="#{Mis_juqing_0043}"
x200053_g_MissionTarget="#{Mis_juqing_Tar_0043}"	--任务目标
x200053_g_MissionComplete="  你不是$N吗？我们公主也常常提起你呢！快请坐，快请坐。"

x200053_g_MoneyBonus=48600
x200053_g_exp=86400

x200053_g_RadioItemBonus={{id=10414017 ,num=1},{id=10414018,num=1},{id=10414019,num=1}}

x200053_g_Custom	= { {id="已找到晓蕾",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200053_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200053_g_MissionId) > 0)  then
		-- 检测是不是在副本，再检测是不是，如果是就可以直完成任务，^_^
			-- 检测下名字，安全点点
		if GetName(sceneId, targetId) == x200053_g_Name  then
	    BeginEvent(sceneId)
				AddText(sceneId,x200053_g_MissionName)
				AddText(sceneId,x200053_g_MissionComplete)
				AddMoneyBonus( sceneId, x200053_g_MoneyBonus )
				for i, item in x200053_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
	    EndEvent( )
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x200053_g_ScriptId,x200053_g_MissionId)
		end
	
	--满足任务接收条件
	elseif x200053_CheckAccept(sceneId, selfId, targetId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200053_g_MissionName)
			AddText(sceneId,x200053_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200053_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200053_g_MoneyBonus )
			for i, item in x200053_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200053_g_ScriptId,x200053_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200053_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200053_g_MissionId) > 0 then
		--需要在副本才可以
		if GetName(sceneId, targetId) == x200053_g_Name    then
			AddNumText(sceneId, x200053_g_ScriptId,x200053_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200053_CheckAccept(sceneId,selfId,targetId) > 0 then	
		if GetName(sceneId, targetId) == "赫连铁树"    then
			AddNumText(sceneId,x200053_g_ScriptId,x200053_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200053_CheckAccept( sceneId, selfId, targetId )

	--判定条件
	--1，前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200053_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0  then
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
function x200053_OnAccept( sceneId, selfId, targetId )

	if x200053_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200053_g_MissionId, x200053_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y接受任务：酒罢问君三语",MSG2PLAYER_PARA )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200053_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)

end

--**********************************
--定时事件
--**********************************
function x200053_OnTimer(sceneId,selfId)
end

--**********************************
--放弃
--**********************************
function x200053_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200053_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200053_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200053_CheckSubmit( sceneId, selfId, selectRadioId )

	--1, 是否有这个任务
	if IsHaveMission(sceneId,selfId,x200053_g_MissionId) < 1 then
		return 0;
	end
	
	--2, 是否已经完成这个任务
	if IsMissionHaveDone(sceneId,selfId,x200053_g_MissionId) > 0  then
		return 0;
	end
	
	--3，等级达到70
	if GetLevel(sceneId, selfId) < 70   then
		return 0;
	end

	--4，任务完成标记
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200053_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200053_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--1, 当前玩家是否与正确的NPC对话
	if GetName(sceneId, targetId) ~= x200053_g_Name  then
		return
	end

	--2, 可以提交的条件判定
	if x200053_CheckSubmit( sceneId, selfId, selectRadioId ) ~= 1 then
		return
	end

	--3，是否可添加物品
  	BeginAddItem(sceneId)
		for i, item in x200053_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
	ret = EndAddItem(sceneId,selfId)

	if ret < 1 then
		--任务奖励没有加成功
		BeginEvent(sceneId)
			strText = "背包已满,无法完成任务"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--4，删除任务
	MissionCom( sceneId, selfId, x200053_g_MissionId )
	if DelMission( sceneId, selfId, x200053_g_MissionId ) ~= 1 then
		return
	end

	--5，添加任务奖励
	AddItemListToHuman(sceneId,selfId)
	AddMoney(sceneId,selfId, x200053_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId, x200053_g_exp)

	--6，提示
	Msg2Player( sceneId, selfId, "#Y完成任务：酒罢问君三语", MSG2PLAYER_PARA )

	--7，剧情
	LuaFnSetCopySceneData_Param(sceneId, 8, 1)
	LuaFnSetCopySceneData_Param(sceneId, 10, 0)
	LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
	LuaFnSetCopySceneData_Param(sceneId, 30, 1)

end

--**********************************
--杀死怪物或玩家
--**********************************
function x200053_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200053_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200053_OnItemChanged( sceneId, selfId, itemdataId )
	
end


