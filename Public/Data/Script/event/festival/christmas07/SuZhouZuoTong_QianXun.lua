--创建人[ QUFEI 2007-11-29 10:10 UPDATE BugID 27819 ]
--千寻任务事件脚本
--每种关系任务每天只能做一次,每次20环

--MisDescBegin
--脚本号
x229024_g_ScriptId	= 229024

--接受任务NPC属性
x229024_g_Position_X=129.2676
x229024_g_Position_Z=213.0914
x229024_g_SceneID=1
x229024_g_AccomplishNPC_Name="左桐"

--任务号
x229024_g_MissionId			= 421
--下一个任务的ID
x229024_g_MissionIdNext	= 421
--任务目标npc
x229024_g_Name			= "左桐"
--任务归类
x229024_g_MissionKind			= 12
--任务等级
x229024_g_MissionLevel		= 10
--是否是精英任务
x229024_g_IfMissionElite	= 0
--任务是否已经完成
x229024_g_IsMissionOkFail	= 0		--变量的第0位

--任务文本描述
x229024_g_MissionName			= "千寻"
--任务描述
x229024_g_MissionInfo			= "#{QX_20071129_026}"
--任务目标
x229024_g_MissionTarget		= "#{QX_20071129_025}"
--未完成任务的npc对话
x229024_g_ContinueInfo		= "#{QIANXUN_INFO_19}"
--完成任务npc说的话
x229024_g_MissionComplete	= "#{QX_20071129_039}"
--每天每种关系的环数上限
x229024_g_MaxRound	= 10
--控制脚本
x229024_g_ControlScript		= 001066
--MisDescEnd

--任务是否完成
x229024_g_Mission_IsComplete = 0		--第0位参数
--任务环数
x229024_g_Mission_RoundNum	 = 5		--第5位参数
--任务物品序号
x229024_g_Mission_ItemIdx		 = 6		--第6位参数

x229024_g_QianXunMission_IDX	= 120	--千寻任务索引
x229024_g_MissionInfo_IDX			= 121	--任务说明索引
x229024_g_FuQiMission_IDX		 	= 131	--夫妻关系任务索引
x229024_g_JieBaiMission_IDX		= 132	--结拜关系任务索引
x229024_g_ShiTuMission_IDX		= 133	--师徒关系任务索引

--添加特殊的一周连续千寻，czf，2009.08.07
x229024_g_SpecialBeginTime	= 20090824
x229024_g_SpecialEndTime	= 20090830
--所拥有的事件ID列表
x229024_g_EventList	= {}

x229024_g_Impact_Accept_Mission 	= 47	-- 接受任务时的特效ID
x229024_g_PlayerSlow_LVL					= 10	-- 接受任务的最低等级
x229024_g_Activity_DayTime				=	5		-- 活动激活时间:每周五

x229024_g_ItemId = { {id=40004435,num=1},
										 {id=40004436,num=1},
										 {id=40004437,num=1},
										 {id=40004438,num=1} }

x229024_g_Impact_Complete_Mission = 43				-- 任务完成时的吉祥如意特效

x229024_g_scenePosInfoList = { {sceneId=7,  scenename="剑阁", PosName="剑门叠翠", PosX=130, PosY=140,  PosR=10, Area=711 },
															 {sceneId=8,  scenename="敦煌", PosName="瀚海求佛", PosX=267, PosY=251,  PosR=10, Area=811 },
															 {sceneId=5,  scenename="镜湖", PosName="玉带临风", PosX=35 , PosY=265,  PosR=10, Area=511 },
															 {sceneId=4,  scenename="太湖", PosName="舞榭歌台", PosX=155, PosY=255,  PosR=10, Area=411 },
															 {sceneId=3,  scenename="嵩山", PosName="江山多娇", PosX=280, PosY=80,   PosR=10, Area=311 },
															 {sceneId=30, scenename="西湖", PosName="一望虎跑", PosX=170, PosY=230,  PosR=10, Area=3011},															 
															 {sceneId=31, scenename="龙泉", PosName="飞流直下", PosX=270, PosY=280,  PosR=10, Area=3111},
															 {sceneId=25, scenename="苍山", PosName="似水流年", PosX=260, PosY=110,  PosR=10, Area=2512},															 
															 {sceneId=32, scenename="武夷", PosName="烟锁二乔", PosX=50 , PosY=180,  PosR=10, Area=3211},															 
															 {sceneId=0,  scenename="洛阳", PosName="金城汤池", PosX=50,  PosY=220,  PosR=10, Area=11  } }
															             

