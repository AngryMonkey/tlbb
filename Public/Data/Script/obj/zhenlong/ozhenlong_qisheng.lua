--珍笼NPC - 齐圣

x044000_g_ScriptId = 044000; --脚本号
x044000_g_name	="齐圣";

--所拥有的事件ID列表
x044000_g_eventId_yes = 0;
x044000_g_eventId_no = 1;

--**********************************
--事件交互入口
--**********************************
function x044000_OnDefaultEvent( sceneId, selfId, targetId )
	x044000_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x044000_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "我可以将您传送出去，是否要传送？" );
		AddNumText( sceneId, x044000_g_ScriptId, "确定", 9, x044000_g_eventId_yes);
		AddNumText( sceneId, x044000_g_ScriptId, "取消", 8, x044000_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--事件列表选中一项
--**********************************
function x044000_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId then
		if selectEventId == x044000_g_eventId_yes then
			CallScriptFunction(401001, "PlayerExit", sceneId, selfId);
		else
			BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x044000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x044000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end
