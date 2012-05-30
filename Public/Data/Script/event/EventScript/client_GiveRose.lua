-- 宝石合成

-- 脚本号
x006673_g_scriptId = 006673

-- 脚本名称
x006673_g_scriptName = "合成宝石"
x006673_g_Impact1 = 4918 --临时写这个

--**********************************************************************
-- 任务入口函数
--**********************************************************************
function x006673_OnDefaultEvent( sceneId, selfId, targetId )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 23)

end

--**********************************************************************
-- 列举事件
--**********************************************************************
function x006673_OnEnumerate( sceneId, selfId, targetId )


end

function x006673_GiveRose( sceneId, selfId, targetId )

local nObjID = LuaFnGuid2ObjId( sceneId, targetId )
local szName = GetName( sceneId, nObjID );

	
	local nSexSelf = LuaFnGetSex(sceneId, selfId)
    local nSexTarget = LuaFnGetSex(sceneId, nObjID)                
    if( nSexSelf == nSexTarget ) then
      LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)      
      return 0;                                            
    end 
    
    if LuaFnIsFriend(sceneId, nObjID, selfId) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
	end
    
	local nYaoDingCount = GetItemCount(sceneId, selfId, 30509011);
	if nYaoDingCount <= 0 then
		x006673_NotifyTip(sceneId, selfId, "您没有玫瑰，请到元宝商店购买。");
		return 0;
	end
	
	local msg = format("您是否要送#G999朵玫瑰#Y给#G%s#Y?", szName);
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x006673_g_scriptId);		
		UICommand_AddInt(sceneId, nObjID);
		UICommand_AddString(sceneId,"DoUseItemReal");
		UICommand_AddString(sceneId, msg);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

end



function x006673_DoUseItemReal( sceneId, selfId, param1, param2 )

	local szNameTarget = GetName( sceneId, param1 );
	local szNameSelf = GetName( sceneId, selfId );

	local targetId = param1;
	if LuaFnGetPropertyBagSpace( sceneId, param1 ) < 1 then
		x006673_NotifyTip( sceneId, selfId, "对方背包已满，无法接受送花!" )
		return 0
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30509011);
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);
	local bRet = DelItem(sceneId, selfId, 30509011, 1);
	if bRet <= 0 then
		x006673_NotifyTip( sceneId, selfId, "删除道具失败，请检查是否锁定！" )
		return 0;
	end
	
	if LuaFnIsFriend(sceneId, targetId, selfId) > 0 then
	
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, 66, 0);
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x006673_g_Impact1, 0);
				
			local nFriendPoint = LuaFnGetFriendPoint( sceneId, selfId, targetId );
			if nFriendPoint >= 9999 then
			
				BeginEvent(sceneId)
					AddText(sceneId, "你与对方的好友度已经到达上限。");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)		
				
			else
			
				BeginEvent(sceneId)
				AddText(sceneId, "你与对方的友好度增加了5000");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
			end
			
			
			local	namSelf		= GetName( sceneId, selfId )
			local	namTarget	= GetName( sceneId, targetId )
			
			--给对方用光效
			--LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 18, 0);

			
			local randMessage = random(3);
			local message;

			if randMessage == 1 then
	   			message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_00}#{_INFOMSG%s}#{GiveRose_01}#{_INFOUSR%s}#{GiveRose_02}", szNameSelf, szTransfer, szNameTarget );
			elseif randMessage == 2 then		
				message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_04}#{_INFOUSR%s}#{GiveRose_05}", szNameSelf, szTransfer, szNameTarget );
			else		
				message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_06}#{_INFOUSR%s}#{GiveRose_07}", szNameSelf, szTransfer, szNameTarget );
			end
			
			AddGlobalCountNews( sceneId, message )
			
			
			--奖励
			local	lstBounty	=
			{
				[0]	= { 10124021,	228, "玫瑰仙子" },		--女装
				[1]	= { 10124020,	227, "情圣" },				--男装
			}
			
			local	untBounty
			
			if GetSex( sceneId, selfId ) == 0 then
				untBounty	= lstBounty[0]
			else
				untBounty	= lstBounty[1]
			end
			
			if TryRecieveItem( sceneId, selfId, untBounty[1], 1 ) >= 0 then
				x006673_NotifyTip( sceneId, selfId, "你得到了一件"..GetItemName( sceneId, untBounty[1] ) )
			end
			 
			AwardTitle( sceneId, selfId, 8, untBounty[2] )
			LuaFnDispatchAllTitle( sceneId, selfId )		--更新所有称号到CLIENT
			 x006673_NotifyTip( sceneId, selfId, "你得到了["..untBounty[3].."]称号。" )

			 if GetSex( sceneId, targetId ) == 0 then
			 	untBounty	= lstBounty[0]
			 else
			 	untBounty	= lstBounty[1]
			 end
			 if TryRecieveItem( sceneId, targetId, untBounty[1], 1 ) >= 0 then
			 	x006673_NotifyTip( sceneId, targetId, "你得到了一件"..GetItemName( sceneId, untBounty[1] ) )
			 end
			 AwardTitle( sceneId, targetId, 8, untBounty[2] )
			 LuaFnDispatchAllTitle( sceneId, targetId )	--更新所有称号到CLIENT
			 x006673_NotifyTip( sceneId, targetId, "你得到了["..untBounty[3].."]称号。" )
	end
	

end


--**********************************
--醒目提示
--**********************************
function x006673_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
