--���ߣ�GF���<ID:30504042>
--�ű��� 889021
--Author:zhangzhuang 2008-12-27

x889021_g_scriptId = 889021
x889021_g_GFPrize = {
	               10141087,	
						30501132,
						30501133,
						30501153,
						30501151,
						31000001,
						31000003,
						30607000,
						30008011,
						30900006,
						30502002,
						30008002,
						30402026,
						30402092,
						30402046,
						30402094,
						30402072,
						30402036,
						30402076,
						30402078,
						30402025,
						30402030,
						30402034,
						30402040,
						30402042,
						30402044,
						30402048,
						30402050,
						30402012,
						30402014,
						30402016,
						30402018,
						30402020,
						30402056,
						30402060,
						30402062,
						30402064,
						30402066,
						30402068,
						30402070,
						30402074,
						30402080,
						30402091,
						30402093,
						30402051,
						30402052,
						30402053,
						30402054,
						30402045,
						30402029,
						30402035,
						30402055,
						30402059,
						30402047,
						30402049,
						30402061,
						30402063,
						30402065,
						30402067,
						30402069,
						30402073,
						30402033,
						30402039,
						30402041,
						30402043,
						30402075,
						30402077,
						30402079,
						30008034,
						30008048,
						30008009,
						30309619,
						10124063,
						10124066,
						10141091,
						30700203,
						30501169
	              } 

x889021_g_strGongGaoInfo = {
	"#{_INFOUSR%s}#c00FFFF������˾��µ�#G#{_ITEM30504042}#c00FFFF�����Ͳ�ס�Ĵ򿪣�ǿ�����Ϣӿ�����õ�һ��#{_INFOMSG%s}#c00FFFF��",
 "#{_INFOUSR%s}#c00FFFF������˾��µ�#G#{_ITEM30504042}#c00FFFF�����Ͳ�ס�Ĵ򿪣�ǿ�����Ϣӿ�����õ�һ��#{_INFOMSG%s}#c00FFFF��",
  "#{_INFOUSR%s}#c00FFFF������˾��µ�#G#{_ITEM30504042}#c00FFFF�����Ͳ�ס�Ĵ򿪣�ǿ�����Ϣӿ�����õ�һ��#{_INFOMSG%s}#c00FFFF��",
}
--**********************************
--�¼��������
--**********************************
function x889021_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889021_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889021_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889021_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--��Ϊת����������һ��������һ���ո��Һ��������ཱ��3�������ж�ʣ��ռ�<2	
--��Ϊ���ز�������Ʒ�е��ڵ��������е��ڲ�����
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x889021_ShowNotice( sceneId, selfId, strNotice)
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
function x889021_OnDeplete( sceneId, selfId )
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
function x889021_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 20, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 18)
    if( RandomBase > 0 ) then    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 18 )
        local PrizeNum = 0
         if (RandomID == x889021_g_GFPrize[77]) then
          PrizeNum = 22
        elseif (RandomID == x889021_g_GFPrize[76]) then
          PrizeNum = 4
        elseif (RandomID == x889021_g_GFPrize[9] or RandomID == x889021_g_GFPrize[10] or 
        	RandomID == x889021_g_GFPrize[11] or RandomID == x889021_g_GFPrize[12]) then
        	PrizeNum = 3
        elseif (RandomID == x889021_g_GFPrize[71] or RandomID == x889021_g_GFPrize[69]) then
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
					       x889021_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889021_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889021_ShowNotice( sceneId, selfId, strNotice)
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
function x889021_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889021_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889021_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889021_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889021_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889021_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