-- 奖励的物品
-- 节日神符
x229024_g_BonusFuJie = 20310010

-- 圣诞帽
x229024_g_BonusItem = { {ItemID01=10410118, ItemID02=10410108},
											  {ItemID01=10410119, ItemID02=10410109},
											  {ItemID01=10410120, ItemID02=10410110},
											  {ItemID01=10410121, ItemID02=10410111},
											  {ItemID01=10410122, ItemID02=10410112},
											  {ItemID01=10410123, ItemID02=10410113},
											  {ItemID01=10410124, ItemID02=10410114},
											  {ItemID01=10410125, ItemID02=10410115},
											  {ItemID01=10410126, ItemID02=10410116},
											  {ItemID01=10410127, ItemID02=10410117} }
											  	
x229024_g_BonusEXP_List = { 0,0,0,0,0,0,0,0,0,17436,                                              
														18416,19369,20328,21326,22297,23274,24291,25280,26309,53543,          
														55908,58352,60811,63284,65707,68209,70727,73259,75739,126150,         
														130300,134474,138564,142784,147029,151297,155479,159795,164133,245746,
														252138,258454,264914,271409,277827,284391,290989,297509,304176,310878,
														317500,324270,331075,337914,344672,351580,358523,365383,372394,379440,
														386403,393517,400666,407731,414948,422200,429367,436688,444043,451433,
														458736,466195,473688,481093,488655,496251,503759,511424,519123,526733,
														534501,542303,550140,557887,565792,573732,581581,589590,597633,605584,
														613696,621842,629895,638110,646360,654515,662834,671187,679574,679574,
														679574,679574,679574,679574,679574,679574,679574,679574,679574,679574,
														679574,679574,679574,679574,679574,679574,679574,679574,679574,        }
                                           
--**********************************
--任务入口函数
--**********************************
--点击该任务后执行此脚本
function x229024_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end
			
	local	key	= GetNumText()	
	if key == x229024_g_QianXunMission_IDX then
		BeginEvent(sceneId)
			AddText(sceneId,"#{QX_20071129_023}")
			AddNumText( sceneId, x229024_g_ScriptId, "夫妻领取任务", 6, x229024_g_FuQiMission_IDX )		
			AddNumText( sceneId, x229024_g_ScriptId, "结拜领取任务", 6, x229024_g_JieBaiMission_IDX )		
			AddNumText( sceneId, x229024_g_ScriptId, "师徒领取任务", 6, x229024_g_ShiTuMission_IDX )		
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif key == x229024_g_MissionInfo_IDX then
		x229024_TalkInfo( sceneId, selfId, targetId, "#{QIANXUN_INFO_02}" )		
		return 0

	elseif key == x229024_g_FuQiMission_IDX or key == x229024_g_JieBaiMission_IDX or key == x229024_g_ShiTuMission_IDX then
		if key == x229024_g_FuQiMission_IDX then
			if x229024_CheckMission_FuQi( sceneId, selfId ) == 0 then
				return 0
			end
		elseif key == x229024_g_JieBaiMission_IDX then
			if x229024_CheckMission_JieBai( sceneId, selfId ) == 0 then
				return 0
			end
		elseif key == x229024_g_ShiTuMission_IDX then
			if x229024_CheckMission_ShiTu( sceneId, selfId ) == 0 then
				return 0
			end
		end
		  	
		-- 如果已经接了任务
		if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
												
			--发送任务需求的信息
			BeginEvent(sceneId)
				AddText(sceneId, x229024_g_MissionName)
				AddText(sceneId, x229024_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x229024_CheckSubmit( sceneId, selfId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x229024_g_ScriptId, x229024_g_MissionId, bDone)
			
		else			
			-- 任务是否已满
			if IsMissionFull( sceneId, selfId ) == 1 then
				x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
				return 0
			end
			
			SetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE, key )			-- 设置队长所选的任务类型
					
			-- 进入接受任务界面			
			x229024_AcceptMission( sceneId, selfId, targetId )				
		end
	else
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

