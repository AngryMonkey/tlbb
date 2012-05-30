--ȫ���й�Ҫ��

--���񴲹һ��õ���....RMB��....

x300067_g_scriptId = 300067

x300067_g_NoRMBBuffID = 5901	--��RMB�һ���buff��ID....
x300067_g_RMBBuffID = 5902		--RMB�һ���buff��ID....

x300067_g_SpouseBuffID = 5704

x300067_g_MaxUseCount = 10
x300067_g_SkillBook30_OneTime_id = 30700203; -- zchw

--**********************************
--�¼��������
--**********************************
function x300067_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300067_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300067_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300067_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local BagIndex = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	local BookId = LuaFnGetItemTableIndexByIndex(sceneId, selfId, BagIndex)
	local PlayerLevel = GetLevel( sceneId, selfId )
	if 30700201 == BookId then
		if PlayerLevel < 90 then
			x300067_ShowTips( sceneId, selfId, "��Ҫ��ֻ�ʺ�90�����ϣ�����90�������������" )
			return 0
		end
	elseif 30700202 == BookId then
		if PlayerLevel >= 90 then
			x300067_ShowTips( sceneId, selfId, "��Ҫ��ֻ�ʺ�90�����£�����90�������������" )
			return 0
		end
	elseif x300067_g_SkillBook30_OneTime_id == BookId or 30504039 == BookId then
	else
		return 0
	end

	--��Ҫ���ڱ�����ʹ����Ч....
	if sceneId ~= 194 then
		x300067_ShowTips( sceneId, selfId, "��Ҫ���ڱ�����ʹ����Ч" )
		return 0
	end
	
	--������Ѿ�ʹ�ù������й�Ҫ��....
	local lastDayTime = GetMissionData( sceneId, selfId, MD_HANYUBED_USEBOOK_LASTDAY )
	local CurDayTime = GetDayTime()
	if CurDayTime <= lastDayTime then
		x300067_ShowTips( sceneId, selfId, "�������Ѿ�ʹ�ù�������й�Ҫ��" )
		return 0
	end

	--��ǰ�Ƿ����йһ�buff....
	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x300067_g_NoRMBBuffID ) == 1 then
		x300067_ShowTips( sceneId, selfId, "���Ѿ���������" )
		return 0
	end

	if LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x300067_g_RMBBuffID ) == 1 
	 	or LuaFnHaveImpactOfSpecificDataIndex( sceneId, selfId, x300067_g_SpouseBuffID ) == 1 then
		x300067_ShowTips( sceneId, selfId, "���Ѿ���������" )
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
function x300067_OnDeplete( sceneId, selfId )
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
function x300067_OnActivateOnce( sceneId, selfId )
    
  local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
  -- zchw
  local BookId = LuaFnGetItemTableIndexByIndex(sceneId, selfId, bagId) 
  if BookId == x300067_g_SkillBook30_OneTime_id or 30504039 == BookId then
  else
  
	  local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
	  local ValidValue = x300067_g_MaxUseCount - UseValue
	
		if UseValue >= x300067_g_MaxUseCount then   --��¼��ʹ�ô������ڵ��������ô���,�����ϲ����ܳ���.
		    return 0
		end
	
		local CurValue = UseValue + 1
		SetBagItemParam( sceneId, selfId, bagId, 4, 2, x300067_g_MaxUseCount ) --����������
		SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --�������ô���
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
		    
		if CurValue >= x300067_g_MaxUseCount then  --��ʹ�ô����ﵽ������ʱ,��ɾ������Ʒ
			local ret = EraseItem( sceneId, selfId, bagId )
			if ret < 0 then	 --���ɾ��ʧ��,����������buff
					return 0
			end
		end
		
	end

	--����Һ��񴲹һ�buff....
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300067_g_RMBBuffID, 0)

	CallScriptFunction( 808072, "OnPlayerUseHanYuBook", sceneId, selfId )

	--��¼�����ù�����....
	local CurDayTime = GetDayTime()
	SetMissionData( sceneId, selfId, MD_HANYUBED_USEBOOK_LASTDAY, CurDayTime )

	return 1

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300067_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end


function x300067_ShowTips( sceneId, selfId, msg)
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
