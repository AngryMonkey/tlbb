--������һ��ķ����ؼ�
--MisDescBegin
--�ű���
x808058_g_ScriptId = 808058
x808058_g_ExchangeLongzhu_Active = 1
x808058_g_LongpaiId = 30505092
x808058_g_Longpai75Id =	30505907
--x808058_g_LongzhuList = { 30505085, 30505086, 30505087, 30505088, 30505089, 30505090, 30505091 }
x808058_g_LongzhuList = { 30505136, 30505137, 30505138, 30505139, 30505140, 30505141, 30505142 }

--x808058_g_ActiveStartTime = 7128
--x808058_g_ActiveEndTime = 7150

--MisDescEnd


function x808058_CheckPercentOK( numerator, denominator )
    --����Ϊ����,��ĸ. ���� ( 100, 10000 ) ��ʾ����Ϊ 100 / 10000
    local roll = random( denominator )
    
    if roll <= numerator then
        return 1
    end
    
    return 0
end


function x808058_DropLongzhuList( sceneId, LongzhuIndex )
    
    --30505136   0.000200
    --30505137   0.000050
    --30505138   0.000020
    --30505139   0.000011
    --30505140   0.000007
    --30505141   0.000004
    --30505142   0.000002
    x808058_CheckRightTime()
    
    if 1 ~= x808058_g_ExchangeLongzhu_Active then    --û���ʱ��Ͳ�ִ��(�ݴ���,��ȷ���̲�Ӧ���õ�����)
        return -1
    end
    
    if 1 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 200, 1000000 )
        if 1 == CheckOK then
            return 30505136
        end
    end
    
    if 2 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 50, 1000000 )
        if 1 == CheckOK then
            return 30505137
        end
    end
    
    if 3 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 20, 1000000 )
        if 1 == CheckOK then
            return 30505138
        end
    end
    
    if 4 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 11, 1000000 )
        if 1 == CheckOK then
            return 30505139
        end
    end
    
    if 5 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 7, 1000000 )
        if 1 == CheckOK then
            return 30505140
        end
    end
    
    if 6 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 4, 1000000 )
        if 1 == CheckOK then
            return 30505141
        end
    end
    
    if 7 == LongzhuIndex then
        local CheckOK = x808058_CheckPercentOK( 2, 1000000 )
        if 1 == CheckOK then
            return 30505142
        end
    end
    
    return -1
    
end

function x808058_CheckEnoughItem( sceneId, selfId, targetId )
    
    local ListSize = getn( x808058_g_LongzhuList )

    for i=1, ListSize do
		local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x808058_g_LongzhuList[ i ] )
		if ItemCount < 1 then
		    return 0
		end
	end
	
	return 1
	
end

function x808058_DelNeedItem( sceneId, selfId, targetId )
    
    local ListSize = getn( x808058_g_LongzhuList )

    for i=1, ListSize do
		ret = LuaFnDelAvailableItem(sceneId, selfId, x808058_g_LongzhuList[ i ], 1)
		if ret ~= 1 then
			return -1   --����ɾ���������κ�һ����Ʒʧ��,���жϲ���,��Ϊɾ��ʧ��
		end
	end
	
	return 1
	
end

function x808058_AwardItem( sceneId, selfId, targetId, type )

    local bEnough = x808058_CheckEnoughItem( sceneId, selfId, targetId )
    if 0 == bEnough then        --û���㹻��Ʒ
		--"�һ���������Ҫ�ࡢ�ȡ��ơ��̡��ࡢ������ɫ�����һ���������ϵ����鲻ȫ������޷��һ���"
		local strNotEnough = "#{EXCHANGE_LONGPAI_TEX01}"
		BeginEvent(sceneId)
			AddText( sceneId, strNotEnough )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )        
		return
    end


	BeginAddItem(sceneId)
		if type == 1 then
			AddItem( sceneId, x808058_g_LongpaiId, 1 )
		elseif type == 2 then
			AddItem( sceneId, x808058_g_Longpai75Id, 1 )
		end
	local Ret = EndAddItem(sceneId,selfId)
	
	if Ret > 0 then
	    local bDel = x808058_DelNeedItem( sceneId, selfId, targetId )
	    if 1 == bDel then
	        --���������Ʒ
	        AddItemListToHuman(sceneId,selfId)
	        
	        --����ϵͳ����
	        local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
			local PlayerName = GetName( sceneId, selfId )
			local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
			local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
			
			local strNotice = "#{EXCHANGE_LONGPAI_TEX02}"
			
			--"#P����һ��Ŭ���������ռ�ȫ�˾ۼ�����ؾ������߿����顪����ɫ����ɫ����ɫ����ɫ����ɫ����ɫ����ɫ���顣��Ϊ��л������Ĺ����������͸���һ��"
			local SysStr = PlayerInfoName..strNotice..ItemInfo.."#R��"
			BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
		
	    --�رս���
	    BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
	    end

	else
		--local strBagFull = "�Բ���������Ʒ���Ѿ�û�пռ䣬����޷��һ���"
		local strBagFull = "#{EXCHANGE_LONGPAI_TEX03}"
		BeginEvent(sceneId)
			AddText( sceneId, strBagFull )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--��Ҽ�����Ĺ���
