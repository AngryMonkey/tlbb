--�����
--ʥ����Ԫ���-�ռ����ɵ��߻�����

--�ű���
x050026_g_ScriptId = 050026



x050026_g_HeKaId = {
	                 20310011,
	                 20310017,
	                 20310012,
	                 20310019,
	                 20310014,
	                 20310018,
	                 20310015,
	                 20310016,
	                 20310013,	
}			                                   --�ؿ�ID

x050026_g_GiftId = {
                   30501127,	--���ݵ����ǹ���*1
                   30501126,	--���ݵ���������*1
                   30501125,	--���ݵ���ʥ����*1
                   30505146,	--�Ҹ�ѩ��*10
                   10141101,	--5����ϰ���ʥ�������ͣ�
                   10141100,	--5����Ʒ����ʥ�����˿ڴ����ͣ�
                   10141105,	--�������
                   10141106,	--���ľţ����
                   10141107,	--�����
                   10141108,	--�������
                   10141109,	--���½��
                   10141110,	--�������
                   10410108,  --ʥ��ñ(������ʱװ)
                   10410098,  --����ʥ��ñ��װ���󶨣�
                   10410099,  --����ʥ��ñ��װ���󶨣�
                   10410100,  --����ʥ��ñ��װ���󶨣�
                   10410101,  --����ʥ��ñ��װ���󶨣�
                   10410102,  --����ʥ��ñ��װ���󶨣�
                   10410103,  --����ʥ��ñ��װ���󶨣�
                   10410104,  --����ʥ��ñ��װ���󶨣�
                   10410105,  --����ʥ��ñ��װ���󶨣�
                   10410106,  --����ʥ��ñ��װ���󶨣�
                   10410107,  --����ʥ��ñ��װ���󶨣�
}			                                   --��ƷID

--**********************************
--������ں���
--**********************************
function x050026_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050026_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()


	if NumText == 111 then
	  BeginEvent(sceneId)
			AddText(sceneId, "#{CHRISTMAS_LUOYANG_HTJS_2}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 112 then
	  BeginEvent(sceneId)
	    local nGetgiftcount = x050026_GetGiftCount(sceneId, selfId) + 1
	    local str
	    if nGetgiftcount > 6 then
	       str = "#{SDYD_081007_010}"
	       AddText(sceneId, str);
	    else
	       str = format("#{SDYD_081007_021}%d#{SDYD_081007_022}", nGetgiftcount);
	       AddText(sceneId, str);
	       AddNumText(sceneId, x050026_g_ScriptId,"ȷ��", 8, 113);
				AddNumText(sceneId, x050026_g_ScriptId,"ȡ��", 8, 114);
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 113 then
	  x050026_GivePlayerGift( sceneId, selfId, targetId )	
	elseif NumText == 114 then
	  -- �رմ���
	  BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end
	
end

--**********************************
--�о��¼�
--**********************************
function x050026_OnEnumerate( sceneId, selfId, targetId )
  
  --���ʱ���Ƿ���ȷ
	local isTime = x050026_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050026_g_ScriptId, "���պ����һ���Ʒ", 6, 112 )	
	AddNumText(sceneId, x050026_g_ScriptId, "���պ����һ���Ʒ����", 11, 111 )												
end

--**********************************
--���ʱ���Ƿ���ȷ
--**********************************
function x050026_CheckRightTime( sceneId )
	  
	local today = GetDayTime()						--��ǰʱ��
		local firstDay = 8357								-- 2008�� 12 �� 23 ��
		local lastDay = 9007								-- 2009�� 1  �� 8  ��
	  
	-- 12 �� 31 �� 0 ʱ ~ 1 �� 7 �� 24 ʱ
	if today <= firstDay or today >= lastDay then
		return 0
	end

	return 1

end