end

--**********************************
--列举事件
--**********************************
function x229024_OnEnumerate( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		return 0
	end

	AddText(sceneId,"#{QIANXUN_INFO_01}")
	if x229024_CheckHuoDongTime() == 1 or x229024_CheckSpecialTime() ==1 then --czf modify
		AddNumText( sceneId, x229024_g_ScriptId, "千寻", 6, x229024_g_QianXunMission_IDX )
	end
		
	AddNumText( sceneId, x229024_g_ScriptId, "关于千寻", 11, x229024_g_MissionInfo_IDX )

end

--**********************************
--检测接受条件，也供子任务调用
--**********************************
function x229024_CheckAccept( sceneId, selfId, targetId )
	
	--检测玩家是否符合接受任务的条件
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end
		
	--已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
		x229024_TalkInfo( sceneId, selfId, targetId, "#{QIANXUN_INFO_19}" )							
		return 0
	end
	
	return 1
end

--**********************************
--接受，仅供子任务调用设置公共参数
--**********************************
function x229024_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--判断该npc是否是对应任务的npc
 	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
 		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end

	if x229024_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--玩家所选的任务类型

	if nMisType == x229024_g_FuQiMission_IDX then
		if x229024_CheckMission_FuQi( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_JieBaiMission_IDX then
		if x229024_CheckMission_JieBai( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_ShiTuMission_IDX then
		if x229024_CheckMission_ShiTu( sceneId, selfId ) == 0 then
			return 0
		end
	else		
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )		
		return 0
	end
	local itemidx = random(getn(x229024_g_ItemId))
	
	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x229024_g_ItemId[itemidx].num then
		x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end
	
	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay
		
	BeginAddItem(sceneId)
	AddItem(sceneId,x229024_g_ItemId[itemidx].id, x229024_g_ItemId[itemidx].num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then						
		--加入任务到玩家列表
		local bAdd = AddMission( sceneId, selfId, x229024_g_MissionId, x229024_g_ScriptId, 0, 1, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			--得到任务的序列号
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x229024_g_MissionId )
			
			--根据序列号把任务变量的第0位置0 (任务完成情况)
			SetMissionByIndex( sceneId, selfId, misIndex, x229024_g_Mission_IsComplete, 0 )
			--根据序列号把任务变量的第1位置为任务脚本号
			SetMissionByIndex( sceneId, selfId, misIndex, 2, scriptId )		
			SetMissionByIndex(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum, 1)
			SetMissionByIndex(sceneId, selfId, misIndex, x229024_g_Mission_ItemIdx, itemidx)
			SetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE, nMisType )
						
			if nMisType == x229024_g_FuQiMission_IDX then
				SetMissionData( sceneId, selfId, MD_QIANXUN_FUQI_DAYTIME, curDayTime )
			elseif nMisType == x229024_g_JieBaiMission_IDX then
				SetMissionData( sceneId, selfId, MD_QIANXUN_JIEBAI_DAYTIME, curDayTime )
			elseif nMisType == x229024_g_ShiTuMission_IDX then
				SetMissionData( sceneId, selfId, MD_QIANXUN_SHITU_DAYTIME, curDayTime )
			end
			
			local ScintInfo = x229024_g_scenePosInfoList[1]
			CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, ScintInfo.sceneId, ScintInfo.PosX, ScintInfo.PosY, x229024_g_MissionName)
			
			BeginEvent(sceneId)
				AddText(sceneId,x229024_g_MissionName)
				AddText(sceneId,x229024_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{QX_20071129_025}")
				local strText = format("千寻任务第1环: 你只有到%s的#{_INFOAIM%d,%d,%d,%s}才能使用寻路之心", ScintInfo.scenename, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)						
				AddText(sceneId,strText)
				AddText(sceneId,"#e00f000小提示：#e000000使用#gfff0f0滑鼠右键#g000000点击任务背包中的#gfff0f0寻路之心#g000000，可以显示需要找的任务地点。")											
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x229024_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--放弃，仅供子任务调用
--**********************************
function x229024_OnAbandon( sceneId, selfId )
  
  --删除玩家任务列表中对应的任务
  local itemidx = 1
  if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
  	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)
 	  itemidx = GetMissionParam(sceneId,selfId,misIndex,x229024_g_Mission_ItemIdx) 	
 	end
	if HaveItem(sceneId, selfId, x229024_g_ItemId[itemidx].id) > 0 then
	  if LuaFnGetAvailableItemCount(sceneId, selfId, x229024_g_ItemId[itemidx].id) >= x229024_g_ItemId[itemidx].num then
	    DelItem( sceneId, selfId, x229024_g_ItemId[itemidx].id, LuaFnGetAvailableItemCount(sceneId, selfId, x229024_g_ItemId[itemidx].id) )
			if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
	 			DelMission( sceneId, selfId, x229024_g_MissionId )
			else		
				return 0
			end
	  else
	  	x229024_NotifyTip( sceneId, selfId, "您的物品现在不可用或已被锁定。" )			
			return 0
	  end 
  else
 		if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
	 		DelMission( sceneId, selfId, x229024_g_MissionId )
		else		
			return 0
		end	    
  end
  
end

--**********************************
--继续
--**********************************
function x229024_OnContinue( sceneId, selfId, targetId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end
	
	--检测等级
	if LuaFnGetLevel( sceneId, selfId ) < x229024_g_PlayerSlow_LVL then		
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )					
		return 0
	end
	
	-- 检查任务是否完成
	if x229024_CheckSubmit( sceneId, selfId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x229024_g_MissionName)
		AddText( sceneId, x229024_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x229024_g_ScriptId,x229024_g_MissionId)
	
end

--**********************************
--检测是否可以提交
--**********************************
function x229024_CheckSubmit( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) <= 0 then				
		return 0
	end

	--在此判断提交条件是否符合，并给予相应奖励
	--得到任务的序列号
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)	
	if GetMissionParam(sceneId, selfId, misIndex, 0) > 0 then	--察看任务是否完成		
		return 1
	end
	
	return 0
	
