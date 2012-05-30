-- 200051 一笑人间万事
-- 保护天山童老修练，其实只是看戏，看完就完成

--************************************************************************
--MisDescBegin
--脚本号
x200051_g_ScriptId = 200051

--任务号
x200051_g_MissionId = 41

--前续任务号
x200051_g_PreMissionId = 40

--目标NPC
x200051_g_Name = "虚竹"

--是否是精英任务
x200051_g_IfMissionElite = 1

--任务等级
x200051_g_MissionLevel = 70

--任务归类
x200051_g_MissionKind = 49

--任务文本描述
x200051_g_MissionName="一笑人间万事"
x200051_g_MissionInfo="#{Mis_juqing_0041}"
x200051_g_MissionTarget="#{Mis_juqing_Tar_0041}"	--任务目标
x200051_g_MissionComplete="  我们还是快点离开这里吧，阿弥陀佛，罪过罪过……"

x200051_g_MoneyBonus=9000
x200051_g_exp=17280

x200051_g_RadioItemBonus={{id=10415013 ,num=1},{id=10415014,num=1},{id=10415015,num=1}}

x200051_g_Custom	= { {id="一笑人间万事",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200051_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200051_g_MissionId) > 0)  then
		-- 检测是不是在副本，再检测是不是，如果是就可以直完成任务，^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型是副本
			-- 检测下名字，安全点点
			if GetName(sceneId, targetId) == x200051_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200051_g_MissionName)
				AddText(sceneId,x200051_g_MissionComplete)
				AddMoneyBonus( sceneId, x200051_g_MoneyBonus )
		    EndEvent( )
				bDone = x200051_CheckSubmit( sceneId, selfId )
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId,bDone)
		    --DispatchMissionContinueInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId)
			end
		end
	
	--满足任务接收条件
	elseif x200051_CheckAccept(sceneId, selfId, targetId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200051_g_MissionName)
			AddText(sceneId,x200051_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200051_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200051_g_MoneyBonus )
			for i, item in x200051_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200051_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200051_g_MissionId) > 0 then
		--需要在副本才可以
		if GetName(sceneId, targetId) == x200051_g_Name    then
			AddNumText(sceneId, x200051_g_ScriptId,x200051_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200051_CheckAccept(sceneId,selfId,targetId) > 0 then	
		AddNumText(sceneId,x200051_g_ScriptId,x200051_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200051_CheckAccept( sceneId, selfId, targetId )
	--判定条件
	--1，前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200051_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0  then
		return 0
	end
	
	--2，等级达到50
	if GetLevel(sceneId, selfId) < 70   then
		return 0
	end

	--检测是不是天山童姥
	if GetName(sceneId, targetId) ~= "天山童姥"    then
		return 0
	end
	
	return 1
end


--**********************************
--接受
--**********************************
function x200051_OnAccept( sceneId, selfId, targetId )

	if x200051_CheckAccept(sceneId, selfId, targetId) ~= 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200051_g_MissionId, x200051_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	Msg2Player(  sceneId, selfId,"#Y接受任务：一笑人间万事",MSG2PLAYER_PARA )

	-- 剧情泡泡
	LuaFnSetCopySceneData_Param(sceneId, 8, 1)
	LuaFnSetCopySceneData_Param(sceneId, 10, 0)
	LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
end

--**********************************
--定时事件
--**********************************
function x200051_OnTimer(sceneId,selfId)
	
	if 1==1  then 
		return
	end

	-- 利用计时器，控制剧情
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200051_g_MissionId)--得到任务在20个任务中的序列号
	
	local bDone = GetMissionParam( sceneId,selfId,misIndex,0 )
	local NowTime = LuaFnGetCurrentTime()
	local OldTime = GetMissionParam( sceneId,selfId,misIndex,1 )

	local nSceneId = GetMissionParam( sceneId,selfId,misIndex,3 )
	if 	nSceneId ~= sceneId    then
		-- 玩家离开了这个场景，关闭之
		StopMissionTimer(sceneId,selfId,x200051_g_MissionId)
		return
	end
	
	if bDone == 1   then
		-- 关闭计时器
		StopMissionTimer(sceneId, selfId, x200051_g_MissionId)
		return
	end
	
	-- 利用时间控制NPC行为
	if NowTime - OldTime > 10   then
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		BeginEvent(sceneId)
			AddText(sceneId,"任务完成1/1");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end

end

--**********************************
--放弃
--**********************************
function x200051_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200051_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200051_OnContinue( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,x200051_g_MissionName)
		AddText(sceneId,x200051_g_MissionComplete)
		AddMoneyBonus( sceneId, x200051_g_MoneyBonus )
		for i, item in x200051_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x200051_g_ScriptId,x200051_g_MissionId)
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200051_CheckSubmit( sceneId, selfId )
	
	--1, 是否有这个任务
	if IsHaveMission(sceneId,selfId,x200051_g_MissionId) < 1 then
		return 0;
	end
	
	--2, 是否已经完成这个任务
	if IsMissionHaveDone(sceneId,selfId,x200051_g_MissionId) > 0  then
		return 0;
	end
	
	--3，等级达到70
	if GetLevel(sceneId, selfId) < 70 then
		return 0;
	end

	--4，任务特定的条件
	local bDone = LuaFnGetCopySceneData_Param( sceneId, 15 )
	if bDone ~= 1 then
		return 0
	end

	return 1
	
end

--**********************************
--提交
--**********************************
function x200051_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--1，可以提交的条件判定
	if x200051_CheckSubmit( sceneId, selfId) == 1  then

		--2，是否可添加物品
	  	BeginAddItem(sceneId)
			for i, item in x200051_g_RadioItemBonus do
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

		--3，删除任务
		MissionCom( sceneId, selfId, x200051_g_MissionId )
		if DelMission( sceneId, selfId, x200051_g_MissionId ) ~= 1 then
			return
		end

		--4，添加任务奖励
		AddItemListToHuman(sceneId,selfId)
		AddMoney(sceneId,selfId, x200051_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200051_g_exp)
		
		--5，提示
		Msg2Player( sceneId, selfId, "#Y完成任务：一笑人间万事", MSG2PLAYER_PARA )

		--6，调用后续任务
		CallScriptFunction((200052), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200051_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200051_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200051_OnItemChanged( sceneId, selfId, itemdataId )
	
end


