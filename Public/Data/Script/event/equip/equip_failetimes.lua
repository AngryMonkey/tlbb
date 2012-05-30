--װ����������ʧ�ܴ���
--�ű���
x809265_g_ScriptId = 809265

--��������ʧ�ܴ���UI 1005

--**********************************
--�о��¼�
--**********************************
function x809265_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--��������ʧ�ܴ���
--**********************************
function x809265_EquipFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2)

	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex1 )
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"��װ�������á�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"����¶�����á�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemIndex2);


	local sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900007 and sy_index ~= 30900000   then
		BeginEvent(sceneId)
		AddText(sceneId,"��������ʧ�ܴ�����Ҫ����¶��");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local	text	= "����ɹ�"
	local money = GetMoney( sceneId, selfId )
	local jiaozi = GetMoneyJZ(sceneId, selfId);
	local need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 200
	if money+jiaozi < need_money then
		text="���͸�װ������ʧ�ܴ�����Ҫ#{_EXCHG%d}�������ϵ��ֽ��㡣"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local szMsg;
	local szName;
	szName = GetName( sceneId, selfId );		
	
	if sy_index == 30900007  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 1 )
		szMsg = format( "#W#{_INFOUSR%s}#Hʹ����#W#{_INFOMSG%s}#H֮��װ���Ŀ���������ɹ�����1�Σ�������װ������ʧ��3�κ����ѡ�", szName, szTransfer );
	elseif sy_index == 30900000  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 0 )
		szMsg = format( "#W#{_INFOUSR%s}#Hʹ����#W#{_INFOMSG%s}#H֮��װ���Ŀ���������ɹ��Ļָ���Ϊ3�Σ�������װ������ʧ��3�κ����ѡ�", szName, szTransfer );
	end

	if ret == 0 then
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);

		
		AddGlobalCountNews( sceneId, szMsg )
		
	end
	
	if ret == -1 then
		text="δ֪����"
	end

	if ret == -2 then
		text="װ�������á�"
	end
	
	if ret == -3 then
		text="����¶�����á�"
	end

	if ret == -4 then
		text="����ʧ�ܴ����Ѿ�����ˡ�"
	end

	BeginEvent(sceneId)
		AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
