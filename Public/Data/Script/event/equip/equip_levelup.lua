--װ������
--�ű���
x809263_g_ScriptId = 809263

--װ������UI 1003

--**********************************
--�о��¼�
--**********************************
function x809263_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--װ������
--**********************************
function x809263_EquipLevelUp( sceneId, selfId, nItemIndex1, nItemIndex2)
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex1 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"��װ�������á�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"������ʯ�����á�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	equip_level = GetBagItemLevel( sceneId, selfId, nItemIndex1 )
	if equip_level < 60 then
		BeginEvent(sceneId)
		AddText(sceneId,"60�����µ�װ������������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if gem_index ~= 30900008 then
		--������ʯ
		BeginEvent(sceneId)
		AddText(sceneId,"װ��������Ҫ������ʯ��");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	money = GetMoney( sceneId, selfId )
	need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 20000
	if money < need_money then
		BeginEvent(sceneId)
		AddText(sceneId,"��Ǯ���㡣");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = GetGemEmbededCount( sceneId, selfId, nItemIndex1 )
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"��Ƕ��ʯ��װ������������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	ret, arg0 = LuaFnEquipLevelUp( sceneId, selfId, nItemIndex1, nItemIndex2 )
	
	local text="װ�������ɹ���"
	if ret == 0 then
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		LuaFnCostMoney( sceneId, selfId, need_money )
		if arg0 == 0 then
			text="��ϲ����װ���ɹ��������쿴�������������װ���ɡ�"
		else
			text="��ϲ��װ���ɹ�����������ǿ���ȼ���1������װ����ǿ���ȼ�Ϊ"..tostring(arg0)
		end
	end

	if ret == -1 then
		text="δ֪����"
	end

	if ret == -2 then
		text="װ�������á�"
	end
	
	if ret == -3 then
		text="������ʯ�����á�"
	end

	if ret == -6 then
		text="δ֪����"
	end

	if ret == -7 then
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnCostMoney( sceneId, selfId, need_money )
		text="̫�������ˣ�����װ������ʧ���ˣ�"
	end

	if ret == -8 then
		text="��װ���޷�������"
	end

	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
