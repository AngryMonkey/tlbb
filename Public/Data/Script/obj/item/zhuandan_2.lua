--���ߣ����ޱ���<ID:30504001>
--�ű��� 889001
--Author: Steven.Han 10:39 2007-5-17

x889001_g_scriptId = 889001

x889001_g_DuanWuBaoHePrize = {
	                 50101001,
	                 50101002,
	                 50102001,
	                 50102002,
	                 50102003,
	                 50102004,
	                 50103001,
	                 50104002,
	                 50301001,
	                 50301002,
	                 50302001,
	                 50302002,
	                 50302003,
	                 50302004,
	                 50303001,
	                 50304002,
	                 50601001,
	                 50601002,
	                 50602001,
	                 50602002,
	                 50602003,
	                 50602004,
	                 50603001,
	                 50604002,
}	

x889001_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#c00FFFFС��������#G#{_ITEM30504002}#c00FFFF���ݵ�����һ��#{_INFOMSG%s}#c00FFFF����ҫ�ޱȵı�ʯ͸�Ź�������¶�����ֵ�Ƿ�!",
  "#{_INFOUSR%s}#c00FFFFС��������#G#{_ITEM30504002}#c00FFFF���ݵ�����һ��#{_INFOMSG%s}#c00FFFF����ҫ�ޱȵı�ʯ͸�Ź�������¶�����ֵ�Ƿ�!",
  "#{_INFOUSR%s}#c00FFFFС��������#G#{_ITEM30504002}#c00FFFF���ݵ�����һ��#{_INFOMSG%s}#c00FFFF����ҫ�ޱȵı�ʯ͸�Ź�������¶�����ֵ�Ƿ�!",
}
--**********************************
--�¼��������
--**********************************
function x889001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889001_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889001_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889001_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end


--��Ϊ���䱦�н�����Ʒ���ڵ�2��
	local FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 5 ) then 
	        local strNotice = "���Ĳ�����û�пռ䣬��Ҫ����"
		      x889001_ShowNotice( sceneId, selfId, strNotice)
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
function x889001_OnDeplete( sceneId, selfId )
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
function x889001_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 1, 0)
	
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 1 )
    
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 1 )
        
        local PrizeNum = 0
        if( RandomID == x889001_g_DuanWuBaoHePrize[1] or RandomID == x889001_g_DuanWuBaoHePrize[2]
            or RandomID == x889001_g_DuanWuBaoHePrize[3] or RandomID == x889001_g_DuanWuBaoHePrize[4]
            or RandomID == x889001_g_DuanWuBaoHePrize[5] or RandomID == x889001_g_DuanWuBaoHePrize[6]
            or RandomID == x889001_g_DuanWuBaoHePrize[7] or RandomID == x889001_g_DuanWuBaoHePrize[8]
            ) then
          PrizeNum = 5
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
					       x889001_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889001_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889001_ShowNotice( sceneId, selfId, strNotice)
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
function x889001_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889001_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889001_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889001_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x889001_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889001_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
