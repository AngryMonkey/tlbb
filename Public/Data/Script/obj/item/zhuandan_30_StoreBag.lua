--���ߣ���ʯ����<ID:30504054>
--�ű��� 889033
--Author:xiehong 2009-02-11

x889033_g_scriptId = 889033
x889033_g_ColorSockPrize = {
					30501169,
					30900006,
					30008034,
					30008048,
					30502002,
					50613001,
					50613002,
					50613004,
					50613003,
					50613005,
					50603001,
					50604002,
					50614001,
					50713001,
					50713002,
					50713004,
					50713003,
					50713005,
					50703001,
					50704002,
					50714001,
					30008006,
					30008007,
					10141115,
					20109009,
					20109010,
					20109101,
					30509025,
					30509021,
					30509024
              } 
                 
x889033_g_strGongGaoInfo = {
	"#G#{_ITEM30504054}#c00FFFF˲��ų�һ��ǿ�����Ϣ���Һ�#{_INFOUSR%s}#c00FFFF���������ס���Σ���㵵ķ������ж���һ��#{_INFOMSG%s}��",
	"#G#{_ITEM30504054}#c00FFFF˲��ų�һ��ǿ�����Ϣ���Һ�#{_INFOUSR%s}#c00FFFF���������ס���Σ���㵵ķ������ж���һ��#{_INFOMSG%s}��",
	"#G#{_ITEM30504054}#c00FFFF˲��ų�һ��ǿ�����Ϣ���Һ�#{_INFOUSR%s}#c00FFFF���������ס���Σ���㵵ķ������ж���һ��#{_INFOMSG%s}��",
}

--��־
x889033_g_AuditIndex = 29

--������ڳ���������
x889033_g_DropTableIndex = 24

--���������ϱ���Ԥ���ĸ���
x889033_g_BagPreCount = { 1, 1 }


--**********************************
--�¼��������   
--**********************************
function x889033_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end              
                 
--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889033_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end              
                 
--**********************************
--ֱ��ȡ��Ч���� 
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889033_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end              
                 
--**********************************
--���������ڣ� 
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889033_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < x889033_g_BagPreCount[1] ) then 
		local strNotice = "�����ռ䲻�㡣"
			x889033_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < x889033_g_BagPreCount[2] ) then 
		local strNotice = "�������ռ䲻�㡣"
			x889033_ShowNotice( sceneId, selfId, strNotice)
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
function x889033_OnDeplete( sceneId, selfId )
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
function x889033_OnActivateOnce( sceneId, selfId )

	--����ͳ�ƣ�ת����ʹ�ã�ת���ű���ż�һ
	LuaFnAuditZhuanDanUsed(sceneId, selfId, x889033_g_AuditIndex, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, x889033_g_DropTableIndex )
    if( RandomBase > 0 ) then
    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, x889033_g_DropTableIndex )
        local PrizeNum = 1
        if (RandomID == x889033_g_ColorSockPrize[1]) then
			PrizeNum = 10
        elseif  (RandomID ==x889033_g_ColorSockPrize[2] or RandomID ==x889033_g_ColorSockPrize[29] or RandomID ==x889033_g_ColorSockPrize[30]) then
			PrizeNum = 2
        elseif  (RandomID ==x889033_g_ColorSockPrize[5]) then
			PrizeNum = 5
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
					x889033_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				end
				      
				local ItemName = GetItemName(sceneId, RandomID)
				local strNotice = "���õ���"..ItemName
				x889033_ShowNotice( sceneId, selfId, strNotice)
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
			else
				local strNotice = "�����ռ䲻��"
				x889033_ShowNotice( sceneId, selfId, strNotice)
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
function x889033_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889033_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889033_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889033_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889033_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889033_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
