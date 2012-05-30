-- 悲酥清风   英雄救美

--************************************************************************
--MisDescBegin
--脚本号
x200016_g_ScriptId = 200016

--任务号
x200016_g_MissionId = 15

--任务号
x200016_g_PreMissionId = 14

--目标NPC
x200016_g_Name = "王语嫣"

--是否是精英任务
x200016_g_IfMissionElite = 1

--任务等级
x200016_g_MissionLevel = 30

--任务归类
x200016_g_MissionKind = 48

--任务文本描述
x200016_g_MissionName="悲酥清风"
x200016_g_MissionInfo="#{Mis_juqing_0015}"
x200016_g_MissionTarget="#{Mis_juqing_Tar_0015}"	--任务目标
x200016_g_MissionComplete="  啊……我的手臂能动了。我中的毒已经解了。$N，段公子，我们快去苏州寻找表哥吧。"	--完成任务npc说话的话
x200016_g_MissionContinue="  你快点去帮助段公子呀！"

x200016_g_MoneyBonus=27000
x200016_g_exp=32000

x200016_g_RadioItemBonus={{id=10414005 ,num=1},{id=10414006,num=1},{id=10414007,num=1},{id=10414008,num=1}}

x200016_g_DemandItem={{id=40001005,num=1}}		--从背包中计算

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200016_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200016_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200016_g_MissionName)
			AddText(sceneId,"  你得到解药了没有啊？")
			--AddMoneyBonus( sceneId, x200016_g_MoneyBonus )
		EndEvent( )
		bDone = x200016_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200016_g_ScriptId,x200016_g_MissionId,bDone)
    --满足任务接收条件
  elseif x200016_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200016_g_MissionName)
			AddText(sceneId,x200016_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200016_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200016_g_MoneyBonus )
			for i, item in x200016_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200016_g_ScriptId,x200016_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200016_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200016_g_MissionId) > 0 then
		return
	end

  --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200016_g_MissionId) > 0 then
		AddNumText(sceneId,x200016_g_ScriptId,x200016_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x200016_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200016_g_ScriptId,x200016_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200016_CheckAccept( sceneId, selfId )
	-- 看看有没有完成该任务
	if IsMissionHaveDone(sceneId, selfId, x200016_g_MissionId) > 0 then
		return
	end

	-- 玩家需要先完成前续任务
  if IsMissionHaveDone(sceneId,selfId,x200016_g_PreMissionId) < 1 then
		return 0
	end
	
	-- 需要场景进行到第二步才能接
	if LuaFnGetCopySceneData_Param(sceneId, 10) < 2   then
		return 0
	end
	
	--需要30级才能接
	if GetLevel( sceneId, selfId ) >= 30 then
		return 1
	else
		return 0
	end
end

--**********************************
--接受
--**********************************
function x200016_OnAccept( sceneId, selfId )
	if x200016_CheckAccept( sceneId, selfId ) < 1 then
		return
	end

	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200016_g_MissionId, x200016_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x200016_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：悲酥清风",MSG2PLAYER_PARA )

	local nStep = LuaFnGetCopySceneData_Param(sceneId, 10)
	
	if nStep < 3 then
		LuaFnSetCopySceneData_Param(sceneId, 10, 3) --控制说话
		LuaFnSetCopySceneData_Param(sceneId, 11, LuaFnGetCurrentTime())	--时间
		LuaFnSetCopySceneData_Param(sceneId, 13, 1)	--时间
	end

end

--**********************************
--定时事件
--**********************************
function x200016_OnTimer(sceneId,selfId)
	--时间控制对白
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200016_g_MissionId)			--得到任务的序列号
	local nTime = LuaFnGetCurrentTime()
	local nStartTime = GetMissionParam(sceneId,selfId,misIndex,1)

	local nSceneId = GetMissionParam( sceneId,selfId,misIndex,3 )
	if 	nSceneId ~= sceneId    then
		-- 玩家离开了这个场景，关闭之
		StopMissionTimer(sceneId,selfId,x200016_g_MissionId)
		return
	end
	
	--对白部分（先每3秒一句话）
	local nTimes = GetMissionParam(sceneId,selfId,misIndex,4) -- 次数

	if nTime - nStartTime > 5  then
		if nTimes == 1  then
			CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "#{JQ_PaoPao_70}")
			--PrintStr("段誉")
		elseif nTimes == 2  then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_71}")
			--PrintStr("李延宗")
		elseif nTimes == 3  then
			CallScriptFunction((200060), "Paopao",sceneId, "段誉", "燕子坞", "#{JQ_PaoPao_72}")
			--PrintStr("段誉")
		elseif nTimes == 4  then
			CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "#{JQ_PaoPao_73}")
			--PrintStr("王语嫣")
		elseif nTimes == 5  then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_74}")
			--PrintStr("李延宗")
		elseif nTimes == 6  then
			CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "#{JQ_PaoPao_75}")
			--PrintStr("王语嫣")
		elseif nTimes == 7  then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_76}")
			--PrintStr("李延宗")
		elseif nTimes == 8  then
			CallScriptFunction((200060), "Paopao",sceneId, "王语嫣", "燕子坞", "#{JQ_PaoPao_77}")
			--PrintStr("王语嫣")
		elseif nTimes == 9  then
			CallScriptFunction((200060), "Paopao",sceneId, "李延宗", "燕子坞", "#{JQ_PaoPao_78}")
			--PrintStr("李延宗")
		elseif nTimes == 10  then
			-- 李延宗 消失，同时玩家得到解药
			local nMonsterNum = GetMonsterCount(sceneId)
			local bHave = 0
			local ii = 0
			local bHaveMonster = 0
			for ii=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,ii)
				if GetName(sceneId, nMonsterId)  == "李延宗"  then
					LuaFnDeleteMonster(sceneId, nMonsterId)
					ItemBoxEnterScene(62,74,-1,sceneId,1,1,40001005)
				end
			end
		end
		
		SetMissionByIndex(sceneId,selfId,misIndex,4,nTimes+1)
		SetMissionByIndex(sceneId,selfId,misIndex,1,nTime)
	end
	
	if nTimes == 11  then
		BeginEvent(sceneId)
		AddText(sceneId,"任务完成");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		
		--关闭计时器
		StopMissionTimer(sceneId,selfId,x200016_g_MissionId)
		
	end
	
