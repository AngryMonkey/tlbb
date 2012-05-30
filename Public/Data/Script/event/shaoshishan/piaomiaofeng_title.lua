
-- ��翷�ƺ�	20090220 by zhangguoxin
x402305_g_scriptId = 402305

--Ʈ������
x402305_g_XuanFuID = 20310112

--�һ�����
x402305_g_Cost = {1,15,45,90}
--�ƺ�id
x402305_g_TitleID = {256,257,258,259}
--��ͬ�ȼ���ʧ����ʾ
x402305_g_FailMsg = {"#{PMF_REMINDINF_002}","#{PMF_REMINDINF_003}","#{PMF_REMINDINF_004}","#{PMF_REMINDINF_005}"}
--�ƺŵȼ�
x402305_g_TitleLvNum = 4;
--�ƺ�idx ������
x402305_g_TitleIndex = 19;


function x402305_ChangePiaoMiaoTitle(sceneId, selfId, targetId,titleLv)
	
	--DeleteTitle(sceneId,selfId,x402305_g_TitleIndex);
	--�Ϸ��Լ��
	if titleLv < 1 and titleLv > x402305_g_TitleLvNum then
		return
	end
	
	--��ɫ���гƺ�	
	local HadTitleID = GetTitle(sceneId,selfId,x402305_g_TitleIndex)
	
	if (titleLv == 1) then
		--�Ƿ����гƺ�
		if (HadTitleID == x402305_g_TitleID[1]
				or HadTitleID == x402305_g_TitleID[2]
				or HadTitleID == x402305_g_TitleID[3]
				or HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
	end
	
	if (titleLv == 2) then
		--�Ƿ����гƺ�
		if (HadTitleID == x402305_g_TitleID[2]
				or HadTitleID == x402305_g_TitleID[3]
				or HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--�Ƿ�����һ�ȼ��ĳƺ�
		if (HadTitleID ~= x402305_g_TitleID[1]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
		end
	end
	
	if (titleLv == 3) then
		--�Ƿ����гƺ�
		if (HadTitleID == x402305_g_TitleID[3]
				or HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--�Ƿ�����һ�ȼ��ĳƺ�
		if (HadTitleID ~= x402305_g_TitleID[2]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
		end
	end
	
	if (titleLv == 4) then
		--�Ƿ����гƺ�
		if (HadTitleID == x402305_g_TitleID[4]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, "#{PMF_REMINDINF_001}")	
			return
		end
		--�Ƿ�����һ�ȼ��ĳƺ�
		if (HadTitleID ~= x402305_g_TitleID[3]) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
		end
	end
	
	--�����������
	local checkRet = x402305_CheckXuanFu(sceneId,selfId,targetId,x402305_g_Cost[titleLv]);
	if (checkRet ~= 1) then
			x402305_NotifyFailBox(sceneId, selfId, targetId, x402305_g_FailMsg[titleLv])
			return
	end
	
	--�۳�����
	local costRet = x402305_CostXuanFu(sceneId,selfId,targetId,x402305_g_Cost[titleLv]);
	if (costRet ~= 1) then
		x402305_NotifyFailBox(sceneId, selfId, targetId, "�۳���Ʒʧ�ܣ�")
		return
	end
	
	--����ƺ�
	AwardTitle( sceneId, selfId, x402305_g_TitleIndex, x402305_g_TitleID[titleLv])
	--дaudit��־ add by zhangguoxin 090226
	local guid = LuaFnObjId2Guid(sceneId, selfId);
	local LogInfo = format("LUAAUDIT_TITLE_GET,0X%08X,%d,",guid,x402305_g_TitleID[titleLv]);
	LuaFnAuditGeneralLog(LogInfo);
	--���¿ͻ���
	DispatchAllTitle(sceneId,selfId)
	--���õ�ǰ�ƺ�
	SetCurTitle(sceneId,selfId,43,x402305_g_TitleID[titleLv])
	--�رնԻ���
	x402305_CloseWindow(sceneId,selfId, targetId)
	--���͹���
	x402305_SendNotice(sceneId, selfId, targetId,titleLv)
	--����Ч
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0)
	--��Ŀ��ʾ
	x402305_MsgBox(sceneId, selfId,"#{PMF_090302_6}")
end

--���͹���
function x402305_SendNotice(sceneId, selfId, targetId,lv)

	--�Ϸ��Լ��
	if lv < 1 and lv > x402305_g_TitleLvNum then
		return
	end
	
	local strformat;
	
	if (lv == 1) then
		strformat	= "#{PMF_NOTICE_001}#W#{_INFOUSR%s}#{PMF_NOTICE_002}"
	end
	if (lv == 2) then
		strformat	= "#{PMF_NOTICE_003}#W#{_INFOUSR%s}#{PMF_NOTICE_004}"
	end
	if (lv == 3) then
		strformat	= "#{PMF_NOTICE_005}#W#{_INFOUSR%s}#{PMF_NOTICE_006}"
	end
	if (lv == 4) then
		strformat	= "#{PMF_NOTICE_007}#W#{_INFOUSR%s}#{PMF_NOTICE_008}"
	end
	
	local strText = format(strformat, GetName(sceneId,selfId))	
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
end

--�����Ʒ
function x402305_CheckXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x402305_g_XuanFuID)
	
	if (nCount < num) then
		return 0;
	end
	
	return 1;
end

--�۳���Ʒ
function x402305_CostXuanFu(sceneId, selfId, targetId,num)
	if num <= 0 then
		return 0
	end
	
	local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x402305_g_XuanFuID, num)
	if (ret1 < 1) then
		return 0;
	end
	
	return 1;
end

--�رնԻ���
function x402305_CloseWindow(sceneId,selfId, targetId)
	BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--������ں���
--**********************************
function x402305_OnDefaultEvent( sceneId, selfId, targetId )
	local nNum = GetNumText()
	
	--��һ�����
	if (nNum == 10) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_1}")
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_03}", 6, 21 )
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_04}", 6, 22 )
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_05}", 6, 23 )
			AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_06}", 6, 24 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--����
	if (nNum == 11) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090220_02}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	--�ڶ������
	if (nNum == 21) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_2}")
			AddNumText( sceneId, x402305_g_scriptId, "��Ҫ�һ�", 6, 1 )
			AddNumText( sceneId, x402305_g_scriptId, "��������", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 22) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_3}")
			AddNumText( sceneId, x402305_g_scriptId, "��Ҫ�һ�", 6, 2 )
			AddNumText( sceneId, x402305_g_scriptId, "��������", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 23) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_4}")
			AddNumText( sceneId, x402305_g_scriptId, "��Ҫ�һ�", 6, 3 )
			AddNumText( sceneId, x402305_g_scriptId, "��������", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 24) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{PMF_090302_5}")
			AddNumText( sceneId, x402305_g_scriptId, "��Ҫ�һ�", 6, 4 )
			AddNumText( sceneId, x402305_g_scriptId, "��������", 0, 100 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId,x402305_g_scriptId,0)
	end
	
	if (nNum == 100) then
		--�رնԻ���
		x402305_CloseWindow(sceneId,selfId, targetId)
	end
	
	--ȷ�϶һ�
	if nNum >= 1 and nNum <= x402305_g_TitleLvNum then
		x402305_ChangePiaoMiaoTitle(sceneId, selfId, targetId,nNum)
	end
end

--**********************************
--�о��¼�
--**********************************
function x402305_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x402305_g_scriptId, "�һ���翷�ƺ�", 3, 10 )	
	AddNumText( sceneId, x402305_g_scriptId, "#{PMF_090220_01}", 11, 11 )	
end

--**********************************
--����������
--**********************************
function x402305_CheckAccept( sceneId, selfId )
	return 1
end

--**********************************
--����
--**********************************
function x402305_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x402305_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x402305_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x402305_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ͳ����ﵰ�Ĺ���
--**********************************
function x402305_ShowSystemNotice( sceneId, selfId, strItemInfo,iIndex )
		
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x402305_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x402305_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x402305_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x402305_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x402305_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x402305_OnItemChanged( sceneId, selfId, itemdataId )
end


