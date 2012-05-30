--洛阳NPC
--阿紫
--主要

--脚本号
x000016_g_scriptId = 000016

--所拥有的事件ID列表
x000016_g_eventList={200099,200100}

x000016_g_RSMissionId = 101
x000016_g_ActivateMissionId = 32			-- 激活条件
x000016_g_SongXinScriptId = 006668		-- 送信
x000016_g_ShaGuaiScriptId = 006666		-- 杀怪
x000016_g_XunWuScriptId = 006667			-- 寻物

x000016_g_RoundStorytelling = {
		[0] = { misIndex = { 1039250 }, script = x000016_g_XunWuScriptId },
		[1] = { misIndex = { 1039251 }, script = x000016_g_XunWuScriptId },
		[2] = { misIndex = { 1039252 }, script = x000016_g_XunWuScriptId },
		[3] = { misIndex = { 1039253 }, script = x000016_g_XunWuScriptId },
		[4] = { misIndex = { 1039254 }, script = x000016_g_XunWuScriptId }}
			
x000016_g_SongXinMissionList = {
		[0] = { misIndex = { 1018500 }, script = x000016_g_SongXinScriptId },
		[1] = { misIndex = { 1018501 }, script = x000016_g_SongXinScriptId },
		[2] = { misIndex = { 1018502 }, script = x000016_g_SongXinScriptId },
		[3] = { misIndex = { 1018503 }, script = x000016_g_SongXinScriptId },
		[4] = { misIndex = { 1018504 }, script = x000016_g_SongXinScriptId }}		
			
x000016_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1039255 }, script = x000016_g_XunWuScriptId },
		[1] = { misIndex = { 1039256 }, script = x000016_g_XunWuScriptId },
		[2] = { misIndex = { 1039257 }, script = x000016_g_XunWuScriptId },
		[3] = { misIndex = { 1039258 }, script = x000016_g_XunWuScriptId },
		[4] = { misIndex = { 1039259 }, script = x000016_g_XunWuScriptId }}


--**********************************
--事件列表
--**********************************
function x000016_UpdateEventList( sceneId, selfId,targetId )
		
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end

	BeginEvent( sceneId )
		AddText(sceneId,"#{OBJ_luoyang_0009}")

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x000016_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "阿紫任务" and IsMissionHaveDone( sceneId, selfId, x000016_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x000016_g_scriptId, "阿紫任务", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x000016_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x000016_g_scriptId, "阿紫任务", 3, 1 )
		end

		for _, eventId in x000016_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件交互入口
--**********************************
function x000016_OnDefaultEvent( sceneId, selfId,targetId )
	x000016_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000016_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000016_g_eventList do
		if eventId == findId then			
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end	
	
	local num = GetNumText()
	if num == 1 then										-- 阿紫任务
		if IsHaveMission( sceneId, selfId, x000016_g_RSMissionId ) > 0 then
			x000016_NotifyFailBox( sceneId, selfId, targetId, "    哦，你已有其他英雄的关系任务（剧情循环任务）尚未完成，请完成之后再来找我吧。" )
			return
		end
		
		-- 检测是否满足任务激活条件
		if IsMissionHaveDone( sceneId, selfId, x000016_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--看下今天的阿紫任务是不是做完50次了
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_AZI_LIMITI)
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
			SetMissionData(sceneId, selfId, MD_JQXH_AZI_LIMITI, 0)
		end

		local mission = x000016_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_AZI)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- 等级上限处理
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		
		-- 送信任务
		if randtype <= 60 then
			if playerlevel == 50 then
				mission = x000016_g_SongXinMissionList[0];
			elseif playerlevel == 60 then
				mission = x000016_g_SongXinMissionList[1];
			elseif playerlevel == 70 then
				mission = x000016_g_SongXinMissionList[2];
			elseif playerlevel == 80 then
				mission = x000016_g_SongXinMissionList[3];
			elseif playerlevel == 90 then
				mission = x000016_g_SongXinMissionList[4];			
			end
		-- 杀怪任务
		elseif randtype <= 95 then
			if playerlevel == 50 then
				mission = x000016_g_ShaGuaiMissionList[0];
			elseif playerlevel == 60 then
				mission = x000016_g_ShaGuaiMissionList[1];
			elseif playerlevel == 70 then
				mission = x000016_g_ShaGuaiMissionList[2];
			elseif playerlevel == 80 then
				mission = x000016_g_ShaGuaiMissionList[3];
			elseif playerlevel == 90 then
				mission = x000016_g_ShaGuaiMissionList[4];			
			end
		-- 寻物任务
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x000016_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x000016_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x000016_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x000016_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x000016_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
	
	
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x000016_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000016_g_eventList do
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
function x000016_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000016_g_eventList do
		if missionScriptId == findId then
			x000016_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000016_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end	
end

--**********************************
--提交已做完的任务
--**********************************
function x000016_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000016_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end	
end

--**********************************
--死亡事件
--**********************************
function x000016_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x000016_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--提交物品
--**********************************
function x000016_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x000016_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