end

--**********************************
--检测夫妻任务
--**********************************
function x229024_CheckMission_FuQi( sceneId, selfId )

	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay
		
	local nMisDaytime = 0
	local	IsHaveMis = 0
	
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
		local nMisType 	= GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )				-- 玩家身上的任务类型
			
		if nMisType ~= x229024_g_FuQiMission_IDX then
			x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_18}" )
			return 0
		end
		
		IsHaveMis = 1
	else
		nMisDaytime = GetMissionData( sceneId, selfId, MD_QIANXUN_FUQI_DAYTIME )			-- 获得上次接受夫妻关系任务的时间
		
		if nMisDaytime == curDayTime then
			x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_032}" )
			
			return 0
		end
		
		IsHaveMis = 0
	end
	
	if x229024_GeneralRule( sceneId, selfId ) == 0 then
		return 0
	end

	-- 组队中是否有两个(含)以上的队员
	local NumMem = LuaFnGetTeamSize( sceneId, selfId )
  if NumMem < 2 then   	
   	if IsHaveMis == 1 then
    	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_08}" )
    else
     	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_07}" )						
    end
    return 0
	end 
		
	-- 组队中的两个人必须都在附近
	local nNearTeamCount = GetNearTeamCount( sceneId, selfId )
  if GetNearTeamCount( sceneId, selfId ) < 2 then  	
   	x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_034}" )						
    return 0
	end 
	
	--是否有夫妻关系....
	local ObjID0 = selfId
	local ObjID1
	for i=0, nNearTeamCount-1 do
		ObjID1 = GetNearTeamMember( sceneId, selfId, i )
		if ObjID0 ~= ObjID1 then
			local	SelfGUID	= LuaFnObjId2Guid( sceneId, ObjID0 )
			local	SpouGUID	= LuaFnGetSpouseGUID( sceneId, ObjID1 )
		
			if LuaFnIsMarried( sceneId, ObjID0 ) ~= 0 and LuaFnIsMarried( sceneId, ObjID1 ) ~= 0 and SelfGUID == SpouGUID then			
		    return 1
			end
		end
	end
	
	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_11}" )							
	return 0
	
