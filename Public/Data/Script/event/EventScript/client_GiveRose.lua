-- ��ʯ�ϳ�

-- �ű���
x006673_g_scriptId = 006673

-- �ű�����
x006673_g_scriptName = "�ϳɱ�ʯ"
x006673_g_Impact1 = 4918 --��ʱд���

--**********************************************************************
-- ������ں���
--**********************************************************************
function x006673_OnDefaultEvent( sceneId, selfId, targetId )

	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 23)

end

--**********************************************************************
-- �о��¼�
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
		x006673_NotifyTip(sceneId, selfId, "��û��õ�壬�뵽Ԫ���̵깺��");
		return 0;
	end
	
	local msg = format("���Ƿ�Ҫ��#G999��õ��#Y��#G%s#Y?", szName);
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
		x006673_NotifyTip( sceneId, selfId, "�Է������������޷������ͻ�!" )
		return 0
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30509011);
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);
	local bRet = DelItem(sceneId, selfId, 30509011, 1);
	if bRet <= 0 then
		x006673_NotifyTip( sceneId, selfId, "ɾ������ʧ�ܣ������Ƿ�������" )
		return 0;
	end
	
	if LuaFnIsFriend(sceneId, targetId, selfId) > 0 then
	
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, 66, 0);
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x006673_g_Impact1, 0);
				
			local nFriendPoint = LuaFnGetFriendPoint( sceneId, selfId, targetId );
			if nFriendPoint >= 9999 then
			
				BeginEvent(sceneId)
					AddText(sceneId, "����Է��ĺ��Ѷ��Ѿ��������ޡ�");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)		
				
			else
			
				BeginEvent(sceneId)
				AddText(sceneId, "����Է����Ѻö�������5000");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				
			end
			
			
			local	namSelf		= GetName( sceneId, selfId )
			local	namTarget	= GetName( sceneId, targetId )
			
			--���Է��ù�Ч
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
			
			
			--����
			local	lstBounty	=
			{
				[0]	= { 10124021,	228, "õ������" },		--Ůװ
				[1]	= { 10124020,	227, "��ʥ" },				--��װ
			}
			
			local	untBounty
			
			if GetSex( sceneId, selfId ) == 0 then
				untBounty	= lstBounty[0]
			else
				untBounty	= lstBounty[1]
			end
			
			if TryRecieveItem( sceneId, selfId, untBounty[1], 1 ) >= 0 then
				x006673_NotifyTip( sceneId, selfId, "��õ���һ��"..GetItemName( sceneId, untBounty[1] ) )
			end
			 
			AwardTitle( sceneId, selfId, 8, untBounty[2] )
			LuaFnDispatchAllTitle( sceneId, selfId )		--�������гƺŵ�CLIENT
			 x006673_NotifyTip( sceneId, selfId, "��õ���["..untBounty[3].."]�ƺš�" )

			 if GetSex( sceneId, targetId ) == 0 then
			 	untBounty	= lstBounty[0]
			 else
			 	untBounty	= lstBounty[1]
			 end
			 if TryRecieveItem( sceneId, targetId, untBounty[1], 1 ) >= 0 then
			 	x006673_NotifyTip( sceneId, targetId, "��õ���һ��"..GetItemName( sceneId, untBounty[1] ) )
			 end
			 AwardTitle( sceneId, targetId, 8, untBounty[2] )
			 LuaFnDispatchAllTitle( sceneId, targetId )	--�������гƺŵ�CLIENT
			 x006673_NotifyTip( sceneId, targetId, "��õ���["..untBounty[3].."]�ƺš�" )
	end
	

end


--**********************************
--��Ŀ��ʾ
--**********************************
function x006673_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
