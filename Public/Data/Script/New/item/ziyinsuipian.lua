--890012紫银碎片兑换
x890012_g_ScriptId = 890012

x890012_g_itemId = 39901004

x890012_g_itemIdx = 39901005

--**********************************
--事件列表
--**********************************
function x890012_UpdateEventList( sceneId, selfId,targetId )
	  if GetItemCount(sceneId, selfId, x890012_g_itemId) < 10 then
		BeginEvent(sceneId)
			 AddText( sceneId, "您必须拥有10个紫银碎片我才能帮你兑换！" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	  if LuaFnDelAvailableItem(sceneId, selfId, x890012_g_itemId, 10) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "您必须拥有10个紫银碎片我才能帮你兑换,请检查物品是否上锁！" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
		 
		 TryRecieveItem( sceneId, selfId, x890012_g_itemIdx, 1 )
		 BeginEvent(sceneId)
			 AddText( sceneId, "恭喜您成功兑换了#cff99cc紫银珠！" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
end
--**********************************
--事件交互入口
--**********************************
function x890012_OnDefaultEvent( sceneId, selfId,targetId )
	x890012_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--事件列表选中一项
--**********************************
function x890012_OnEventRequest( sceneId, selfId, targetId, eventId )
end