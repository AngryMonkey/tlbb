--�����
--ʥ����Ԫ���-�ռ����ɵ��߻�����

--�ű���
x050025_g_ScriptId = 050025

--x050025_g_EndDayTime = 7290   --�����ʱ�� 2007-10-18

x050025_g_FuJieId = 20310010			--����ID
x050025_g_HeKaId = {
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


--**********************************
--������ں���
--**********************************
function x050025_OnDefaultEvent( sceneId, selfId, targetId, menpaiId )

	local isTime = x050025_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()
	if NumText == 111 then
	  x050025_GivePlayerFuJie( sceneId, selfId, targetId, menpaiId )
	elseif NumText == 112 then
		BeginEvent(sceneId)
			AddText(sceneId, "#{CHRISTMAS_SHIMEN_HTJS}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x050025_OnEnumerate( sceneId, selfId, targetId )
  
  --���ʱ���Ƿ���ȷ
	local isTime = x050025_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050025_g_ScriptId, "�һ����ɽ��պ���", 6, 111 )
	AddNumText(sceneId, x050025_g_ScriptId, "�������ɽ��պ�������", 11, 112 )													
end

--**********************************
--���ʱ���Ƿ���ȷ
--**********************************
function x050025_CheckRightTime()

	local today = GetDayTime()						--��ǰʱ��
	--local firstDay = 7357								-- 2007�� 12 �� 24 ��
	--local lastDay = 8007								-- 2008�� 1  �� 8  ��
	local firstDay = 8357								-- 2008�� 12 �� 23 ��
	local lastDay = 9007								-- 2009�� 1  �� 8  ��
	
	-- 12 �� 31 �� 0 ʱ ~ 1 �� 7 �� 24 ʱ
	if today <= firstDay or today >= lastDay then
		return 0
	end

	return 1

end

--**********************************
--����ҽ��պ���
--**********************************
function x050025_GivePlayerFuJie( sceneId, selfId, targetId, menpaiId )

	--�رնԻ�����....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

  --�����Ҳ��Ǹñ����ɵĲ��軻ȡ�ؿ�
	if menpaiId ~= GetMenPai( sceneId, selfId ) then 
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_004}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--�����ҵȼ�С��25���軻ȡ�ؿ�
	if	GetLevel( sceneId, selfId) < 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_005}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--����1�����շ���....
	local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050025_g_FuJieId)
	if itemCount < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_006}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	 
	--�����ϰ��Ƿ��еط�....
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_007}" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--�Ƿ�ɾ��ʧ��....
	if 0 == LuaFnDelAvailableItem(sceneId, selfId, x050025_g_FuJieId, 1) then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_006}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--�����ɺ���
	if menpaiId == MP_SHAOLIN then
	   strtext = "��������ֽ��պ���һ�š�"
	   hekaid = x050025_g_HeKaId[1]
	elseif menpaiId == MP_MINGJIAO then
	   strtext = "��������̽��պ���һ�š�"
	   hekaid = x050025_g_HeKaId[2]
	elseif menpaiId == MP_GAIBANG then
	   strtext = "�����ؤ����պ���һ�š�"
	   hekaid = x050025_g_HeKaId[3]
	elseif menpaiId == MP_WUDANG then
	   strtext = "������䵱���պ���һ�š�"
	   hekaid = x050025_g_HeKaId[4]
	elseif menpaiId == MP_EMEI then
	   strtext = "����ö�ü���պ���һ�š�"
	   hekaid = x050025_g_HeKaId[5]
	elseif menpaiId == MP_XINGSU then
	   strtext = "��������޽��պ���һ�š�"
	   hekaid = x050025_g_HeKaId[6]
	elseif menpaiId == MP_DALI then
	   strtext = "������������պ���һ�š�"
	   hekaid = x050025_g_HeKaId[7]
	elseif menpaiId == MP_TIANSHAN then
	   strtext = "�������ɽ���պ���һ�š�"
	   hekaid = x050025_g_HeKaId[8]
	elseif menpaiId == MP_XIAOYAO then
	   strtext = "�������ң���պ���һ�š�"
	   hekaid = x050025_g_HeKaId[9]
	end
	
	BeginAddItem( sceneId )
		nIndex = AddItem( sceneId, hekaid, 1 )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	--��־ͳ��
	local guid = LuaFnObjId2Guid(sceneId,selfId)
	local log = format("menpaiId=%d", menpaiId)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_MPCARD_EXCHANGE, guid, log)
	
	BeginEvent( sceneId )
			AddText( sceneId, strtext )
		EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	--local BagIndex = TryRecieveItem( sceneId, selfId, hekaid, QUALITY_MUST_BE_CHANGE )
	--if BagIndex ~= -1 then
		--BeginEvent( sceneId )
			--AddText( sceneId, strtext )
		--EndEvent( sceneId )
		--DispatchMissionTips( sceneId, selfId )
	--end

end

--**********************************
--����������
--**********************************
function x050025_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050025_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050025_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x050025_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x050025_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x050025_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--ɱ����������
--**********************************
function x050025_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x050025_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x050025_OnItemChanged( sceneId, selfId, itemdataId )
end
