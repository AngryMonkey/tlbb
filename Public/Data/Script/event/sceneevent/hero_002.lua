-- 212129
-- 古来英雄皆寂寞

--MisDescBegin
--脚本号
x212129_g_ScriptId = 212129

--接受任务NPC属性
x212129_g_Position_X=208
x212129_g_Position_Z=212
x212129_g_SceneID=0
x212129_g_AccomplishNPC_Name="司马光"

--任务号
x212129_g_MissionId = 251

--目标NPC
x212129_g_Name	="司马光"

--任务归类
x212129_g_MissionKind = 55

--任务等级
x212129_g_MissionLevel = 75

--是否是精英任务
x212129_g_IfMissionElite = 0

--任务名
x212129_g_MissionName="古来英雄皆寂寞"
x212129_g_MissionInfo="#{Mis_75_desc_002}"
x212129_g_MissionTarget="    在洛阳城找到司马光#{_INFOAIM207,212,0,司马光}。"
--x212129_g_MissionContinue="  生命如果能够重来一次，我会怎么选择呢？既然真实和虚幻无从分辨，为何不听从心灵的召唤做出抉择呢。"
x212129_g_MissionComplete="  历史是条长河，波涛滚滚，奔流不息。那些雄姿勃发的英雄，轰轰烈烈的豪情都随着滔滔流水一去不返了……"

x212129_g_MoneyBonus=5000
x212129_g_exp=50000

x212129_g_Custom	= { {id="已找到司马光",num=1} }
x212129_g_IsMissionOkFail = 0


--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212129_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212129_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212129_g_Name then
			x212129_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x212129_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212129_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x212129_g_MissionName)
				AddText(sceneId,x212129_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x212129_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x212129_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x212129_g_ScriptId,x212129_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x212129_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212129_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212129_g_Name then
			AddNumText(sceneId, x212129_g_ScriptId,x212129_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212129_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x212129_g_Name then
			AddNumText(sceneId,x212129_g_ScriptId,x212129_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x212129_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 ) then
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
function x212129_CheckAcceptEx( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212129_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel(sceneId, selfId) < x212129_g_MissionLevel then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x212129_OnAccept( sceneId, selfId, targetId )
	if x212129_CheckAcceptEx(sceneId, selfId) < 1   then
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
	local ret = AddMission(sceneId,selfId, x212129_g_MissionId, x212129_g_ScriptId, 0, 0, 0)
	if ret <= 0 then
		local strText = format("#Y你的任务日志已经满了。")
		Msg2Player(sceneId, selfId, strText, MSG2PLAYER_PARA)
   	BeginEvent(sceneId)
			AddText(sceneId, strText)
	  EndEvent(sceneId)
  	DispatchMissionTips(sceneId,selfId)
		return
	end
	local strText = format("#Y接受任务：古来英雄皆寂寞。")
	Msg2Player(sceneId, selfId, strText,MSG2PLAYER_PARA)
 	BeginEvent(sceneId)
		AddText(sceneId, strText)
  EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	local misIndex = GetMissionIndexByID(sceneId,selfId,x212129_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	
end

--**********************************
--放弃
--**********************************
function x212129_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212129_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212129_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
  BeginEvent(sceneId)
	AddText(sceneId,x212129_g_MissionName)
	AddText(sceneId,x212129_g_MissionComplete)
	AddMoneyBonus( sceneId, x212129_g_MoneyBonus )
  EndEvent( )
  DispatchMissionContinueInfo(sceneId,selfId,targetId,x212129_g_ScriptId,x212129_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212129_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212129_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212129_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x212129_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--添加任务奖励
		AddMoney(sceneId,selfId, x212129_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x212129_g_exp)
		DelMission( sceneId, selfId, x212129_g_MissionId )
		MissionCom( sceneId, selfId, x212129_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：古来英雄皆寂寞",MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212129_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212129_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212129_OnItemChanged( sceneId, selfId, itemdataId )
end

