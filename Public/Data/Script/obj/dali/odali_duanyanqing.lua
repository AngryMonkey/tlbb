--段延庆

--脚本号
x002016_g_scriptId = 002016

--所拥有的事件ID列表
x002016_g_eventList={ 210225, 210226, 210227, 210228, 210229, 200099,200100}		--201801,201901,201802

x002016_g_RSMissionId = 101
x002016_g_ActivateMissionId = 8			-- 激活条件
x002016_g_SongXinScriptId = 006668		-- 送信
x002016_g_ShaGuaiScriptId = 006666		-- 杀怪
x002016_g_XunWuScriptId = 006667		-- 寻物

x002016_g_RewardsId = 10155001	-- 飞蝗石--[tx43452_]
x002016_g_BoundRewardsId = 10155004		-- 飞蝗石--[tx43452_]
x002016_g_cdLimid = 1000  -- 计数分段号--[tx43452]
x002016_g_RoundStorytelling = {
		[0] = { misIndex = { 1039400 }, script = x002016_g_XunWuScriptId },
		[1] = { misIndex = { 1039401 }, script = x002016_g_XunWuScriptId },
		[2] = { misIndex = { 1039402 }, script = x002016_g_XunWuScriptId },
		[3] = { misIndex = { 1039403 }, script = x002016_g_XunWuScriptId },
		[4] = { misIndex = { 1039404 }, script = x002016_g_XunWuScriptId }}
			
x002016_g_SongXinMissionList = {
		[0] = { misIndex = { 1018100,1018108,1018116,1018124,1018132,1018140,1018148 }, script = x002016_g_SongXinScriptId },
		[1] = { misIndex = { 1018101,1018109,1018117,1018125,1018133,1018141,1018149 }, script = x002016_g_SongXinScriptId },
		[2] = { misIndex = { 1018102,1018110,1018118,1018126,1018134,1018142,1018150 }, script = x002016_g_SongXinScriptId },
		[3] = { misIndex = { 1018103,1018111,1018119,1018127,1018135,1018143,1018151 }, script = x002016_g_SongXinScriptId },
		[4] = { misIndex = { 1018104,1018112,1018120,1018128,1018136,1018144,1018152 }, script = x002016_g_SongXinScriptId },
		[5] = { misIndex = { 1018105,1018113,1018121,1018129,1018137,1018145,1018153 }, script = x002016_g_SongXinScriptId },
		[6] = { misIndex = { 1018106,1018114,1018122,1018130,1018138,1018146,1018154 }, script = x002016_g_SongXinScriptId },
		[7] = { misIndex = { 1018107,1018115,1018123,1018131,1018139,1018147,1018155 }, script = x002016_g_SongXinScriptId }}
			
x002016_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1039405 }, script = x002016_g_XunWuScriptId },
		[1] = { misIndex = { 1039406 }, script = x002016_g_XunWuScriptId },
		[2] = { misIndex = { 1039407 }, script = x002016_g_XunWuScriptId },
		[3] = { misIndex = { 1039408 }, script = x002016_g_XunWuScriptId },
		[4] = { misIndex = { 1039409 }, script = x002016_g_XunWuScriptId },
		[5] = { misIndex = { 1039410 }, script = x002016_g_XunWuScriptId },
		[6] = { misIndex = { 1039411 }, script = x002016_g_XunWuScriptId },
		[7] = { misIndex = { 1039412 }, script = x002016_g_XunWuScriptId }}


--**********************************
--事件列表
--**********************************
function x002016_UpdateEventList( sceneId, selfId,targetId )
		
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end

	BeginEvent( sceneId )
		AddText(sceneId,"#{OBJ_dali_0006}");

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x002016_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "段延庆任务" and IsMissionHaveDone( sceneId, selfId, x002016_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x002016_g_scriptId, "段延庆任务", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x002016_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x002016_g_scriptId, "段延庆任务", 3, 1 )
		end

		for _, eventId in x002016_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	
end

