-- 血战聚贤庄


-- 200024
-- 顶天立地

-- 再在副本内完成杀怪任务

--************************************************************************
--MisDescBegin
--脚本号
x200024_g_ScriptId = 200024

--副本名称
x200024_g_CopySceneName="聚贤庄"

--任务号
x200024_g_MissionId = 23

--前续任务
x200024_g_PreMissionId = 22

--目标NPC
x200024_g_Name = "薛慕华"

--是否是精英任务
x200024_g_IfMissionElite = 1

--任务等级
x200024_g_MissionLevel = 40

--任务归类
x200024_g_MissionKind = 47

--任务文本描述
x200024_g_MissionName="血战聚贤庄"
x200024_g_MissionInfo="#{Mis_juqing_0023}"
x200024_g_MissionTarget="#{Mis_juqing_Tar_0023}"	--任务目标
x200024_g_MissionComplete="  $N，冲着你的面子，老夫一定会治好这个小丫头的。但她伤好之后，一定要说出那黑衣人的来历。"	--完成任务npc说话的话

x200024_g_MoneyBonus=63000
x200024_g_exp=64000

x200024_g_RadioItemBonus={{id=10415004 ,num=1},{id=10415005,num=1},{id=10415006,num=1},{id=10415007,num=1}}

x200024_g_Custom	= { {id="已保护乔峰脱险",num=1} }
x200024_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200024_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200024_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200024_g_MissionName)
			--AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
		EndEvent( )
		bDone = x200024_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId,bDone)
    --满足任务接收条件
  elseif x200024_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200024_g_MissionName)
			AddText(sceneId,x200024_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200024_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
			for i, item in x200024_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200024_OnEnumerate( sceneId, selfId, targetId )
  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200024_g_MissionId) > 0 then
		return
	end

  --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200024_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == "薛慕华"   then
			AddNumText(sceneId,x200024_g_ScriptId,x200024_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x200024_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200024_g_ScriptId,x200024_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200024_CheckAccept( sceneId, selfId )
	
	--需要4级才能接
	if GetLevel( sceneId, selfId ) < 40 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200024_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200024_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200024_g_MissionId, x200024_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：血战聚贤庄",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200024_g_SignPost.x, x200024_g_SignPost.z, x200024_g_SignPost.tip )
	
	-- 接受任务后，开启剧情
	LuaFnSetCopySceneData_Param(sceneId, 10, 1)
	LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 12, LuaFnGetCurrentTime())
	LuaFnSetCopySceneData_Param(sceneId, 13, 1)
	
end

--**********************************
--定时事件
--**********************************
function x200024_OnTimer(sceneId,selfId)--,missionIndex)
	
end

--**********************************
--放弃
--**********************************
function x200024_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200024_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200024_g_SignPost.tip )
end


--**********************************
--继续
--**********************************
function x200024_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x200024_g_MissionName)
	AddText(sceneId,x200024_g_MissionComplete)
	AddText(sceneId,"#{M_SHOUHUO}#r")
	AddMoneyBonus( sceneId, x200024_g_MoneyBonus )
	for i, item in x200024_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200024_g_ScriptId,x200024_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200024_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200024_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
	
	local Kill1 = LuaFnGetCopySceneData_Param(sceneId, 15)

	if Kill1~=1 			then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200024_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200024_CheckSubmit(sceneId, selfId) == 1   then
  	BeginAddItem(sceneId)
		for i, item in x200024_g_RadioItemBonus do
			if item.id == selectRadioId then
				AddItem( sceneId,item.id, item.num )
			end
		end
		local ret = EndAddItem(sceneId,selfId)
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

		AddMoney(sceneId,selfId,x200024_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200024_g_exp)

		DelMission( sceneId, selfId, x200024_g_MissionId )
		MissionCom( sceneId, selfId, x200024_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：血战聚贤庄",MSG2PLAYER_PARA )

		Msg2Player( sceneId, selfId,"你已经完成了#G聚贤庄#W系列任务",MSG2PLAYER_PARA )
		local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
		LuaFnSendMailToGUID(sceneId, selfGuid, "你已经完成了#G聚贤庄#W系列任务。请在达到50级之后，在大理城找到赵天师，开启#G苍茫山#W系列任务。")

		-- 完成聚贤庄剧情，给10点剧情点
		local nPoint = GetHumanJuqingPoint(sceneId, selfId)
		SetHumanJuqingPoint(sceneId, selfId, nPoint+10)

		-- 通知玩家，可以做剧情循环任务了
		-- 您现在可以去AA城的[bb，cc]找到DD，接受DD循环任务。
		local strText1 = "#{LOOTMISSION_MAIL_08}"
		LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
		
		BeginEvent(sceneId)
			AddText(sceneId,"#{LOOTMISSION_INFO_03}");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200024_OnKillObject( sceneId, selfId, objdataId ,objId)

	local misIndex
	if GetName(sceneId,objId) == "玄难"	  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,3,1)
	end
	if GetName(sceneId,objId) == "玄寂"	  then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200024_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,4,1)
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x200024_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200024_OnItemChanged( sceneId, selfId, itemdataId )
end


