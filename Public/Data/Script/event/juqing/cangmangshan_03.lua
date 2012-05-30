-- 	勤王   把辽国皇帝的圣旨交给雁北的耶律余睹。

--************************************************************************
--MisDescBegin
--脚本号
x200032_g_ScriptId = 200032

--任务号
x200032_g_MissionId = 28

--前续任务号
x200032_g_PreMissionId = 27

--接受任务NPC属性
x200032_g_Position_X=195
x200032_g_Position_Z=41
x200032_g_SceneID=19
x200032_g_AccomplishNPC_Name="耶律余暏"

--目标NPC
x200032_g_Name = "耶律余睹"

--是否是精英任务
x200032_g_IfMissionElite = 1

--任务等级
x200032_g_MissionLevel = 50

--任务归类
x200032_g_MissionKind = 52

--任务文本描述
x200032_g_MissionName="勤王"
x200032_g_MissionInfo="#{Mis_juqing_0028}"
x200032_g_MissionTarget="#{Mis_juqing_Tar_0028}"	--任务目标
x200032_g_MissionComplete="  末将接旨，一定不负皇帝重托。"	--完成任务npc说话的话

x200032_g_MoneyBonus=21600
x200032_g_exp=26400

x200032_g_Custom	= { {id="已得到辽国皇帝的圣旨",num=1} }

--MisDescEnd
--************************************************************************

--**********************************
--任务入口函数
--**********************************
function x200032_OnDefaultEvent( sceneId, selfId, targetId )
	--如果玩家完成过这个任务
	if (IsMissionHaveDone(sceneId,selfId,x200032_g_MissionId) > 0 ) then
		return
	elseif( IsHaveMission(sceneId,selfId,x200032_g_MissionId) > 0)  then
		-- 检测下名字，安全点点
		if GetName(sceneId, targetId) == x200032_g_Name  then
	    BeginEvent(sceneId)
			AddText(sceneId,x200032_g_MissionName)
			AddText(sceneId,x200032_g_MissionComplete)
			AddMoneyBonus( sceneId, x200032_g_MoneyBonus )
	    EndEvent( )
	    DispatchMissionContinueInfo(sceneId,selfId,targetId,x200032_g_ScriptId,x200032_g_MissionId)
		end
	
	--满足任务接收条件
	elseif x200032_CheckAccept(sceneId,selfId) > 0 then
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
		AddText(sceneId,x200032_g_MissionName)
		AddText(sceneId,x200032_g_MissionInfo)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200032_g_MissionTarget)
		AddText(sceneId,"#{M_SHOUHUO}#r")
		AddMoneyBonus( sceneId, x200032_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200032_g_ScriptId,x200032_g_MissionId)
	end
end

--**********************************
--列举事件
--**********************************
function x200032_OnEnumerate( sceneId, selfId, targetId )
	
	--如果玩家完成过这个任务
	if IsMissionHaveDone(sceneId,selfId,x200032_g_MissionId) > 0 then
		return 
	--如果已接此任务
	elseif IsHaveMission(sceneId,selfId,x200032_g_MissionId) > 0 then
		--需要在副本才可以
		if GetName(sceneId, targetId) == x200032_g_Name  then
			AddNumText(sceneId, x200032_g_ScriptId,x200032_g_MissionName,2,-1);
		end
		
	--满足任务接收条件
	elseif x200032_CheckAccept(sceneId,selfId) > 0 then	
		AddNumText(sceneId,x200032_g_ScriptId,x200032_g_MissionName,1,-1);
	end

end

--**********************************
--检测接受条件
--**********************************
function x200032_CheckAccept( sceneId, selfId )
	-- 1，检测玩家是不是已经做过
	if (IsMissionHaveDone(sceneId,selfId,x200032_g_MissionId) > 0 ) then
		return 0
	end
		
	-- 等级检测
	if GetLevel( sceneId, selfId ) < x200032_g_MissionLevel then
		return 0
	end
	
	-- 前续任务的完成情况
	if IsMissionHaveDone(sceneId,selfId,x200032_g_PreMissionId) < 1  then
		return 0
	end
	
	--3，场景不是副本
	local sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType ~= 1 then --场景类型是副本
		return 0
	end
	
	return 1
end


--**********************************
--接受
--**********************************
function x200032_OnAccept( sceneId, selfId, targetId )

	if x200032_CheckAccept(sceneId, selfId) < 1   then
		return 0
	end
	
	-- 需要网玩家身上丢一个物品
	BeginAddItem( sceneId )
		AddItem( sceneId, 40001008, 1 )
	local ret = EndAddItem( sceneId, selfId )

	if ret <= 0 then 
		--提示不能接任务了
		Msg2Player(  sceneId, selfId,"#Y你的任务背包已经满了。", MSG2PLAYER_PARA )
	else
		--加入任务到玩家列表
		local ret = AddMission( sceneId,selfId, x200032_g_MissionId, x200032_g_ScriptId, 0, 0, 0 )
		if ret <= 0 then
			Msg2Player(  sceneId, selfId,"#Y你的任务日志已经满了" , MSG2PLAYER_PARA )
			return
		end
		AddItemListToHuman(sceneId,selfId)
		Msg2Player(  sceneId, selfId,"#Y接受任务：勤王",MSG2PLAYER_PARA )
		local misIndex = GetMissionIndexByID(sceneId,selfId,x200032_g_MissionId)
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1)
	end

end

--**********************************
--放弃
--**********************************
function x200032_OnAbandon( sceneId, selfId )
  DelMission( sceneId, selfId, x200032_g_MissionId )
	DelItem( sceneId, selfId, 40001008, 1 )	
 
end

--**********************************
--继续
--**********************************
function x200032_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x200032_CheckSubmit( sceneId, selfId, selectRadioId )

end

--**********************************
--提交
--**********************************
function x200032_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	-- 可以提交的条件判定
	-- 1，有这个任务，
	if( IsHaveMission(sceneId,selfId,x200032_g_MissionId) > 0)  then
		--添加任务奖励
		DelItem( sceneId, selfId, 40001008, 1 )	
		AddMoney(sceneId,selfId, x200032_g_MoneyBonus );
		LuaFnAddExp( sceneId, selfId, x200032_g_exp)

		DelMission( sceneId, selfId,  x200032_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId, selfId,  x200032_g_MissionId )
		Msg2Player( sceneId, selfId,"#Y完成任务：勤王",MSG2PLAYER_PARA )

		-- 调用后续任务
		CallScriptFunction((200033), "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x200032_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--进入区域事件
--**********************************
function x200032_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x200032_OnItemChanged( sceneId, selfId, itemdataId )
	
end


