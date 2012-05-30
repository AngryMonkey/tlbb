--少林NPC
--玄证
--普通

x009035_g_scriptId = 009035

--**********************************
--事件交互入口
--**********************************
function x009035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"不知道是什么原因，木人巷中的木人一时无法控制，现在跑的寺中都是，看施主慈眉善目，给你个锻炼的机会，你可愿往？")
		AddNumText(sceneId,x009035_g_scriptId,"打木人锻炼",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x009035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<41  then	
			BeginEvent( sceneId )
			local strText = "本寺的木人虽然好打，但施主等级不到41，恐怕力所不逮，依老僧看还是过段再来吧。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 139,95,141)
		end
	end
end
