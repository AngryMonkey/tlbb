-- 剧情任务——万劫谷  副本内送信到副本外
-- 石敢当->段正淳

--MisDescBegin
--脚本号
x200004_g_ScriptId = 200004

--任务号
x200004_g_MissionId = 4

--前续任务
x200004_g_PreMissionId = 3

--上一个任务的ID
--g_MissionIdPre = 

--目标NPC
x200004_g_Name	="段正淳"

--任务归类
x200004_g_MissionKind = 51

--任务等级
x200004_g_MissionLevel = 20

--是否是精英任务
x200004_g_IfMissionElite = 0

--接受任务NPC属性
x200004_g_Position_X=62.9422
x200004_g_Position_Z=35.9417
x200004_g_SceneID=2
x200004_g_AccomplishNPC_Name="段正淳"

--任务名
x200004_g_MissionName="恶贯满盈"
x200004_g_MissionInfo="#{Mis_juqing_0004}"
x200004_g_MissionTarget="#{Mis_juqing_Tar_0004}"
x200004_g_MissionComplete="  这，这，我马上把这件事情通知皇兄。"

x200004_g_MoneyBonus=10
x200004_g_exp=6900

x200004_g_RadioItemBonus={{id=10414001 ,num=1},{id=10414002,num=1},{id=10414003,num=1},{id=10414004,num=1}}

x200004_g_Custom	= { {id="已找到段正淳",num=1} }

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200004_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200004_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200004_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200004_g_Name then
			x200004_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x200004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200004_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
			AddText(sceneId,x200004_g_MissionName)
			AddText(sceneId,x200004_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId,x200004_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200004_g_MoneyBonus )
			for i, item in x200004_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200004_g_ScriptId,x200004_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200004_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200004_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200004_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200004_g_Name then
			AddNumText(sceneId, x200004_g_ScriptId,x200004_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x200004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200004_g_Name then
			AddNumText(sceneId,x200004_g_ScriptId,x200004_g_MissionName,1,-1);
		end
	end
end

--**********************************
--检测接受条件
--**********************************
function x200004_CheckAccept( sceneId, selfId )
	--需要3级才能接
	if GetLevel( sceneId, selfId ) < 20 then
		return 0
	end
	
	if IsMissionHaveDone(sceneId,selfId,x200004_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1	
end

--**********************************
--接受
--**********************************
function x200004_OnAccept( sceneId, selfId, targetId )
	if x200004_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	--加入任务到玩家列表
	local ret = AddMission( sceneId,selfId, x200004_g_MissionId, x200004_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
		return
	end
	Msg2Player(  sceneId, selfId,"#Y接受任务：恶贯满盈",MSG2PLAYER_PARA )
	
	local misIndex = GetMissionIndexByID(sceneId,selfId,x200004_g_MissionId)
	SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
end

--**********************************
--放弃
--**********************************
function x200004_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200004_g_MissionId )
--	--CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200004_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200004_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200004_g_MissionName)
		AddText(sceneId,x200004_g_MissionComplete)
		AddMoneyBonus( sceneId, x200004_g_MoneyBonus )
		for i, item in x200004_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200004_g_ScriptId,x200004_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200004_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200004_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200004_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200004_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
  	BeginAddItem(sceneId)
		for i, item in x200004_g_RadioItemBonus do
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

		--添加任务奖励
		AddMoney(sceneId,selfId,x200004_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200004_g_exp)

		DelMission( sceneId,selfId,  x200004_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200004_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：恶贯满盈",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200002), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200004_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200004_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200004_OnItemChanged( sceneId, selfId, itemdataId )
end
