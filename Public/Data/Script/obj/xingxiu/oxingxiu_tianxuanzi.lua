--星宿NPC
--天璇子
--普通

x016035_g_scriptId = 016035

--**********************************
--事件交互入口
--**********************************
function x016035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"前日苍龙出现于天，师父的神木王鼎竟发出嗡嗡之声，引来无数巨大蜘蛛，此正是修炼的好时机，你可愿意去看看？")
		AddNumText(sceneId,x016035_g_scriptId,"打蜘蛛修炼",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x016035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<51  then	
			BeginEvent( sceneId )
			local strText = "进入修炼的江湖中人，大都是51级以上，看你武功平平，我可不敢带你去。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 146,91,144)
		end
	end
end
