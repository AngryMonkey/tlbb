-- 200037

-- 200037 金戈荡寇鏖兵
-- 苍茫山的重要剧情

-- 再在副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200037_g_ScriptId = 200037

--任务号
x200037_g_MissionId = 31

--目标NPC
x200037_g_Name = "萧峰"

--任务文本描述
x200037_g_MissionName="金戈荡寇鏖兵"
x200037_g_MissionInfo="#{Mis_juqing_0031}"
x200037_g_MissionTarget="#{Mis_juqing_Tar_0031}"	--任务目标
x200037_g_MissionComplete="    $N，这一下叛军军心已经涣散了，不要着急，我们步步为营，把叛乱彻底平息。"	--完成任务npc说话的话
x200037_g_MissionContinue="  楚王已经被杀，皇太叔也已经在我们手中了。"

x200037_g_MoneyBonus=36000
x200037_g_exp=34000

x200037_g_RadioItemBonus={{id=10423012 ,num=1},{id=10423013,num=1},{id=10423014,num=1}}

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200037_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200037_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200037_g_MissionName)
			AddText(sceneId,x200037_g_MissionContinue)
			--AddMoneyBonus( sceneId, x200037_g_MoneyBonus )
		EndEvent( )
		bDone = x200037_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200037_g_ScriptId,x200037_g_MissionId,bDone)
    --满足任务接收条件
  end

end

--**********************************
--列举事件
--**********************************
function x200037_OnEnumerate( sceneId, selfId, targetId )
  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200037_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200037_g_MissionId) > 0 then
		AddNumText(sceneId,x200037_g_ScriptId,x200037_g_MissionName,2,-1);
		--满足任务接收条件
	end

end

--**********************************
--检测接受条件
--**********************************
function x200037_CheckAccept( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x200037_OnAccept( sceneId, selfId )
	
end

--**********************************
--放弃
--**********************************
function x200037_OnAbandon( sceneId, selfId )

end

--**********************************
--继续
--**********************************
function x200037_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200037_g_MissionName)
		AddText(sceneId,x200037_g_MissionComplete)
		AddMoneyBonus( sceneId, x200037_g_MoneyBonus )
		for i, item in x200037_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200037_g_ScriptId,x200037_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200037_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200037_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	if LuaFnGetCopySceneData_Param(sceneId, 8) > 7  then
		return 1
	end
	
	return 0

end

--**********************************
--提交
--**********************************
function x200037_OnSubmit( sceneId, selfId, targetId,selectRadioId )

	if x200037_CheckSubmit(sceneId, selfId) == 1  then
		--添加任务奖励
  	BeginAddItem(sceneId)
		for i, item in x200037_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId, x200037_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200037_g_exp)

		DelMission( sceneId, selfId, x200037_g_MissionId )
		MissionCom( sceneId, selfId, x200037_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：金戈荡寇鏖兵",MSG2PLAYER_PARA )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x200037_OnKillObject( sceneId, selfId, objdataId ,objId)
	
end

--**********************************
--进入区域事件
--**********************************
function x200037_OnEnterArea( sceneId, selfId, zoneId )

end

--**********************************
--道具改变
--**********************************
function x200037_OnItemChanged( sceneId, selfId, itemdataId )
end


