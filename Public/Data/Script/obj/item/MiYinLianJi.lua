--���ߣ���������<ID:30501167>
--�ű��� 300074
--Author:zhangzhuang 2008-10-20

x300074_g_scriptId = 300074
x300074_g_KuangShi = 30501168
x300074_g_MiYin  = 20502001

--**********************************
--�¼��������
--**********************************
function x300074_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300074_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300074_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300074_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
		local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x300074_g_KuangShi )
	if ItemCount < 1 then
		local strNotice = "#{MYKS_081021_2}" --������ʯ���
		x300074_ShowNotice( sceneId, selfId, strNotice)
	    return 0
	end
	
	local FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "#{MYKS_081021_3}"
		    x300074_ShowNotice( sceneId, selfId, strNotice)
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
function x300074_OnDeplete( sceneId, selfId )
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
function x300074_OnActivateOnce( sceneId, selfId )

    --����һ��������ʯ
  ret = LuaFnDelAvailableItem(sceneId, selfId, x300074_g_KuangShi, 1)
	if ret ~= 1 then
		return   --����ɾ����ʧ��,���жϲ���,�����������κ���Ʒ
	end
	
  --����ͳ�ƣ������ܼ���ʹ��
	LuaFnAuditMiYinKuangShiUsed(sceneId, selfId)
	Msg2Player(sceneId, selfId, "#������һ��#H1������", MSG2PLAYER_PARA )
	BeginAddItem(sceneId)
			AddItem( sceneId, x300074_g_MiYin, 1 )
	local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			
	if Ret > 0 then
		LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
		x300074_ShowNotice( sceneId, selfId, "#{MYKS_081021_4}")
	end 
	
   
    
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300074_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x300074_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

