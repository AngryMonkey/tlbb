--���ߣ��۱���<ID:30008038>
--�ű��� 332204
--Author: Steven.Han 10:39 2007-5-24

x332204_g_scriptId = 332204

x332204_g_MultiJuBaoPenMaxUseCount = 11

x332204_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#H����#G#{_ITEM30008038}#Hʱ����Ȼ�����Ը�����#{_INFOMSG%s}#H������������Ľ����",
  "#{_INFOUSR%s}#H������Թ#G#{_ITEM30008038}#H̫Сʱ����Ȼ�����淢����һ�������#{_INFOMSG%s}��",
  "#{_INFOUSR%s}#Hƽ�����ڼ��Լ��������#G#{_ITEM30008038}#H��õ���һ��#{_INFOMSG%s}#H�����ڲ�������Ʒ���ʱ��Ϊ�ӵ��ĸ��������ˣ�",
}

--**********************************
--�¼��������
--**********************************
function x332204_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332204_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332204_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332204_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "�����ռ䲻�㡣"
		      x332204_ShowNotice( sceneId, selfId, strNotice)
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
function x332204_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

function x332204_GetPos( DropList, RandomID )
    local ListSize = getn( DropList )
    for i=1, ListSize do
        if RandomID == DropList[i][1] then
            return i
        end
    end
    
    return 0
end

function x332204_OnTest( sceneId, selfId )

    local DropList = {}
    local RandomBase = GetDarkBoxItemDropCount( sceneId, selfId )
    
    --PrintNum( RandomBase )
    
    for ii = 1, RandomBase do
		if( RandomBase > 0 ) then    
			local RandomNum = random( 0, RandomBase - 1 )
			local RandomID, Notice = DarkBoxItemDropRandom( sceneId, selfId, RandomNum )
	        local Pos = x332204_GetPos( DropList, RandomID )
	        local ListSize = getn( DropList )
	       
	        if 0 == Pos then
	            DropList[ ListSize+1 ] = { RandomID, 1 }
	        else
	            DropList[ Pos ] = { RandomID, DropList[ Pos ][2] + 1 }
	        end
	        
		end
        
    end
    
    local ListSize = getn( DropList )
    local sysstr = "=====================#r"
    local TotalItem = 0
    sysstr = sysstr.."�ܹ���Ʒ����"..ListSize..",��������:"
	BroadMsgByChatPipe( sceneId, selfId, sysstr, 4 )
	
	for i=1, ListSize do
	    TotalItem = TotalItem + DropList[ i ][2]
	end
	
	for i=1, ListSize do
	    sysstr = DropList[ i ][1]..","..DropList[ i ][2]
	    local per = DropList[ i ][2] / TotalItem * 100
	    sysstr = sysstr.."     "
	    sysstr = sysstr..(per).."%"
	    BroadMsgByChatPipe( sceneId, selfId, sysstr, 4 )
	end
	
	sysstr = "�ܹ���Ʒ����"..TotalItem
	BroadMsgByChatPipe( sceneId, selfId, sysstr, 4 )
	
	
    
end


--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x332204_OnActivateOnce( sceneId, selfId )
    
    --x332204_OnTest( sceneId, selfId )
    
    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    local ValidValue = x332204_g_MultiJuBaoPenMaxUseCount - UseValue
	
	--����һ�ξ۱���
	if bagId >= 0 then
		local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		if UseValue >= x332204_g_MultiJuBaoPenMaxUseCount then   --��¼��ʹ�ô������ڵ��������ô���,�����ϲ����ܳ���.
		    return 0
		end
		
		local CurValue = UseValue + 1
		
		SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332204_g_MultiJuBaoPenMaxUseCount ) --����������
		SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --�������ô���
		
		--------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���ʧ��
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		if CheckParam1 ~= x332204_g_MultiJuBaoPenMaxUseCount then
		    return 0
		end
		if CheckParam2 ~= CurValue then
		    return 0
		end
		--------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���ʧ��
		
		
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	    
		if CurValue >= x332204_g_MultiJuBaoPenMaxUseCount then  --��ʹ�ô����ﵽ������ʱ,��ɾ������Ʒ
			local EraseRet = EraseItem( sceneId, selfId, bagId )
			if EraseRet < 0 then      --���ɾ��ʧ��,������������Ʒ
			    local strNotice = "��Ҫ�۱���"
				  x332204_ShowNotice( sceneId, selfId, strNotice)
				return 0
			end
			
		end
	else
		local strNotice = "��Ҫ�۱���"
		x332204_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
    
    --����ͳ�ƣ��������ʹ��
    local nRemain = x332204_g_MultiJuBaoPenMaxUseCount-UseValue-1;
    if(0>nRemain) then
    	nRemain = 0
    end
    
	LuaFnAuditJuBaoContainerUsed(sceneId, selfId, 1, nRemain);
		
    --���ľ۱������,���������Ʒ
    local RandomBase = GetJuBaoContainerItemDropCount( sceneId, selfId )
    if( RandomBase > 0 ) then    
         
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = JuBaoContainerItemDropRandom( sceneId, selfId, RandomNum )
       
        if( RandomID > 0 ) then
          BeginAddItem(sceneId)
				  AddItem( sceneId, RandomID, 1 )
			    local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			
			    if Ret > 0 then
			       LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
				
				     if 1 == Notice then
					      local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					      x332204_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				     end
				
				     local ItemName = GetItemName(sceneId, RandomID)
				     local strNotice = "���õ���"..ItemName
				     x332204_ShowNotice( sceneId, selfId, strNotice)
				     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				
			else
				local strNotice = "�����ռ䲻��"
				x332204_ShowNotice( sceneId, selfId, strNotice)
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
function x332204_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x332204_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332204_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x332204_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x332204_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x332204_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
