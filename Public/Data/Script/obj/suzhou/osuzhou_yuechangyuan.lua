-- 苏州NPC
-- 岳常圆
-- 中秋任务

x050001_g_scriptId = 050001

--所拥有的事件ID列表
x050001_g_eventList = { 050017, 808064, 050020 } --050009,

x050001_g_ControlScript = 050009

--**********************************
--事件列表
--**********************************
function x050001_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		if CallScriptFunction( x050001_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			AddText( sceneId, "    中秋之夜，花好月圆，寻常巷陌陈罗绮，" ..
				"几处楼台奏管弦。但此时此刻，正是边关的将士奋力抗击外敌" ..
				"，才有了我们这花花世界。" )
		else
			AddText( sceneId, "    苏学士有一句词写得好，人有悲欢离合，" ..
				"月有阴晴圆缺，此事古难全。现在虽然不是花好月圆之夜，但" ..
				"在我心中，月亮和人一样，永远是团圆的。" )
		end

		local i, eventId
		for i, eventId in x050001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
		--AddNumText(sceneId, x050001_g_scriptId, "中秋活动介绍", 11, 1010);
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x050001_OnDefaultEvent( sceneId, selfId, targetId )
	x050001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050001_OnEventRequest( sceneId, selfId, targetId, eventId )
	local Num = GetNumText();
	if(Num == 1010) then
		BeginEvent(sceneId);
			AddNumText(sceneId, 808064, "#{ZQHD_20070916_010}", 11, 705 )
			AddNumText(sceneId, 050017, "#{ZQHD_20070916_011}", 11, 10);
			AddNumText(sceneId, 050020, "#{ZQHD_20070916_012}", 11, 102);
		EndEvent(sceneId);
		DispatchEventList(sceneId,selfId,targetId)
	end
	local i, findId
	for i, findId in x050001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x050001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x050001_g_eventList do
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
function x050001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	local i, findId
	for i, findId in x050001_g_eventList do
		if missionScriptId == findId then
			x050001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end
