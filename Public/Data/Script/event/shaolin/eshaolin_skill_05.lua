--x212144_g_ScriptId = 212144
-- 灭此朝食

-- 交5G学技能

--MisDescBegin

--脚本号
x212144_g_ScriptId = 212144

--接受任务NPC属性
x212144_g_Position_X=217
x212144_g_Position_Z=255
x212144_g_SceneID=2
x212144_g_AccomplishNPC_Name="王韶"

--任务号
x212144_g_MissionId = 966

--前续任务
x212144_g_PreMissionId = 965

--目标NPC
x212144_g_Name	="王韶"

--任务归类
x212144_g_MissionKind = 20

--任务等级
x212144_g_MissionLevel = 30

--是否是精英任务
x212144_g_IfMissionElite = 0

--任务名
x212144_g_MissionName="灭此朝食"
x212144_g_MissionInfo="#{Mis_shaolin_966}"
x212144_g_MissionTarget="  把5个金币交给大理城修文台#W的#R王韶#W#{_INFOAIM217,255,2,王韶}。"
x212144_g_MissionContinue="  你决定要学习“灭此朝食”了吗？"
x212144_g_MissionComplete="  看好了，这一招就传给你了，以后要好好使用。"

x212144_g_MoneyBonus=1000
x212144_g_exp=2000

--x212144_g_Custom	= { {id="",num=1} }
x212144_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x212144_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x212144_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x212144_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x212144_g_Name then
			x212144_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x212144_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x212144_g_MissionName)
			AddText(sceneId,x212144_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x212144_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x212144_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x212144_g_ScriptId,x212144_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x212144_OnEnumerate( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x212144_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x212144_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x212144_g_Name then
			AddNumText(sceneId, x212144_g_ScriptId,x212144_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x212144_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x212144_g_ScriptId,x212144_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x212144_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x212144_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel( sceneId, selfId ) < x212144_g_MissionLevel then
		return 0
	end
	
	-- 接任务的玩家必须是少令派的
	if GetMenPai(sceneId, selfId) ~= 0  then
		return 0
	end
	
	-- 前续任务的完成情况
	if IsMissionHaveDone(sceneId,selfId,x212144_g_PreMissionId) < 1  then
		return 0
	end
	return 1
end

--**********************************
--接受
--**********************************
function x212144_OnAccept( sceneId, selfId, targetId )
	if x212144_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x212144_g_MissionId, x212144_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y接受任务：灭此朝食",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x212144_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
end

--**********************************
--放弃
--**********************************
function x212144_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x212144_g_MissionId )
end

--**********************************
--继续
--**********************************
function x212144_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x212144_g_MissionName)
		AddText(sceneId,x212144_g_MissionComplete)
		AddMoneyBonus( sceneId, x212144_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x212144_g_ScriptId,x212144_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x212144_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x212144_g_MissionId )
	if bRet ~= 1 then
		return 0
	end
	
	if GetMoney(sceneId, selfId) < 50000   then
		return 2
	end

	return 1
end

--**********************************
--提交
--**********************************
function x212144_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x212144_CheckSubmit( sceneId, selfId, selectRadioId ) == 2 then
    BeginEvent(sceneId)
			AddText(sceneId,"你身上没有足够的金钱来完成这个任务.")
    EndEvent( )
    DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if x212144_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- 扣除玩家5个G
		if CostMoney(sceneId, selfId, 50000)  == 1  then
			--添加任务奖励
			AddMoney(sceneId,selfId,x212144_g_MoneyBonus );
			LuaFnAddExp( sceneId, selfId,x212144_g_exp)
			
			-- 检测玩家是不是峨眉派的弟子
			if GetMenPai(sceneId, selfId) == 0  then
				-- 给玩家增加304号技能
				AddSkill(sceneId, selfId, 304)
		    BeginEvent(sceneId)
					AddText(sceneId,"你学会了“灭此朝食”技能。")
		    EndEvent( )
		    DispatchMissionTips(sceneId,selfId)
			end
			
			DelMission( sceneId,selfId,  x212144_g_MissionId )
			--设置任务已经被完成过
			MissionCom( sceneId,selfId,  x212144_g_MissionId )
			Msg2Player(  sceneId, selfId,"#Y完成任务：灭此朝食",MSG2PLAYER_PARA )
			
			-- 调用后续任务
			CallScriptFunction((200087), "OnDefaultEvent",sceneId, selfId, targetId )
		
		else
	    BeginEvent(sceneId)
				AddText(sceneId,"扣除金钱出错。.")
	    EndEvent( )
	    DispatchMissionTips(sceneId,selfId)
			return
		end
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x212144_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x212144_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x212144_OnItemChanged( sceneId, selfId, itemdataId )
	
end
