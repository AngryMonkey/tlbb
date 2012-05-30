--创建人[ QUFEI 2008-04-30 10:27 UPDATE BugID 34165 ]
--解决流失率引导任务事件脚本
--棋局引导任务_天师的期待2

--MisDescBegin
--脚本号
x500602_g_ScriptId	= 500602

--目标任务NPC属性
x500602_g_Position_X=160.2399
x500602_g_Position_Z=134.1486
x500602_g_SceneID=0
x500602_g_AccomplishNPC_Name="周天师"

--前续任务号
x500602_g_PreMissionId	=	408
--任务号
x500602_g_MissionId			= 409
--下一个任务的ID
x500602_g_MissionIdNext	= 410
--下一个任务的Index
x500602_g_MissionIndexNext	= 1018706
--下一个任务的ScriptId
x500602_g_NextScriptId	= 006668
--领取任务目标所在场景
x500602_g_AcceptNPC_SceneID	=	0
--领取任务npc
x500602_g_Name 					= "周天师"
--任务归类
x500602_g_MissionKind			= 11
--任务等级
x500602_g_MissionLevel		= 28
--是否是精英任务
x500602_g_IfMissionElite	= 0
--任务是否已经完成
x500602_g_IsMissionOkFail	= 0		--任务参数的第0位

--任务文本描述
x500602_g_MissionName			= "天师的期待(2)"
--任务描述
x500602_g_MissionInfo			= "#{YD_20080421_14}"
--任务目标
x500602_g_MissionTarget		= "#{YD_20080421_35}"
--未完成任务的npc对话
x500602_g_ContinueInfo		= "#{YD_20080421_15}"
--完成任务npc说的话
x500602_g_MissionComplete	= "#{YD_20080421_16}"
--可以完成的环数
x500602_g_MaxRound	= 1
--控制脚本
x500602_g_ControlScript		= 001066

-- 任务完成情况,内容动态刷新,占用任务参数的第1位
x500602_g_Custom	= { {id="已升到30级",num=1} }
--MisDescEnd

--任务是否完成
x500602_g_Mission_IsComplete = 0		--任务参数的第0位
--是否达到等级的标记
x500602_g_RecordIdx 				 = 1		--任务参数的第1位
--任务脚本号记录
x500602_g_MissScriptID_Idx	 = 2		--任务参数的第2位
--任务发布NPC标记
x500602_g_AcceptNPC_Idx			 = 3		--任务参数的第3位 1.洛阳NPC

x500602_g_AcceptMission_IDX		= 747	--接收任务索引
x500602_g_CompleteMission_IDX	= 748	--提交任务索引

--所拥有的事件ID列表
x500602_g_EventList	= {}

x500602_g_PlayerSlow_LVL					 = 28		-- 接受任务的最低等级

--奖励
x500602_g_MoneyBonus					=	1000
x500602_g_ExpBonus						= 4051

--**********************************
--任务入口函数
--**********************************
--点击该任务后执行此脚本
function x500602_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500602_g_AcceptMission_IDX then
		--判断该npc是否是对应任务的npc
		if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
			x500602_NotifyTip( sceneId, selfId, "接受任务失败" )					
			return 0
		end
		-- 任务是否已满
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500602_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- 检测任务接受条件
		if x500602_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- 进入接受任务界面			
		x500602_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500602_g_CompleteMission_IDX then
		--判断该npc是否是对应任务的npc
		if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
			x500602_NotifyTip( sceneId, selfId, "提交任务失败" )					
			return 0
		end
		-- 如果已经接了任务
		if IsHaveMission( sceneId, selfId, x500602_g_MissionId) > 0 then
												
			--发送任务需求的信息
			BeginEvent(sceneId)
				AddText(sceneId, x500602_g_MissionName)
				AddText(sceneId, x500602_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500602_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500602_g_ScriptId, x500602_g_MissionId, bDone)
			
		else			
			x500602_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500602_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

end

--**********************************
--列举事件
--**********************************
function x500602_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name
		 or sceneId ~= x500602_g_SceneID then
		 
		 return 0
	end

	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) <= 0 then
		if IsMissionHaveDone( sceneId, selfId, x500602_g_MissionId ) <= 0
			 and LuaFnGetLevel( sceneId, selfId ) >= x500602_g_PlayerSlow_LVL then
			AddNumText( sceneId, x500602_g_ScriptId, x500602_g_MissionName, 1, x500602_g_AcceptMission_IDX )
		end
	else
		
		AddNumText( sceneId, x500602_g_ScriptId, x500602_g_MissionName, 2, x500602_g_CompleteMission_IDX )
	end

