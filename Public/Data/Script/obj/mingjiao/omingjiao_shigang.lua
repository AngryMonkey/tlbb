--明教NPC
--石刚
--普通

x011035_g_scriptId = 011035

--**********************************
--事件交互入口
--**********************************
function x011035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"官兵又来围剿光明殿，真是麻烦，不过来的都是些无名小卒，你愿意去练练拳脚吗？")
		AddNumText(sceneId,x011035_g_scriptId,"去抵挡围剿",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x011035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<31  then	
			BeginEvent( sceneId )
			local strText = "虽是无名小卒，也不可小觎，你还不到31级，为了你的安全依我看，还是练练再来吧。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 141,97,157)
		end
	end
end