--**********************************
function x808058_PlayerPickUpLongZhu( sceneId, selfId, bagidx )

	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagidx)
	local PlayerName = GetName( sceneId, selfId )
			
	local strNotice = format( "#{_INFOUSR%s}#P��Ұ���й�ʱ�����ڲݴ��з�����һ�����Ź�â��Բ�����ӣ�����֮��ŷ��־���#{_INFOMSG%s}��", PlayerName, szItemTransfer )
	BroadMsgByChatPipe( sceneId, selfId, strNotice, 4 )
    
end

--**********************************
--������ں���
--**********************************
function x808058_OnDefaultEvent( sceneId, selfId, targetId )
    
    x808058_CheckRightTime()
    
    if 1 ~= x808058_g_ExchangeLongzhu_Active then    --û���ʱ��Ͳ�ִ��(�ݴ���,��ȷ���̲�Ӧ���õ�����)
        return
    end
    
    local TextNum = GetNumText()

    if 1 == TextNum then
    	--x808058_AwardItem( sceneId, selfId, targetId )
    	
			local strLongpai = "#{EXCHANGE_LONGPAI_TEX07}"
			local strLongpai75 = "#{EXCHANGE_LONGPAI_TEX08}"
			BeginEvent(sceneId)
				AddNumText(sceneId, x808058_g_ScriptId, strLongpai, 6, 3 )
				AddNumText(sceneId, x808058_g_ScriptId, strLongpai75, 6, 4 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
		elseif 2 == TextNum then
			local strNotEnough = "#{EXCHANGE_LONGPAI_TEX06}"
			BeginEvent(sceneId)
				AddText( sceneId, strNotEnough )
			EndEvent()
			DispatchEventList( sceneId, selfId, targetId )      
		elseif 3 == TextNum then
			x808058_AwardItem( sceneId, selfId, targetId, 1 )
		elseif 4 == TextNum then
			x808058_AwardItem( sceneId, selfId, targetId, 2 )
    end
    
end

--**********************************
--����Ƿ���ȷ�Ļʱ��
--**********************************
function x808058_CheckRightTime()

    --local DayTime = GetDayTime()
    
    --if DayTime < x808058_g_ActiveStartTime then
    --   x808058_g_ExchangeLongzhu_Active = 0
    --   return 0    --��ǰ�ǻʱ��
    --end
    
    --if DayTime > x808058_g_ActiveEndTime then
    --   x808058_g_ExchangeLongzhu_Active = 0
    --   return 0    --�˺��Ѿ�����
    --end
    
    x808058_g_ExchangeLongzhu_Active = 1
    return 1
    
end

--**********************************
--�о��¼�
--**********************************
function x808058_OnEnumerate( sceneId, selfId, targetId )
    
    x808058_CheckRightTime()
    
    if 1 ~= x808058_g_ExchangeLongzhu_Active then
        return
    end

    --local strLongpai = "��Ҫ�һ�����"
    --local strDesc = "���ڶһ�����"
    
    local strLongpai = "#{EXCHANGE_LONGPAI_TEX04}"
    local strDesc = "#{EXCHANGE_LONGPAI_TEX05}"
    AddNumText(sceneId, x808058_g_ScriptId, strLongpai, 6, 1 )
    AddNumText(sceneId, x808058_g_ScriptId, strDesc, 0, 2 )
    
end

--**********************************
--����������
--**********************************
function x808058_CheckAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x808058_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x808058_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x808058_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x808058_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x808058_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x808058_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--���������¼�
--**********************************
function x808058_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x808058_OnItemChanged( sceneId, selfId, itemdataId )
end
