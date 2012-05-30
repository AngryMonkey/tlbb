--���ߣ��ٱ���ϻ
--�ű��� 332205
--Author:  houzhifang  2008-11-06

x332205_g_scriptId = 332205
x332205_g_strGongGaoInfo = "#HʫԻ���������лƽ��ݡ���#{_INFOUSR%s}#H�������ʣ�����żȻ����#G#{_ITEM30501171}#H�з�����һ��#{_INFOMSG%s}#H��"
--x332205_g_strGongGaoInfo = "#{_INFOUSR%s}#H��ʹ�ðٱ���ϻ�󣬻����һ��#{_INFOMSG%s}#H���޼����顣"
x332205_g_giftitem_index = 30501318

--**********************************
--�¼��������
--**********************************
function x332205_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ������պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332205_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332205_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332205_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ����	
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
					
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then
	        local strNotice = "�Բ������ı������������������������������ռ䡣"
		      x332205_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	return 1;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x332205_OnDeplete( sceneId, selfId )
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
function x332205_OnActivateOnce( sceneId, selfId )

    local RandomBase = GetBaibaoshuxiaItemDropBase( sceneId, selfId )
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = BaibaoshuxiaItemDropItem( sceneId, selfId, RandomNum )
       
        if( RandomID > 0 ) then
        	BeginAddItem(sceneId)
			AddItem( sceneId, RandomID, 1 )
			AddItem( sceneId, x332205_g_giftitem_index, 1 )
			local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			    if 1 == Notice then
			    	local szItemTransfer = GetItemTransfer(sceneId,selfId, 0)
						x332205_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				   	end
				      
				    local ItemName = GetItemName(sceneId, RandomID)
				    local strNotice = "#{BBSX_081106_2}"..ItemName
				    x332205_ShowNotice( sceneId, selfId, strNotice)
				    LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				 else
				    local strNotice = "#{BBSX_081106_1}"
				    x332205_ShowNotice( sceneId, selfId, strNotice)
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
function x332205_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x332205_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332205_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local str = format( "#HʫԻ���������лƽ��ݡ���#{_INFOUSR%s}#H�������ʣ�����żȻ����#G#{_ITEM30501171}#H�з�����һ��#{_INFOMSG%s}#H��", PlayerName, strItemInfo )
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
