--逍遥NPC
--公治子长
--普通

x014035_g_scriptId = 014035

--**********************************
--事件交互入口
--**********************************
function x014035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"最近我无意中找到了本巧匠的奇书，依书所为，竟然做成了天机傀儡。它们功能非常，似乎还能思考，想去见识见识么？")
		AddNumText(sceneId,x014035_g_scriptId,"去见识天机傀儡",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x014035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<81  then	
			BeginEvent( sceneId )
			local strText = "不要太小看我公冶子长的技艺，等级达不到81级，我是不会让你见天机傀儡的。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 144,51,129)
		end
	end
end
