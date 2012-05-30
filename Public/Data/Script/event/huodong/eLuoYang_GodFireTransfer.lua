--创建人[ QUFEI 2008-03-05 10:27 UPDATE BugID 32710 ]
--洛阳龟兔赛跑任务事件脚本
--本活动每天开启三次,每个玩家每天只能参加一次

--MisDescBegin
--脚本号
x808080_g_ScriptId	= 808080

--接受任务NPC属性
x808080_g_Position_X=228.3477
x808080_g_Position_Z=175.7796
x808080_g_SceneID=0
x808080_g_AccomplishNPC_Name="赵明诚"

--任务号
x808080_g_MissionId			= 1000
--下一个任务的ID
x808080_g_MissionIdNext	= 1000
--任务目标npc
x808080_g_Name 					= "赵明诚"
--任务归类
x808080_g_MissionKind			= 13
--任务等级
x808080_g_MissionLevel		= 20
--是否是精英任务
x808080_g_IfMissionElite	= 0
--任务是否已经完成
x808080_g_IsMissionOkFail	= 0		--任务参数的第0位

--任务文本描述
x808080_g_MissionName			= "龟兔赛跑任务"
--任务描述
x808080_g_MissionInfo			= "#{GodFire_Info_001}"
--任务目标
x808080_g_MissionTarget		= "#{GodFire_Info_004}"
--未完成任务的npc对话
x808080_g_ContinueInfo		= "#{GodFire_Info_007}"
--完成任务npc说的话
x808080_g_MissionComplete	= "#{GodFire_Info_008}"
--每次龟兔赛跑活动需要打卡的城市总数
x808080_g_MaxRound	= 3
--控制脚本
x808080_g_ControlScript		= 001066

-- 任务完成情况,内容动态刷新,分别占用任务参数的第1,2,3,4位
x808080_g_Custom	= { {id="已与洛阳的赵明诚对话",num=1}, {id="已与苏州的陆士铮对话",num=1}, {id="已与大理的王若禹对话",num=1}, {id="已点燃全部孔明灯",num=24} }
--MisDescEnd

--任务是否完成
x808080_g_Mission_IsComplete = 0		--任务参数的第0位
--火把洛阳打卡标记
x808080_g_RecordIdx 				 = 1		--任务参数的第1位 1.洛阳 2.苏州 3.大理
--孔明灯完成数量标记
x808080_g_KongMing_Lighten	 = 4		--任务参数的第4位
--任务脚本号记录
x808080_g_MissScriptID_Idx	 = 5		--任务参数的第5位
--任务发布NPC标记
x808080_g_AcceptNPC_Idx			 = 6		--任务参数的第6位 1.洛阳NPC 2.苏州NPC 3.大理NPC
--龟兔赛跑任务每天轮数标记
x808080_g_RoundIndex 				 = 7		--任务参数的第7位


x808080_g_AcceptMission_IDX		= 520	--龟兔赛跑接收任务索引
x808080_g_CompleteMission_IDX	= 521	--火把提交任务索引
x808080_g_MissionInfo_IDX			= 522	--任务说明索引

x808080_g_Jion_Count = 0						--报名人数标记
x808080_g_Join_CountMax = 50				--报名人数上限

x808080_g_KongMingLighten_MaxCnt	=	24	-- 龟兔赛跑活动需要点燃的孔明灯总数

--所拥有的事件ID列表
x808080_g_EventList	= {}

x808080_g_Impact_Accept_Mission 	= 47	-- 接受任务时的特效ID
x808080_g_Impact_Light_Complete 	= 38	-- 点亮孔明灯时的特效
x808080_g_Impact_Transport_Mission = 113 -- 运输状态特效
x808080_g_Impact_GodOfFire_Mission = 5929 -- 龟兔赛跑状态特效
x808080_g_PlayerSlow_LVL					= 20	-- 接受任务的最低等级

-- 报名持续时间(分钟)
x808080_g_Along_Time							= 5
-- 每天龟兔赛跑活动开启时间
x808080_g_ActivityTime						= { {tstart=1230, tend=1330},
																		  {tstart=1930, tend=2030},
																		  {tstart=2130, tend=2230} }

x808080_g_ItemId = { id=40004444,num=1 }				-- 任务物品

-- 排名
x808080_g_GodFireMis_PaiMing = 0
-- 上次清除排名的环数
x808080_g_ClearPaiMing_Round = 0


-- 奖励的称号 极品飞毛腿
x808080_g_GodFire_Title = 241
-- 称号有效期(天)
x808080_GodFireTitle_AlongTime = 7


