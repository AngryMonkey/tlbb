--苏州NPC
--王夫人
--一般

--脚本号
x001021_g_scriptId = 001021

--所拥有的事件ID列表
x001021_g_eventList={229022, 200099, 200100}

x001021_g_RSMissionId = 101
x001021_g_ActivateMissionId = 15			-- 激活条件
x001021_g_SongXinScriptId = 006668		-- 送信
x001021_g_ShaGuaiScriptId = 006666		-- 杀怪
x001021_g_XunWuScriptId = 006667			-- 寻物

x001021_g_RoundStorytelling = {
		[0] = { misIndex = { 1039200 }, script = x001021_g_XunWuScriptId },
		[1] = { misIndex = { 1039201 }, script = x001021_g_XunWuScriptId },
		[2] = { misIndex = { 1039202 }, script = x001021_g_XunWuScriptId },
		[3] = { misIndex = { 1039203 }, script = x001021_g_XunWuScriptId },
		[4] = { misIndex = { 1039204 }, script = x001021_g_XunWuScriptId }}
			
x001021_g_SongXinMissionList = {
		[0] = { misIndex = { 1018400,1018407,1018414,1018421,1018428,1018435,1018442,1018449 }, script = x001021_g_SongXinScriptId },
		[1] = { misIndex = { 1018401,1018408,1018415,1018422,1018429,1018436,1018443,1018450 }, script = x001021_g_SongXinScriptId },
		[2] = { misIndex = { 1018402,1018409,1018416,1018423,1018430,1018437,1018444,1018451 }, script = x001021_g_SongXinScriptId },
		[3] = { misIndex = { 1018403,1018410,1018417,1018424,1018431,1018438,1018445,1018452 }, script = x001021_g_SongXinScriptId },
		[4] = { misIndex = { 1018404,1018411,1018418,1018425,1018432,1018439,1018446,1018453 }, script = x001021_g_SongXinScriptId },
		[5] = { misIndex = { 1018405,1018412,1018419,1018426,1018433,1018440,1018447,1018454 }, script = x001021_g_SongXinScriptId },
		[6] = { misIndex = { 1018406,1018413,1018420,1018427,1018434,1018441,1018448,1018455 }, script = x001021_g_SongXinScriptId }}		
			
x001021_g_ShaGuaiMissionList = {
		[0] = { misIndex = { 1039205 }, script = x001021_g_XunWuScriptId },
		[1] = { misIndex = { 1039206 }, script = x001021_g_XunWuScriptId },
		[2] = { misIndex = { 1039207 }, script = x001021_g_XunWuScriptId },
		[3] = { misIndex = { 1039208 }, script = x001021_g_XunWuScriptId },
		[4] = { misIndex = { 1039209 }, script = x001021_g_XunWuScriptId },
		[5] = { misIndex = { 1039210 }, script = x001021_g_XunWuScriptId },
		[6] = { misIndex = { 1039211 }, script = x001021_g_XunWuScriptId }}		


--**********************************
--事件列表
--**********************************
function x001021_UpdateEventList( sceneId, selfId,targetId )
		
	local PlayerName = GetName( sceneId, selfId )
	local PlayerSex = GetSex( sceneId, selfId )
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end

	BeginEvent( sceneId )
		AddText(sceneId,"#{OBJ_suzhou_0008}")		
		AddNumText( sceneId, x001021_g_scriptId, "连环任务介绍", 11, 10 )
    AddNumText( sceneId, x001021_g_scriptId, "#{JZBZ_081031_02}", 11, 11 )
		
		local missionIndex = GetScriptIDByMissionID( sceneId, selfId, x001021_g_RSMissionId )
		if missionIndex ~= -1 then
			local missionName = TGetMissionName( missionIndex )
			if missionName ~= "王语嫣任务" and IsMissionHaveDone( sceneId, selfId, x001021_g_ActivateMissionId ) > 0 then
				AddNumText( sceneId, x001021_g_scriptId, "王语嫣任务", 3, 1 )
			end
		elseif IsMissionHaveDone( sceneId, selfId, x001021_g_ActivateMissionId ) > 0 then
			AddNumText( sceneId, x001021_g_scriptId, "王语嫣任务", 3, 1 )
		end

		for _, eventId in x001021_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
					
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )	
	
end

