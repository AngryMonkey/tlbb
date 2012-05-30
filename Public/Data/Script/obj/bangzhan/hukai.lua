--NPC 胡凯 B帮

x402297_g_ScriptId = 402297; --脚本号
x402297_g_name	="胡凯";

--所拥有的事件ID列表
x402297_g_eventId_yes = 0;
x402297_g_eventId_no = 1;

--**********************************
--事件交互入口
--**********************************
function x402297_OnDefaultEvent( sceneId, selfId, targetId )
	x402297_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x402297_UpdateEventList( sceneId, selfId, targetId )

	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_21}" );
			AddNumText( sceneId, x402297_g_ScriptId, "确定", 9, x402297_g_eventId_yes);
			AddNumText( sceneId, x402297_g_ScriptId, "取消", 8, x402297_g_eventId_no);
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
	
end

--**********************************
--事件列表选中一项
--**********************************
function x402297_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId and CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		if selectEventId == x402297_g_eventId_yes then
			--有战车buff不能传送
			if CallScriptFunction(402047, "HaveTankBuff", sceneId, selfId) == 0 then
				CallScriptFunction(402047, "Exit", sceneId, selfId)
			else
				BeginEvent(sceneId);
					AddText( sceneId, "#{BHXZ_081103_77}" );
				EndEvent(sceneId);
				DispatchEventList(sceneId, selfId, targetId);
			end
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
function x402297_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x402297_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end