end

--**********************************
--检测结拜任务
--**********************************
function x229024_CheckMission_JieBai( sceneId, selfId )

	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay
  		
	local nMisDaytime = 0
	local	IsHaveMis = 0
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then	
		local nMisType 	= GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )				-- 玩家身上的任务类型
			
		if nMisType ~= x229024_g_JieBaiMission_IDX then
			x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_18}" )
			return 0
		end
	
		IsHaveMis = 1
	else		
		nMisDaytime = GetMissionData( sceneId, selfId, MD_QIANXUN_JIEBAI_DAYTIME )		-- 获得上次接受结拜关系任务的时间
		
		if nMisDaytime == curDayTime then
			x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_033}" )
			
			return 0
		end
		
		IsHaveMis = 0
	end

	if x229024_GeneralRule( sceneId, selfId ) == 0 then
		return 0
	end

	-- 组队中是否有两个(含)以上的队员
	local NumMem = LuaFnGetTeamSize( sceneId, selfId )
  if NumMem < 2 then
   	if IsHaveMis == 1 then
      x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_15}" )
    else
     x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_14}" )						
    end
    return 0
	end 
	
	-- 组队中的队员必须都在附近		
	local nNearTeamCount = GetNearTeamCount( sceneId, selfId )
  if GetNearTeamCount( sceneId, selfId ) < 2 then
   	x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_035}" )						
  	return 0
	end 
	
	--是否有结拜关系....	
	local firstPlayer = selfId
	local otherPlayer
	for i=0, nNearTeamCount-1 do
		otherPlayer = GetNearTeamMember( sceneId, selfId, i )
		if firstPlayer ~= otherPlayer then
			if LuaFnIsBrother(sceneId, firstPlayer, otherPlayer) == 1 then			
				return 1
			end
		end
	end

	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_16}" )			
	return 0
	
end

