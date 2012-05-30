--���ߣ����ޱ���<ID:30504001>
--�ű��� 889000
--Author: Steven.Han 10:39 2007-5-17

x889000_g_scriptId = 889000

x889000_g_ZhenShouBaoNangPrize = {
	                 30402026,
	                 30402092,
	                 30402046,
	                 30402094,
	                 30402072,
	                 10141045,
	                 30900016,
	                 30502000,
	                 30502001,
	                 30502002,
}	

x889000_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#c00FFFF�����#G#{_ITEM30504001}#c00FFFF����Ȼ������#{_INFOMSG%s}#c00FFFF��#{_INFOUSR%s}#c00FFFF�ߺ����ҵĳ����������",
  "#{_INFOUSR%s}#c00FFFF�����#G#{_ITEM30504001}#c00FFFF����Ȼ������#{_INFOMSG%s}#c00FFFF��#{_INFOUSR%s}#c00FFFF�ߺ����ҵĳ����������",
  "#{_INFOUSR%s}#c00FFFF�����#G#{_ITEM30504001}#c00FFFF����Ȼ������#{_INFOMSG%s}#c00FFFF��#{_INFOUSR%s}#c00FFFF�ߺ����ҵĳ����������",
}
--**********************************
--�¼��������
--**********************************
function x889000_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889000_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889000_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889000_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

--��Ϊת����������һ��������һ���ո������ޱ�����ཱ��3�������ж�ʣ��ռ�<2	
--��Ϊ���ޱ��ҽ�����Ʒ���ڵ�һ��
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x889000_ShowNotice( sceneId, selfId, strNotice)
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
function x889000_OnDeplete( sceneId, selfId )
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
function x889000_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 0, 0)
	
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 0)
    
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 0 )
        
        local PrizeNum = 0
        if( RandomID == x889000_g_ZhenShouBaoNangPrize[8] ) then
          PrizeNum = 10
        elseif (RandomID == x889000_g_ZhenShouBaoNangPrize[9]) then
          PrizeNum = 5
        elseif (RandomID == x889000_g_ZhenShouBaoNangPrize[10]) then
          PrizeNum = 3
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
					       x889000_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889000_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889000_ShowNotice( sceneId, selfId, strNotice)
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
function x889000_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889000_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889000_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889000_g_strGongGaoInfo[1], PlayerName, strItemInfo, PlayerName )
	elseif nMsgIndex == 2 then
		str = format( x889000_g_strGongGaoInfo[2], PlayerName, strItemInfo, PlayerName )
	else
		str = format( x889000_g_strGongGaoInfo[3], PlayerName, strItemInfo, PlayerName )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
