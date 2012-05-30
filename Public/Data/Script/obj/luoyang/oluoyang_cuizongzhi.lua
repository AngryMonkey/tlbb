--洛阳NPC
--崔宗之
--普通

x000055_g_shoptableindex=8

x000055_g_scriptId=000055

--**********************************
--事件交互入口
--**********************************
function x000055_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  人们总我喝醉了之后的样子就像玉树临风，不知是也不是。")
		AddNumText(sceneId,x000055_g_scriptId,"购买肉",7,0)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000055_OnEventRequest( sceneId, selfId, targetId, eventId )
	DispatchShopItem( sceneId, selfId,targetId, x000055_g_shoptableindex )
end
