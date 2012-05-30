x870001_g_ScriptId	= 870001

x870001_g_FlashCityChannelButton = 870001001

function x870001_FlashCityChannelButton(sceneId, selfId)
	DispatchUICommand( sceneId, selfId, x870001_g_FlashCityChannelButton )
end

-- 角色登陆的时候界面的操作
function x870001_UISystemOnLogin(sceneId, selfId)
	x870001_FlashCityChannelButton(sceneId, selfId)
end
