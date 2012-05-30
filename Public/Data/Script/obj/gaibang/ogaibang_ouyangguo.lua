--丐帮NPC
--欧阳果
--普通

x010035_g_scriptId = 010035

--**********************************
--事件交互入口
--**********************************
function x010035_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"那些恶猴一贯进入我们酒窖偷酒，甚是可恶，我们教训过他们几次，竟不知进退的来攻丐帮总舵，要去给他们些颜色吗？")
		AddNumText(sceneId,x010035_g_scriptId,"去抵挡恶猴",10,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x010035_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		if	GetLevel( sceneId, selfId)<11  then	
			BeginEvent( sceneId )
			local strText = "可不要小看这些恶猴，我看你还是等级超过11级再来找我吧。"
			AddText( sceneId, strText )
			EndEvent( sceneId )
			DispatchEventList(sceneId,selfId,targetId)
		else
			CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 140,91,151)
		end
	end
end
