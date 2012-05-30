--���ߣ��������ID:30504017>
--�ű��� x889015
--Author: ��׳ 2008-10-10

x889015_g_scriptId = 889015

x889015_g_LuckBoxPrize = {
	                 20500001,
	                 20500002,
	                 20500003,
	                 20501001,
	                 20501002,
	                 20501003,
	                 20502001,
	                 20502002,
	                 20502003,
	                 10141102,
	                 30309155,
	                 30309168,
	                 30900038,
	                 30900039,
	                 30900040,
	                 30900041,
	                 30502000,
      						 30502001,
      						 30502002,
      						 30503017,
      						 30503018,
      						 30503019,
      						 30607001,
      						 30900006
}	

x889015_g_strGongGaoInfo = {
	"#{_INFOUSR%s}#c00FFFF��������#G#{_ITEM30504017}#c00FFFF����������һ������������ͷ��#{_INFOMSG%s}#c00FFFF������ع��˳�����",
 	"#{_INFOUSR%s}#c00FFFF��������#G#{_ITEM30504017}#c00FFFF����������һ������������ͷ��#{_INFOMSG%s}#c00FFFF������ع��˳�����",
  "#{_INFOUSR%s}#c00FFFF��������#G#{_ITEM30504017}#c00FFFF����������һ������������ͷ��#{_INFOMSG%s}#c00FFFF������ع��˳�����",
}
--**********************************
--�¼��������
--**********************************
function x889015_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889015_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889015_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889015_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--��Ϊת����������һ��������һ���ո��Һ��������ཱ��3�������ж�ʣ��ռ�<2	
--��Ϊ�����������Ʒ�е��ڵ��������е��ڲ�����
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x889015_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "�������ռ䲻�㡣"
		      x889015_ShowNotice( sceneId, selfId, strNotice)
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
function x889015_OnDeplete( sceneId, selfId )
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
function x889015_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 15, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 15)
    if( RandomBase > 0 ) then    
       	
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 15 )
        
        local PrizeNum = 0
        if( RandomID == x889015_g_LuckBoxPrize[17] ) then
          PrizeNum = 10
        elseif (RandomID == x889015_g_LuckBoxPrize[18] ) then
        	PrizeNum = 4
        elseif (RandomID == x889015_g_LuckBoxPrize[20]) then
          PrizeNum = 3
        elseif (RandomID == x889015_g_LuckBoxPrize[24] or RandomID == x889015_g_LuckBoxPrize[22] or
        RandomID == x889015_g_LuckBoxPrize[21] or RandomID == x889015_g_LuckBoxPrize[19]) then
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
					       x889015_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889015_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889015_ShowNotice( sceneId, selfId, strNotice)
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
function x889015_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889015_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889015_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889015_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889015_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889015_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
