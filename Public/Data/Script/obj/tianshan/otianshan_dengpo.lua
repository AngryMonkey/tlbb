--天山NPC
--邓婆
--普通

x017035_g_scriptId = 017035

--**********************************
--事件交互入口
--**********************************
function x017035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我天山一向与那些雪怪井水不犯河水，可是这些家伙越来越暴虐，姥姥用了计谋将它们引到了灵鹫峰上，现在就看你的了。")
		AddNumText(sceneId,x017035_g_scriptId,"去歼灭雪怪",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x017035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<61  then	
			BeginEvent( sceneId )
			local strText = "这些雪怪力大无穷，你等级不到61级，这样带你去，实在是危险。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 147,94,145)
		end
	end
end
