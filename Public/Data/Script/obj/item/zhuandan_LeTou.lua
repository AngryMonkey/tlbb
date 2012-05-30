--���ߣ���͸ת��<ID:30504069>
--�ű��� 889039
--Author:zhangzhuang 2009-03-13

x889039_g_scriptId = 889039
x889039_g_ColorSockPrize = {
			            30900006,
									30502000,
									30502001,
									30502002,
									30700203,
									50412003,
									50412004,
									50404002,
									50414001,
									50412001,
									50412002,
									50512003,
									50512004,
									50504002,	
									50514001,	
									50512001,	
									50512002,
									50612003,
									50612004,
									50604002,
									50614001,	
									50612001,
									50612002,
									30505041,
									30505034,
									30501153,
									30501151,
									30309754,
									10141062,
									10124103,
									30509066,
									30509036,
									50313004,
									30008021,
									30008025,
									30607001,
	              } 
                 
x889039_g_strGongGaoInfo = {
	"#c00FFFF����ϣ����#G#{_ITEM30504069}#c00FFFF�����ҫ�ĳ�����ǰ��#{_INFOUSR%s}#c00FFFFС������Ĵ򿪣��������#{_INFOMSG%s}#c00FFFF��",
	"#c00FFFF����ϣ����#G#{_ITEM30504069}#c00FFFF�����ҫ�ĳ�����ǰ��#{_INFOUSR%s}#c00FFFFС������Ĵ򿪣��������#{_INFOMSG%s}#c00FFFF��",
	"#c00FFFF����ϣ����#G#{_ITEM30504069}#c00FFFF�����ҫ�ĳ�����ǰ��#{_INFOUSR%s}#c00FFFFС������Ĵ򿪣��������#{_INFOMSG%s}#c00FFFF��",
}                
--**********************************
--�¼��������   
--**********************************
function x889039_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end              
                 
--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889039_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end              
                 
--**********************************
--ֱ��ȡ��Ч���� 
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889039_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end              
                 
--**********************************
--���������ڣ� 
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889039_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--��Ϊת����������һ��������һ���ո�����͸ת����ཱ��2�������ж�ʣ��ռ�<1	
--��Ϊ��͸ת����Ʒ�е��ڵ��������е��ڲ�����
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x889039_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "�������ռ䲻�㡣"
		      x889039_ShowNotice( sceneId, selfId, strNotice)
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
function x889039_OnDeplete( sceneId, selfId )
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
function x889039_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 30, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 25)
    if( RandomBase > 0 ) then    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 25 )
        local PrizeNum = 1
        if (RandomID == x889039_g_ColorSockPrize[2]) then
          PrizeNum = 3
        elseif  (RandomID ==x889039_g_ColorSockPrize[3] or RandomID ==x889039_g_ColorSockPrize[25] or RandomID ==x889039_g_ColorSockPrize[24]) then
        	PrizeNum = 2
        else
          PrizeNum = 1
        end
        
        if( RandomID > 0 ) then
           BeginAddItem(sceneId)
				   AddItem( sceneId, RandomID, PrizeNum )
			     local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			     if Ret > 0 then
			       	LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			       	if 1 == Notice then
			       	   local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					       x889039_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889039_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889039_ShowNotice( sceneId, selfId, strNotice)
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
function x889039_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889039_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889039_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889039_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889039_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889039_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
