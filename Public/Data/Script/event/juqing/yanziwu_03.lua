-- 夜长梦多
-- 把副本里头王语嫣的信送给苏州城的慕容复

--MisDescBegin
--脚本号
x200013_g_ScriptId = 200013

--任务号
x200013_g_MissionId = 12

--前续任务号
x200013_g_PreMissionId = 11

--上一个任务的ID
--g_MissionIdPre = 
--接受任务NPC属性
x200013_g_Position_X=129
x200013_g_Position_Z=77
x200013_g_SceneID=1
x200013_g_AccomplishNPC_Name="慕容复"

--目标NPC
x200013_g_Name	="慕容复"

--任务归类
x200013_g_MissionKind = 48

--任务等级
x200013_g_MissionLevel = 30

--是否是精英任务
x200013_g_IfMissionElite = 0

--任务名
x200013_g_MissionName="夜长梦多"
x200013_g_MissionInfo="#{Mis_juqing_0012}"
x200013_g_MissionTarget="#{Mis_juqing_Tar_0012}"
x200013_g_MissionContinue="  你找我有什么事情吗？"
x200013_g_MissionComplete="  是表妹让你给我带的信吗？他们现在是不是已经平安无事了？我先看看信。"

x200013_g_MoneyBonus=8100
x200013_g_exp=8000

x200013_g_DemandItem={{id=40001004,num=1}}

--x200013_g_Custom	= { {id="已找到慕容复",num=1} }
x200013_g_IsMissionOkFail = 0
--MisDescEnd

--x200013_g_MissionItem = 40001004


--**********************************
--任务入口函数
--**********************************
function x200013_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200013_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200013_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200013_g_Name then
			x200013_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x200013_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200013_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
			AddText(sceneId,x200013_g_MissionName)
			AddText(sceneId,x200013_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200013_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200013_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200013_g_ScriptId,x200013_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200013_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200013_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200013_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200013_g_Name then
			AddNumText(sceneId, x200013_g_ScriptId,x200013_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x200013_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200013_g_Name then
			AddNumText(sceneId,x200013_g_ScriptId,x200013_g_MissionName,1,-1);
		end
	end
end

--**********************************
--检测接受条件
--**********************************
function x200013_CheckAccept( sceneId, selfId )
	--需要3级才能接
	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end
	
	if 	IsMissionHaveDone(sceneId,selfId,x200013_g_PreMissionId) < 1 then
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x200013_OnAccept( sceneId, selfId )
	
	-- 添加任务道具，"40001004",王语嫣的信
	BeginAddItem( sceneId )
		AddItem( sceneId, 40001004, 1 )
	local ret = EndAddItem( sceneId, selfId )
	
	if ret <= 0 then 
		--提示不能接任务了
		Msg2Player(  sceneId, selfId,"#Y你的任务背包已经满了。", MSG2PLAYER_PARA )
	else
		--加入任务到玩家列表
		local ret = AddMission( sceneId,selfId, x200013_g_MissionId, x200013_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end
	
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y接受任务：夜长梦多",MSG2PLAYER_PARA )
		--CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x200013_g_SignPost.x, x200013_g_SignPost.z, x200013_g_SignPost.tip )
		
		-- 设置任务完成标记
		
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200013_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		--SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
		
	end
end

--**********************************
--放弃
--**********************************
function x200013_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x200013_g_MissionId )
--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200013_g_SignPost.tip )
	-- 删除相关物品
	DelItem( sceneId, selfId, 40001004, 1 )	
	
end

--**********************************
--继续
--**********************************
function x200013_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200013_g_MissionName)
		AddText(sceneId,x200013_g_MissionComplete)
		AddMoneyBonus( sceneId, x200013_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200013_g_ScriptId,x200013_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200013_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200013_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200013_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200013_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		--删除任务物品 
		DelItem( sceneId, selfId, 40001004, 1 )

		--添加任务奖励
		AddMoney(sceneId,selfId, x200013_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200013_g_exp)

		DelMission( sceneId, selfId, x200013_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId, selfId, x200013_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y完成任务：夜长梦多", MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200085), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200013_OnKillObject( sceneId, selfId, objdataId )
	
end

--**********************************
--进入区域事件
--**********************************
function x200013_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200013_OnItemChanged( sceneId, selfId, itemdataId )
	
end