-- 奖励经验修正值(与排名有关)
x808080_g_BonusEXP_ListEX = { 3.0000,2.9592,2.9184,2.8776,2.8367,2.7959,2.7551,2.7143,2.6735,2.6327,
															2.5918,2.5510,2.5102,2.4694,2.4286,2.3878,2.3469,2.3061,2.2653,2.2245,
															2.1837,2.1429,2.1020,2.0612,2.0204,1.9796,1.9388,1.8980,1.8571,1.8163,
															1.7755,1.7347,1.6939,1.6531,1.6122,1.5714,1.5306,1.4898,1.4490,1.4082,
															1.3673,1.3265,1.2857,1.2449,1.2041,1.1633,1.1224,1.0816,1.0408,1.0000 }
											  	
x808080_g_BonusEXP_List = { 0,0,0,0,0,0,0,0,0,0,
														0,0,0,0,0,0,0,0,0,19008,
														19872,20628,21384,22212,22968,23832,24588,25344,26208,30852,
														31788,32652,33588,34416,35388,36324,37188,38124,38988,44928,
														45972,46944,47952,48996,50040,51084,52020,53064,54108,61308,
														62460,63576,64728,65844,66996,68112,69264,70416,71532,79848,
														81180,82404,83664,84888,86112,87444,88668,89892,91116,100764,
														102204,103536,104868,106272,107604,109008,110340,111672,113076,123984,
														125496,126900,128412,129852,131364,132876,134280,135792,137232,141948,
														143460,144972,146484,147996,149508,151020,152460,153972,155484,159372,
														160992,162504,164016,165528,167040,168624,170172,171684,173196,176040,
														177552,179064,180648,182268,183780,185292,186804,188316,189936,191448,
														193068,194580,196092,197712,199224,200736,202248,203760,205380,206964,
														208476,209988,211500,213120,214632,216144,217656,219276,220896,222408,
														223920,225432,226944,228564,230076,231660,233208,234720,236304,236304 }

-- 孔明灯中的任务物品ID
x808080_g_ItemBox_ItemID = 40004445

--**********************************
--任务入口函数
--**********************************
--点击该任务后执行此脚本
function x808080_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end
			
	local	key	= GetNumText()	
	if key == x808080_g_AcceptMission_IDX then		
		-- 任务是否已满
		if IsMissionFull( sceneId, selfId ) == 1 then
			x808080_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end

		-- 检测报名时间
		if x808080_CheckApplyTime() == 0 then
			x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_018}" )					
			return 0
		end
		
		-- 检测任务接受条件
		if x808080_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- 进入接受任务界面			
		x808080_AcceptMission( sceneId, selfId, targetId )				

	elseif key == x808080_g_CompleteMission_IDX then
		-- 如果已经接了任务
		if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
												
			--发送任务需求的信息
			BeginEvent(sceneId)
				AddText(sceneId, x808080_g_MissionName)
				AddText(sceneId, x808080_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x808080_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x808080_g_ScriptId, x808080_g_MissionId, bDone)
			
		else			
			x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_011}" )
			return 0
		end
		
	elseif key == x808080_g_MissionInfo_IDX then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_009}" )		
		return 0

	else
		x808080_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

end

