-- 中秋NPC
-- 小贩

x050201_g_scriptId = 050201

x050201_g_shoptableindex = 166	--暂时

--**********************************
--事件交互入口
--**********************************
function x050201_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    这位大侠，来买碗绿豆汤去去暑气吧！小店的冰镇绿豆汤方圆百里都有名啊！" )
		AddNumText( sceneId, x050201_g_scriptId, "购买绿豆汤", 7, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050201_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1 then
		DispatchShopItem( sceneId, selfId, targetId, x050201_g_shoptableindex )
	end
end
