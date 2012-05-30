--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��


--�ű�:

--�����ǽű�����:


--4918.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x334918_g_scriptId = 334918 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�
x334918_g_levelRequire = 1
--AE��Χ�뾶
x334918_g_radiusAE = 3.0
--AE��Ŀ���ϵ���
x334918_g_standFlag = 1 -- 2:���ѣ� 1���Ѿ��� -1���о�
--AEӰ����Ŀ����
x334918_g_effectCount = 4 -- -1:������
--Ч����ID
x334918_g_Impact1 = 4918 --��ʱд���
x334918_g_Impact2 = -1 --����

--**********************************
--�¼��������
--**********************************
function x334918_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x334918_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x334918_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x334918_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(0<=targetId) then
		-- Ŀ��������Ѿ��ļ��
		if LuaFnIsFriend(sceneId, targetId, selfId) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
		if LuaFnIsFriend(sceneId, selfId, targetId ) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
    local SelfSex = LuaFnGetSex(sceneId, selfId)
    local TargetSex = LuaFnGetSex(sceneId, targetId)                
    if( SelfSex == TargetSex ) then
      LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
      
      return 0;                                            
    end 
       
		-- Ŀ������ǵо��ļ��
--		if(1~=LuaFnUnitIsEnemy(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- Ŀ������Ƕ��ѵļ��
--		if(1~=LuaFnUnitIsPartner(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- Ŀ�꼶��ļ��
--		if(g_LevelRequire<=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
--		if(g_LevelRequire>=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end

	end
	
	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x334918_OnDeplete( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
--		x334918_MsgBox( sceneId, selfId, "��û���㹻�ı����ռ�" )
--		return 0
	end

	if LuaFnGetPropertyBagSpace( sceneId, targetId ) < 1 then
		x334918_MsgBox( sceneId, selfId, "�Է�û���㹻�ı����ռ�" )
		return 0
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30509011);
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local szNameSelf = GetName( sceneId, selfId );
	local szNameTarget = GetName( sceneId, targetId );
	
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
			
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x334918_OnActivateOnce( sceneId, selfId )
	if(-1~=x334918_g_Impact1) then
		--���Լ���Ч��
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x334918_g_Impact1, 0);
		--��Ŀ���Ч��
		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
		if(0<=targetId) then
			if LuaFnIsFriend(sceneId, targetId, selfId) > 0 then
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x334918_g_Impact1, 0);
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, 66, 0);
				
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
			LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 18, 0);			

					  
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
			  	x334918_MsgBox( sceneId, selfId, "��õ���һ��"..GetItemName( sceneId, untBounty[1] ) )
			  end
				AwardTitle( sceneId, selfId, 8, untBounty[2] )
				LuaFnDispatchAllTitle( sceneId, selfId )		--�������гƺŵ�CLIENT
			  x334918_MsgBox( sceneId, selfId, "��õ���["..untBounty[3].."]�ƺš�" )

			  if GetSex( sceneId, targetId ) == 0 then
			  	untBounty	= lstBounty[0]
			  else
			  	untBounty	= lstBounty[1]
			  end
			  if TryRecieveItem( sceneId, targetId, untBounty[1], 1 ) >= 0 then
			  	x334918_MsgBox( sceneId, targetId, "��õ���һ��"..GetItemName( sceneId, untBounty[1] ) )
			  end
			  AwardTitle( sceneId, targetId, 8, untBounty[2] )
			  LuaFnDispatchAllTitle( sceneId, targetId )	--�������гƺŵ�CLIENT
			  x334918_MsgBox( sceneId, targetId, "��õ���["..untBounty[3].."]�ƺš�" )

			end
		end
		--�Լ���ΧAE
--		local posX,posZ = LuaFnGetUnitPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
		--ָ���ص���ΧAE
--		local posX,posZ = LuaFnGetTargetPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
		--Ŀ�������ΧAE
--		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
--		if(0<=targetId) then
--			local posX,posZ = LuaFnGetUnitPosition(sceneId, targetId)
--			LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
--		end

	end
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x334918_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x334918_MsgBox( sceneId, selfId, Msg )
	if Msg == nil then
		return
	end
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
