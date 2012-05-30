--���ߣ���Һ��ƿ<ID:31000002>
--�ű��� 332102
--Author: Steven.Han 18:26 2007-5-17

x332102_g_scriptId = 332102
--x332102_g_MaxValue = 500000 zchw
x332102_g_IncPerAct = 1000

--**********************************
--�¼��������
--**********************************
function x332102_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332102_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332102_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332102_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	local PlayerMP = GetMp(sceneId, selfId)
    local PlayerMaxMP  = GetMaxMp(sceneId, selfId)
      
    if PlayerMP == PlayerMaxMP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_MANA_IS_FULL )
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
function x332102_OnDeplete( sceneId, selfId )
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
function x332102_OnActivateOnce( sceneId, selfId )

    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    -- zchw
    local x332102_g_MaxValue;
    local UsedItemNum = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);   
       
    if( tonumber(UsedItemNum) == 31000007 ) then  --��ƿ
    		x332102_g_MaxValue =50000;
    else
    		x332102_g_MaxValue =500000;		--��ƿ
    end
    local ValidValue = x332102_g_MaxValue - UseValue
    
    local PlayerMP = GetMp(sceneId, selfId)
    local PlayerMaxMP  = GetMaxMp(sceneId, selfId)
    local NeedMP = PlayerMaxMP - PlayerMP   --��Ҫ�ָ���MP��
    
    if x332102_g_IncPerAct < NeedMP then
        NeedMP = x332102_g_IncPerAct
    end
     
    if PlayerMP == PlayerMaxMP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_MANA_IS_FULL )
    else
		local nCB = ValidValue   --ʹ��ǰ����
		local nMPB = PlayerMP    --ʹ��ǰ���hp
		local bErased = -1       --��Ʒ�Ƿ�ɾ��
		    
        if NeedMP >= ValidValue then  --���ṩ��MP����ָ���Ҷ���MP
            --IncreaseMp
            IncreaseMp(sceneId, selfId, ValidValue ) --�ָ����ṩ��MP
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332102_g_MaxValue ) --�����������
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, x332102_g_MaxValue ) --������������
            bErased = EraseItem( sceneId, selfId, bagId )
        else
            IncreaseMp(sceneId, selfId, NeedMP ) --�ָ���Ҫ��MP,��ʱ,���Ӧ��MPȫ��
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332102_g_MaxValue ) --�����������
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + x332102_g_IncPerAct ) --������������
            
            if( ( UseValue + x332102_g_IncPerAct ) >= x332102_g_MaxValue ) then
                bErased = EraseItem( sceneId, selfId, bagId )
            end
            
        end


        local szName = GetName( sceneId, selfId )
        local nGuid = LuaFnGetGUID( sceneId, selfId )
		local nMPA = GetMp(sceneId, selfId)             --ʹ�ú����hp
		
        if bErased < 0 then
			--local szLog = "Use31000002, Name=%s, Guid=%d, CB=%d, CA=%d, HPB=%d, HPA=%d, BIDX=%d"
			local szLog = "Use31000002, ����=%s, Guid=%d, ʹ��ǰҩ��=%d, ʹ�ú�ҩ��=%d, ʹ��ǰMP=%d, ʹ�ú�MP=%d, ����λ��=%d"
			local UseValue_log = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
			local nCA = x332102_g_MaxValue - UseValue_log   --ʹ�ú�����
			
			local szDebugLog = format( szLog, szName, nGuid, nCB, nCA, nMPB, nMPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )  
        else
			local szLog = "Use31000002, ����=%s, Guid=%d, ʹ��ǰҩ��=%d, �ѱ�ɾ��, ʹ��ǰMP=%d, ʹ�ú�MP=%d, ����λ��=%d"
			local szDebugLog = format( szLog, szName, nGuid, nCB, nMPB, nMPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        end
        
        --LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
        --SetHp( sceneId, selfId, 1 ) --������ҩ�ô���,һ��Ҫɾ�˰�!
        
    end
    
    LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x332102_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x332102_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
