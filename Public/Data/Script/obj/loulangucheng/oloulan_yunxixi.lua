--楼兰NPC....
--虫鸟坊坊主....

x001111_g_scriptId = 001111
x001111_g_shoptableindex = 27

--**********************************
--事件交互入口
--**********************************
function x001111_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLGC_20080324_01}" )
		AddNumText( sceneId, x001111_g_scriptId, "看看你卖的东西", 7, 0 )
		
		AddNumText(sceneId,x001111_g_scriptId,"查询珍兽成长率",6,1)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001111_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x001111_g_shoptableindex )
	elseif GetNumText() == 1 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 6 )				--珍兽查询分支
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 3 )	--调用珍兽界面
	end
end
