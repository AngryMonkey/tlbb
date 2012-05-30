--苍山 狼穴大营 探索类任务
--212121


--MisDescBegin
--脚本号
x212121_g_ScriptId = 212121

--接受任务NPC属性
x212121_g_Position_X=154
x212121_g_Position_Z=205
x212121_g_SceneID=25
x212121_g_AccomplishNPC_Name="萨玛"

--任务号
x212121_g_MissionId = 932

--目标NPC
x212121_g_Name	="萨玛"

--任务归类
x212121_g_MissionKind = 35

--任务等级
x212121_g_MissionLevel = 41

--是否是精英任务
x212121_g_IfMissionElite = 0

--任务名
x212121_g_MissionName="狼穴大营"
x212121_g_MissionInfo="#{Mis_30_60_desc_007}"
x212121_g_MissionTarget="    苍山的萨玛#{_INFOAIM155,205,25,萨玛}要你去探索狼穴大营。"
x212121_g_MissionContinue="  你已经侦查了狼穴大营吗？"
x212121_g_MissionComplete="  看来萨鲁真的要采取进一步的行动了！我也要好好准备一下了。"

x212121_g_MoneyBonus=8500
x212121_g_exp=10000

x212121_g_Custom	= { {id="已探索狼穴大营",num=1} }
x212121_g_IsMissionOkFail = 0

--MisDescEnd

--**********************************
--任务入口函数
--**********************************
function x212121_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212121_g_MissionId) > 0)  then
			--x212121_OnContinue( sceneId, selfId, targetId )
			local bDone = x212121_CheckSubmit( sceneId, selfId )
			BeginEvent(sceneId)
				AddText(sceneId,x212121_g_MissionName)
				AddText(sceneId,x212121_g_MissionContinue)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId,bDone)		
	
	--满足任务接收条件
	elseif x212121_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		local  PlayerName=GetName(sceneId,selfId)	
		BeginEvent(sceneId)
			AddText(sceneId,x212121_g_MissionName)
			AddText(sceneId,x212121_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212121_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212121_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212121_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212121_g_MissionId) > 0 then
			AddNumText(sceneId, x212121_g_ScriptId,x212121_g_MissionName,2,-1);
	--满足任务接收条件
	elseif x212121_CheckAccept(sceneId,selfId) > 0 then
			AddNumText(sceneId,x212121_g_ScriptId,x212121_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x212121_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212121_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212121_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212121_OnAccept( sceneId, selfId, targetId )
	if x212121_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于20级）
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 20 ) == 0  then  -- zchw
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到20级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212121_g_MissionId, x212121_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y你的任务日志已经满了")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y接受任务：狼穴大营")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212121_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 0)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 0)
	
	-- 玩家关心进入区域
	SetMissionEvent( sceneId,selfId,x212121_g_MissionId, 1 )
	
end

--**********************************
--放弃
--**********************************
function x212121_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212121_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212121_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212121_g_MissionName)
	AddText(sceneId,x212121_g_MissionComplete)
	AddMoneyBonus( sceneId, x212121_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212121_g_ScriptId,x212121_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212121_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212121_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212121_g_MissionId)
	if GetMissionParam(sceneId, selfId, misIndex, 0) < 1  then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212121_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212121_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212121_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212121_g_exp)
		DelMission( sceneId, selfId, x212121_g_MissionId )
		MissionCom( sceneId, selfId, x212121_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：狼穴大营",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212121_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212121_OnEnterArea( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x212121_OnItemChanged( sceneId, selfId, itemdataId )
end

