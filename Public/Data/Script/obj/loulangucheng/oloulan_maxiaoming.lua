--楼兰NPC
--马骁鸣
--普通

x001158_g_ScriptId	= 001158

--**********************************
--事件交互入口
--**********************************
function x001158_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  在西域，白骆驼是很稀有的。开始只有很少几个贵族才骑，后来一些富贾也花大量的钱财去搜寻。久而久之，人们把白骆驼当成财富的象征...#r我这恰好有一些白骆驼，大侠是否要买？" )
		AddNumText( sceneId, x001158_g_ScriptId, "购买骑乘", 7, 1 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001158_OnEventRequest( sceneId, selfId, targetId )
	local	key	= GetNumText()
	if key == 1 then
		DispatchShopItem( sceneId, selfId, targetId, 185 )
	end
end

--**********************************
--对话框提示
--**********************************
function x001158_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
