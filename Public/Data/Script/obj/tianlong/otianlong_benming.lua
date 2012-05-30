--天龙寺NPC
--本名
--普通

x013035_g_scriptId = 013035

--**********************************
--事件交互入口
--**********************************
function x013035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"老僧最近参破了寒玉塔上的玄机，了因了果，无名无相，你想挑战传说中的魔道傀儡帝吗？")
		AddNumText(sceneId,x013035_g_scriptId,"去大战傀儡",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x013035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<91  then	
			BeginEvent( sceneId )
			local strText = "这个施主等级不到91级，进到幻境恐怕危险之极啊。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 143,95,134)
		end
	end
end