--**********************************
--事件交互入口
--**********************************
function x001021_OnDefaultEvent( sceneId, selfId,targetId )
	x001021_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001021_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_070}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	elseif GetNumText() == 11 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{JZBZ_081031_01}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end


	for i, findId in x001021_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
		
	local num = GetNumText()
	if num == 1 then										-- 王语嫣任务
		if IsHaveMission( sceneId, selfId, x001021_g_RSMissionId ) > 0 then
			x001021_NotifyFailBox( sceneId, selfId, targetId, "    哦，你已有其他英雄的关系任务（剧情循环任务）尚未完成，请完成之后再来找我吧。" )
			return
		end
		
		-- 检测是否满足任务激活条件
		if IsMissionHaveDone( sceneId, selfId, x001021_g_ActivateMissionId ) <= 0 then
			return 0
		end
		
		--看下今天的王语嫣任务是不是做完50次了
		--begin modified by zhangguoxin 090208
		local nDayCount = GetMissionData(sceneId, selfId, MD_JQXH_WANGYUYAN_LIMITI)
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
			SetMissionData(sceneId, selfId, MD_JQXH_WANGYUYAN_LIMITI, 0)
		end

		local mission = x001021_g_RoundStorytelling[0];
		local relation = GetMissionData(sceneId, selfId, MD_RELATION_WANGYUYAN)
		local playerlevel = GetLevel( sceneId, selfId )
		
		-- 等级上限处理
		if playerlevel >= 100 then
			playerlevel = 90
		end
		
		playerlevel = floor( playerlevel / 10 ) * 10
		local randtype = random(100)
		
		-- 送信任务
		if randtype <= 60 then
			if playerlevel == 30 then
				mission = x001021_g_SongXinMissionList[0];
			elseif playerlevel == 40 then
				mission = x001021_g_SongXinMissionList[1];
			elseif playerlevel == 50 then
				mission = x001021_g_SongXinMissionList[2];
			elseif playerlevel == 60 then
				mission = x001021_g_SongXinMissionList[3];
			elseif playerlevel == 70 then
				mission = x001021_g_SongXinMissionList[4];
			elseif playerlevel == 80 then
				mission = x001021_g_SongXinMissionList[5];
			elseif playerlevel == 90 then
				mission = x001021_g_SongXinMissionList[6];			
			end
		-- 杀怪任务
		elseif randtype <= 95 then
			if playerlevel == 30 then
				mission = x001021_g_ShaGuaiMissionList[0];
			elseif playerlevel == 40 then
				mission = x001021_g_ShaGuaiMissionList[1];
			elseif playerlevel == 50 then
				mission = x001021_g_ShaGuaiMissionList[2];
			elseif playerlevel == 60 then
				mission = x001021_g_ShaGuaiMissionList[3];
			elseif playerlevel == 70 then
				mission = x001021_g_ShaGuaiMissionList[4];
			elseif playerlevel == 80 then
				mission = x001021_g_ShaGuaiMissionList[5];
			elseif playerlevel == 90 then
				mission = x001021_g_ShaGuaiMissionList[6];			
			end
		-- 寻物任务
		elseif randtype <= 100 then
			if relation <= 999 then
				mission = x001021_g_RoundStorytelling[0];
			elseif relation <= 1999 then
				mission = x001021_g_RoundStorytelling[1];
			elseif relation <= 3999 then
				mission = x001021_g_RoundStorytelling[2];
			elseif relation <= 6499 then
				mission = x001021_g_RoundStorytelling[3];
			elseif relation <= 9999 then
				mission = x001021_g_RoundStorytelling[4];
			end
		end
				
		CallScriptFunction( mission.script, "OnDefaultEvent", sceneId, selfId, targetId, mission.misIndex[ random( getn(mission.misIndex) ) ] )		
		
		return
	end	
	
	
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x001021_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001021_g_eventList do
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
function x001021_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001021_g_eventList do
		if missionScriptId == findId then
			x001021_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001021_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001021_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001021_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001021_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001021_OnDie( sceneId, selfId, killerId )
end

--**********************************
--时钟事件
--**********************************
function x001021_OnCharacterTimer( sceneId, selfId, dataId, nowtime )
--场景号，ObjID，怪物表号，时间值(毫秒)

end

--**********************************
-- 对话窗口信息提示
--**********************************
function x001021_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--提交物品
--**********************************
function x001021_OnMissionCheck( sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
	
	for i, eventId in x001021_g_XunWuScriptId do
		
		if eventId == scriptId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, targetId, scriptId, index1, index2, index3, indexpet, missionIndex )
			return 1
		end
	end
		
end
