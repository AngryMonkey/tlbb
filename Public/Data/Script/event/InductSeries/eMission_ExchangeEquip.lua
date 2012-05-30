-- ��װ�һ�����

--************************************************************************
--MisDescBegin

-- �ű���
x500620_g_ScriptId = 500620

-- ����Ŀ�� NPC
x500620_g_Name = "����"

--MisDescEnd
--************************************************************************

x500620_g_NumText_Main = 1						-- �������ѡ��
x500620_g_NumText_ExchangeLeve76 = 100	--�һ�76����װ
x500620_g_NumText_ExchangeLeve86 = 200	--�һ�86����װ
x500620_g_NumText_ExchangeLeve96 = 300	--�һ�96����װ

x500620_g_EquipName ={{"�һ�������װ","�һ�������װ","�һ�������װ","�һ���¥��װ"},
{"�һ������װ","�һ�������װ","�һ������װ","�һ��ٺ���װ"},
{"�һ�������װ","�һ�̫����װ","�һ�������װ","�һ�������װ"}
}

x500620_g_EquipID ={
{{10521099,10511090,10515099,10520090},{10521100,10511091,10515100,10520091},{10510090,10521101,10511092,10514099},{10510091,10521102,10511093,10514100}},
{{10510092,10511094,10514101,10522099},{10510093,10511095,10514102,10522100},{10510094,10512090,10514103,10523099},{10510095,10512091,10514104,10523100}},
{{10511096,10512092,10520092,10522101,10523101},{10511097,10512093,10520093,10522102,10523102},{10511098,10512094,10520094,10522103,10523103},{10511099,10512095,10520095,10522104,10523104}}
}

x500620_g_Stone = 20310020      --�����
x500620_g_BindStone = 20310021  --�������

--**********************************
-- ������ں���
--**********************************
function x500620_OnDefaultEvent( sceneId, selfId, targetId )	-- ����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x500620_g_Name then		-- �жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local numText = GetNumText()
	
	if numText == x500620_g_NumText_Main then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_2}")
		AddNumText(sceneId, x500620_g_ScriptId, "�һ�76����װ", 6, x500620_g_NumText_ExchangeLeve76)
		AddNumText(sceneId, x500620_g_ScriptId, "�һ�86����װ", 6, x500620_g_NumText_ExchangeLeve86)
		AddNumText(sceneId, x500620_g_ScriptId, "�һ�96����װ", 6, x500620_g_NumText_ExchangeLeve96)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == x500620_g_NumText_ExchangeLeve76 then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_3}")
		for i = 1, getn( x500620_g_EquipName[1] ) do
			AddNumText(sceneId, x500620_g_ScriptId, x500620_g_EquipName[1][i], 6, x500620_g_NumText_ExchangeLeve76+i)
		end
		AddNumText(sceneId, x500620_g_ScriptId, "������һ��", 0, x500620_g_NumText_Main)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == x500620_g_NumText_ExchangeLeve86 then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_7}")
		for i = 1, getn( x500620_g_EquipName[2] ) do
			AddNumText(sceneId, x500620_g_ScriptId, x500620_g_EquipName[2][i], 6, x500620_g_NumText_ExchangeLeve86+i)
		end
		AddNumText(sceneId, x500620_g_ScriptId, "������һ��", 0, x500620_g_NumText_Main)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == x500620_g_NumText_ExchangeLeve96 then
		BeginEvent(sceneId)
		AddText(sceneId, "  #{LLFB_80821_8}")
		for i = 1, getn( x500620_g_EquipName[3] ) do
			AddNumText(sceneId, x500620_g_ScriptId, x500620_g_EquipName[3][i], 6, x500620_g_NumText_ExchangeLeve96+i)
		end
		AddNumText(sceneId, x500620_g_ScriptId, "������һ��", 0, x500620_g_NumText_Main)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		if numText > x500620_g_NumText_ExchangeLeve76 then
			local level = floor( numText/100 )
			local type = mod( numText, 100 )
			
			local str
			if level == 1 then
				str = "#{LLFB_80821_9}"
			elseif level == 2 then
				str = "#{LLFB_80821_10}"
			elseif level == 3 then
				str = "#{LLFB_80821_11}"
			else
				return
			end

			BeginEvent(sceneId)
			AddText(sceneId, str)
			for i = 1, getn( x500620_g_EquipID[level][type] ) do
				AddRadioItemBonus( sceneId, x500620_g_EquipID[level][type][i], 4 )
			end
			EndEvent(sceneId)
			DispatchMissionContinueInfo(sceneId,selfId,targetId,x500620_g_ScriptId,0)
		end
	end
	