--**********************************
--������������
--**********************************
function x050026_GivePlayerGift( sceneId, selfId, targetId )

	--�رնԻ�����....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

	--�����ҵȼ�С��25���軻ȡ�ؿ�
	if	GetLevel( sceneId, selfId) < 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_008}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--����1���������....
	local ShaoLinHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[1])
	local MingJiaoHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[2])
	local GaiBangHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[3])
	local WuDangHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[4])
	local EMeiHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[5])
	local XingSuHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[6])
	local DaLiHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[7])
	local TianShanHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[8])
  local XiaoYaoHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[9])

  local result = 1
  if ShaoLinHeKaCount < 1 then
    result = 0
  elseif MingJiaoHeKaCount < 1 then
    result = 0
  elseif GaiBangHeKaCount < 1 then
    result = 0
  elseif WuDangHeKaCount < 1 then
    result = 0
  elseif EMeiHeKaCount < 1 then
    result = 0
  elseif XingSuHeKaCount < 1 then
    result = 0
  elseif DaLiHeKaCount < 1 then
    result = 0
  elseif TianShanHeKaCount < 1 then
    result = 0
  elseif XiaoYaoHeKaCount < 1 then
    result = 0
  end    
    
  if result == 0 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_009}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	local td = GetDayTime()
	local LastGetGiftTime = GetMissionData(sceneId,selfId,MD_GETGIFT_TIME)
	if (td<LastGetGiftTime) then
		return
	end
	if td > LastGetGiftTime then
	    SetMissionData( sceneId, selfId, MD_GETGIFT_COUNT, 0 )
	    SetMissionData( sceneId, selfId, MD_GETGIFT_TIME, td )
	end
	
	local nGetGiftCount = GetMissionData(sceneId,selfId,MD_GETGIFT_COUNT)
	
	if nGetGiftCount >= 6 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_010}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end	
	
	--��ⱳ���Ƿ��еط�....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_011}" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--�Ƿ�ɾ��ʧ��....
	for i, v in x050026_g_HeKaId do
	  if LuaFnDelAvailableItem(sceneId, selfId, v, 1) == 0 then
			 BeginEvent(sceneId)
			 AddText( sceneId, "#{SDYD_081007_009}" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	 end
	    
	    
	local odds = random(1,1000)
	local GiftId = 0   --����ID
	local GiftNum = 0  --��������
	local strtext

	--�����������
	  if( odds >= 1 and odds <= 81 ) then       --81
	    GiftId = x050026_g_GiftId[1]
	    GiftNum = 1
	    strtext = "��ϲ������������ݵ����ǹ��У�ף����Ϸ��죡"
	  elseif( odds >= 82 and odds <= 162 ) then          --81
	    GiftId = x050026_g_GiftId[2]
	    GiftNum = 1
	    strtext = "��ϲ������������ݵ�����������ף����Ϸ��죡"
	  elseif( odds >= 163 and odds <= 281 ) then                  --119
	    GiftId = x050026_g_GiftId[3]
	    GiftNum = 1
	    strtext = "��ϲ������������ݵ���ʥ������ף����Ϸ��죡"
	  elseif( odds >= 282 and odds <= 371 ) then                  --90
	    GiftId = x050026_g_GiftId[4]
	    GiftNum = 10
	    strtext = "��ϲ����������Ҹ�ѩ��ף����Ϸ��죡"
	  elseif( odds >= 372 and odds <= 450 ) then                 --79
	    GiftId = x050026_g_GiftId[5]
	    GiftNum = 1
	    strtext = "��ϲ���������5����ϰ���ʥ�������ͣ���ף����Ϸ��죡"
	  elseif( odds >= 451 and odds <= 529 ) then                 --79
	    GiftId = x050026_g_GiftId[6]
	    GiftNum = 1
	    strtext = "��ϲ���������5����Ʒ����ʥ�����˿ڴ����ͣ���ף����Ϸ��죡"
	  elseif( odds >= 530 and odds <= 553 ) then                 --24
	    GiftId = x050026_g_GiftId[7]
	    GiftNum = 1
	    strtext = "��ϲ����������������ף����Ϸ��죡"
	  elseif( odds >= 554 and odds <= 577 ) then                 --24
	    GiftId = x050026_g_GiftId[8]
	    GiftNum = 1
	    strtext = "��ϲ������������ľţ����ף����Ϸ��죡"
	  elseif( odds >= 578 and odds <= 601 ) then                 --24
	    GiftId = x050026_g_GiftId[9]
	    GiftNum = 1
	    strtext = "��ϲ�������������ܣ�ף����Ϸ��죡"
	  elseif( odds >= 602 and odds <= 625 ) then                 --24
	    GiftId = x050026_g_GiftId[10]
	    GiftNum = 1
	    strtext = "��ϲ���������������ӣ�ף����Ϸ��죡"
	  elseif( odds >= 626 and odds <= 636 ) then                 --11
	    GiftId = x050026_g_GiftId[11]
	    GiftNum = 1
	    strtext = "��ϲ������������½�ᣬף����Ϸ��죡"
	  elseif( odds >= 637 and odds <= 647 ) then                 --11
	    GiftId = x050026_g_GiftId[12]
	    GiftNum = 1
	    strtext = "��ϲ����������������ף����Ϸ��죡"
	  elseif( odds >= 648 and odds <= 655 ) then                 --8
	    GiftId = x050026_g_GiftId[13]
	    GiftNum = 1
	    strtext = "��ϲ���������ʥ��ñ(������ʱװ)��ף����Ϸ��죡"
	  elseif( odds >= 656 and odds <= 656 ) then                 --1
	    GiftId = x050026_g_GiftId[14]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 657 and odds <= 661 ) then                 --5
	    GiftId = x050026_g_GiftId[15]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 662 and odds <= 666 ) then                 --5
	    GiftId = x050026_g_GiftId[16]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 667 and odds <= 684 ) then                 --18
	    GiftId = x050026_g_GiftId[17]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 685 and odds <= 714 ) then                 --30
	    GiftId = x050026_g_GiftId[18]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 715 and odds <= 760 ) then                 --46
	    GiftId = x050026_g_GiftId[19]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 761 and odds <= 814 ) then                 --54
	    GiftId = x050026_g_GiftId[20]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 815 and odds <= 892 ) then                 --78
	    GiftId = x050026_g_GiftId[21]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 893 and odds <= 966 ) then                 --74
	    GiftId = x050026_g_GiftId[22]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  elseif( odds >= 967 and odds <= 1000 ) then                 --34
	    GiftId = x050026_g_GiftId[23]
	    GiftNum = 1
	    strtext = "��ϲ��������ﻶ��ʥ��ñ��װ���󶨣���ף����Ϸ��죡"
	  end
	
	BeginAddItem( sceneId )
		nIndex = AddItem( sceneId, GiftId, GiftNum )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	SetMissionData( sceneId, selfId, MD_GETGIFT_COUNT, nGetGiftCount+1 )
	
	--��־ͳ��
	local guid = LuaFnObjId2Guid(sceneId, selfId)
	log = format("ItemId=%d,Num=%d", GiftId, GiftNum)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_MPCARD_PRIZE, guid, log)
	
	BeginEvent( sceneId )
		AddText( sceneId, strtext )
	EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
  
	--ϵͳ����
	local	bagpos = -1
	bagpos = GetBagPosByItemSn(sceneId, selfId, GiftId)
		
  local ItemInfo
	if bagpos ~= -1 then
	  ItemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
	end
	local PlayerName = GetName(sceneId,selfId)
	local str = format( "#{SDYD_16}����#{SDYD_17}#{_INFOUSR%s}#{SDYD_18}#{_INFOMSG%s}#{SDYD_19}#{_INFOUSR%s}#{SDYD_20}", PlayerName, ItemInfo, PlayerName )
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )

end

--**********************************
--��ý�����ȡ��Ʒ����
--**********************************
function x050026_GetGiftCount( sceneId, selfId )
	  
	local td = GetDayTime()
	local LastGetGiftTime = GetMissionData(sceneId,selfId,MD_GETGIFT_TIME)

	if td > LastGetGiftTime then
	    SetMissionData( sceneId, selfId, MD_GETGIFT_COUNT, 0 )
	    SetMissionData( sceneId, selfId, MD_GETGIFT_TIME, td )
	end
		
	local nGetGiftCount = GetMissionData(sceneId,selfId,MD_GETGIFT_COUNT)

	return nGetGiftCount

end

--**********************************
--����������
--**********************************
function x050026_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050026_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050026_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050026_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x050026_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x050026_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x050026_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x050026_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x050026_OnItemChanged( sceneId, selfId, itemdataId )
end
