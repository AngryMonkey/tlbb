--ת��ͨ�ýű�
--�ű��� x889040
--Author: zchw 2009-3-17

x889040_g_scriptId = 889040

--**********************************
--�¼��������
--**********************************
function x889040_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889040_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889040_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889040_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0;
	end

	local ItemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	local ZD_ID = LuaFnGetZhuanDanIndex(ItemIndex);
	if ZD_ID == -1 then
		return 0;
	end

	local BaseSpace, MaterialSpace, TaskSpace = LuaFnGetZhuandanSpace(ZD_ID);	
	if BaseSpace == -1 then
		return 0;
	end
	
	local FreeSpace1 = LuaFnGetPropertyBagSpace(sceneId, selfId);
	local FreeSpace2 = LuaFnGetMaterialBagSpace(sceneId, selfId);
	local FreeSpace3 = LuaFnGetTaskItemBagSpace(sceneId, selfId);
	
	if (FreeSpace1<BaseSpace) or (FreeSpace2<MaterialSpace) or (FreeSpace3<TaskSpace) then 
    x889040_ShowNotice( sceneId, selfId, "�����ռ䲻�㡣");
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
function x889040_OnDeplete( sceneId, selfId )
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
function x889040_OnActivateOnce( sceneId, selfId )
	local ItemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	local ZD_ID = LuaFnGetZhuanDanIndex(ItemIndex);	
	if ZD_ID == -1 then
		return 0;
	end
	
	local PrizeItem, PrizeNum, IsBind, NoticeFormat = LuaFnGetZhuanDanInfo(ZD_ID);
	if PrizeItem == -1 then
		return 0;
	end
	
	local BagPos = nil;
	
	--�����Ʒ
	for i=1, PrizeNum do
		BagPos = LuaFnTryRecieveItemIgnoreFatigueState(sceneId, selfId, PrizeItem, QUALITY_MUST_BE_CHANGE);
		if BagPos == -1 then
			x889040_ShowNotice( sceneId, selfId, "�����ռ䲻��");
			return 0;
		end
		--ǿ�ư�
		if(IsBind == 1) then
			LuaFnItemBind( sceneId, selfId, BagPos);
		end
	end
	
	--����
	if NoticeFormat ~= nil then
 		local ItemTransfer = GetBagItemTransfer(sceneId, selfId, BagPos);
 	  local PlayerName = GetName(sceneId, selfId);
 	  local str = format(NoticeFormat, PlayerName, ItemTransfer)
    BroadMsgByChatPipe( sceneId, selfId, str, 4 )		  
  end  
  
  --��Ϣ	
  local ItemName = GetItemName(sceneId, PrizeItem)
  local strNotice = "���õ���"..ItemName
  x889040_ShowNotice( sceneId, selfId, strNotice)
  LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);	
  
	--����ͳ�ƣ�ת����ʹ��
	LuaFnAuditZhuanDanUsed(sceneId, selfId, 100+ZD_ID, 0)
	    
	return 1;	
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x889040_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889040_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end


	
