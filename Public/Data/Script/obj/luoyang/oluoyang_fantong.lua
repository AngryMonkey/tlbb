--洛阳NPC
--范统
--饭店老板

x000059_g_ShopTabId	= 15

x000059_g_ScriptId	= 000059

--**********************************
--事件交互入口
--**********************************
function x000059_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  来尝尝茗珍楼的洛阳水席吧，包你吃了之后再也不想离开洛阳。")
		AddNumText(sceneId,x000059_g_ScriptId,"购买食物",7,0)
--		AddNumText(sceneId,x000059_g_ScriptId,"精力打工",6,1)
--		AddNumText(sceneId,x000059_g_ScriptId,"活力打工",6,2)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000059_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	local	ene	= GetHumanEnergy( sceneId, selfId )	--精力
	local	vig	= GetHumanVigor( sceneId, selfId )	--活力
	
	if key == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x000059_g_ShopTabId )
		
	elseif key == 1 then
		if ene >= 40 then
			SetHumanEnergy( sceneId, selfId, ene-40 )
			AddMoney( sceneId, selfId, 3000 )
			x000059_MsgBox( sceneId, selfId, "你打工消耗40精力,获得30个银币" );
		else
			x000059_MsgBox( sceneId, selfId, "你的精力不足40点,老板不需要你打工" );
		end
	elseif key == 2 then
		if vig >= 40 then
			SetHumanVigor( sceneId, selfId, vig-40 )
			AddMoney( sceneId, selfId, 3000 )
			x000059_MsgBox( sceneId, selfId, "你打工消耗40活力,获得30个银币" );
		else
			x000059_MsgBox( sceneId, selfId, "你的活力不足40点,老板不需要你打工" );
		end
	end
end

--**********************************
--消息提示
--**********************************
function x000059_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
