--�����Ӗ�
--����С����ʱ��д
x000176_g_scriptId = 000176

x000176_g_Jinzhizhongchui = {
	                 50313006,
50313001,
50313002,
50313003,
50313004,
50313005,
50314001,
50413006,
50413001,
50413002,
50413003,
50413004,
50413005,
50414001,
50513006,
50513001,
50513002,
50513003,
50513004,
50513005,
50514001,
50613006,
50613001,
50613002,
50613003,
50613004,
50613005,
50614001,
30008018,
30900014,
10141044,
30309152,
30309165,
}	

x000176_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#c00FFFF���������еĽ����Ӗ���ͻȻ���һ����ԭ���Ӗ�������һ��#{_INFOMSG%s}#c00FFFF��",
  "#{_INFOUSR%s}#c00FFFF���������еĽ����Ӗ���ͻȻ���һ����ԭ���Ӗ�������һ��#{_INFOMSG%s}#c00FFFF��",
  "#{_INFOUSR%s}#c00FFFF���������еĽ����Ӗ���ͻȻ���һ����ԭ���Ӗ�������һ��#{_INFOMSG%s}#c00FFFF��",
}
--**********************************
--�¼��������
--**********************************
function x000176_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x000176_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x000176_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x000176_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 3 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x000176_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end


	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 3 ) then 
	        local strNotice = "���Ĳ�����û�пռ䣬��Ҫ����"
		      x000176_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
			
	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x000176_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x000176_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 5, 0)
	
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 5 )
    
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 5 )
        
        local PrizeNum = 0
        if( RandomID == x000176_g_Jinzhizhongchui[29] ) then
          PrizeNum = 2
        else
          PrizeNum = 1
        end
        
        if( RandomID > 0 ) then
           BeginAddItem(sceneId)
				   AddItem( sceneId, RandomID, PrizeNum )
			     local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			     if Ret > 0 then
			       	LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)

			       	if 1 == Notice then
			       	   local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					       x000176_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
                         

				      x000176_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x000176_ShowNotice( sceneId, selfId, strNotice)
			     end
			
        end
        
    end
    
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x000176_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x000176_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x000176_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x000176_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x000176_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x000176_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
