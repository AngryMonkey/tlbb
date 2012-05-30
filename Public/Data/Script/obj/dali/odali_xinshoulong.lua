--钱龙

--脚本号
x002031_g_scriptId = 002031

x002031_g_startTime = 09097 --活动开始时间
x002031_g_EndTime   = 09150 --活动结束时间

--所拥有的事件ID列表
x002031_g_eventList={210205,210207,210208,050028,889054,889055,889056,889057}--210206,311100

--**********************************
--事件列表
--**********************************
function x002031_UpdateEventList( sceneId, selfId,targetId )
	
	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "妹妹"
	else
		PlayerSex = "兄弟"
	end
	
	BeginEvent(sceneId)
	local curDayTime = GetDayTime()
	if curDayTime >= x002031_g_startTime and curDayTime <= x002031_g_EndTime then
		AddText(sceneId,"#{XFMTL_20090319_05}")
	else
		AddText(sceneId,"#{OBJ_dali_0013}"..PlayerName..PlayerSex.."不想一试身手吗？")		--#r  在下不才，却也有“江湖百晓生”的虚名，对古今天下江湖之事都略知一二，若有什么疑问，你可以尽管来找我。--#r  #r#r  “你问我答”－我来告诉你一些江湖事。  #r#r  “我问你答”－连续答对问题就资助你银两。
	end
	for i, eventId in x002031_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002031_OnDefaultEvent( sceneId, selfId,targetId )
	x002031_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002031_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002031_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002031_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002031_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002031_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002031_g_eventList do
		if missionScriptId == findId then
			x002031_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002031_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002031_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002031_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002031_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002031_OnDie( sceneId, selfId, killerId )
end
