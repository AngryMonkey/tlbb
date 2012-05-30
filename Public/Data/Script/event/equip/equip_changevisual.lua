--װ���ı�����
--�ű���
x809264_g_ScriptId = 809264

--װ���ı�����UI 1010

--**********************************
--�о��¼�
--**********************************
function x809264_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--װ���ı�����
--**********************************
function x809264_ChangeVisual( sceneId, selfId, nItemIndex1, nItemIndex2, nVisualIndex)
	local text="�ı����γɹ���"

	local ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex1 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"�����ɱ��ε�װ����");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"�������η���");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900004 then
		--���η�
		BeginEvent(sceneId)
		AddText(sceneId,"�ı�װ��������Ҫ���η���");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	money = GetMoney( sceneId, selfId )
	need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 20000
	if money < need_money then
		text="ǿ����װ����������Ҫ#{_MONEY%d}�������ϵ��ֽ��㡣"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	ret, arg0 = LuaFnChangeVisual( sceneId, selfId, nItemIndex1, nItemIndex2, nVisualIndex )

	if ret == 0 then
		LuaFnCostMoney( sceneId, selfId, need_money )
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end
	
	if ret == -1 then
		text="��װ�����ɱ��Ρ�"
	end

	if ret == -2 then
		text="װ�������á�"
	end
	
	if ret == -3 then
		text="���η������á�"
	end

	if ret == -4 then
		text="���ܸı����ͬ���Ρ�"
	end

	if ret == -5 then
		text="Ҫ�ı�����β����ڡ�"
	end

	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
