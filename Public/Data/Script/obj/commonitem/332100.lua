--���ߣ��𵤺�«<ID:31000000>
--�ű��� 332100
--Author: Steven.Han 10:39 2007-5-17

x332100_g_scriptId = 332100
x332100_g_MaxValue = 500000
x332100_g_IncPerAct = 2500

--**********************************
--�¼��������
--**********************************
function x332100_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332100_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332100_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332100_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	local PlayerHP = GetHp(sceneId, selfId)
    local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    
    --PrintStr( ""..UseValue.."/"..ValidValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
    
    if PlayerHP == PlayerMaxHP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
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
function x332100_OnDeplete( sceneId, selfId )
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
function x332100_OnActivateOnce( sceneId, selfId )

    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    local ValidValue = x332100_g_MaxValue - UseValue
    
    local PlayerHP = GetHp(sceneId, selfId)
    local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    local NeedHP = PlayerMaxHP - PlayerHP   --��Ҫ�ָ���HP��
    
    if x332100_g_IncPerAct < NeedHP then
        NeedHP = x332100_g_IncPerAct
    end
    
    --PrintStr( ""..ValidValue.."/"..x332100_g_MaxValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
    
    if PlayerHP == PlayerMaxHP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
    else
		local nCB = ValidValue   --ʹ��ǰ����
		local nHPB = PlayerHP    --ʹ��ǰ���hp
		local bErased = -1       --��Ʒ�Ƿ�ɾ��
		
        if NeedHP >= ValidValue then  --���ṩ��HP����ָ���Ҷ���HP
            --IncreaseHp
            IncreaseHp(sceneId, selfId, ValidValue ) --�ָ����ṩ��HP
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332100_g_MaxValue ) --�����������
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, x332100_g_MaxValue ) --������������
            bErased = EraseItem( sceneId, selfId, bagId )
        else
            IncreaseHp(sceneId, selfId, NeedHP ) --�ָ���Ҫ��HP
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332100_g_MaxValue ) --�����������
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + x332100_g_IncPerAct ) --������������
            --SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + NeedHP ) --������������
            
            if( x332100_g_MaxValue == ( UseValue + x332100_g_IncPerAct ) ) then
                bErased = EraseItem( sceneId, selfId, bagId )
            end
            
        end

		local szName = GetName( sceneId, selfId )
		local nGuid = LuaFnGetGUID( sceneId, selfId )
		local nHPA = GetHp(sceneId, selfId)             --ʹ�ú����hp
		        
        if bErased < 0 then
			--local szLog = "Use31000000, Name=%s, Guid=%d, CB=%d, CA=%d, HPB=%d, HPA=%d, BIDX=%d"
			local szLog = "Use31000000, ����=%s, Guid=%d, ʹ��ǰҩ��=%d, ʹ�ú�ҩ��=%d, ʹ��ǰHP=%d, ʹ�ú�HP=%d, ����λ��=%d"
			local UseValue_log = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
			local nCA = x332100_g_MaxValue - UseValue_log   --ʹ�ú�����
			
			local szDebugLog = format( szLog, szName, nGuid, nCB, nCA, nHPB, nHPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        else
			local szLog = "Use31000000, ����=%s, Guid=%d, ʹ��ǰҩ��=%d, �ѱ�ɾ��, ʹ��ǰHP=%d, ʹ�ú�HP=%d, ����λ��=%d"
			local szDebugLog = format( szLog, szName, nGuid, nCB, nHPB, nHPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        end
        
        --LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
        --SetMp( sceneId, selfId, 0 ) --������ҩ�ô���,һ��Ҫɾ�˰�!
        
    end
    
    LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 3101, 0);
	--PrintStr( "x332100_OnActivateOnce" )
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x332100_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x332100_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
