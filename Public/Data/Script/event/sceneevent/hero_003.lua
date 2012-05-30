-- 212130
-- 天下英雄谁敌手

--MisDescBegin
--脚本号
x212130_g_ScriptId = 212130

--接受任务NPC属性
x212130_g_Position_X=267
x212130_g_Position_Z=116
x212130_g_SceneID=1
x212130_g_AccomplishNPC_Name="王安石"

--任务号
x212130_g_MissionId = 252

--目标NPC
x212130_g_Name	="王安石"

--任务归类
x212130_g_MissionKind = 55

--任务等级
x212130_g_MissionLevel = 75

--是否是精英任务
x212130_g_IfMissionElite = 0

--任务名
x212130_g_MissionName="天下英雄谁敌手"
x212130_g_MissionInfo="#{Mis_75_desc_003}"
x212130_g_MissionTarget="    在苏州城找到王安石#{_INFOAIM267,116,1,王安石}。"
--x212130_g_MissionContinue="  生命如果能够重来一次，我会怎么选择呢？既然真实和虚幻无从分辨，为何不听从心灵的召唤做出抉择呢。"
x212130_g_MissionComplete="  国富兵强，百姓安居乐业是我一生的夙愿。和这个理想比起来，个人的荣辱得失还算得了什么呢！"

x212130_g_MoneyBonus=5000
x212130_g_exp=50000

x212130_g_Custom	= { {id="已找到王安石",num=1} }
x212130_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212130_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212130_g_Name then
			x212130_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212130_g_MissionName)
				AddText(sceneId,x212130_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212130_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212130_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212130_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212130_g_Name then
			AddNumText(sceneId, x212130_g_ScriptId,x212130_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212130_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212130_g_Name then
			AddNumText(sceneId,x212130_g_ScriptId,x212130_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212130_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < 10 then
		return 0
	end
	
	return 1
end

--**********************************
--检测接受条件
--**********************************
function x212130_CheckAcceptEx( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212130_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212130_g_MissionLevel then
		return 0
	end
	return 1
end


--**********************************
--接受
--**********************************
function x212130_OnAccept( sceneId, selfId, targetId )
--PrintNum(1)
	if x212130_CheckAcceptEx(sceneId, selfId) < 1   then
		BeginEvent(sceneId)
			AddText( sceneId, "  这个任务需要你的人物等级到75级，前六种心法等级都达到70级才能接取。" )
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return 
	end

	-- 检查玩家的心法是不是达到了要求（前六种心法等级大于等于30级）
	
	if CallScriptFunction( 212120, "CheckAllXinfaLevel", sceneId, selfId, 70 ) == 0  then
   	BeginEvent(sceneId)
			local strText = format("这个任务需要前六种心法都达到70级。")
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 需要网玩家身上丢一个物品
	--加入任务到玩家列表
	local ret = AddMission(sceneId,selfId, x212130_g_MissionId, x212130_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y你的任务日志已经满了。")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y接受任务：天下英雄谁敌手。")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212130_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x212130_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212130_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212130_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212130_g_MissionName)
	AddText(sceneId,x212130_g_MissionComplete)
	AddMoneyBonus( sceneId, x212130_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212130_g_ScriptId,x212130_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212130_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212130_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212130_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212130_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212130_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212130_g_exp)
		DelMission( sceneId, selfId, x212130_g_MissionId )
		MissionCom( sceneId, selfId, x212130_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：天下英雄谁敌手",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212130_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212130_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212130_OnItemChanged( sceneId, selfId, itemdataId )
end

