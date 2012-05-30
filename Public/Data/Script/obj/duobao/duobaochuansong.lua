-- 891003
-- 高太公 匪寨传送人

--脚本号
x891003_g_scriptId = 891003

--所拥有的事件ID列表
x891003_g_eventList={}

--**********************************
--事件列表
--**********************************
function x891003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  我被别人杀怕了，要离开生死门，返回洛阳。")
	
	AddNumText( sceneId, x891003_g_scriptId, "返回洛阳",0 ,1  )
	AddNumText( sceneId, x891002_g_scriptId, "生死夺宝攻略",0 ,2  )
	
	for i, eventId in x891003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x891003_OnDefaultEvent( sceneId, selfId,targetId )
	x891003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x891003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 1  then
		local nStoneId = 39910008
		local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
		if nStoneCount >= 1  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B生死夺宝");
				AddText(sceneId,"  携带生死宝盒的玩家不能离开生死门。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)		
			return 0
		end
		LuaFnCancelSpecificImpact(sceneId,selfId,200)
              LuaFnCancelSpecificImpact(sceneId,selfId,16115)
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 0, 161, 105, 10 )

		return
	end

	if GetNumText() == 2  then
		BeginEvent( sceneId )
			AddText(sceneId,"夺宝时间为#Y20：00-21：00，#W进入时间为#Y19：45-21：00，#cFF0000超过时间将不得进入，#Y21：00#G夺宝时间结束后#W玩家将传出地图！")
			AddText(sceneId,"夺宝地图#Y20：00#W会准时刷出一个怪物，杀死后会在地图#Y中心位置#G刷出一个#cFF0000带生死宝盒的包，#W下手快者#Y将获得此包。")
			AddText(sceneId,"#Y20:00-21:00#W为战斗时间，杀死#G得到宝盒#W的玩家，#cFF0000宝盒会掉落，#W在#Y地图中心位置会#W重新刷新出一个包，#W下手快者#Y将获得此包。")
			AddText(sceneId,"生死地图#Y不能定位，#G不能使用传送技能，#W获得宝盒#Y中途下线，#W重新上线后将会#cFF0000删除宝盒，而宝盒会#Y重新刷出，#W其他玩家可以获得，#G中途不想战斗#W可以#Y传送到洛阳！")
			AddNumText( sceneId, x889063_g_scriptId, "取消", 5, 4)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end

	for i, findId in x891003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x891003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891003_g_eventList do
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
function x891003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x891003_g_eventList do
		if missionScriptId == findId then
			x891003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x891003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x891003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x891003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x891003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x891003_OnDie( sceneId, selfId, killerId )
end

