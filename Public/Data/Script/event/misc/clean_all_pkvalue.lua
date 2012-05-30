--ϴɱ��

--�ű��� 
x800112_g_scriptId = 800112

-- *****************************
-- ����Ƿ����㹻���ƶ�ֵ�ͽ�Ǯ
-- ******************************
-- nValue : ��ǰɱ��ֵ
function x800112_CheckCost( sceneId, selfId, targetId ,nValue )

	-- �ƶ�ֵ�۳�ǰ���ж�
	local gb_value = LuaFnGetHumanGoodBadValue( sceneId, selfId )
	if not gb_value or gb_value < nValue * 2000 then
		x800112_NotifyFail( sceneId, selfId, "��������ɱ����Ҫ" .. nValue * 2000 .. "���ƶ�ֵ��Ŀǰ�����ϵ��ƶ�������㡣" ,targetId)
--		Msg2Player( sceneId, selfId, "����ƶ�ֵ����" .. nValue * 1000 .. "��", MSG2PLAYER_PARA )
--		x800112_NotifyFailTips(sceneId, selfId, "��������ɱ����Ҫ" .. nValue * 2000 .. "���ƶ�ֵ��Ŀǰ�����ϵ��ƶ�������㡣");
		return 0
	end

	-- ��Ǯ�۳�ǰ���ж�
	local money = GetMoney( sceneId, selfId )
	if not money or money < nValue * 50000 then
		x800112_NotifyFail( sceneId, selfId, "��������ɱ����Ҫ��Ǯ#{_MONEY" .. nValue * 50000 .. "}�����Ľ�Ǯ���㡣", targetId )
--		Msg2Player( sceneId, selfId, "��Ľ�Ǯ����#{_MONEY" .. nValue * 50000 .. "}��", MSG2PLAYER_PARA )
--		x800112_NotifyFailTips(sceneId, selfId, "��������ɱ����Ҫ��Ǯ#{_MONEY" .. nValue * 20000 .. "}�����Ľ�Ǯ���㡣");
		return 0
	end

	return 1

end

-- *****************
-- �۳��ƶ�ֵ�ͽ��
-- *****************
-- nValue : ��ǰɱ��ֵ
function x800112_PayForClean( sceneId, selfId, nValue )
	local gb_value = LuaFnGetHumanGoodBadValue( sceneId, selfId )

	-- ÿһ��ɱ���۳�2000���ƶ�ֵ
	LuaFnSetHumanGoodBadValue( sceneId, selfId, gb_value - ( nValue * 2000 ) )
	
	-- ÿһ��ɱ���۳�5�����
	CostMoney( sceneId, selfId, nValue * 50000 )
end

-- *************
-- �¼�������
-- *************
function x800112_OnDefaultEvent( sceneId, selfId, targetId )

	-- �õ���ǰɱ��ֵ
	local pk_value = LuaFnGetHumanPKValue(sceneId, selfId);
	if pk_value then
	else
		return 0;
	end

	-- �ж��Ƿ���ɱ��
	if pk_value < 1 then
		x800112_NotifyFail( sceneId, selfId,"�㲢û��ɱ��",targetId)
--		Msg2Player(sceneId, selfId, "�㲢û��ɱ��", MSG2PLAYER_PARA);
		return 0;
	end

	-- ����Ƿ����㹻���ƶ�ֵ�ͽ�Ǯ���۳�����ɱ��
	if x800112_CheckCost( sceneId, selfId, targetId, pk_value ) ~= 1 then
		return 0
	end

	-- ���ݵ�ǰɱ��ֵ���۳��ƶ�ֵ�ͽ��
	x800112_PayForClean( sceneId, selfId, pk_value )

	-- ����������ҵ�ǰ��ɱ��ֵΪ0
	LuaFnSetHumanPKValue(sceneId, selfId, 0)
	LuaFnAuditGoodbadDecPKValue( sceneId, selfId, 0 ); --��¼���ƶ�ֵ����ɱ����ͳ����Ϣ....(0�����������ɱ��)
	
	x800112_NotifyFail( sceneId, selfId,"��ɹ�����������ɱ����",targetId)
--	x800112_NotifyFailTips(sceneId, selfId, "��ɹ�����������ɱ����");
	
	-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
	local LogInfo	= format( "[ChangePKValue]:ClearPKValue sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),			
			pk_value,
			LuaFnGetHumanPKValue(sceneId, selfId) )
	WriteCheckLog( sceneId, selfId, LogInfo )

end

-- ************************
-- NPC�Ի������е��õĺ���
-- ************************
function x800112_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId, x800112_g_scriptId, "�������ɱ��", 6, x800112_g_scriptId)

end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x800112_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--�Ի�����ʾ
function x800112_NotifyFail( sceneId, selfId, Tip ,targetId)
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end