--**********************************
--检测师徒任务
--**********************************
function x229024_CheckMission_ShiTu( sceneId, selfId )
	
	local nYear	 = LuaFnGetThisYear()
	local nMonth = LuaFnGetThisMonth()
  local nDay   = LuaFnGetDayOfThisMonth()
  local curDayTime = nYear*10000+(nMonth+1)*100+nDay

	local nMisDaytime = 0
	local	IsHaveMis = 0
	--如果玩家已经接了任务
	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
		local nMisType 	= GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )				-- 玩家身上的任务类型
			
		if nMisType ~= x229024_g_ShiTuMission_IDX then
			x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_18}" )
			return 0
		end
		
		IsHaveMis = 1
	else		
		nMisDaytime = GetMissionData( sceneId, selfId, MD_QIANXUN_SHITU_DAYTIME )			-- 获得上次接受师徒关系任务的时间
		
		if nMisDaytime == curDayTime then
			x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_039}" )
			
			return 0
		end
		
		IsHaveMis = 0
	end

	if x229024_GeneralRule( sceneId, selfId ) == 0 then
		return 0
	end

	-- 组队中是否有两个(含)以上的队员
	local NumMem = LuaFnGetTeamSize( sceneId, selfId )
  if NumMem < 2 then
   	if IsHaveMis == 1 then
       x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_15}" )
    else
     	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_14}" )						
    end
    return 0
	end 
	
	-- 组队中的队员必须都在附近		
	local nNearTeamCount = GetNearTeamCount( sceneId, selfId )
  if GetNearTeamCount( sceneId, selfId ) < 2 then
   	x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_17}" )						
    return 0
	end 
	
	-- 队伍中是否有师徒关系....	
	local firstPlayer = selfId
	local otherPlayer
	for i=0, nNearTeamCount-1 do
		otherPlayer = GetNearTeamMember( sceneId, selfId, i )		
		if firstPlayer ~= otherPlayer then
			if LuaFnIsMaster(sceneId, otherPlayer, firstPlayer) == 1 then
				return 1
			end
			if LuaFnIsMaster(sceneId, firstPlayer, otherPlayer) == 1 then
				return 1
			end
		end
	end
	
	x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_036}" )
	return 0
	
end

--**********************************
--提交，仅供子任务调用
--**********************************
function x229024_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "提交任务失败" )					
		return 0
	end
	
	--检测等级
	if LuaFnGetLevel( sceneId, selfId ) < x229024_g_PlayerSlow_LVL then		
		x229024_NotifyTip( sceneId, selfId, "提交任务失败" )					
		return 0
	end
		
  -- 检查任务是否完成
	if x229024_CheckSubmit( sceneId, selfId ) ~= 1 then
		x229024_NotifyTip( sceneId, selfId, "提交任务失败" )				
		return 0
	end
	
	local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--队员所选的任务类型

	if nMisType == x229024_g_FuQiMission_IDX then
		if x229024_CheckMission_FuQi( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_JieBaiMission_IDX then
		if x229024_CheckMission_JieBai( sceneId, selfId ) == 0 then
			return 0
		end
	elseif nMisType == x229024_g_ShiTuMission_IDX then
		if x229024_CheckMission_ShiTu( sceneId, selfId ) == 0 then
			return 0
		end
	else		
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )		
		return 0
	end

	-- 队长发系统公告
	if selfId == GetTeamLeader( sceneId, selfId ) then
		local temp = ""
				
		if nMisType == x229024_g_FuQiMission_IDX then
			temp = "#{QX_20071129_043}"
		elseif nMisType == x229024_g_JieBaiMission_IDX then
			temp = "#{QX_20071129_046}"
		elseif nMisType == x229024_g_ShiTuMission_IDX then
			temp = "#{QX_20071129_047}"
		end
		
		local strText = format("#{_INFOUSR%s}#{QX_20071129_048}%s#{QIANXUN_INFO_24}", GetName(sceneId,selfId), temp )
		BroadMsgByChatPipe( sceneId, 0, strText, 4 )
	end
	
	local playerlvl = LuaFnGetLevel( sceneId, selfId )	
	LuaFnAddExp( sceneId, selfId, x229024_g_BonusEXP_List[playerlvl] )
	DelMission( sceneId, selfId, x229024_g_MissionId )			

end

--**********************************
--杀死怪物或玩家
--**********************************
function x229024_OnKillObject( sceneId, selfId, objdataId ,objId)--参数意思：场景号、玩家objId、怪物表位置号、怪物
end

