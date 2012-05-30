--苏州NPC 
--欧冶子
--普通

--脚本号
x001066_g_ScriptId = 001066
x001066_g_ShenBingScriptId = 500503			-- 血欲神兵任务脚本
x001066_g_ChongZhuScriptId = 500504			-- 神器铸造和修理脚本
x001066_g_Name			= "欧冶子"

x001066_g_eventList={}
--**********************************
--事件列表
--**********************************
function x001066_UpdateEventList( sceneId, selfId,targetId )
end

--**********************************
--事件交互入口
--**********************************
function x001066_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )
		AddText(sceneId,"#{OBJ_suzhou_0020}")
		
		for i, eventId in x001066_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		if LuaFnGetName( sceneId, targetId ) == x001066_g_Name then
			AddNumText(sceneId,x001066_g_ScriptId,"血浴神兵",3,105)
		end
		AddNumText(sceneId,x001066_g_ScriptId,"装备资质鉴定",6,4)
		AddNumText(sceneId,x001066_g_ScriptId,"装备强化",6,5)
		--AddNumText(sceneId,x001066_g_ScriptId,"提升装备等级",6,6)
		--AddNumText(sceneId,x001066_g_ScriptId,"装备改变外形",6,7)

		AddNumText(sceneId,x001066_g_ScriptId,"增加可修理次数",6,8)
		AddNumText(sceneId,x001066_g_ScriptId,"装备刻铭",6,9)
		AddNumText(sceneId,x001066_g_ScriptId,"装备除铭",6,22)
		AddNumText(sceneId,x001066_g_ScriptId,"重新鉴定装备资质",6,19)
		if LuaFnGetName( sceneId, targetId ) == x001066_g_Name then
			AddNumText(sceneId,x001066_g_ScriptId,"神器铸造",11,106)
		end
		
		AddNumText( sceneId, x001066_g_ScriptId, "装备加强相关介绍", 11, 10 )
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x001066_OnEventRequest( sceneId, selfId, targetId, eventId )

---------------------------介绍-------------------------------------------------
		if GetNumText() == 10 then
			BeginEvent(sceneId)	
				AddText(sceneId,"#{function_help_055}#r")
				
				AddNumText(sceneId, x001066_g_ScriptId,"装备刻铭介绍",11,11);
				AddNumText(sceneId, x001066_g_ScriptId,"装备强化介绍",11,12);
				AddNumText(sceneId, x001066_g_ScriptId,"装备资质鉴定介绍",11,13);
				--AddNumText(sceneId, x001066_g_ScriptId,"改变装备外形介绍",11,14);				
				AddNumText(sceneId, x001066_g_ScriptId,"重新鉴定装备资质介绍",11,29);

			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	
		if GetNumText() == 11 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{function_help_044}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 12 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_045}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 13 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_046}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 14 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_047}#r")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		if GetNumText() == 29 then
			BeginEvent(sceneId)						
					AddText(sceneId,"#{function_help_097}")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		--------------------------------------------------------------------------
		
		-- 装备资质鉴定
		if GetNumText() == 4 then
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1001 )
			return
		end

		-- 装备强化
		if	GetNumText()==5	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1002)
			return

		end

		if	GetNumText()==6	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1003)
			return

		end

		if	GetNumText()==7	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1010)
			return

		end

		-- 增加可修理次数
		if	GetNumText()==8	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1004)
			return

		end

		-- 装备刻铭
		if	GetNumText()==9	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1005)
			return

		end
		
		-- 装备除铭
		if	GetNumText()==22	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 1006)
			return

		end
		
		-- 重新鉴定装备资质
		if	GetNumText()==19	then

			BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId)
			EndUICommand(sceneId)
			DispatchUICommand(sceneId,selfId, 112233)
			return

		end
		
		-- 血浴神兵
		if GetNumText() == 105 then
			BeginEvent(sceneId)						
				AddText(sceneId,"#{XYSB_20070928_001}")				
				CallScriptFunction( x001066_g_ShenBingScriptId, "OnEnumerate",sceneId, selfId, targetId )
				CallScriptFunction( x001066_g_ChongZhuScriptId, "OnEnumerate",sceneId, selfId, targetId )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		if GetNumText() == 106 then
			BeginEvent(sceneId)						
				AddText( sceneId, "#{XYSB_20070928_011}" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end	
		
		if eventId == x001066_g_ShenBingScriptId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end	
		
		if eventId == x001066_g_ChongZhuScriptId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end	
		
		for i, findId in x001066_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
				return
			end
		end
		
end

--**********************************
--接受此NPC的任务
--**********************************
function x001066_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
	end
	
--	local i				= 1
--	local findId	= 0
--	for i, findId in x001066_g_eventList do
--		if missionScriptId == findId then
--			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
--			if ret > 0 then
--				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
--			end
--			return
--		end
--	end

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x001066_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	
	--拒绝之后，要返回NPC的事件列表
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		x001066_UpdateEventList( sceneId, selfId, targetId )
		return
	end	

end

--**********************************
--继续（已经接了任务）
--**********************************
function x001066_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end	

end

--**********************************
--提交已做完的任务
--**********************************
function x001066_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	
	if missionScriptId == x001066_g_ShenBingScriptId then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end	

end

--**********************************
--死亡事件
--**********************************
function x001066_OnDie( sceneId, selfId, killerId )
end

--**********************************
--提交物品
--**********************************
function x001066_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	
	if scriptId == x001066_g_ShenBingScriptId or scriptId == x001066_g_ChongZhuScriptId then
		CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
		return
	end
	
end