--**********************************
--列举事件
--**********************************
function x808080_OnEnumerate( sceneId, selfId, targetId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		return 0
	end
	
	AddNumText( sceneId, x808080_g_ScriptId, "我要参加龟兔赛跑", 7, x808080_g_AcceptMission_IDX )
	AddNumText( sceneId, x808080_g_ScriptId, "我已经完成了龟兔赛跑", 7, x808080_g_CompleteMission_IDX )
	AddNumText( sceneId, x808080_g_ScriptId, "龟兔赛跑活动介绍", 11, x808080_g_MissionInfo_IDX )

end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x808080_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家是否符合接受任务的条件
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end
	
	--检测等级
	if LuaFnGetLevel( sceneId, selfId ) < x808080_g_PlayerSlow_LVL then		
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_013}" )
		return 0
	end

	--检测运输状态驻留效果
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_Transport_Mission) ~= 0
		 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_GodOfFire_Mission) ~= 0 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_014}" )
		return 0
	end

	local nTimePoint = x808080_CheckHuoDongTime()
	-- 清除排名
	if x808080_g_ClearPaiMing_Round ~= nTimePoint then
		x808080_g_Jion_Count = 0
		x808080_g_GodFireMis_PaiMing = 0
		x808080_g_ClearPaiMing_Round = nTimePoint
	end

	--检测报名人数上限
	if x808080_g_Jion_Count >= x808080_g_Join_CountMax then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_015}" )
		return 0
	end

	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_016}" )
		return 0
	end
	
	--检测玩家参加活动的时间
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime == nDay then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_017}" )
		return 0
	end
	
	--检测玩家是否组队跟随
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GCTeamFollowErrorHandler_Info_In_Mis_GodOfFire}" )		
		return 0
	end
	
	--检测是否处于双人骑乘状态
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end
	
	return 1
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x808080_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--判断该npc是否是对应任务的npc
 	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
 		x808080_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

	if x808080_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x808080_g_ItemId.num then
		x808080_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end

  local nDay   = LuaFnGetDayOfThisMonth()

	BeginAddItem(sceneId)
	AddItem(sceneId,x808080_g_ItemId.id, x808080_g_ItemId.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		--加入任务到玩家列表
		local bAdd = AddMission( sceneId, selfId, x808080_g_MissionId, x808080_g_ScriptId, 0, 0, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			--得到任务的序列号
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x808080_g_MissionId )
			
			--根据序列号把任务变量的第0位置0 (任务完成情况)
			SetMissionByIndex( sceneId, selfId, misIndex, x808080_g_Mission_IsComplete, 0 )
			--根据序列号把任务变量的第1位置为任务脚本号
			SetMissionByIndex( sceneId, selfId, misIndex, x808080_g_MissScriptID_Idx, scriptId )		
			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx, 1)
			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_RecordIdx, 1)
			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_KongMing_Lighten, 0)

			local nTimePoint = x808080_CheckHuoDongTime()

			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_RoundIndex, nTimePoint)
			
			SetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME, nDay )

			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808080_g_Impact_Transport_Mission, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808080_g_Impact_GodOfFire_Mission, 0 )

			x808080_g_Jion_Count = x808080_g_Jion_Count + 1

			-- 通知客户端			
			BeginEvent(sceneId)				
				AddText(sceneId, "#{GodFire_Info_002}")				
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

			BeginEvent(sceneId)
				AddText(sceneId,x808080_g_MissionName)
				AddText(sceneId,x808080_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{GodFire_Info_004}")				
				AddText(sceneId,"#{GodFire_Info_019}")				
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808080_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x808080_OnAbandon( sceneId, selfId )
  
  --删除玩家任务列表中对应的任务,物品和驻留效果
  if HaveItem(sceneId, selfId, x808080_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) >= x808080_g_ItemId.num then
  		DelItem( sceneId, selfId, x808080_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) )
  	else
	  	x808080_NotifyTip( sceneId, selfId, "您的物品现在不可用或已被锁定。" )			
			return 0
  	end
  end
  
  if HaveItem(sceneId, selfId, x808080_g_ItemBox_ItemID) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) >= 1 then
  		DelItem( sceneId, selfId, x808080_g_ItemBox_ItemID, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) )
  	else
	  	x808080_NotifyTip( sceneId, selfId, "您的物品现在不可用或已被锁定。" )			
			return 0
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_Transport_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_Transport_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_GodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_GodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808080_g_MissionId )
	end
	
	return 0

end

--**********************************
--继续
--**********************************
function x808080_OnContinue( sceneId, selfId, targetId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

	-- 检查任务是否完成
	if x808080_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x808080_g_MissionName)
		AddText( sceneId, x808080_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x808080_g_ScriptId,x808080_g_MissionId)
	
end

