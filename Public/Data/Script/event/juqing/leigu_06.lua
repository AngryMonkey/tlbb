-- 关门捉贼 200045 

-- 副本外接任务到副本内杀怪，然后出来交（同一个NPC），有剧情

--************************************************************************
--MisDescBegin
--脚本号
x200045_g_ScriptId = 200045

--任务号
x200045_g_MissionId = 37

--前续任务号
x200045_g_PreMissionId = 36

--目标NPC
x200045_g_Name = "苏星河"

--是否是精英任务
x200045_g_IfMissionElite = 1

--任务等级
x200045_g_MissionLevel = 60

--任务归类
x200045_g_MissionKind = 53

--任务文本描述
x200045_g_MissionName="#{MISSIONNAME_JUQING_2}"
x200045_g_MissionInfo="#{Mis_juqing_0037}"
x200045_g_MissionTarget="#{Mis_juqing_Tar_0037}"	--任务目标
x200045_g_MissionContinue="  #{TM_20080313_08}"
x200045_g_MissionComplete="  #{TM_20080313_09}"	--完成任务npc说话的话

x200045_g_MoneyBonus=45000
x200045_g_exp=100000

x200045_g_RadioItemBonus={{id=10414016 ,num=1},{id=10415012,num=1},{id=10422011,num=1},{id=10423015,num=1}}

x200045_g_Custom	= { {id="已打败丁春秋",num=1} }
x200045_g_IsMissionOkFail = 0

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200045_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200045_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200045_g_MissionId) > 0)  then
		-- 检测是不是在副本，再检测是不是，如果是就可以直完成任务，^_^
		local sceneType = LuaFnGetSceneType(sceneId) 
		if sceneType == 1 then --场景类型不是副本
			-- 检测下名字，安全点点
			if GetName(sceneId, targetId) == x200045_g_Name  then
		    BeginEvent(sceneId)
				AddText(sceneId,x200045_g_MissionName)
				AddText(sceneId,x200045_g_MissionContinue)
				--AddMoneyBonus( sceneId, x200045_g_MoneyBonus )
		    EndEvent()
		    local bDone = x200045_CheckSubmit(sceneId, selfId)
				DispatchMissionDemandInfo(sceneId,selfId,targetId,x200045_g_ScriptId,x200045_g_MissionId,bDone)
			end
		end
	
	--满足任务接收条件
	elseif x200045_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200045_g_MissionName)
			AddText(sceneId,x200045_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200045_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200045_g_MoneyBonus )
			for i, item in x200045_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent()
		DispatchMissionInfo(sceneId,selfId,targetId,x200045_g_ScriptId,x200045_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200045_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200045_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200045_g_MissionId) > 0 then
		--需要在副本才可以
		local sceneType = LuaFnGetSceneType(sceneId)
		if sceneType == 1 then --场景类型是副本
			AddNumText(sceneId, x200045_g_ScriptId,x200045_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200045_CheckAccept(sceneId,selfId) > 0 then	
		local sceneType = LuaFnGetSceneType(sceneId)
		if sceneType ~= 1 then --场景类型是副本
			AddNumText(sceneId,x200045_g_ScriptId,x200045_g_MissionName,1,-1)
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200045_CheckAccept( sceneId, selfId )
	--判定条件
	--1，前续任务完成
	if IsMissionHaveDone(sceneId,selfId,x200045_g_PreMissionId) < 1 then
		return 0
	end
	if IsMissionHaveDone(sceneId,selfId,x200045_g_MissionId) > 0  then
		return 0
	end
	
	--2，等级达到60
	if GetLevel(sceneId, selfId) < 60   then
		return 0
	end

	return 1
end


--**********************************
--接受
--**********************************
function x200045_OnAccept( sceneId, selfId, targetId )

	if x200045_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200045_g_MissionId, x200045_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#{TM_20080313_02}" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#{TM_20080313_10}",MSG2PLAYER_PARA )

	-- 设置任务的第0位置为0
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200045_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)
	
	-- 设置任务关系的事件"关心玩家杀人"
	SetMissionEvent(sceneId, selfId, x200045_g_MissionId, 0)

end

--**********************************
--放弃
--**********************************
function x200045_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200045_g_MissionId )
end

--**********************************
--继续
--**********************************
function x200045_OnContinue( sceneId, selfId, targetId )
  BeginEvent(sceneId)
	AddText(sceneId,x200045_g_MissionName)
	AddText(sceneId,x200045_g_MissionComplete)
	AddMoneyBonus( sceneId, x200045_g_MoneyBonus )
	for i, item in x200045_g_RadioItemBonus do
		AddRadioItemBonus( sceneId, item.id, item.num )
	end
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x200045_g_ScriptId,x200045_g_MissionId)
end	

--**********************************
--检测是否可以提交
--**********************************
function x200045_CheckSubmit( sceneId, selfId, selectRadioId )
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200045_g_MissionId)
	
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1    then
		return 1
	end
	return 0
end

--**********************************
--提交
--**********************************
function x200045_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交的条件判定
	-- 1，有这个任务，
	if( IsHaveMission(sceneId,selfId,x200045_g_MissionId) > 0)  then
  	BeginAddItem(sceneId)
		for i, item in x200045_g_RadioItemBonus do
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

		AddMoney(sceneId,selfId,x200045_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200045_g_exp)

		DelMission( sceneId,selfId,  x200045_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200045_g_MissionId )
		Msg2Player(  sceneId, selfId,"#{TM_20080313_11}",MSG2PLAYER_PARA )

		Msg2Player( sceneId, selfId,"#{TM_20080313_12}",MSG2PLAYER_PARA )
		local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
		LuaFnSendMailToGUID(sceneId, selfGuid, "#{TM_20080313_13}")

		-- 完成擂鼓山剧情，给10点剧情点
		local nPoint = GetHumanJuqingPoint(sceneId, selfId)
		SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
		
		-- 通知玩家，可以做剧情循环任务了
		-- 您现在可以去AA城的[bb，cc]找到DD，接受DD循环任务。
		local strText1 = "#{LOOTMISSION_MAIL_10}#r#{LOOTMISSION_MAIL_11}#r#{LOOTMISSION_MAIL_12}"
		LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
		
		BeginEvent(sceneId)
			AddText(sceneId,"#{LOOTMISSION_INFO_05}");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200045_OnKillObject( sceneId, selfId, objdataId, objId )

--	if GetName(sceneId,objId) == "丁春秋"	  then
--		-- 取得这个怪物死后拥有分配权的人数
--		local num = GetMonsterOwnerCount(sceneId,objId)
--		for j=0,num-1  do
--			-- 取得拥有分配权的人的objId
--			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)
--			-- 看这个人是不是有这个任务
--			if IsHaveMission(sceneId, humanObjId, x200045_g_MissionId) > 0 then
--				local misIndex = GetMissionIndexByID(sceneId,selfId,x200045_g_MissionId)
--				SetMissionByIndex(sceneId,humanObjId,misIndex,0,1)
--				BeginEvent(sceneId)
--				AddText(sceneId,"已战胜丁春秋：1/1")
--				EndEvent(sceneId)
--				DispatchMissionTips(sceneId,humanObjId)
--			end
--		end
--	end

end

--**********************************
--进入区域事件
--**********************************
function x200045_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200045_OnItemChanged( sceneId, selfId, itemdataId )
	
end




