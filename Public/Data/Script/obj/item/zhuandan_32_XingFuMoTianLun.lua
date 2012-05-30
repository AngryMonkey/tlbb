--���ߣ��Ҹ�Ħ����<ID:>
--�ű��� 889041
--Author:xiehong 2009-03-18

x889041_g_scriptId = 889041

x889041_g_ColorSockPrize = {
					10124104,
					50213006,
					50201001,
					50201002,
					50202001,
					50202002,
					50202003,
					50202004,
					50203001,
					50204002,
					50211001,
					50211002,
					50212001,
					50212002,
					50212003,
					50212004,
					50213001,
					50213002,
					50213003,
					50213004,
					50213005,
					50214001,
					30900015,
					30900006,
					30008003,
					30504037,					
              } 

x889041_g_strGongGaoInfo = {
	"#G#{_INFOUSR%s}#c00FFFF���е�#G#{_ITEM30504072}#c00FFFF�����ܵ����ٻ���ͻȻӿ������ս����������Ϣ��һ��#G#{_INFOMSG%s}#c00FFFFͻȻ���������С�",
	"#G#{_INFOUSR%s}#c00FFFF���е�#G#{_ITEM30504072}#c00FFFF�����ܵ����ٻ���ͻȻӿ������ս����������Ϣ��һ��#G#{_INFOMSG%s}#c00FFFFͻȻ���������С�",
	"#G#{_INFOUSR%s}#c00FFFF���е�#G#{_ITEM30504072}#c00FFFF�����ܵ����ٻ���ͻȻӿ������ս����������Ϣ��һ��#G#{_INFOMSG%s}#c00FFFFͻȻ���������С�",
}

--��־
x889041_g_AuditIndex = 31

--������ڳ���������
x889041_g_DropTableIndex = 26

--���������ϱ���Ԥ���ĸ���
x889041_g_BagPreCount = { 2, 2 }


--**********************************
--�¼��������   
--**********************************
function x889041_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end              
                 
--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889041_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end              
                 
--**********************************
--ֱ��ȡ��Ч���� 
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889041_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end              
                 
--**********************************
--���������ڣ� 
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889041_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < x889041_g_BagPreCount[1] ) then 
		local strNotice = "�����ռ䲻�㡣"
			x889041_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < x889041_g_BagPreCount[2] ) then 
		local strNotice = "�������ռ䲻�㡣"
			x889041_ShowNotice( sceneId, selfId, strNotice)
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
function x889041_OnDeplete( sceneId, selfId )
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
function x889041_OnActivateOnce( sceneId, selfId )

	--����ͳ�ƣ�ת����ʹ�ã�ת���ű���ż�һ
	LuaFnAuditZhuanDanUsed(sceneId, selfId, x889041_g_AuditIndex, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, x889041_g_DropTableIndex )
    
    if( RandomBase > 0 ) then
    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, x889041_g_DropTableIndex )
        local PrizeNum = 1
        if (RandomID == x889041_g_ColorSockPrize[26]) then
			PrizeNum = 5
        elseif  (RandomID ==x889041_g_ColorSockPrize[1] or RandomID ==x889041_g_ColorSockPrize[23] or RandomID ==x889041_g_ColorSockPrize[25]) then
			PrizeNum = 1
        else
			PrizeNum = 2
        end
        
        if( RandomID > 0 ) then
			
			if RandomID == x889041_g_ColorSockPrize[1] then
				
				BeginAddItem(sceneId)
				AddItem( sceneId, RandomID, PrizeNum )
				local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
				if Ret > 0 then
					LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
					if 1 == Notice then
						local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
						x889041_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					end
				end
				
			else
				for i = 1, PrizeNum do
					local bagpos = TryRecieveItem( sceneId, selfId, RandomID, QUALITY_MUST_BE_CHANGE )
					LuaFnItemBind( sceneId, selfId, bagpos )					
				end
			end
			
			local ItemName = GetItemName(sceneId, RandomID)
			local strNotice = "���õ���"..ItemName
			x889041_ShowNotice( sceneId, selfId, strNotice)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
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
function x889041_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889041_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889041_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889041_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889041_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889041_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
