-- 200088
-- 送信任务 

--MisDescBegin

--脚本号
x200088_g_ScriptId = 200088

--任务号
x200088_g_MissionId = 18

--前续任务
x200088_g_PreMissionId = 17

--目标NPC
x200088_g_Name	="徐惊雷"

--任务归类
x200088_g_MissionKind = 47

--任务等级
x200088_g_MissionLevel = 40

--接受任务NPC属性
x200088_g_Position_X=210.2844
x200088_g_Position_Z=201.6758
x200088_g_SceneID=0
x200088_g_AccomplishNPC_Name="徐惊雷"

--是否是精英任务
x200088_g_IfMissionElite = 0

--任务名
x200088_g_MissionName="共同进退"
x200088_g_MissionInfo="#{Mis_juqing_0018}"
x200088_g_MissionTarget="#{Mis_juqing_Tar_0018}"
x200088_g_MissionComplete="  想不到镇南王竟置民族大义于不顾，真是令人痛心啊。"

x200088_g_MoneyBonus=5400
x200088_g_exp=5400

x200088_g_Custom	= { {id="已找到徐惊雷",num=1} }
x200088_g_IsMissionOkFail = 0

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x200088_OnDefaultEvent( sceneId, selfId, targetId )
	
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200088_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200088_g_MissionId) > 0)  then
		if GetName(sceneId,targetId) == x200088_g_Name then
			x200088_OnContinue( sceneId, selfId, targetId )
		end
	
	--满足任务接收条件
	elseif x200088_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200088_g_Name then
			--发送任务接受时显示的信息
			local  PlayerName=GetName(sceneId,selfId)	
			BeginEvent(sceneId)
				AddText(sceneId,x200088_g_MissionName)
				AddText(sceneId,x200088_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,x200088_g_MissionTarget)
				AddText(sceneId,"#{M_SHOUHUO}#r")
				AddMoneyBonus( sceneId, x200088_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x200088_g_ScriptId,x200088_g_MissionId)
		end
	end
end

--**********************************
--列举事件
--**********************************
function x200088_OnEnumerate( sceneId, selfId, targetId )

	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200088_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200088_g_MissionId) > 0 then
		if GetName(sceneId,targetId) == x200088_g_Name then
			AddNumText(sceneId, x200088_g_ScriptId,x200088_g_MissionName,2,-1);
		end
	--满足任务接收条件
	elseif x200088_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x200088_g_Name then
			AddNumText(sceneId,x200088_g_ScriptId,x200088_g_MissionName,1,-1);
		end
	end

end

--**********************************
--检测接受条件
--**********************************
function x200088_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200088_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel( sceneId, selfId ) < x200088_g_MissionLevel then
		return 0
	end
	
	-- 前续任务的完成情况
	if IsMissionHaveDone(sceneId,selfId,x200088_g_PreMissionId) < 1  then
		return 0
	end
	
	return 1
end

--**********************************
--接受
--**********************************
function x200088_OnAccept( sceneId, selfId, targetId )
	if x200088_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- 需要网玩家身上丢一个物品
	BeginAddItem( sceneId )
		AddItem( sceneId, 40001006, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--提示不能接任务了
		Msg2Player(  sceneId, selfId,"#Y你的任务背包已经满了。", MSG2PLAYER_PARA )
	else
		--加入任务到玩家列表
		
		
		local ret = AddMission( sceneId,selfId, x200088_g_MissionId, x200088_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y接受任务：共同进退",MSG2PLAYER_PARA )

		local misIndex = GetMissionIndexByID(sceneId,selfId,x200088_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
		SetMissionByIndex( sceneId, selfId, misIndex, 1, 1)
	end
	
end

--**********************************
--放弃
--**********************************
function x200088_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
  DelMission( sceneId, selfId, x200088_g_MissionId )
	DelItem( sceneId, selfId, 40001006, 1 )	

--	CallScriptFunction( SCENE_SCRIPT_ID, "DelSignpost", sceneId, selfId, sceneId, x200088_g_SignPost.tip )
end

--**********************************
--继续
--**********************************
function x200088_OnContinue( sceneId, selfId, targetId )
	--提交任务时的说明信息
    BeginEvent(sceneId)
		AddText(sceneId,x200088_g_MissionName)
		AddText(sceneId,x200088_g_MissionComplete)
		AddMoneyBonus( sceneId, x200088_g_MoneyBonus )
    EndEvent( )
    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200088_g_ScriptId,x200088_g_MissionId)
end

--**********************************
--检测是否可以提交
--**********************************
function x200088_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x200088_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x200088_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x200088_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
		-- 删除任务道具
		DelItem( sceneId, selfId, 40001006, 1 )	
		--添加任务奖励
		AddMoney(sceneId,selfId,x200088_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId,x200088_g_exp)
		DelMission( sceneId,selfId,  x200088_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId,selfId,  x200088_g_MissionId )
		Msg2Player(  sceneId, selfId,"#Y完成任务：共同进退",MSG2PLAYER_PARA )
		
		-- 调用后续任务
		CallScriptFunction((200089), "OnDefaultEvent",sceneId, selfId, targetId )
		
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200088_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x200088_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x200088_OnItemChanged( sceneId, selfId, itemdataId )
end
