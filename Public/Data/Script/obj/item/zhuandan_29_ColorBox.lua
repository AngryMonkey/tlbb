--���ߣ��ͷ����<ID:30504051>
--�ű��� 889030
--Author:xiehong 2009-02-11

x889030_g_scriptId = 889030
x889030_g_ColorSockPrize = {
				30501169,
				30502002,
				30008034,
				30008048,
				30008009,
				30900006,
				30607001,
				30700203,
				30309731,
				10141804,
				30509011,
				30402087,
				30402088,
				30402089,
				30402090,
				30501178,
				30501187,
				30501232,
				30501223,
				30501214,
				30501241,
				30501196,
				30501205,
				30501179,
				30501188,
				30501233,
				30501224,
				30501215,
				30501242,
				30501197,
				30501206,
				30501180,
				30501189,
				30501234,
				30501225,
				30501216,
				30501243,
				30501198,
				30501207,
				30504049,
				30504048,
				10124101,
				31000001,
				31000003,
				30402096,
				30402097,
				30402099,
				30402098
              } 
                 
x889030_g_strGongGaoInfo = {
	"#c00FFFF������#G#{_ITEM30504051}#c00FFFF����ʶ�Ŀ�ĳ�����ǰ��#{_INFOUSR%s}#c00FFFFС������Ĳ𿪣��������#{_INFOMSG%s}��",
	"#c00FFFF������#G#{_ITEM30504051}#c00FFFF����ʶ�Ŀ�ĳ�����ǰ��#{_INFOUSR%s}#c00FFFFС������Ĳ𿪣��������#{_INFOMSG%s}��",
	"#c00FFFF������#G#{_ITEM30504051}#c00FFFF����ʶ�Ŀ�ĳ�����ǰ��#{_INFOUSR%s}#c00FFFFС������Ĳ𿪣��������#{_INFOMSG%s}��",
}

--��־
x889030_g_AuditIndex = 28

--������ڳ���������
x889030_g_DropTableIndex = 23

--���������ϱ���Ԥ���ĸ���
x889030_g_BagPreCount = { 1, 0 }


--**********************************
--�¼��������   
--**********************************
function x889030_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end              
                 
--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889030_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end              
                 
--**********************************
--ֱ��ȡ��Ч���� 
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889030_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end              
                 
--**********************************
--���������ڣ� 
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889030_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < x889030_g_BagPreCount[1] ) then 
		local strNotice = "�����ռ䲻�㡣"
			x889030_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < x889030_g_BagPreCount[2] ) then 
		local strNotice = "�������ռ䲻�㡣"
			x889030_ShowNotice( sceneId, selfId, strNotice)
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
function x889030_OnDeplete( sceneId, selfId )
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
function x889030_OnActivateOnce( sceneId, selfId )

	--����ͳ�ƣ�ת����ʹ�ã�ת���ű���ż�һ
	LuaFnAuditZhuanDanUsed(sceneId, selfId, x889030_g_AuditIndex, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, x889030_g_DropTableIndex )
    if( RandomBase > 0 ) then
    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, x889030_g_DropTableIndex )
        local PrizeNum = 1
        if (RandomID == x889030_g_ColorSockPrize[1]) then
			PrizeNum = 22
        elseif  (RandomID ==x889030_g_ColorSockPrize[2]) then
			PrizeNum = 10
        elseif  (RandomID ==x889030_g_ColorSockPrize[3] or RandomID ==x889030_g_ColorSockPrize[6] or RandomID ==x889030_g_ColorSockPrize[8]) then
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
					x889030_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				end
				      
				local ItemName = GetItemName(sceneId, RandomID)
				local strNotice = "���õ���"..ItemName
				x889030_ShowNotice( sceneId, selfId, strNotice)
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
			else
				local strNotice = "�����ռ䲻��"
				x889030_ShowNotice( sceneId, selfId, strNotice)
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
function x889030_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889030_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889030_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889030_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889030_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889030_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
