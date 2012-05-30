--���ߣ��޲�������
--zchw

x300078_g_scriptId = 300078

x300078_g_mianbu_material_id 		= 30501355
x300078_g_mianbu_assistor_id 		= 30501356
x300078_g_jingtie_material_id  	= 30501357
x300078_g_jingtie_assistor_id  	= 30501358
x300078_g_mianbu_rank1_id 			= 20501001
x300078_g_jingtie_rank1_id 			= 20500001

--**********************************
--�¼��������
--**********************************
function x300078_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300078_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300078_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300078_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local itemSn = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	if x300078_g_mianbu_assistor_id == itemSn then 					--�޲�ӡȾ��
		local itemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x300078_g_mianbu_material_id )
		if itemCount < 1 then
			x300078_ShowNotice( sceneId, selfId, "#{MBJT_081125_02}");
			return 0;
		end
		local freeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
		if( freeSpace < 1 ) then
			 x300078_ShowNotice( sceneId, selfId, "#{MYKS_081021_3}");
		   return 0;
		end
	elseif x300078_g_jingtie_assistor_id == itemSn then			--����������
		local itemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x300078_g_jingtie_material_id )
		if itemCount < 1 then
			x300078_ShowNotice( sceneId, selfId, "#{MBJT_081125_04}");
			return 0;
		end
		local freeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
		if( freeSpace < 1 ) then
			 x300078_ShowNotice( sceneId, selfId, "#{MYKS_081021_3}");
		   return 0;
		end	
	else 
		return 0;
	end
		
	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x300078_OnDeplete( sceneId, selfId )
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
function x300078_OnActivateOnce( sceneId, selfId )
	local itemSn = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	if x300078_g_mianbu_assistor_id == itemSn then 					--�޲�ӡȾ��
		if LuaFnDelAvailableItem(sceneId, selfId, x300078_g_mianbu_material_id, 1) ~= 1 then
			return 0;
		end
		if TryRecieveItem( sceneId, selfId, x300078_g_mianbu_rank1_id, QUALITY_MUST_BE_CHANGE) == -1 then
			return 0;
		end
		x300078_ShowNotice( sceneId, selfId, "#{MBJT_081125_05}")
	elseif x300078_g_jingtie_assistor_id == itemSn then			--����������
		if LuaFnDelAvailableItem(sceneId, selfId, x300078_g_jingtie_material_id, 1) ~= 1 then
			return 0;
		end
		if TryRecieveItem( sceneId, selfId, x300078_g_jingtie_rank1_id, QUALITY_MUST_BE_CHANGE) == -1 then
			return 0;
		end
		x300078_ShowNotice( sceneId, selfId, "#{MBJT_081125_06}")
	else 
		return 0;
	end	   
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300078_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x300078_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

