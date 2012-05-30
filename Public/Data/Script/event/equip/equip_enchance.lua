--װ��ǿ��
--�ű���
x809262_g_ScriptId = 809262

x809262_g_QianghualuId = 30900045

x809262_g_QianghualuTime = 11
gem_index = 30900045
--װ��ǿ��UI 1002

--**********************************
--�о��¼�
--**********************************
function x809262_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--װ��ǿ�����
--**********************************
function x809262_FinishEnhance( sceneId, selfId, itemidx1, itemidx2 )
	local ret = LuaFnIsItemLocked( sceneId, selfId, itemidx1 )
	
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"��װ�������á�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, itemidx2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		--AddText(sceneId,"��ǿ�����������á�");
		AddText(sceneId,"��ǿ��������ǿ��¶�����á�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	equip_level = GetBagItemLevel( sceneId, selfId, itemidx1 )
	gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemidx2 )
	if equip_level < 40 then
	
		if gem_index ~= 30900005 then
			--�ͼ�ǿ������
			str	= format( "��װ��ǿ����Ҫ%s��", GetItemName( sceneId, 30900005 ) )
			BeginEvent(sceneId)
			AddText(sceneId,str);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	else

		if gem_index ~= 30900006 and gem_index ~= x809262_g_QianghualuId then
			--�߼�ǿ������
			str	= format( "��װ��ǿ����Ҫ%s��%s��", GetItemName( sceneId, 30900006 ), GetItemName( sceneId, x809262_g_QianghualuId ) )
			BeginEvent(sceneId)
			AddText(sceneId,str);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	end

	--����Ƿ��ܹ�ǿ�� 
	ret, arg0 = LuaFnEquipEnhanceCheck( sceneId, selfId, itemidx1, itemidx2 )
	local text="װ��ǿ���ɹ���"
	-- zchw
	equip_index = tonumber(LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemidx1 )); 
	if (equip_index ==10423024) or (equip_index == 10422016) then --��¥����¥��
		if tonumber(gem_index) == 30900006 then --ǿ������
			bindStatus = tonumber(LuaFnGetItemBindStatus(sceneId, selfId, itemidx2));
			if bindStatus == 1 then --��
				text = "��װ���������Ѱ󶨵����ǿ������ǿ����";
				BeginEvent(sceneId);
				AddText(sceneId,text);
				EndEvent(sceneId);
				DispatchMissionTips(sceneId,selfId);
				return
			end
		end
	end
	if ret == 0 then
		--ǿ�����ļ��ɹ�
		x809262_DoFinishEnhance( sceneId, selfId, itemidx1*1000+itemidx2)
		return
	end
	
	if ret == -1 then
		text="δ֪����"
	end
	
	if ret == -2 then
		text="װ�������á�"
	end
	
	if ret == -3 then
		--text="ǿ�����������á�"
		text="ǿ��������ǿ��¶�����á�"
	end
	
	if ret == -4 then
		text="��װ����ǿ���ȼ��Ѿ����"
	end

	if ret == -5 then
		text="ǿ����װ����Ҫ#{_EXCHG%d}�������ϵ��ֽ��㡣" --zchw
		text=format( text, arg0 )
	end
	
	if ret == -7 then
		text="��װ�����ܱ�ǿ����"
	end

	if ret == -6 then
		--��Ҫȷ�Ͻ���
		--text="ǿ��ʧ��֮��ǿ���ȼ�������"..tostring(arg0).."���Ƿ����ǿ����"
		--BeginUICommand(sceneId)
			--UICommand_AddInt(sceneId,x809262_g_ScriptId);
			--UICommand_AddInt(sceneId,targetId);
			--UICommand_AddInt(sceneId,itemidx1*1000+itemidx2);
			--UICommand_AddString(sceneId,"DoFinishEnhance");
			--UICommand_AddString(sceneId,text);
			--EndUICommand(sceneId)
		--DispatchUICommand(sceneId,selfId, 24)
		x809262_DoFinishEnhance( sceneId, selfId, itemidx1*1000+itemidx2)
		return
	end
	
	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end

--**********************************
--װ��ǿ��
--**********************************
function x809262_DoFinishEnhance( sceneId, selfId, index )
	local itemidx1 = floor(index / 1000)
	local itemidx2 = mod(index , 1000)
	local text="װ��ǿ���ɹ���"

	--ǿ��
	local ret,arg0 = LuaFnEquipEnhance( sceneId, selfId, itemidx1, itemidx2 )

	if ret == 0 then
		if arg0 >= 2 then
			local	szTranItm1	= GetBagItemTransfer( sceneId, selfId, itemidx1 )
			local	szTranItm2	= GetBagItemTransfer( sceneId, selfId, itemidx2 )
			local	szMsg				= format( "#W#{_INFOUSR%s}#{EQ_1}#{_INFOMSG%s}#{EQ_2}%d#{EQ_3}#{_INFOMSG%s}#{EQ_4}",
														LuaFnGetName( sceneId, selfId ), szTranItm2, arg0, szTranItm1 )
			--���澫��С��5����ǿ������������
			if (arg0 >= 5) then
				AddGlobalCountNews( sceneId, szMsg )
			end
		end
		
		gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, itemidx2 )
		
		if x809262_g_QianghualuId == gem_index then
			local r, t = LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			--PrintNum(r);
			--PrintNum(t)
			
			BeginEvent(sceneId)
			--local str = "���ǿ��¶ʣ��ʹ�ô���%d"
			local	szMsg				= format( "���ǿ��¶ʣ��ʹ�ô���%d/%d",
														tonumber(t), tonumber(x809262_g_QianghualuTime) );
			AddText(sceneId,szMsg);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		else
			LuaFnEraseItem( sceneId, selfId, itemidx2 )
		end
		
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end

	if ret == -1 then
		text="δ֪����"
	end
	
	if ret == -2 then
		text="װ�������á�"
	end
	
	if ret == -3 then
		text="ǿ�����������á�"
	end
	
	if ret == -4 then
		text="��װ����ǿ���ȼ��Ѿ����"
	end

	if ret == -5 then
		text="ǿ����װ����Ҫ#{_EXCHG%d}�������ϵ��ֽ��㡣" --zchw
		text=format( text, arg0 )
	end

	if ret == -6 then
		text="�ÿ�ϧ������װ��ǿ��ʧ����,�����!!!"
		
		if x809262_g_QianghualuId == gem_index then
			local r, t = LuaFnEraseItemTimes( sceneId, selfId, itemidx2, x809262_g_QianghualuTime )
			--PrintNum(r);
			--PrintNum(t)
			
			BeginEvent(sceneId)
			local	szMsg				= format( "���ǿ��¶ʣ��ʹ�ô���%d/%d",
														tonumber(t), tonumber(x809262_g_QianghualuTime) );
			AddText(sceneId,szMsg);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
	
		else
			LuaFnEraseItem( sceneId, selfId, itemidx2 )
		end
		--LuaFnEraseItem( sceneId, selfId, itemidx2 )
	end

	BeginEvent(sceneId)
	AddText(sceneId,text);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
