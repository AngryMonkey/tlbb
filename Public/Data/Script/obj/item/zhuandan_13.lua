--���ߣ����̽���<ID:30504014>
--�ű��� x889012
--Author: ��׳ 2008-9-22

x889012_g_scriptId = 889012

x889012_g_MingJiaoPrize = {
	                 10510017,
	        				 10512017,
	        			   10514017,
	        			   10521017,
	        			   10523017,
	        			   10500018,
	        			   10511018,
	        			   10513018,
	        			   10520018,
	        			   10522018,
	        			   10553018,
	        			   31000002,
	        			   31000001,
	        			   31000000,
	        			   31000003,
	        			   30607001,
	        			   30008007,   		
	        			   30900006,				
}	

x889012_g_strGongGaoInfo = {
	"#c00FFFF�ٻ����ޣ�ˮ�����飬#{_INFOUSR%s}#c00FFFF����#G#{_ITEM30504014}#c00FFFF�У���һ�����ɿڴ�������һ��#{_INFOMSG%s}#c00FFFF��",
 	"#c00FFFF�ٻ����ޣ�ˮ�����飬#{_INFOUSR%s}#c00FFFF����#G#{_ITEM30504014}#c00FFFF�У���һ�����ɿڴ�������һ��#{_INFOMSG%s}#c00FFFF��",
 	"#c00FFFF�ٻ����ޣ�ˮ�����飬#{_INFOUSR%s}#c00FFFF����#G#{_ITEM30504014}#c00FFFF�У���һ�����ɿڴ�������һ��#{_INFOMSG%s}#c00FFFF��",
}
--**********************************
--�¼��������
--**********************************
function x889012_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889012_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889012_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889012_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

--��Ϊת����������һ��������һ���ո������̽�����ཱ��5�������ж�ʣ��ռ�<4	
--��Ϊ���̽��ҽ�����Ʒ���ڵ�һ��
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 4 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x889012_ShowNotice( sceneId, selfId, strNotice)
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
function x889012_OnDeplete( sceneId, selfId )
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
function x889012_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 12, 0)
	
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 12)
    
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 12 )
        
        local PrizeNum = 0
        if( RandomID == x889012_g_MingJiaoPrize[18] ) then
          PrizeNum = 5
        elseif (RandomID == x889012_g_MingJiaoPrize[17]) then
          PrizeNum = 3
        elseif (RandomID == x889012_g_MingJiaoPrize[16]) then
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
					       x889012_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889012_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889012_ShowNotice( sceneId, selfId, strNotice)
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
function x889012_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889012_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889012_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889012_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889012_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889012_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
