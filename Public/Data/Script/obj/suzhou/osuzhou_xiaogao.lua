--苏州NPC
--小高

x001070_g_ScriptId	= 001070

--配方店
x001070_g_shoptableindex= 168
--**********************************
--事件交互入口
--**********************************
function x001070_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{PFBQ_20070926_001}" )
		AddNumText( sceneId, x001070_g_ScriptId, "重购配方", 7, 100 )
		AddNumText( sceneId, x001070_g_ScriptId, "关于重购配方", 11, 101 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001070_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	if key == 100 then
		DispatchShopItem( sceneId, selfId, targetId, x001070_g_shoptableindex )
	elseif key == 101 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{CGPF_2007_0109}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end
