--峨嵋NPC
--柳三妹
--普通

x015035_g_scriptId = 015035

--**********************************
--事件交互入口
--**********************************
function x015035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"峨嵋山自古都以猿猱为名，最近这些恶猿闹得越来越不成话，竟然来本派胡闹，你愿意试试去击退它们吗？")
		AddNumText(sceneId,x015035_g_scriptId,"去击退猿猱",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x015035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<21  then	
			BeginEvent( sceneId )
			local strText = "可不要小看这些恶猿，我看你还是等级超过21级再来找我吧。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 145,89,142)
		end
	end
end
