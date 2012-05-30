--���ߣ����ز���<ID:30504025>
--�ű��� 889019
--Author:zhangzhuang 2008-12-17

x889019_g_scriptId = 889019
x889019_g_SockPrize = {
	                30008034,
									30008048,
									30008009,
									30503018,
									30503019,
									30900006,
									50201001,
									50201002,
									50202001,
									50202002,
									50202003,
									50202004,
									50204002,
									50301001,
									50301002,
									50302001,
									50302002,
									50302003,
									50302004,
									50304002,
									50401001,
									50401002,
									50402001,
									50402002,
									50402003,
									50402004,
									50404002,
									50501001,
									50501002,
									50502001,
									50502002,
									50502003,
									50502004,
									50504002,
									50601001,
									50601002,
									50602001,
									50602002,
									50602003,
									50602004,
									50604002,
									30504019,
									30309612,
									10124063,
									10124066,
									10124135,
									30501132,
									10141091,
									30700203
	              } 

x889019_g_strGongGaoInfo = {
	"#c00FFFF���ڱ�¯�ߵ�#G#{_ITEM30504025}��#c00FFFF���˵ص��ڵ��ϣ�#{_INFOUSR%s}#c00FFFFʰ����һ�������˵ļ���#{_INFOMSG%s}#c00FFFF��",
 	"#c00FFFF���ڱ�¯�ߵ�#G#{_ITEM30504025}��#c00FFFF���˵ص��ڵ��ϣ�#{_INFOUSR%s}#c00FFFFʰ����һ�������˵ļ���#{_INFOMSG%s}#c00FFFF��",
  "#c00FFFF���ڱ�¯�ߵ�#G#{_ITEM30504025}��#c00FFFF���˵ص��ڵ��ϣ�#{_INFOUSR%s}#c00FFFFʰ����һ�������˵ļ���#{_INFOMSG%s}#c00FFFF��",
}
--**********************************
--�¼��������
--**********************************
function x889019_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889019_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889019_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889019_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--��Ϊת����������һ��������һ���ո��Һ��������ཱ��3�������ж�ʣ��ռ�<2	
--��Ϊ���ز�������Ʒ�е��ڵ��������е��ڲ�����
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x889019_ShowNotice( sceneId, selfId, strNotice)
	        return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then 
	        local strNotice = "�������ռ䲻�㡣"
		      x889019_ShowNotice( sceneId, selfId, strNotice)
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
function x889019_OnDeplete( sceneId, selfId )
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
function x889019_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 19, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 17)
    if( RandomBase > 0 ) then    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 17 )
        local PrizeNum = 0
        if (RandomID == x889019_g_SockPrize[4] or RandomID == x889019_g_SockPrize[6] or
        	RandomID == x889019_g_SockPrize[49]) then
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
					       x889019_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889019_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889019_ShowNotice( sceneId, selfId, strNotice)
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
function x889019_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889019_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889019_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889019_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889019_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889019_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