end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x500602_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家是否符合接受任务的条件
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
		x500602_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

	--检测等级
	if LuaFnGetLevel( sceneId, selfId ) < x500602_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500602_g_PlayerSlow_LVL )
		x500602_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) > 0 then
		-- x500602_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500602_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x500602_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--判断该npc是否是对应任务的npc
 	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
 		x500602_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

	if x500602_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--加入任务到玩家列表
	local bAdd = AddMission( sceneId, selfId, x500602_g_MissionId, x500602_g_ScriptId, 0, 0, 0 )
	if bAdd >= 1 then

		--得到任务的序列号
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500602_g_MissionId )
		
		--根据序列号把任务变量的第0位置0 (任务完成情况)
		SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_RecordIdx, 0 )
		--根据序列号把任务变量的第2位置为任务脚本号
		SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500602_g_AcceptNPC_Idx, 1)

		local strText = "#{YD_20080421_229}" .. x500602_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		-- 是否达到30级
		local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	  if Playerlvl >= 30 then
			SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_Mission_IsComplete, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x500602_g_RecordIdx, 1 )
			x500602_NotifyTip( sceneId, selfId, "#{YD_20080421_181}" )
		end

	end

	return 1

end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x500602_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500602_g_MissionId )
	end
	
	return 0

end

--**********************************
--继续
--**********************************
function x500602_OnContinue( sceneId, selfId, targetId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
		x500602_NotifyTip( sceneId, selfId, "提交任务失败" )					
		return 0
	end

	-- 检查任务是否完成
	if x500602_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500602_g_MissionName)
		AddText( sceneId, x500602_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500602_g_ScriptId,x500602_g_MissionId)
	
end

--**********************************
--检测是否可以提交
--**********************************
function x500602_CheckSubmit( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
		x500602_NotifyTip( sceneId, selfId, "提交任务失败" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) <= 0 then
		x500602_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	-- 是否达到30级
	local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	if Playerlvl < 30 then
		x500602_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_182}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500602_g_MissionId)

	-- 检测任务是否完成	
	if GetMissionParam(sceneId, selfId, misIndex, x500602_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x500602_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_AccomplishNPC_Name then
		x500602_NotifyTip( sceneId, selfId, "提交任务失败" )					
		return 0
	end

  -- 检查任务是否完成
	if x500602_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500602_NotifyTip( sceneId, selfId, "提交任务失败" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500602_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500602_g_ExpBonus )

	-- 任务顺利完成
	x500602_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500602_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500602_g_MissionId )
	 	-- 设置任务已经被完成过
	 	MissionCom( sceneId, selfId, x500602_g_MissionId )
	 	
	 	local strText = "#Y" .. x500602_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- 弹出后续任务接受界面
	 	if IsHaveMission( sceneId, selfId, x500602_g_MissionIdNext ) <= 0 and IsMissionHaveDone( sceneId, selfId, x500602_g_MissionIdNext ) <= 0 then
	 		CallScriptFunction( x500602_g_NextScriptId, "OnDefaultEvent", sceneId, selfId, targetId, x500602_g_MissionIndexNext )
	 	end	 		 	
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x500602_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思：场景号、玩家objId、怪物表位置号、怪物
end

--**********************************
--进入区域事件
--**********************************
function x500602_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--道具改变
--**********************************
function x500602_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示的界面
--**********************************
function x500602_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示的界面
--**********************************
function x500602_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x500602_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--与NPC对话
--**********************************
function x500602_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--取得本事件的MissionId，用于obj文件中对话情景的判断
--**********************************
function x500602_GetEventMissionId( sceneId, selfId )	
	return x500602_g_MissionId
end

function x500602_AcceptMission( sceneId, selfId, targetId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x500602_g_Name then
		x500602_NotifyTip( sceneId, selfId, "接受任务失败" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务接受时显示的信息
	BeginEvent(sceneId)
		AddText(sceneId,x500602_g_MissionName)
		AddText( sceneId, x500602_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_35}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500602_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500602_g_ScriptId,x500602_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体item的详细信息
function x500602_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--道具使用
--**********************************
function x500602_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--死亡事件
--**********************************
function x500602_OnDie( sceneId, selfId, killerId )
end
