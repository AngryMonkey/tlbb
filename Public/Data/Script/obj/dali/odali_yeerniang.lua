--叶二娘

--脚本号
x002003_g_scriptId = 002003

--所拥有的事件ID列表
x002003_g_eventList={200099,200100}
--x002003_g_eventList={201001,201002,201101,201102,201202,201301}	

x002003_g_RSMissionId = 101
x002003_g_ActivateMissionId = 37			-- 激活条件
x002003_g_SongXinScriptId = 006668		-- 送信
x002003_g_ShaGuaiScriptId = 006666		-- 杀怪
x002003_g_XunWuScriptId = 006667			-- 寻物

x002003_g_RoundStorytelling = {
		[0] = { misIndex = { 1039650 }, script = x002003_g_XunWuScriptId },
		[1] = { misIndex = { 1039651 }, script = x002003_g_XunWuScriptId },
		[2] = { misIndex = { 1039652 }, script = x002003_g_XunWuScriptId },
		[3] = { misIndex = { 1039653 }, script = x002003_g_XunWuScriptId },
		[4] = { misIndex = { 1039654 }, script = x002003_g_XunWuScriptId }}
			
x002003_g_SongXinMissionList = {
		[0] = { misIndex = { 1018300,1018304,1018308 }, script = x002003_g_SongXinScriptId },
		[1] = { misIndex = { 1018301,1018305,1018309 }, script = x002003_g_SongXinScriptId },
		[2] = { misIndex = { 1018302,1018306,1018310 }, script = x002003_g_SongXinScriptId },
		[3] = { misIndex = { 1018303,1018307,1018311 }, script = x002003_g_SongXinScriptId }}
					
x002003_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1009000,1009004,1009008,1009012,1009016,1009020,1009024 }, script = x002003_g_ShaGuaiScriptId },
		[1] = { misIndex = { 1009001,1009005,1009009,1009013,1009017,1009021,1009025 }, script = x002003_g_ShaGuaiScriptId },
		[2] = { misIndex = { 1009002,1009006,1009010,1009014,1009018,1009022,1009026 }, script = x002003_g_ShaGuaiScriptId },
		[3] = { misIndex = { 1009003,1009007,1009011,1009015,1009019,1009023,1009027 }, script = x002003_g_ShaGuaiScriptId }}
			

--**********************************
--事件列表
--**********************************
function x002003_UpdateEventList( sceneId, selfId,targetId )
  
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end

	BeginEvent( sceneId )
		AddText(sceneId,"  "..PlayerName..PlayerSex.."，我冷眼看你在这大理城来来去去，匆匆忙忙。总是忍不住想问你，你所做的，是为了你自己，还是为了别人？");

		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x002003_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "虚竹任务" and IsMissionHaveDone( sceneId, selfId, x002003_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x002003_g_scriptId, "虚竹任务", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x002003_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x002003_g_scriptId, "虚竹任务", 3, 1 )
		end

		for i, eventId in x002003_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件交互入口
--**********************************
function x002003_OnDefaultEvent( sceneId, selfId,targetId )
	x002003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
		
	local num = GetNumText()
	if num == 1 then										-- 虚竹任务
		if IsHaveMission( sceneId, selfId, x002003_g_RSMissionId ) > 0 then
			x002003_NotifyFailBox( sceneId, selfId, targetId, "    哦，你已有其他英雄的关系任务（剧情循环任务）尚未完成，请完成之后再来找我吧。" )
			return
		end
		
		-- 检测是否满足任务激活条件
		if IsMissionHaveDone( sceneId, selfId, x002003_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--看下今天的虚竹任务是不是做完50次了
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_XUZHU_LIMITI)
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
			SetMissionData(sceneId, selfId, MD_JQXH_XUZHU_LIMITI, 0)
		end

		local mission = x002003_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_XUZHU)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- 等级上限处理
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		
		-- 送信任务
		if randtype <= 60 then
			if playerlevel == 60 then
				mission = x002003_g_SongXinMissionList[0];
			elseif playerlevel == 70 then
				mission = x002003_g_SongXinMissionList[1];
			elseif playerlevel == 80 then
				mission = x002003_g_SongXinMissionList[2];
			elseif playerlevel == 90 then
				mission = x002003_g_SongXinMissionList[3];			
			end
		-- 杀怪任务
		elseif randtype <= 95 then
			if playerlevel == 60 then
				mission = x002003_g_ShaGuaiMissionList[0];
			elseif playerlevel == 70 then
				mission = x002003_g_ShaGuaiMissionList[1];
			elseif playerlevel == 80 then
				mission = x002003_g_ShaGuaiMissionList[2];
			elseif playerlevel == 90 then
				mission = x002003_g_ShaGuaiMissionList[3];			
			end
		-- 寻物任务
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x002003_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x002003_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x002003_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x002003_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x002003_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x002003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002003_g_eventList do
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
function x002003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002003_g_eventList do
		if missionScriptId == findId then
			x002003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002003_OnDie( sceneId, selfId, killerId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x002003_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--提交物品
--**********************************
function x002003_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x002003_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
