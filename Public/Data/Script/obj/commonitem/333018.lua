-- ������[ QUFEI 2007-11-07 09:53 UPDATE BugID 24671 ]

-- ����ҵ���_������ĵ� ���ĳ���ȷ���֣�
-- ItemID = 31000004
-- �ű���	333018
-- ���ٷֱ������������ֵ
-- ��Ʒ����ʹ��20��
-- �Ժ�ÿ��ʹ�ÿ�һ�Σ������ɾ����Ʒ

x333018_g_scriptId = 333018
x333018_g_MinValue = 1000			-- HP��С����ֵ
x333018_g_MaxHPValue = 0			-- HP��������ֵ
x333018_g_MaxUseCount = 20		-- ���ʹ�ô���20��
x333018_g_HPValuePer = 0.1		-- HP�ָ��ٷֱ�

--**********************************
--�¼��������
--**********************************
function x333018_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x333018_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x333018_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x333018_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	local PlayerHP = GetHp(sceneId, selfId)
  local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    
  --PrintStr( ""..UseValue.."/"..ValidValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
  
  if PlayerHP >= PlayerMaxHP then
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
function x333018_OnDeplete( sceneId, selfId )
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
function x333018_OnActivateOnce( sceneId, selfId )

   local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
   local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
   local ValidValue = x333018_g_MaxUseCount - UseValue      
   local PlayerHP = GetHp(sceneId, selfId)
   local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
   local NeedHP = floor(PlayerMaxHP * x333018_g_HPValuePer)   --��Ҫ�ָ���HP��
   local IsDelete = 0		-- ��Ʒ�Ƿ�ɾ��
   
   if NeedHP < x333018_g_MinValue then
       NeedHP = x333018_g_MinValue
   end
   
   --PrintStr( ""..ValidValue.."/"..x333018_g_MaxUseCount.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
   
   if PlayerHP >= PlayerMaxHP then
       LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
       return 0
   end
   
   --����һ��������ĵ�
	if bagId >= 0 then		
		
		if UseValue >= x333018_g_MaxUseCount then   --��¼��ʹ�ô������ڵ��������ô���,�����ϲ����ܳ���.
	    return 0
		end

		local CurValue = UseValue + 1
		
    IncreaseHp(sceneId, selfId, NeedHP ) --�ָ���Ҫ��HP
    SetBagItemParam( sceneId, selfId, bagId, 4, 2, x333018_g_MaxUseCount ) --�����������
    SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --������������
     
    --------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���ʧ��
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    
    if CheckParam1 ~= x333018_g_MaxUseCount then
	    return 0
		end
		if CheckParam2 ~= CurValue then
	    return 0
		end
     --------------�������ð�ȫ�Լ��,��Ȼ�����ϲ������ò���ʧ��      
     
    LuaFnRefreshItemInfo( sceneId, selfId, bagId )	--ˢ�±�����Ϣ
     
    if CurValue >= x333018_g_MaxUseCount then		--��ʹ�ô����ﵽ������ʱ,��ɾ������Ʒ
        local bErased = EraseItem( sceneId, selfId, bagId )
        IsDelete = 1
         
      if bErased < 0 then      --���ɾ��ʧ��,����������κ�Ч��
		 		local strMsg = "��Ҫ������ĵ�"
				x333018_ShowNotice( sceneId, selfId, strMsg)
				return 0
			end
		
   	end
   	
   	local szName = GetName( sceneId, selfId )
		local nGuid = LuaFnGetGUID( sceneId, selfId )
		
   	local szLog = "Use31000004, ����=%s, Guid=%0X, ʹ��ǰҩ��=%d, ʣ��ҩ��=%d, ʹ��ǰHP=%d, ʹ�ú�HP=%d, ����λ��=%d, �Ƿ��ѱ�ɾ��=%d"
		local UseValue_log = x333018_g_MaxUseCount - CurValue	-- ʣ��ҩ��
		local PlayerNowHP = GetHp(sceneId, selfId)	-- ��Ѫ����ҵ�HP
		
		local szDebugLog = format( szLog, szName, nGuid, ValidValue, UseValue_log, PlayerHP, PlayerNowHP, bagId, IsDelete )
		WriteDebugLog( sceneId, selfId, szDebugLog )  
   	
  else
		local strMsg = "��Ҫ������ĵ�"
		x333018_ShowNotice( sceneId, selfId, strMsg)
		return 0
	end

	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x333018_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x333018_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