--**********************************
--事件交互入口
--**********************************
function x002016_OnDefaultEvent( sceneId, selfId,targetId )
	x002016_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002016_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for _, findId in x002016_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
	
	local num = GetNumText()
	if num == 1 then										-- 段延庆任务
		if IsHaveMission( sceneId, selfId, x002016_g_RSMissionId ) > 0 then
			x002016_NotifyFailBox( sceneId, selfId, targetId, "    哦，你已有其他英雄的关系任务（剧情循环任务）尚未完成，请完成之后再来找我吧。" )
			return
		end
		
		-- 检测是否满足任务激活条件
		if IsMissionHaveDone( sceneId, selfId, x002016_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--看下今天的段延庆任务是不是做完50次了
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_DUANYANQING_LIMITI)
		local nCount = 		floor(nDayCount/100000)
		local nTime = 		mod(nDayCount,100000)
		--local nDayTime = 	floor(nTime/100)	--上一次交任务的时间(天数)
		local nDayTime = 	nTime								--上一次交任务的时间(天数)
		
		--local CurTime = GetHourTime()				--当前时间
		local CurTime = GetDayTime()					--当前时间
		--local CurDaytime = floor(CurTime/100)	--当前时间(天)
		local CurDaytime = CurTime							--当前时间(天)
		--end modified by zhangguoxin 090208

		if nDayTime == CurDaytime  then -- 当天
			if nCount >= 50  then
				BeginEvent( sceneId )
					AddText( sceneId, "  今天已经麻烦你太多的事情了，实在是过意不去，明天再麻烦你吧！" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				return
			end
			
		else		-- 新的一天
			SetMissionData(sceneId, selfId, MD_JQXH_DUANYANQING_LIMITI, 0)
		end

		local mission = x002016_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_DUANYANQING)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- 等级上限处理
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		if randtype <= 75 then --[tx44885]原来20，即改后占75
			if playerlevel == 20 then
				mission = x002016_g_SongXinMissionList[0];
			elseif playerlevel == 30 then
				mission = x002016_g_SongXinMissionList[1];
			elseif playerlevel == 40 then
				mission = x002016_g_SongXinMissionList[2];
			elseif playerlevel == 50 then
				mission = x002016_g_SongXinMissionList[3];
			elseif playerlevel == 60 then
				mission = x002016_g_SongXinMissionList[4];
			elseif playerlevel == 70 then
				mission = x002016_g_SongXinMissionList[5];
			elseif playerlevel == 80 then
				mission = x002016_g_SongXinMissionList[6];
			elseif playerlevel == 90 then
				mission = x002016_g_SongXinMissionList[7];
			end
		elseif randtype <= 95 then --[tx44885]原来40，即改后占20
			if playerlevel == 20 then
				mission = x002016_g_ShaGuaiMissionList[0];
			elseif playerlevel == 30 then
				mission = x002016_g_ShaGuaiMissionList[1];
			elseif playerlevel == 40 then
				mission = x002016_g_ShaGuaiMissionList[2];
			elseif playerlevel == 50 then
				mission = x002016_g_ShaGuaiMissionList[3];
			elseif playerlevel == 60 then
				mission = x002016_g_ShaGuaiMissionList[4];
			elseif playerlevel == 70 then
				mission = x002016_g_ShaGuaiMissionList[5];
			elseif playerlevel == 80 then
				mission = x002016_g_ShaGuaiMissionList[6];
			elseif playerlevel == 90 then
				mission = x002016_g_ShaGuaiMissionList[7];
			end
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x002016_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x002016_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x002016_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x002016_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x002016_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x002016_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002016_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			x002016_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002016_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002016_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002016_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x002016_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--提交物品
--**********************************
function x002016_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x002016_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
--**********************************
--第一次完成任务NPC对话
--**********************************
function x002016_NPCTalkOnFirstSubmission( sceneId, selfId, missionIndex, isDone)--[tx43452]
	local ret = x002016_IsQualified( sceneId, selfId, missionIndex )
	if ret == 0 then
		return 0
	end
	
  local countValue = GetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT )
  if not countValue then
    return 0
  end

  local adCount = mod(countValue, x002016_g_cdLimid)--给飞蝗石的次数
	local msCount = floor(countValue / x002016_g_cdLimid)--完成关系值高于等于480的次数 
	
	
	if isDone == 0 then
	  if adCount == 0 and msCount == 0 then--adCount
			local PlayerName = GetName(sceneId, selfId)
			local msg = format("#{_INFOUSR%s}#{AQFC_090115_03}", PlayerName)
			AddText( sceneId, msg )
			return 1
		end
	else
	  if adCount == 1 and msCount == 1 then--adCount
			local PlayerName = GetName(sceneId, selfId)
			local msg = format("#{_INFOUSR%s}#{AQFC_090115_03}", PlayerName)
			AddText( sceneId, msg )
			return 1
		end		
	end 

	return 0
	
end

--**********************************
--检查是否满足暗器放出前提条件
--**********************************
function x002016_IsQualified( sceneId, selfId, missionIndex )--[tx43452]
	
	local mdLocation, _, _ = TGetRelationShipAwardInfo( missionIndex )
	if not mdLocation or mdLocation ~= MD_RELATION_DUANYANQING then
		return 0
	end
	
	local value = GetMissionData( sceneId, selfId, mdLocation );
	if not value or value < 480 then
		return 0
	end	

	return 1
	