end

--**********************************
--放弃
--**********************************
function x200016_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200016_g_MissionId )
	DelItem( sceneId, selfId, 40001005, 1 )	

--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200016_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200016_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
	BeginEvent(sceneId)
		AddText(sceneId,x200016_g_MissionName)
		AddText(sceneId,x200016_g_MissionComplete)
		AddMoneyBonus( sceneId, x200016_g_MoneyBonus )
		for i, item in x200016_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x200016_g_ScriptId,x200016_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200016_CheckSubmit( sceneId, selfId )
--	local misIndex = GetMissionIndexByID(sceneId,selfId,x200016_g_MissionId)
	
--	local bOk = GetMissionParam(sceneId,selfId,misIndex,0)
--	if bOk == 0    then
--		return 0
--	end

	--1, 是否有这个任务
	if IsHaveMission(sceneId,selfId,x200016_g_MissionId) < 1 then
		return 0;
	end
	
	--2, 是否已经完成这个任务
	if IsMissionHaveDone(sceneId,selfId,x200016_g_MissionId) > 0  then
		return 0;
	end

	--3，检测玩家身上是不是有任务物品
	if GetItemCount( sceneId, selfId, 40001005 ) < 1    then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200016_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200016_CheckSubmit( sceneId, selfId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200016_g_RadioItemBonus do
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

		if DelMission( sceneId, selfId, x200016_g_MissionId ) ~= 1 then
			return
		end

		MissionCom( sceneId, selfId, x200016_g_MissionId )

		if DelItem( sceneId, selfId, 40001005, 1 ) ~= 1 then
			return
		end
		
		AddItemListToHuman(sceneId,selfId)

		--添加任务奖励
		AddMoney(sceneId,selfId, x200016_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200016_g_exp)

		Msg2Player( sceneId, selfId, "#Y完成任务：悲酥清风", MSG2PLAYER_PARA )

	
		Msg2Player( sceneId, selfId,"你已经完成了#G燕子坞#W系列任务",MSG2PLAYER_PARA )
		local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
		LuaFnSendMailToGUID(sceneId, selfGuid, "你已经完成了#G燕子坞#W系列任务。请在达到40级之后，在大理城找到赵天师，开启#G聚贤庄#W系列任务。")
		
		-- 完成燕子坞剧情，给10点剧情点
		local nPoint = GetHumanJuqingPoint(sceneId, selfId)
		SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
		
		-- 通知玩家，可以做剧情循环任务了
		-- 您现在可以去AA城的[bb，cc]找到DD，接受DD循环任务。
		local strText1 = "#{LOOTMISSION_MAIL_05}#r#{LOOTMISSION_MAIL_06}#r#{LOOTMISSION_MAIL_07}"		
		LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
		
		BeginEvent(sceneId)
			AddText(sceneId,"#{LOOTMISSION_INFO_02}");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200016_OnKillObject( sceneId, selfId, objdataId ,objId)
end

--**********************************
--进入区域事件
--**********************************
function x200016_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200016_OnItemChanged( sceneId, selfId, itemdataId )

end







