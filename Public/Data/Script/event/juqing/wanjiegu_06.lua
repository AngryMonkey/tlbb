
-- 再在副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200006_g_ScriptId = 200006

--副本名称
x200006_g_CopySceneName="万劫谷"

--任务号
x200006_g_MissionId = 6

--前续任务
x200006_g_PreMissionId = 5

--目标NPC
x200006_g_Name = "段正淳"

--是否是精英任务
x200006_g_IfMissionElite = 1

--任务等级
x200006_g_MissionLevel = 20

--任务归类
x200006_g_MissionKind = 51

--任务文本描述
x200006_g_MissionName="大战万劫谷"
x200006_g_MissionInfo="#{Mis_juqing_0006}"
x200006_g_MissionTarget="#{Mis_juqing_Tar_0006}"	--任务目标
x200006_g_MissionComplete="  干的好，段延庆没有这三个羽翼相助，就难以在万劫谷兴风作浪了。"	--完成任务npc说话的话
x200006_g_MissionContinue="  你已经打败了叶二娘、南海鳄神和云中鹤了吗？"

x200006_g_MoneyBonus=1580
x200006_g_exp=18000

x200006_g_RadioItemBonus={{id=10422001 ,num=1},{id=10422002,num=1},{id=10422003,num=1}}

x200006_g_Custom	= { {id="已战胜叶二娘",num=1},{id="已战胜南海鳄神",num=1},{id="已战胜云中鹤",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200006_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200006_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200006_g_MissionName)
			AddText(sceneId,x200006_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
		EndEvent( )
		bDone = x200006_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId,bDone)
    --满足任务接收条件
  elseif x200006_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200006_g_MissionName)
			AddText(sceneId,x200006_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200006_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
			for i, item in x200006_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200006_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200006_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200006_g_MissionId) > 0 then
		AddNumText(sceneId,x200006_g_ScriptId,x200006_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x200006_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200006_g_ScriptId,x200006_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200006_CheckAccept( sceneId, selfId )
	
	--需要4级才能接
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200006_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200006_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200006_g_MissionId, x200006_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200006_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：大战万劫谷",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200006_g_SignPost.x, x200006_g_SignPost.z, x200006_g_SignPost.tip )
	
	--接任务后，把相关的怪设置为可以战斗
	-- 需要遍历所有的怪，改变他们的阵营
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "叶二娘"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "岳老三"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "云中鹤"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		end
	end

	SetMissionEvent(sceneId, selfId, x200006_g_MissionId, 0)

end

--**********************************
--放弃
--**********************************
function x200006_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200006_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200006_g_SignPost.tip )
end


--**********************************
--继续
--**********************************
function x200006_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200006_g_MissionName)
		AddText(sceneId,x200006_g_MissionComplete)
		AddMoneyBonus( sceneId, x200006_g_MoneyBonus )
		for i, item in x200006_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200006_g_ScriptId,x200006_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200006_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200006_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x200006_g_MissionId)
	
	local Kill1 = GetMissionParam(sceneId,selfId,misIndex,0)
	local Kill2 = GetMissionParam(sceneId,selfId,misIndex,1)
	local Kill3 = GetMissionParam(sceneId,selfId,misIndex,2)

	if Kill1~=1 			then
		return 0
	elseif Kill2~=1 	then
		return 0
	elseif Kill3~=1   then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200006_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200006_CheckSubmit( sceneId, selfId ) == 1   then
  	BeginAddItem(sceneId)
		for i, item in x200006_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId,x200006_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200006_g_exp)

		DelMission( sceneId, selfId, x200006_g_MissionId )
		MissionCom( sceneId, selfId, x200006_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：大战万劫谷",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200007), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200006_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex = -1
	if GetName(sceneId,objId) == "叶二娘"	  then
		-- 取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死叶二娘1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	if GetName(sceneId,objId) == "岳老三"	  then
		-- 取得这个怪物死后拥有分配权的人数
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死岳老三1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	if GetName(sceneId,objId) == "云中鹤"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)
		for j=0,num-1  do
			-- 取得拥有分配权的人的objId
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
			-- 看这个人是不是有这个任务
			if IsHaveMission(sceneId, humanObjId, x200006_g_MissionId) > 0 then
				misIndex = GetMissionIndexByID(sceneId,humanObjId,x200006_g_MissionId)
				SetMissionByIndex(sceneId,humanObjId,misIndex,2,1)
				BeginEvent(sceneId)
				AddText(sceneId,"已杀死云中鹤1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,humanObjId)
			end
		end
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x200006_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200006_OnItemChanged( sceneId, selfId, itemdataId )
end
