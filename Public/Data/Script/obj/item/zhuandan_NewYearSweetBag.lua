--���ߣ����۵�<ID:30504045>
--�ű��� 889026
--Author:xiehong 2009-02-05

x889026_g_scriptId = 889026
x889026_g_ColorSockPrize = {
													30501132,	--1
													30501133,	--2
													30501153,	--3
													30501151,	--4
													31000001,	--5
													31000003,	--6
													30607000,	--7
													30008011,	--8
													30900006,	--9
													30502002,	--10
													30008002,	--11
													30402096,	--12
													30402097,	--13
													30402098,	--14
													30402099,	--15
													30402026,	--16
													30402092,	--17
													30402046,	--18
													30402094,	--19
													30402072,	--20
													30402036,	--21
													30402076,	--22
													30402078,	--23
													30402025,	--24
													30402030,	--25
													30402034,	--26
													30402040,	--27
													30402042,	--28
													30402044,	--29
													30402048,	--30
													30402050,	--31
													30402012,	--32
													30402014,	--33
													30402016,	--34
													30402018,	--35
													30402020,	--36
													30402056,	--37
													30402060,	--38
													30402062,	--39
													30402064,	--40
													30402066,	--41
													30309612,	--42
													30402070,	--43
													30402074,	--44
													30402080,	--45
													10141091,	--46
													30402093,	--47
													30402051,	--48
													30402052,	--49
													30402053,	--50
													30402054,	--51
													30402045,	--52
													30402029,	--53
													30402035,	--54
													30402055,	--55
													30402059,	--56
													30402047,	--57
													30402049,	--58
													30402061,	--59
													30402063,	--60
													30402065,	--61
													30402067,	--62
													30402069,	--63
													30402073,	--64
													30402033,	--65
													30402039,	--66
													30402041,	--67
													30402043,	--68
													30402075,	--69
													30402077,	--70
													30402079,	--71
													30008034,	--72
													30008048,	--73
													30008009,	--74
													30309187,	--75
													10124101,	--76
													10141804,	--77
													30700203,	--78
													30501169,	--79
													30501231,	--80
													30501222,	--81
													30501231,	--82
													30501222,	--83
													30501213,	--84
													30501240,	--85
													30501232,	--86
													30501223,	--87
													30501232,	--88
													30501223,	--89
													30501214,	--90
													30501241,	--91
													30501233,	--92
													30501224,	--93
													30501233,	--94
													30501224,	--95
													30501215,	--96
													30501242	--97
													}
                 
x889026_g_strGongGaoInfo = {
	"#{_INFOUSR%s}#c00FFFF���е�#G#{_ITEM30504045}#c00FFFF���Ҷ�����������ɫ��â����������һ��#{_INFOMSG%s}#c00FFFF�����������С�",
	"#{_INFOUSR%s}#c00FFFF���е�#G#{_ITEM30504045}#c00FFFF���Ҷ�����������ɫ��â����������һ��#{_INFOMSG%s}#c00FFFF�����������С�",
	"#{_INFOUSR%s}#c00FFFF���е�#G#{_ITEM30504045}#c00FFFF���Ҷ�����������ɫ��â����������һ��#{_INFOMSG%s}#c00FFFF�����������С�",
}                
--**********************************
--�¼��������   
--**********************************
function x889026_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end              
                 
--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x889026_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end              
                 
--**********************************
--ֱ��ȡ��Ч���� 
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x889026_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end              
                 
--**********************************
--���������ڣ� 
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x889026_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--��Ϊת����������һ��������һ���ո��Ұ׽������ཱ��3�������ж�ʣ��ռ�<2	
--��Ϊ�߲����ز�����Ʒ�е��ڵ��������е��ڲ�����
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then 
	        local strNotice = "�����ռ䲻�㡣"
		      x889026_ShowNotice( sceneId, selfId, strNotice)
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
function x889026_OnDeplete( sceneId, selfId )
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
function x889026_OnActivateOnce( sceneId, selfId )

    --����ͳ�ƣ�ת����ʹ��
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 25, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 22)
    if( RandomBase > 0 ) then    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 22 )
        local PrizeNum = 1
				
				if (RandomID == x889026_g_ColorSockPrize[8])
				or (RandomID == x889026_g_ColorSockPrize[9])
				or (RandomID == x889026_g_ColorSockPrize[10])
				or (RandomID == x889026_g_ColorSockPrize[11])
				or (RandomID == x889026_g_ColorSockPrize[80])
				or (RandomID == x889026_g_ColorSockPrize[81])
				or (RandomID == x889026_g_ColorSockPrize[82])
				or (RandomID == x889026_g_ColorSockPrize[83])
				or (RandomID == x889026_g_ColorSockPrize[84])
				or (RandomID == x889026_g_ColorSockPrize[85]) then
					PrizeNum = 3
				elseif (RandomID == x889026_g_ColorSockPrize[78]) then
					PrizeNum = 4
				elseif (RandomID == x889026_g_ColorSockPrize[79]) then
					PrizeNum = 22
				elseif (RandomID == x889026_g_ColorSockPrize[72])
				or (RandomID == x889026_g_ColorSockPrize[74])	then
					PrizeNum = 2
				end
					
					
        if( RandomID > 0 ) then
           BeginAddItem(sceneId)
				   AddItem( sceneId, RandomID, PrizeNum )
			     local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			     if Ret > 0 then
			       	LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			       	if 1 == Notice then
			       	   local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					       x889026_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "���õ���"..ItemName
				      x889026_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "�����ռ䲻��"
				      x889026_ShowNotice( sceneId, selfId, strNotice)
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
function x889026_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

function x889026_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889026_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889026_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889026_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889026_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
