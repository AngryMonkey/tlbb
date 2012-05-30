--���ߣ�����<ID:30505092>
--�ű��� 332002
--�սű����ȴ�������ӹ���

x332002_g_scriptId = 332002

--**********************************
--�¼��������
--**********************************
function x332002_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332002_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332002_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332002_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local PlayerLevel = GetLevel( sceneId, selfId )
    if PlayerLevel < 65 then    --����ʹ�õȼ����65
        return 0
    end
    
    if TryCreatePet(sceneId,selfId,1) <= 0 then
        BeginEvent(sceneId)
			strText = "�Բ������ĳ�����û���㹻�Ŀռ䣬��������ռ�֮����ʹ�á�"
			AddText(sceneId,strText)
 		EndEvent(sceneId)
 		DispatchMissionTips(sceneId,selfId)
 		--DispatchEventList( sceneId, selfId )
		return
	end
		
	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x332002_OnDeplete( sceneId, selfId )
	--local PlayerName 		= LuaFnGetName(sceneId, selfId)
	--local itemBagIndex 	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	--local szTransferItem= GetBagItemTransfer( sceneId, selfId, itemBagIndex )
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		--BroadMsgByChatPipe(sceneId, selfId, "#{_INFOUSR"..PlayerName.."}#ccc33ccʹ����#{_INFOMSG"..szTransferItem.."}", 4)
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
function x332002_OnActivateOnce( sceneId, selfId )
    
    --����Ƿ�����������
    local bCreate = TryCreatePet(sceneId,selfId,1)
    
    --��������������һֻ
    local PetID_LongBaby = 6009
    if bCreate > 0 then
	    LuaFnCreatePetToHuman(sceneId, selfId, PetID_LongBaby, 1, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	end
		

	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x332002_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
