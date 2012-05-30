--楼兰寻宝 传送NPC  
-- created by 左春伟

x044700_g_ScriptId = 044700; --脚本号
x044700_g_name	="金久妙";

--所拥有的事件ID列表
x044700_g_eventId_yes = 1;
x044700_g_eventId_no = 0;

--**********************************
--事件交互入口
--**********************************
function x044700_OnDefaultEvent( sceneId, selfId, targetId )
	x044700_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--事件列表
--**********************************
function x044700_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "#{LLXB_8815_07}" );
		AddText( sceneId, "真的要出去吗？");
		AddNumText( sceneId, x044700_g_ScriptId, "确定", 9, x044700_g_eventId_yes);
		AddNumText( sceneId, x044700_g_ScriptId, "取消", 8, x044700_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--事件列表选中一项
--**********************************
function x044700_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == x044700_g_eventId_yes then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 186, 162, 77); -- 楼兰金久灵处
	elseif GetNumText() == x044700_g_eventId_no then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	end
end

