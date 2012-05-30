--钱庄NPC
--莫寻
--普通

x181004_g_ScriptId	= 181004



--**********************************
--事件交互入口
--**********************************
function x181004_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "    珍奇材料，各种打造图，客官请随便挑选！" )
		--AddNumText( sceneId, x181004_g_ScriptId, "打造图", 2, 1 )
		--AddNumText( sceneId, x181004_g_ScriptId, "元宝介绍", 11, 2 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件列表选中一项
--**********************************
function x181004_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	
	if key == 1 then
	--新的元宝商店
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 8)
			UICommand_AddInt( sceneId, 1 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 888902)
	elseif key == 2 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{INTRO_YUANBAO}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--展开商店
--**********************************
function x181004_OnOpenShop( sceneId, selfId, targetId, lstShop )

--	BeginEvent( sceneId )
--		for i = 1, getn( lstShop ) do
--			AddNumText( sceneId, x181004_g_ScriptId, lstShop[i].name, 7, lstShop[i].key )
--		end
--		AddNumText( sceneId, x181004_g_ScriptId, "返回上一页", -1, x181004_g_Key["bak"] )
--	EndEvent( sceneId )
--	DispatchEventList( sceneId, selfId, targetId )

end
