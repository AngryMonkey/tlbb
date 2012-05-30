--琼州NPC
--刘季
--6级打造图纸商

x035006_g_scriptId = 035006
x035006_g_shoptableindex = 108

--**********************************
--事件交互入口
--**********************************
function x035006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    呃……快挑了你想要的东西走吧，别让其它人知道我在这里。" )
		AddNumText( sceneId, x035006_g_scriptId, "看看你卖的东西", 7, 0 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x035006_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x035006_g_shoptableindex )
	end
end
