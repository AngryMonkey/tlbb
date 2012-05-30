-- 指点群豪戏   燕子坞大战，^_^，精彩部分哦 

--************************************************************************
--MisDescBegin
--脚本号
x200015_g_ScriptId = 200015

--副本名称
x200015_g_CopySceneName="燕子坞"

--任务号
x200015_g_MissionId = 14

--任务号
x200015_g_PreMissionId = 13

--目标NPC
x200015_g_Name = "王语嫣"

--是否是精英任务
x200015_g_IfMissionElite = 1

--任务等级
x200015_g_MissionLevel = 30

--任务归类
x200015_g_MissionKind = 48

--任务文本描述
x200015_g_MissionName="指点群豪戏"
x200015_g_MissionInfo="#{Mis_juqing_0014}"
x200015_g_MissionTarget="#{Mis_juqing_Tar_0014}"	--任务目标
x200015_g_MissionComplete="  $N，你的救命之恩，他日定当报还。只是，我现在身中剧毒……不知道是否还有机会回报大侠……"	--完成任务npc说话的话
x200015_g_MissionContinue="  你已经帮助段公子打退那些西夏武士了吗？"

x200015_g_MoneyBonus=21600
x200015_g_exp=22000

x200015_g_RadioItemBonus={{id=10423005,num=1},{id=10423006,num=1},{id=10423007,num=1}}

x200015_g_Custom	= { {id="指点群豪戏",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200015_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200015_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200015_g_MissionName)
			AddText(sceneId,x200015_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
		EndEvent( )
		bDone = x200015_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId,bDone)
    --满足任务接收条件
  elseif x200015_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200015_g_MissionName)
			AddText(sceneId,x200015_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200015_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
			for i, item in x200015_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200015_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200015_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200015_g_MissionId) > 0 then
		AddNumText(sceneId,x200015_g_ScriptId,x200015_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x200015_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200015_g_ScriptId,x200015_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200015_CheckAccept( sceneId, selfId )
	-- 玩家需要先完成前续任务
  if IsMissionHaveDone(sceneId,selfId,x200015_g_PreMissionId) < 1 then
		return 0
	end
	
	if LuaFnGetCopySceneData_Param(sceneId, 25) == 1  then
		return 0
	end	
	
	--需要4级才能接
	if GetLevel( sceneId, selfId ) >= 30 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x200015_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200015_g_MissionId, x200015_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,2,0)						--根据序列号把任务变量的第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,3,0)						--根据序列号把任务变量的第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,4,0)						--根据序列号把任务变量的第1位置0
	SetMissionByIndex(sceneId,selfId,misIndex,5,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：指点群豪戏",MSG2PLAYER_PARA )

	SetMissionEvent(sceneId, selfId, x200015_g_MissionId, 0)
	
	LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 12, LuaFnGetCurrentTime())

	--点名一旦开始，就不能再来一次了
	
	LuaFnSetCopySceneData_Param(sceneId, 25, 1)
end

--**********************************
--定时事件
--**********************************
function x200015_OnTimer(sceneId,selfId)

end

--**********************************
--放弃
--**********************************
function x200015_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200015_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200015_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200015_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x200015_g_MissionName)
		AddText(sceneId,x200015_g_MissionComplete)
		AddMoneyBonus( sceneId, x200015_g_MoneyBonus )
		for i, item in x200015_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x200015_g_ScriptId,x200015_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200015_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)

	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)
	local Kill4 = GetMissionParam(sceneId,selfId,misIndex,3)
	local Kill5 = GetMissionParam(sceneId,selfId,misIndex,4)

	if Kill1~=1 			then
		return 0
	elseif Kill2~=1 	then
		return 0
	elseif Kill3~=1   then
		return 0
	elseif Kill4~=1   then
		return 0
	elseif Kill5~=1   then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200015_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200015_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200015_g_RadioItemBonus do
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
		AddMoney(sceneId,selfId, x200015_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200015_g_exp)

		DelMission( sceneId, selfId, x200015_g_MissionId )
		MissionCom( sceneId, selfId, x200015_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y完成任务：指点群豪戏", MSG2PLAYER_PARA )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200015_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex = -1
	local szMonsterName = GetName(sceneId,objId)
	if szMonsterName == "黄胡子"	  then
		-- 取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死黄胡子:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "灰袍客"	  then
		-- 取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,2,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死灰袍客:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "虎爪门弟子"	  then
		-- 取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,3,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死虎爪门弟子:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "虬髯武士"	  then
		-- 取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,4,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死虬髯武士:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end

	elseif szMonsterName == "摔角高手"	  then
		-- 取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200015_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,selfId,x200015_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,5,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死摔角高手:1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
		
	else
		return
		
	end
	
	-- 检测如果需要杀的人都杀了后，给个完成标志
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,5)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)
	local Kill4 = GetMissionParam(sceneId,selfId,misIndex,3)
	local Kill5 = GetMissionParam(sceneId,selfId,misIndex,4)
	
	if Kill1==1 and Kill2==1 and Kill3==1 and Kill4==1 and Kill5==1 then
		--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0010}",0)
		CallScriptFunction((200060), "Duibai",sceneId, "西夏武士", "燕子坞", "#{JQ_DB_0010}" )
		
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x200015_OnEnterArea( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200015_OnItemChanged( sceneId, selfId, itemdataId )
	
end







