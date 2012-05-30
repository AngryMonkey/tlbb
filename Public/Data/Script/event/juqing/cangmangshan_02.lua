-- 天时不如地利
-- 去苍茫山战场探索皇太叔御帐、楚王大营、苍茫山左山道，苍茫山右山道。

--MisDescBegin
--脚本号
x200031_g_ScriptId = 200031

--任务号
x200031_g_MissionId = 27

x200031_g_Name=""

--前续任务
x200031_g_PreMissionId = 26

--任务归类
x200031_g_MissionKind = 52

--任务等级
x200031_g_MissionLevel = 50

--是否是精英任务
x200031_g_IfMissionElite = 0

--任务名
x200031_g_MissionName="天时不如地利"
x200031_g_MissionInfo="#{Mis_juqing_0027}"
x200031_g_MissionTarget="#{Mis_juqing_Tar_0027}"
x200031_g_MissionComplete="  有了这第一手的敌情，我们就可以期待叛军犯错误了。"
x200031_g_MissionContinue="  你已经探索到皇太叔御帐、楚王大营、苍茫山左山道，苍茫山右山道的情况了吗？"

x200031_g_MoneyBonus=16200
x200031_g_exp=19920

x200031_g_RadioItemBonus={{id=10414009 ,num=1},{id=10414010,num=1},{id=10414011,num=1},{id=10414012,num=1}}

x200031_g_Custom	= { {id="已经探索楚王大营",num=1}, {id="已经探索皇太叔御帐",num=1}, {id="已经探索苍茫山东山道",num=1}, {id="已经探索苍茫山西山道",num=1} }

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200031_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200031_g_MissionId) > 0)  then
		--x200031_OnContinue( sceneId, selfId, targetId )
 		local done = x200031_CheckSubmit( sceneId, selfId )
 		
		BeginEvent(sceneId)
			AddText(sceneId,x200031_g_MissionName);
			AddText(sceneId,x200031_g_MissionContinue);
		EndEvent(sceneId)
 		
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId,done)

	--满足任务接收条件
	elseif x200031_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x200031_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200031_g_MissionName)
				AddText(sceneId,x200031_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200031_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r") -- 你将得到
				for i, item in x200031_g_RadioItemBonus do
					AddRadioItemBonus( sceneId, item.id, item.num )
				end
				AddMoneyBonus( sceneId, x200031_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId)
		--end
	end
end

--**********************************
--列举事件
--**********************************
function x200031_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200031_g_MissionId) > 0 then
		AddNumText(sceneId, x200031_g_ScriptId,x200031_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x200031_CheckAccept(sceneId,selfId) > 0 then
		--if GetName(sceneId,targetId) ~= x200031_g_Name then
			AddNumText(sceneId,x200031_g_ScriptId,x200031_g_MissionName,1,-1);
		--end
	end
end

--**********************************
--检测接受条件
--**********************************
function x200031_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200031_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel( sceneId, selfId ) < x200031_g_MissionLevel then
		return 0
	end
	
	-- 前续任务的完成情况
	if IsMissionHaveDone(sceneId,selfId,x200031_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--接受
--**********************************
function x200031_OnAccept( sceneId, selfId )
	if x200031_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200031_g_MissionId, x200031_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player( sceneId, selfId,"#Y接受任务：天时不如地利",MSG2PLAYER_PARA )
	
	-- 通知关系进入区域
	-- 0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
	SetMissionEvent(sceneId, selfId, x200031_g_MissionId, 1)
	
	-- 使用任务的前4位来记录探索的4个区域
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)
	
end

--**********************************
--放弃
--**********************************
function x200031_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200031_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200031_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200031_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200031_g_MissionName)
		AddText(sceneId,x200031_g_MissionComplete)
		AddMoneyBonus( sceneId, x200031_g_MoneyBonus )
		for i, item in x200031_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200031_g_ScriptId,x200031_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200031_CheckSubmit( sceneId, selfId )

	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200031_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	-- 查询4个值是不是都值为1了
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			--得到任务的序列号
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 1) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 2) < 1 then
		return 0
	end
	if GetMissionParam(sceneId, selfId, misIndex, 3) < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200031_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200031_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		
		-- 
  	BeginAddItem(sceneId)
		for i, item in x200031_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		ret = EndAddItem(sceneId,selfId)
		--添加任务奖励
		if ret < 1 then
			--任务奖励没有加成功
			BeginEvent(sceneId)
				strText = "背包已满,无法完成任务"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
		AddItemListToHuman(sceneId,selfId)

		--添加任务奖励
		AddMoney(sceneId,selfId, x200031_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200031_g_exp)

		DelMission( sceneId,selfId,  x200031_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200031_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：天时不如地利",MSG2PLAYER_PARA )
		
		-- 设置剧情步骤1
		LuaFnSetCopySceneData_Param(sceneId, 8, 1)
		LuaFnSetCopySceneData_Param(sceneId, 10, 0)
		LuaFnSetCopySceneData_Param(sceneId, 20, selfId)
	end
end

--**********************************
--定时事件
--**********************************
function x200031_OnTimer(sceneId,selfId)
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200031_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200031_OnEnterArea( sceneId, selfId, zoneId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200031_g_MissionId)			--得到任务的序列号
	
	if zoneId == 0 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 0) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "已经探索楚王大营：1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		end
		
	elseif zoneId == 1 and
	 	 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 1) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "已经探索皇太叔御帐：1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,1,1)
		end
		
	elseif zoneId == 2 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 2) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "已经探索苍茫山东山道：1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,2,1)
		end
		
	elseif zoneId == 3 and
		 LuaFnGetCopySceneData_Param(sceneId, 0) == FUBEN_JUQING_CANGMANGSHAN then
		if GetMissionParam(sceneId, selfId, misIndex, 3) == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "已经探索苍茫山西山道：1/1")
	  	EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			SetMissionByIndex(sceneId,selfId,misIndex,3,1)
		end
		
	end

end

--**********************************
--道具改变
--**********************************
function x200031_OnItemChanged( sceneId, selfId, itemdataId )
end