--**********************************
--检测是否可以提交
--**********************************
function x808080_CheckSubmit( sceneId, selfId, targetId )

	if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) <= 0 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_011}" )
		return 0
	end

	--检测等级
	if LuaFnGetLevel( sceneId, selfId ) < x808080_g_PlayerSlow_LVL then		
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_013}" )
		return 0
	end

	--检测玩家参加活动的时间
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_017}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x808080_g_MissionId)
	local nTimePoint = x808080_CheckHuoDongTime()
	if nTimePoint ~= GetMissionParam(sceneId, selfId, misIndex, x808080_g_RoundIndex) then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_024}" )
		return 0
	end
	
	-- 检测是不是任务发布NPC
	if GetMissionParam(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx) == 2 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_026}" )
		return 0	
	elseif GetMissionParam(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx) == 3 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_027}" )
		return 0
	elseif GetMissionParam(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx) ~= 1 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_025}" )
		return 0
	end
	
	--检测玩家是否组队跟随
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GCTeamFollowErrorHandler_Info_In_Mis_GodOfFire}" )		
		return 0
	end
	
	--检测是否处于双人骑乘状态
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end

	-- 检测任务是否完成	
	if GetMissionParam(sceneId, selfId, misIndex, x808080_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x808080_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "提交任务失败" )					
		return 0
	end

  -- 检查任务是否完成
	if x808080_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x808080_NotifyTip( sceneId, selfId, "提交任务失败" )				
		return 0
	end
	
	local strText = ""
	x808080_g_GodFireMis_PaiMing = x808080_g_GodFireMis_PaiMing + 1

	if x808080_g_GodFireMis_PaiMing <= 3 then
		strText = format("#{_INFOUSR%s}#{GodFire_Info_029}%d#{GodFire_Info_030}", GetName(sceneId,selfId), x808080_g_GodFireMis_PaiMing )
		BroadMsgByChatPipe( sceneId, 0, strText, 4 )
		
		-- 设置极品飞毛腿称号
		if x808080_g_GodFire_Title == GetTitle( sceneId, selfId, 14 ) then
			DeleteTitle( sceneId, selfId, 14 )			
		end
		AwardTitle( sceneId, selfId, 14, x808080_g_GodFire_Title, 24 * x808080_GodFireTitle_AlongTime )
		SetCurTitle( sceneId, selfId, 14, x808080_g_GodFire_Title )
		DispatchAllTitle( sceneId, selfId )
	end

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808080_g_BonusEXP_List[playerlvl]
	local nExpEx = x808080_g_BonusEXP_ListEX[x808080_g_GodFireMis_PaiMing]

	nExpNum = floor(nExpNum * nExpEx)
	LuaFnAddExp( sceneId, selfId, nExpNum )
	strText = format("#{_INFOUSR%s}#{GodFire_Info_031}%d#{GodFire_Info_032}%d。#{GodFire_Info_033}", GetName(sceneId,selfId), x808080_g_GodFireMis_PaiMing, nExpNum )
	x808080_TalkInfo( sceneId, selfId, targetId, strText )
	
	-- 活动顺利完成
	x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_063}" )
	BroadMsgByChatPipe( sceneId, selfId, "#{GodFire_Info_063}", 8 )
	
	if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808080_g_MissionId )
	end
	
	x808080_DelMissionInfo( sceneId, selfId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x808080_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思：场景号、玩家objId、怪物表位置号、怪物
end

--**********************************
--进入区域事件
--**********************************
function x808080_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--道具改变
--**********************************
function x808080_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示的界面
--**********************************
function x808080_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示的界面
--**********************************
function x808080_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x808080_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--与NPC对话
--**********************************
function x808080_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--取得本事件的MissionId，用于obj文件中对话情景的判断
--**********************************
function x808080_GetEventMissionId( sceneId, selfId )	
	return x808080_g_MissionId
end

function x808080_AcceptMission( sceneId, selfId, targetId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "接受任务失败" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务接受时显示的信息
	BeginEvent(sceneId)
		AddText(sceneId,x808080_g_MissionName)
		AddText( sceneId, x808080_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{GodFire_Info_004}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{GodFire_Info_012}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x808080_g_ScriptId,x808080_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体item的详细信息
function x808080_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--检测活动报名时间
--**********************************
function x808080_CheckApplyTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808080_g_ActivityTime) do
	  if curHourTime >= x808080_g_ActivityTime[i].tstart and curHourTime < (x808080_g_ActivityTime[i].tstart+x808080_g_Along_Time) then
	  	return 1		
	  end
	end

	return 0
end

--**********************************
--检测活动时间
--**********************************
function x808080_CheckHuoDongTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute


	for i=1, getn(x808080_g_ActivityTime) do
	  if curHourTime >= x808080_g_ActivityTime[i].tstart and curHourTime <= x808080_g_ActivityTime[i].tend then
	  	return i		
	  end
	end

	return 0

end

--**********************************
--道具使用
--**********************************
function x808080_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--死亡事件
--**********************************
function x808080_OnDie( sceneId, selfId, killerId )
	x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_034}" )
	x808080_DelMissionInfo( sceneId, selfId )
end

--**********************************
--删除活动信息
--删除玩家任务列表中对应的任务,物品和驻留效果
--**********************************
function x808080_DelMissionInfo( sceneId, selfId )

  if HaveItem(sceneId, selfId, x808080_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) >= x808080_g_ItemId.num then
  		DelItem( sceneId, selfId, x808080_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) )  	
  	end
  end
  
  if HaveItem(sceneId, selfId, x808080_g_ItemBox_ItemID) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) >= 1 then
  		DelItem( sceneId, selfId, x808080_g_ItemBox_ItemID, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) )  	
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_Transport_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_Transport_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_GodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_GodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
  	x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_034}" )
	 	DelMission( sceneId, selfId, x808080_g_MissionId )
	end
	
	return 0

end

--**********************************
-- 火把特效有效期到时自动删除任务信息
--**********************************
function x808080_OnImpactFadeOut( sceneId, selfId, impactId )

	if impactId == x808080_g_Impact_GodOfFire_Mission then
		x808080_DelMissionInfo( sceneId, selfId )
	end

end
