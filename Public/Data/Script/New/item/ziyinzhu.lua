--890013紫银碎片兑换
x890013_g_ScriptId = 890013
x890013_g_itemId = 39901005
x890013_g_MonsterId = 13169


--**********************************
--事件列表
--**********************************
function x890013_UpdateEventList( sceneId, selfId,targetId )		 
	bCanCreate = LuaFnGetSceneAttr_CanCreateRascalKiller(sceneId);
	if bCanCreate == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"此场景不能使用")
		EndEvent( )
		DispatchMissionTips(sceneId,selfId)
		return 0;
	end

	local level = GetLevel( sceneId, selfId )
	if not level or level < 121 then
		BeginEvent( sceneId )
			AddText( sceneId, "等级不足121级无法使用" )
		EndEvent( )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	  if LuaFnDelAvailableItem(sceneId, selfId, x890013_g_itemId, 1) == 0 then
		BeginEvent(sceneId)
			 AddText( sceneId, "您必须拥有1个紫银珠我才可以为您召唤,请检查物品是否上锁！" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	
		local posX, posZ;
		posX, posZ = LuaFnGetWorldPos(sceneId, selfId);
		nObjID = LuaFnCreateMonster(sceneId, x890013_g_MonsterId, posX, posZ, 1, 0, 0);
		if nObjID and nObjID ~= -1 then
		--	SetCharacterDieTime(sceneId, nObjID, 600000);
			SetCharacterTitle(sceneId, nObjID, "轮回神将");
		--	LuaFnSetMonsterExp(sceneId, nObjID, 0);
		--	LuaFnDisableMonsterDropBox(sceneId, nObjID);
		end
            local  nam= LuaFnGetName( sceneId, selfId )
		  local strText = format ("@*;SrvMsg;SCA:#b#cff00f0恭喜玩家★★#c00ff00"..nam.."#b#cff00f0★★成功使用紫银珠召唤出轮回神将#Y", nam)						
		      BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		
		   return
end
--**********************************
--事件交互入口
--**********************************
function x890013_OnDefaultEvent( sceneId, selfId,targetId )
	x890013_UpdateEventList( sceneId, selfId, targetId )
end
--**********************************
--事件列表选中一项
--**********************************
function x890013_OnEventRequest( sceneId, selfId, targetId, eventId )
end