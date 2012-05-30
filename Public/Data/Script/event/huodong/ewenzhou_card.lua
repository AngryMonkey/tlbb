--活动——
--温州游戏推广卡片

x808069_g_ScriptId = 808069

function x808069_WenZhouCard(sceneId,selfId,targetId)
	--是否已经领取过温州推广奖励
	if GetMissionFlag( sceneId, selfId, MF_ActiveWenZhouCard ) == 1 then
		x808069_NotifyFailBox( sceneId, selfId, targetId, "    您已经领取过活动奖励，不能重复领取。" )
		return
	end
	
	--是否大于20级
	--if GetLevel( sceneId, selfId ) < 20 then
	--	x808069_NotifyFailBox( sceneId, selfId, targetId, "    请您的等级超过20级后再来领取活动奖励。" )
	--	return
	--end
	
	--检查背包空间
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		x808069_NotifyFailBox( sceneId, selfId, targetId, "    对不起，您没有足够的物品栏空间，请整理后再来领取。" )
		return
	end

	--打开输入卡号界面
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 2007 )		
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x808069_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--列举事件
--**********************************
function x808069_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId, x808069_g_ScriptId, "领取温州推广奖励", 1, 1 )
end

--**********************************
--任务入口函数
--**********************************
function x808069_OnDefaultEvent( sceneId, selfId, targetId )
	local TextNum = GetNumText()

	if TextNum == 1 then
		x808069_WenZhouCard( sceneId, selfId, targetId )
	end
end
