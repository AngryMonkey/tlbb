-- 独战双雄   在副本中杀怪，夺取东西

--************************************************************************
--MisDescBegin
--脚本号
x200012_g_ScriptId = 200012

--副本名称
x200012_g_CopySceneName="燕子坞"

--任务号
x200012_g_MissionId = 11

--前续任务号
x200012_g_PreMissionId = 10

--目标NPC
x200012_g_Name = "王语嫣"

--是否是精英任务
x200012_g_IfMissionElite = 1

--任务等级
x200012_g_MissionLevel = 30

--任务归类
x200012_g_MissionKind = 48

--任务文本描述
x200012_g_MissionName="独战双雄"
x200012_g_MissionInfo="#{Mis_juqing_0011}"
x200012_g_MissionTarget="#{Mis_juqing_Tar_0011}"	--任务目标
x200012_g_MissionComplete="  太好了，那些坏人一定会吓跑的，我们安全了。"	--完成任务npc说话的话
x200012_g_MissionContinue="  你已经打败司马林和姚伯当，拿到雷公轰和五虎断门刀了吗？"

x200012_g_MoneyBonus=8100
x200012_g_exp=9600

x200012_g_RadioItemBonus={{id=10415001 ,num=1},{id=10415002,num=1},{id=10415003,num=1}}

x200012_g_DemandItem={{id=40001002,num=1},{id=40001003,num=1}}		--从背包中计算

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200012_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x200012_g_MissionId) > 0 then
		--发送任务需求的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200012_g_MissionName)
			AddText(sceneId,x200012_g_MissionContinue)
			AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
		EndEvent( )
		bDone = x200012_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId,bDone)
    --满足任务接收条件
  elseif x200012_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x200012_g_MissionName)
			AddText(sceneId,x200012_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200012_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
			for i, item in x200012_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId)
  end

end

--**********************************
--列举事件
--**********************************
function x200012_OnEnumerate( sceneId, selfId, targetId )

  --如果玩家完成过这个任务
  if IsMissionHaveDone(sceneId,selfId,x200012_g_MissionId) > 0 then
		return
	end
    --如果已接此任务
	if IsHaveMission(sceneId,selfId,x200012_g_MissionId) > 0 then
		AddNumText(sceneId,x200012_g_ScriptId,x200012_g_MissionName,2,-1);
		--满足任务接收条件
	elseif x200012_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x200012_g_ScriptId,x200012_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200012_CheckAccept( sceneId, selfId )
	--需要4级才能接
	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200012_g_PreMissionId) < 1 then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200012_OnAccept( sceneId, selfId )
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200012_g_MissionId, x200012_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end

	misIndex = GetMissionIndexByID(sceneId,selfId,x200012_g_MissionId)			--得到任务的序列号
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)						--根据序列号把任务变量的第0位置0
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)						--根据序列号把任务变量的第1位置0
	Msg2Player(  sceneId, selfId,"#Y接受任务：独战双雄",MSG2PLAYER_PARA )
	--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200012_g_SignPost.x, x200012_g_SignPost.z, x200012_g_SignPost.tip )
	
	--接任务后，把相关的怪设置为可以战斗
	-- 需要遍历所有的怪，改变他们的阵营
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "司马林"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		elseif GetName(sceneId, nMonsterId)  == "姚伯当"  then
			SetUnitReputationID(sceneId, selfId, nMonsterId, 29)
		end
	end
	
	SetMissionEvent(sceneId, selfId, x200012_g_MissionId, 0)
	SetMissionEvent(sceneId, selfId, x200012_g_MissionId, 2)

end

--**********************************
--放弃
--**********************************
function x200012_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200012_g_MissionId )
	--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200012_g_SignPost.tip )
	DelItem( sceneId, selfId, 40001002, 1 )	
	DelItem( sceneId, selfId, 40001003, 1 )	
end