end

--**********************************
--讲暗器放进背包
--**********************************
function x002016_OnAddRewards( sceneId, selfId, missionIndex)--[tx43452]
	
	local ret = x002016_IsQualified( sceneId, selfId, missionIndex )
	if ret == 0 then
		return 0
	end
	
  local countValue = GetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT )
  if not countValue then
    return 0
  end

  local adCount = mod(countValue, x002016_g_cdLimid)--给飞蝗石的次数
	local msCount = floor(countValue / x002016_g_cdLimid)--完成关系值高于等于480的次数  
  if adCount == 0 and msCount == 0 then
		AddItem( sceneId, x002016_g_BoundRewardsId, 1 )
		return 1
	else
		local testCount = 50 * x002016_myPower( 2, adCount - 1 )--计数从关系值>=480开始记，这里用50*2^(n-1),	
		if adCount > 0 and msCount + 1 == testCount then
			AddItem( sceneId, x002016_g_RewardsId, 1 )		
			return 1
		end
	end
	return 0
	
end

--**********************************
--循环任务提交成功的事件

--**********************************
function x002016_OnMissionSubmitionSuccess(sceneId, selfId, targetId, missionIndex)--[tx43452]

	local ret = x002016_IsQualified( sceneId, selfId, missionIndex )
	if ret == 0 then
		return 0
	end
	
	local countValue = GetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT )
	if not countValue then
		return 0
	end

	local adCount = mod(countValue, x002016_g_cdLimid)--给飞蝗石的次数
	local msCount = floor(countValue / x002016_g_cdLimid)--完成关系值高于等于480的次数
	msCount = msCount + 1
	if msCount == 1 then--放出一个绑定的飞蝗石
	  local bagIndex = x002016_RecevieRewards(sceneId, selfId, targetId, x002016_g_BoundRewardsId)
    if bagIndex < 0 then
			return 0
    end
    adCount = adCount + 1
	else
		local testCount = 50 * x002016_myPower( 2, adCount - 1 )--计数从关系值>=480开始记，这里用50*2^(n-1),
		if testCount == msCount  then--msCount放出一个非绑定的飞蝗石
		  local bagIndex = x002016_RecevieRewards( sceneId, selfId, targetId, x002016_g_RewardsId)

			if bagIndex < 0 then
				return 0
	    end
			local ItemTransfer = GetBagItemTransfer( sceneId, selfId, bagIndex)
			local PlayerName = GetName(sceneId,selfId)
			local msg = format("#{AQ_05}#{_INFOUSR%s}#{AQ_06}#{_INFOMSG%s}#{AQ_07}", PlayerName,  ItemTransfer)
	    BroadMsgByChatPipe( sceneId, selfId, msg, 4 )
		  adCount = adCount + 1
		end
	end
	local newCountValue = floor( msCount * x002016_g_cdLimid ) + adCount
	SetMissionData( sceneId, selfId, MD_JQXH_DUANYANQING_COUNT, newCountValue )

	return 1
end

--**********************************
--接受物品

--**********************************
function x002016_RecevieRewards(sceneId, selfId, targetId, ItemId)--[tx43452]
	--实际在前面已放入背包，这里只提示成功

	if ItemId == x002016_g_BoundRewardsId then
	  local guid = LuaFnObjId2Guid(sceneId, selfId);		
	  ScriptGlobal_AuditGeneralLog(LUAAUDIT_FEIHUANGSHI_BOUND, guid);
	else
	  local guid = LuaFnObjId2Guid(sceneId, selfId);
	  ScriptGlobal_AuditGeneralLog(LUAAUDIT_FEIHUANGSHI, guid);			
	end

	
	--醒目提示
	local pos = GetItemBagPos( sceneId, selfId, ItemId, 0 )
	if pos >= 0 then
		local msg = format("#{AQFC_090115_02}") --[tx43452]
		x002016_NotifyTips(sceneId, selfId, msg)
	end
  return pos
end

--**********************************
--醒目提示

--**********************************
function x002016_NotifyTips(sceneId, selfId, msg)--[tx43452]
	BeginEvent( sceneId )
  	AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end



--**********************************
--n^m
--**********************************
function x002016_myPower(n, m)--[tx43452]
	if m == 0 then 
	  return 1
	else 
	  return n * x002016_myPower( n, m - 1 ) 
  end
end