--**********************************
--进入区域事件
--**********************************
function x229024_OnEnterArea( sceneId, selfId, zoneId )

	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) <= 0 then
		return 0
	end
	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)
	local index = GetMissionParam(sceneId,selfId,misIndex,x229024_g_Mission_RoundNum)
	if sceneId ~= x229024_g_scenePosInfoList[index].sceneId or zoneId ~= x229024_g_scenePosInfoList[index].Area then
		return 0
	end
	
	local nposX = random(3)
	local nposY = random(3)
	CreateSpecialObjByDataIndex(sceneId, selfId, x229024_g_Impact_Complete_Mission, x229024_g_scenePosInfoList[index].PosX+nposX, x229024_g_scenePosInfoList[index].PosY+nposY, 0)			-- 进入探索区域后播放的特效
end

--**********************************
--道具改变
--**********************************
function x229024_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--接任务后显示的界面
--**********************************
function x229024_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--交任务后显示的界面
--**********************************
function x229024_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--醒目提示
--**********************************
function x229024_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--与NPC对话
--**********************************
function x229024_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--取得本事件的MissionId，用于obj文件中对话情景的判断
--**********************************
function x229024_GetEventMissionId( sceneId, selfId )	
	return x229024_g_MissionId
end

function x229024_AcceptMission( sceneId, selfId, targetId )
	
	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x229024_g_Name then
		x229024_NotifyTip( sceneId, selfId, "接受任务失败" )		
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--发送任务接受时显示的信息
	BeginEvent(sceneId)
		AddText(sceneId,x229024_g_MissionName)
		AddText( sceneId, x229024_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{QX_20071129_025}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{QX_20071129_050}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x229024_g_ScriptId,x229024_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--获取具体item的详细信息
function x229024_GetItemDetailInfo(itemId)
	local itemId, itemName, itemDesc = GetItemInfoByItemId(itemId)
	if itemId == -1 then
		local strText = format("%s物品在'EquipBase.txt'没有找到!!", itemName)		
	end
	return itemId, itemName, itemDesc
end	

--/////////////////////////////////////////////////////////////////////////////////////////////////////
-- 检测任务通用规则
function x229024_GeneralRule( sceneId, selfId )
		
	if GetLevel( sceneId, selfId ) < x229024_g_PlayerSlow_LVL then
		x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_10}" )		
		return 0
	end
	
	if x229024_CheckHuoDongTime() ~= 1 and x229024_CheckSpecialTime() ~= 1 then --czf modify
		return 0
	end
	
	-- 任务物品栏是否已满
	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x229024_g_ItemId[1].num then
		x229024_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )
		return 0
	end
	
	-- 是否处于组队状态
  if LuaFnHasTeam( sceneId, selfId ) == 0 then
  	--如果玩家已经接了任务
  	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) > 0 then
  		x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_05}" )
  	else
  	  x229024_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_03}" )
  	end
  	
    return 0
  end
 	
	return 1
end

--*******************************************
--或者是 2009年8月24日0点至2009年8月30日24点
--连续一周开启千寻，czf，2009.08.07
--*******************************************
function x229024_CheckSpecialTime()

	local curDate = GetTime2Day( )
	
	--如果是是 2009年8月24日0点至2009年8月30日24点连续一周，则开启
	if curDate >= x229024_g_SpecialBeginTime and curDate <= x229024_g_SpecialEndTime then
		return 1
	else
		return 0
	end
	
end
--**********************************
--检测活动时间
--**********************************
function x229024_CheckHuoDongTime()

  local nDay = GetTodayWeek()

	-- 检测是否星期五
  if nDay == x229024_g_Activity_DayTime then
  	return 1
	else
		return 0
	end

end