--**********************************
--继续
--**********************************
function x200012_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200012_g_MissionName)
		AddText(sceneId,x200012_g_MissionComplete)
		AddMoneyBonus( sceneId, x200012_g_MoneyBonus )
		for i, item in x200012_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200012_g_ScriptId,x200012_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200012_CheckSubmit( sceneId, selfId )
	-- 看玩家身上是不是有这两个物品
	if  1 > GetItemCount( sceneId, selfId, 40001002 )    then
		return 0
	end
	if  1 > GetItemCount( sceneId, selfId, 40001003 )    then
		return 0
	end
	
	return 1
end

--**********************************
--提交
--**********************************
function x200012_OnSubmit( sceneId, selfId, targetId,selectRadioId )
	if x200012_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then

  	BeginAddItem(sceneId)
		for i, item in x200012_g_RadioItemBonus do
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
		--删除道具
		DelItem( sceneId, selfId, 40001002, 1 )
		DelItem( sceneId, selfId, 40001003, 1 )
		AddItemListToHuman(sceneId,selfId)

		--添加任务奖励
		AddMoney(sceneId,selfId, x200012_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200012_g_exp)

		DelMission( sceneId, selfId, x200012_g_MissionId )
		MissionCom( sceneId, selfId, x200012_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：独战双雄",MSG2PLAYER_PARA )
		-- 调用后续任务
		CallScriptFunction((200013), "OnDefaultEvent",sceneId, selfId, targetId )
	end
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200012_OnKillObject( sceneId, selfId, objdataId ,objId)

	-- 如果杀了“司马林”或者“姚伯当”就往掉落包里头加对应的东西
	if GetName(sceneId,objId) == "司马林"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)--取得这个怪物死后拥有分配权的人数
		for j=0,num-1 do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)--取得拥有分配权的人的objId
			if IsHaveMission(sceneId,humanObjId,x200012_g_MissionId) > 0 then	--如果这个人拥有任务	
				AddMonsterDropItem(sceneId,objId,humanObjId,40001002)    --给这个人任务道具(道具会出现在尸体包里)
				
				-- 喊话，然后Npc消失
				--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0004}",0)
				CallScriptFunction((200060), "Duibai",sceneId, "青城派弟子", "燕子坞", "#{JQ_DB_0004}" )

				-- 消失 青城派弟子	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "青城派弟子"  then
						-- 删除 青城派弟子
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end				
			end
		end
	end

	if GetName(sceneId,objId) == "姚伯当"	  then
		local num = GetMonsterOwnerCount(sceneId,objId)--取得这个怪物死后拥有分配权的人数
		for j=0,num-1 do
			local humanObjId = GetMonsterOwnerID(sceneId,objId,j)--取得拥有分配权的人的objId
			if IsHaveMission(sceneId,humanObjId,x200012_g_MissionId) > 0 then	--如果这个人拥有任务	
				AddMonsterDropItem(sceneId,objId,humanObjId,40001003)    --给这个人任务道具(道具会出现在尸体包里)
				-- 喊话，然后Npc消失
				--BroadMsgByChatPipe(sceneId,selfId,"#{JQ_DB_0003}",0)
				CallScriptFunction((200060), "Duibai",sceneId, "秦家寨弟子", "燕子坞", "#{JQ_DB_0003}" )
				
				-- 消失 秦家寨弟子	
				local nMonsterNum = GetMonsterCount(sceneId)
				local ii = 0
				local bHaveMonster = 0
				for ii=0, nMonsterNum-1 do
					local nMonsterId = GetMonsterObjID(sceneId,ii)
					if GetName(sceneId, nMonsterId)  == "秦家寨弟子"  then
						-- 删除 秦家寨弟子
						LuaFnDeleteMonster(sceneId, nMonsterId)
					end
				end				
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x200012_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200012_OnItemChanged( sceneId, selfId, itemdataId )

	if itemdataId == 40001002    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "已得到雷公轰:1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
	
	if itemdataId == 40001003    then
	 	BeginEvent(sceneId)
			AddText(sceneId, "已得到五虎断门刀:1/1")
	  EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end



