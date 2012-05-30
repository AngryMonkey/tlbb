--圣火传递NPC - 传送

x050109_g_ScriptId = 050109; --脚本号
x050109_g_name	="苏飞";

--所拥有的事件ID列表
x050109_g_eventId_yes = 0;
x050109_g_eventId_no = 1;

--**********************************
--事件交互入口
--**********************************
function x050109_OnDefaultEvent( sceneId, selfId, targetId )
	x050109_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x050109_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "我可以将您传送出去，是否要传送？" );
		AddNumText( sceneId, x050109_g_ScriptId, "确定", 9, x050109_g_eventId_yes);
		AddNumText( sceneId, x050109_g_ScriptId, "取消", 8, x050109_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--事件列表选中一项
--**********************************
function x050109_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId then
		if selectEventId == x050109_g_eventId_yes then
			NewWorld( sceneId, selfId, 30, 166, 264) ;
		else
			return 0;
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x050109_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x050109_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end
