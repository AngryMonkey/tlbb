--���ߣ�����Կ�״�<ID:30008012>
--�ű��� 332201
--Author: Steven.Han 10:39 2007-5-24

x332201_g_scriptId = 332201
x332201_g_DarkBox = 30008010
x332201_g_MultiDarkKeyMaxUseCount = 99

--**********************************
--�¼��������
--**********************************
function x332201_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332201_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332201_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332201_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then
	        local strNotice = "���ĵ�����û�пռ䣬��Ҫ����"
		    x332201_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "���Ĳ�����û�пռ䣬��Ҫ����"
		    x332201_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
		
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x332201_g_DarkBox )
	if ItemCount < 1 then
		local strNotice = "��Ҫ".."#{_ITEM"..(x332201_g_DarkBox).."}" --������
		x332201_ShowNotice( sceneId, selfId, strNotice)
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
function x332201_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

function x332201_GetPos( DropList, RandomID )
    local ListSize = getn( DropList )
    for i=1, ListSize do
        if RandomID == DropList[i][1] then
            return i
        end
    end
    
    return 0
end

function x332201_OnTest( sceneId, selfId )

    local DropList = {}
    local RandomBase = GetDarkBoxItemDropCount( sceneId, selfId )
    
    --PrintNum( RandomBase )
    
    for ii = 1, RandomBase do
		if( RandomBase > 0 ) then    
			local RandomNum = random( 0, RandomBase - 1 )
			local RandomID, Notice = DarkBoxItemDropRandom( sceneId, selfId, RandomNum )
	        local Pos = x332201_GetPos( DropList, RandomID )
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
function x332201_OnActivateOnce( sceneId, selfId )
    
    --x332201_OnTest( sceneId, selfId )
    
    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    local ValidValue = x332201_g_MultiDarkKeyMaxUseCount - UseValue
    
    --����һ������
    ret = LuaFnDelAvailableItem(sceneId, selfId, x332201_g_DarkBox, 1)
	if ret ~= 1 then
		return   --����ɾ����ʧ��,���жϲ���,�����������κ���Ʒ
	end
	
	--����һ�ΰ���Կ�״�
	if bagId >= 0 then
		local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		if UseValue >= x332201_g_MultiDarkKeyMaxUseCount then   --��¼��ʹ�ô������ڵ��������ô���,�����ϲ����ܳ���.
		    return 0
		end
		
		local CurValue = UseValue + 1
		
		SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332201_g_MultiDarkKeyMaxUseCount ) --����������
		SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --�������ô���
		
		--------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���ʧ��
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		if CheckParam1 ~= x332201_g_MultiDarkKeyMaxUseCount then
		    return 0
		end
		if CheckParam2 ~= CurValue then
		    return 0
		end
		--------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���ʧ��
		
		
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	    
		if CurValue >= x332201_g_MultiDarkKeyMaxUseCount then  --��ʹ�ô����ﵽ������ʱ,��ɾ������Ʒ
			local EraseRet = EraseItem( sceneId, selfId, bagId )
			if EraseRet < 0 then      --���ɾ��ʧ��,������������Ʒ
			    local strNotice = "��Ҫ����Կ��"
				x332201_ShowNotice( sceneId, selfId, strNotice)
				return 0
			end
			
		end
	else
		local strNotice = "��Ҫ����Կ��"
		x332201_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
    
    --����ͳ�ƣ��������ʹ��
    local nRemain = x332201_g_MultiDarkKeyMaxUseCount-UseValue-1;
    if(0>nRemain) then
    	nRemain = 0
    end
    
	LuaFnAuditDarkKeyUsed(sceneId, selfId, 1, nRemain);
		
    --�������Ӻ�Կ�״����,���������Ʒ
    local RandomBase = GetDarkBoxItemDropCount( sceneId, selfId )
    if( RandomBase > 0 ) then    
         
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = DarkBoxItemDropRandom( sceneId, selfId, RandomNum )
       
        if( RandomID > 0 ) then

			BeginAddItem(sceneId)
				AddItem( sceneId, RandomID, 1 )
			local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
				
				if 1 == Notice then
					local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
					x332201_ShowRandomSystemNotice( sceneId, selfId, ItemInfo )
				end
				
				local strNotice = "�ɹ��򿪱��䣬��ϲ�������".."#B#{_ITEM"..(RandomID).."}" --������
				x332201_ShowNotice( sceneId, selfId, strNotice)
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				
			else
				local strNotice = "�����ռ䲻��"
				x332201_ShowNotice( sceneId, selfId, strNotice)
			end
			
			local SubItem = 30008026  --������Ʒ��100%���ʻ��
			BeginAddItem(sceneId)
				AddItem( sceneId, SubItem, 1 )
			Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			else
				local strNotice = "�����ռ䲻��"
				x332201_ShowNotice( sceneId, selfId, strNotice)
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
function x332201_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x332201_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332201_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local strNotice =
	{
	"#W%s#H���ſտ���Ҳ��#Y%s#H��ŭ����ͷ��ӵ����俳�飬���ⷢ�ֱ���в��в��ŵ�#W%s��",
	"#W%s#H˫�ֲ����Ľ�#Y%s#H�����򿪣�ֻ��һ�����������#W%s#H�;�����������ס�",
	"#W%s#H��ԡ���£�ի����ʳ�����о�ǧ��󣬴���#Y%s#H���������Ȼ��һ��#W%s��"
	}
	
	local strDarkBox = "#{_ITEM30008010}" --������
	
	local PlayerName = GetName( sceneId, selfId )
	local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
	
	local RandomNotice = random( 1, 3 )
	local SysStr = format( strNotice[ RandomNotice ], PlayerInfoName, strDarkBox, strItemInfo )
	
	BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
	
end
