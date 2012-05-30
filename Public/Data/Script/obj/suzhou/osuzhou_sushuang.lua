--苏双

--脚本号
x001059_g_scriptId 				= 001059
x001059_g_shoptableindex	=	35
--**********************************
--事件交互入口
--**********************************
function x001059_OnDefaultEvent( sceneId, selfId,targetId )
	AddText( sceneId, "#{QZG_80919_1}" )
	AddNumText( sceneId, x001059_g_scriptId, "商人介绍", 11, 1 )
	AddNumText( sceneId, x001059_g_scriptId, "打开商店", 7, 2 )
end

--**********************************
--事件列表选中一项
--**********************************
function x001059_OnEventRequest( sceneId, selfId, targetId, eventId )
	--特产商店
	if GetNumText() == 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SHANGREN_JIESHAO_02}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		if(LuaFnGetAvailableItemCount(sceneId, selfId, 40002000) == 1 ) then
				DispatchShopItem( sceneId, selfId, targetId, x001059_g_shoptableindex )
		else
			BeginEvent(sceneId)
				AddText( sceneId, "阁下并无商人银票，你我交易从何谈起？" )		
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
end
