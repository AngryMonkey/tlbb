-- 210242
-- ���ڻ���һ���쵰

x210242_g_ScriptId = 210242

x210242_g_ItemId = {30505114,30505115,30505116,30505117,30505118,30505119,30505120,}

x210242_g_PetEggId = 30505121

-- ����������Ƭ�ʱ��[2009/2/15, 2009/4/1]
x210242_g_Drop_QiXingSuiPian_StartDay = 9045 --2009/2/15��ʼ
x210242_g_Drop_QiXingSuiPian_EndDay = 9090 --2009/4/1����

-- �һ���쵰�ʱ��[2009/2/15, 2009/5/1]
x210242_g_ExchangePenguinEggStartDay	= 9045 --2009/2/15��ʼ
x210242_g_ExchangePenguinEggEndDay		= 9120 --2009/5/1����
	
--**********************************
--������ں���
--**********************************
function x210242_OnDefaultEvent( sceneId, selfId, targetId )
	
	-- �ʱ�䣬ֻ������ʱ��������ʾ����Ի�
	if x210242_IsValidPenguinEggExchangeTime() == 0    then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y�һ����" );
			AddText(sceneId, "    ��Ѿ����ڡ�" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y�һ����" );
			AddText(sceneId, "  ���ȵ���������벻��Ҫһ�����磿�벻��Ҫһ���������벻��Ҫһ˿��ˬ��" );
			AddText(sceneId, "  ֻҪ��ȫ���߿�������Ƭ����Ͷ����Ի������" );
			AddText(sceneId, "  һλ��֪���ĳ��ߣ�����ʹ����Щ��Ƭ���������˲��������ø�����ˬ������Ϊ���������������͸��ռ�������Ƭ����һ������ˬ�����" );
			AddText(sceneId, "  һֻ�ɰ�����죡" );
			AddText(sceneId, "  ��ȷ��Ҫ�һ���쵰��" );
			AddNumText(sceneId, x210242_g_ScriptId,"ȷ��", 8, 3);
			AddNumText(sceneId, x210242_g_ScriptId,"ȡ��", 8, 4);
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 3   then
		
		-- 1�������������ǲ�����һ����Ƭ��
		local HaveAllItem = 1
		for i, ItemId in x210242_g_ItemId  do
			if GetItemCount(sceneId, selfId, ItemId) < 1   then
				HaveAllItem = 0
			end
			if GetItemCount(sceneId, selfId, ItemId) == 1   then
				BagHavePos = 1
			end
		end
		
		if HaveAllItem == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    �һ���쵰��Ҫ��ľ��ˮ���������ա���������Ƭ��һ���������ϵ���Ƭ��ȫ������޷��һ���" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 2�������ҵ�������Ƭ�ǲ��Ƕ��ܹ�ɾ��
		local AllItemCanDelete = 1
		for i, ItemId in x210242_g_ItemId  do
			if LuaFnGetAvailableItemCount(sceneId, selfId, ItemId) < 1   then
				AllItemCanDelete = 0
				break;
			end
		end
		
		if AllItemCanDelete == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    �۳������ϵ���Ʒʧ�ܣ��������Ƿ����Ʒ������������Ʒ���ڽ���״̬��" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 3�������������ǲ����пռ�Ž���
	 	BeginAddItem(sceneId)
			AddItem( sceneId, x210242_g_PetEggId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		local delret = 1
		if ret == 1  then
			for i, ItemId in x210242_g_ItemId  do
				if LuaFnDelAvailableItem(sceneId, selfId, ItemId, 1) == 0   then
					delret = 0
					break
				end
			end
			
			if delret == 1  then
				AddItemListToHuman(sceneId,selfId)
				-- �����繫��
				local transfer = GetItemTransfer(sceneId,selfId,0)
				local str = format("#P #{_INFOUSR%s}����һ��Ŭ���������ռ�ȫ���������׵Ľ��ǡ�ľ�ǡ�ˮ�ǡ����ǡ����ǡ�������̫���߿���Ƭ����Ϊ��л������Ĺ����������͸���һ��#{_INFOMSG%s}��",GetName(sceneId,selfId), transfer)
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)

				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
			end
		end
		return

	end
	
	if GetNumText() == 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y�һ����" );
			AddText(sceneId, "#{duihuanqie_shuoming}" );
			
			--AddText(sceneId, "    ���ȵ���������벻��Ҫһ�����磿�벻��Ҫһ���������벻��Ҫһ˿��ˬ��" );
			--AddText(sceneId, "    ֻҪ��ȫ���߿�������Ƭ����Ͷ����Ի������" );
			--AddText(sceneId, "    һλ��֪���ĳ��ߣ�����ʹ����Щ��Ƭ���������˲��������ø�����ˬ������Ϊ���������������͸��ռ�������Ƭ����һ������ˬ�����" );
			--AddText(sceneId, "    һֻ�ɰ�����죡" );
			--AddText(sceneId, "    ��Ƭ��Ӧ�����޲�ͬ��������Ϊ�ѵõ���̫����Ƭ��ֻ���ڲɼ���ҩ���߲ɼ���ʯ��ʱ�򣬲��п��ܻ��������Ƭ���е�һ�֡�" );
			--AddText(sceneId, "    ������������Ƭ��ľ����Ƭ��ˮ����Ƭ��������Ƭ��������Ƭ��������Ƭ��̫����Ƭ֮�󣬰����ǽ����ҡ��ҾͿ��Դ���λ�����͸���һö���º�������쵰����쵰��������ȼ����ڵ���55��ʱʹ�ã�ʹ�ú󽫻��ٻ���һֻ��챦����Ϊ������ޡ�" );
			--AddText(sceneId, "    ��Ҫ˵�����ǣ�������Ƭֻ�оۼ���һ���ʱ����м�ֵ����Ȼ�������һЩ��Ƭ���Գ��۸��̵껻ȡ�����Ľ�Ǯ��" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--�о��¼�
--**********************************
function x210242_OnEnumerate( sceneId, selfId, targetId )
	
	-- ���Чʱ���ж�
	if x210242_IsValidPenguinEggExchangeTime() == 0    then
		-- �����Ѿ����ڣ��Ͳ�����ʾ��Щ����
		return
	end

	AddNumText(sceneId, x210242_g_ScriptId,"��Ҫ�һ���쵰", 6, 1);
	AddNumText(sceneId, x210242_g_ScriptId,"���ڶһ���쵰", 0, 2);

end

--**********************************
--����������
--**********************************
function x210242_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x210242_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x210242_OnAbandon( sceneId, selfId )
end


--**********************************
--����Ƿ�����ύ
--**********************************
function x210242_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x210242_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--���������¼�
--**********************************
function x210242_OnEnterZone( sceneId, selfId, zoneId )
end


-- �Ƿ�Ϸ��һ���쵰�ʱ��
function x210242_IsValidPenguinEggExchangeTime()
	local theDay = GetDayTime()
	if theDay < x210242_g_ExchangePenguinEggStartDay or
		 theDay > x210242_g_ExchangePenguinEggEndDay then
		return 0 --�ǻʱ��
	end
	
	return 1
end

--**********************************
--��һ��̫��ʯ ��ʱ���ڵ�����ڻ��
--**********************************
function x210242_PickupItem( sceneId, selfId, itemId, bagidx )
	-- #P X�ٳ���һ���ʯ�����ɾ�����֮�󣬲ŷ��־�Ȼ��һ��Y��
	local transfer = GetBagItemTransfer(sceneId, selfId, bagidx)
	local str = format("#P #{_INFOUSR%s}�ٳ���һ���ʯ�����ɾ�����֮�󣬲ŷ��־�Ȼ��һ��#{_INFOMSG%s}��",GetName(sceneId,selfId), transfer)
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
end

function x210242_CheckPercentOK( numerator, denominator )
  --����Ϊ����,��ĸ. ���� ( 100, 10000 ) ��ʾ����Ϊ 100 / 10000
  local roll = random( denominator )
  if roll <= numerator then
      return 1
  end
  return 0
end

--**********************************
--����Ƿ���ȷ�Ļʱ��(����������Ƭ)
--**********************************
function x210242_IsValidDayToDrop_QiXingSuiPian()
    local DayTime = GetDayTime()
    if DayTime < x210242_g_Drop_QiXingSuiPian_StartDay or
    	 DayTime > x210242_g_Drop_QiXingSuiPian_EndDay	 then
       return 0    --�ǻʱ��
    end
    
    return 1  
end

function x210242_DropStoneList(sceneId, LongzhuIndex) 
  --��	0.0200 	0.00667
	--ľ	0.0050 	0.00167
	--ˮ	0.0020 	0.00067
	--��	0.0011 	0.00037
	--��	0.0007 	0.00023
	--��	0.0004 	0.00013
	--��	0.0002 	0.00007

  if 0 == x210242_IsValidDayToDrop_QiXingSuiPian()  then
  	return -1
  end
  
  if 1 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 667, 100000 )--0.00667
      if 1 == CheckOK then
          return 30505114
      end
  end
  
  if 2 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 167, 100000 )
      if 1 == CheckOK then
          return 30505115
      end
  end
  
  if 3 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 67, 100000 )
      if 1 == CheckOK then
          return 30505116
      end
  end
  
  if 4 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 37, 100000 )
      if 1 == CheckOK then
          return 30505117
      end
  end
  
  if 5 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 23, 100000 )
      if 1 == CheckOK then
          return 30505118
      end
  end
  
  if 6 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 13, 100000 )
      if 1 == CheckOK then
          return 30505119
      end
  end
  
  if 7 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 7, 100000 )
      if 1 == CheckOK then
          return 30505120
      end
  end
  
  return -1
    
end