end

--**********************************
-- �о��¼�
--**********************************
function x500620_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x500620_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	AddNumText( sceneId, x500620_g_ScriptId, "�����һ������װ", 6, x500620_g_NumText_Main )
end

--**********************************
-- ����������
--**********************************
function x500620_CheckAccept( sceneId, selfId, targetId )
	return 1
end

--**********************************
--����
--**********************************
function x500620_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x500620_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--obj����
--**********************************
function x500620_OnDie( sceneId, objId, selfId )
end

--**********************************
--����
--**********************************
function x500620_OnContinue( sceneId, selfId, targetId )
--	BeginEvent( sceneId )
--		AddText( sceneId, x500620_g_MissionName )
--		AddText( sceneId, "good ����" )
--	EndEvent( )
--	DispatchMissionContinueInfo( sceneId, selfId, targetId, x500620_g_ScriptId, x500620_g_MissionId )
end

--**********************************
--����
--**********************************
function x500620_OnAbandon( sceneId, selfId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x500620_CheckSubmit( sceneId, selfId )
	return 1
end

--**********************************
--�ύ
--**********************************
function x500620_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	local level = -1
	local type = -1
	
	for i = 1, getn( x500620_g_EquipID ) do
		for j = 1, getn( x500620_g_EquipID[i] ) do
			for k = 1, getn( x500620_g_EquipID[i][j] ) do
				if x500620_g_EquipID[i][j][k] == selectRadioId then
					level = i
					type = j
					break
				end
			end
		end
	end
	
	if level == -1 or type == -1 then
		return
	end
	
	local bindCount = LuaFnGetAvailableItemCount(sceneId, selfId, x500620_g_BindStone)
	local Count = LuaFnGetAvailableItemCount(sceneId, selfId, x500620_g_Stone)
	local mustdelnum = level*10
	--PrintStr(bindCount.." + "..Count)

	if bindCount+Count < mustdelnum then
		x500620_NotifyFailTips(sceneId, selfId, "#{LLFB_80821_5}")
		return
	end
	
	--��鱳���ռ�
	BeginAddItem(sceneId)
		AddItem(sceneId, selectRadioId, 1)
	local bBagOk = EndAddItem(sceneId, selfId)
	if bBagOk < 1 then
		x500620_NotifyFailTips(sceneId, selfId, "#{LLFB_80821_6}")
		return
	end
	
	local nItemBagIndexStone = 0
	local szTransferStone = 0
	
	--���ȿ۳��󶨵������
	local bDelOk = 0
	if bindCount >= mustdelnum then
		nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x500620_g_BindStone)
		szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
		
		bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x500620_g_BindStone, mustdelnum)
	else
		nItemBagIndexStone = GetBagPosByItemSn(sceneId, selfId, x500620_g_Stone)
		szTransferStone = GetBagItemTransfer(sceneId,selfId, nItemBagIndexStone)
		
		if bindCount > 0 then
			bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x500620_g_BindStone, bindCount)
		end
		bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x500620_g_Stone, mustdelnum-bindCount)
	end

	if bDelOk < 1  then
		x500620_NotifyFailTips(sceneId, selfId, "#{JPZB_0610_12}")
		return
	end
	
	local nBagIndex = TryRecieveItem( sceneId, selfId, selectRadioId, 1 );
	local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
	x500620_NotifyFailTips(sceneId, selfId, "#{JPZB_0610_13}")
	if level == 1 then
		AuditExchangeXuanHaoYu(sceneId, selfId, 76, selectRadioId)
	elseif level == 2 then
		AuditExchangeXuanHaoYu(sceneId, selfId, 86, selectRadioId)
	elseif level == 3 then
		AuditExchangeXuanHaoYu(sceneId, selfId, 96, selectRadioId)
	end
	
	LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,0)
	
	local message = format("#{LLFB_80821_12}#{_INFOUSR%s}#{LLFB_80821_13}#{_INFOMSG%s}#{LLFB_80821_14}#{_INFOMSG%s}#{LLFB_80821_16}",LuaFnGetName(sceneId, selfId),szTransferStone, szTransferEquip)
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x500620_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x500620_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