--**********************************
--道具使用
--**********************************
function x229024_OnUseItem( sceneId, selfId, bagIndex )

	if IsHaveMission( sceneId, selfId, x229024_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x229024_g_MissionId)
	local nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum)	
	local ScintInfo = x229024_g_scenePosInfoList[nRoundNum]
	
	--取得玩家当前坐标
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	--计算玩家与目标点的距离
	local Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
	
	local str = ""

  if nRoundNum >= x229024_g_MaxRound then
  	local missitemid = GetItemTableIndexByIndex( sceneId, selfId, bagIndex )
		local ret = DelItem( sceneId, selfId, missitemid, 1 )
		
		if ret <= 0 then
			return 0
		end

		-- 100%几率掉落包	
		-- 给完成任务的玩家一个掉落包
		local nItemId = 0
		local nItemCount = 0					
		local rand =random(100)
		local ntype = 1
		local IsTalkWorld = 0
		local playerlvl = LuaFnGetLevel( sceneId, selfId )
		
		-- 1/20几率掉落圣诞帽
		-- 31492 改为掉落包几率为0
		if random(1) == 10 then
			if playerlvl < 12 then
				ntype = 1
			elseif playerlvl < 22 then
				ntype = 2
			elseif playerlvl < 32 then
				ntype = 3
			elseif playerlvl < 42 then
				ntype = 4
			elseif playerlvl < 52 then
				ntype = 5
			elseif playerlvl < 62 then
				ntype = 6
			elseif playerlvl < 72 then
				ntype = 7
			elseif playerlvl < 82 then
				ntype = 8
			elseif playerlvl < 92 then
				ntype = 9
			else
				ntype = 10
			end
					
			if rand <= 96 then
				nItemId = x229024_g_BonusItem[ntype].ItemID01					-- 拾取绑定
				nItemCount = 1			  	
			else
				nItemId = x229024_g_BonusItem[1].ItemID02					-- 装备绑定
				nItemCount = 1
				IsTalkWorld = 1
			end
		end
							
		-- local x,z = GetWorldPos(sceneId, selfId)
							
		-- local nBoxId = DropBoxEnterScene(	x,z,sceneId )		
		
		-- if nBoxId > -1  then
		-- 	AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,1,x229024_g_BonusFuJie)						
		-- 	if nItemCount > 0 then							
		-- 		AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,1,nItemId)						
		-- 	end
		-- 							
		-- 	-- 把这个掉落绑定给制定玩家
		-- 	SetItemBoxOwner(sceneId, nBoxId, LuaFnGetGUID(sceneId,selfId))
		-- 	
		-- 	if IsTalkWorld == 1 then							
		-- 		local strText = format("#{QX_20071129_040}#R#{_INFOUSR%s}#{QX_20071129_041}%s#{QX_20071129_042}", GetName(sceneId,selfId), GetItemName(sceneId,nItemId) )
		-- 		BroadMsgByChatPipe( sceneId, 0, strText, 4 )
		-- 	end
		-- 	-- 在这里记录开启宝箱的日志
		-- 	LuaFnAuditPlayerBehavior(sceneId, selfId, "开启千寻宝箱");
		-- end
		
		SetMissionByIndex( sceneId, selfId, misIndex, x229024_g_Mission_IsComplete, 1 )													-- 任务完成
		
	else
		
		x229024_NotifyTip( sceneId, selfId, "完成情况:已探索 "..nRoundNum.."/"..x229024_g_MaxRound )
		nRoundNum = nRoundNum+1							
		SetMissionByIndex(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum, nRoundNum)				
		ScintInfo = x229024_g_scenePosInfoList[nRoundNum]
		
		PlayerX = GetHumanWorldX(sceneId,selfId)
		PlayerY = GetHumanWorldZ(sceneId,selfId)
		--计算玩家与目标点的距离
		Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
		nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x229024_g_Mission_RoundNum)
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, ScintInfo.sceneId, ScintInfo.PosX, ScintInfo.PosY, x229024_g_MissionName)
		
		str = format("千寻任务第%d环: 去#G%s#W探索#G%s#{_INFOAIM%d,%d,%d,%s}#W，一览江湖美景吧。抵达后请使用#Y寻路之心#W。", nRoundNum, ScintInfo.scenename, ScintInfo.PosName, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)	
		
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	end
end
