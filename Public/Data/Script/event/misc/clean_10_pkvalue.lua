--ϴɱ��

--�ű���
x800111_g_scriptId = 800111

x800111_g_ModScript = 800112


function x800111_OnDefaultEvent( sceneId, selfId, targetId )

	-- �õ���ǰɱ��ֵ
	pk_value = LuaFnGetHumanPKValue(sceneId, selfId);
	if pk_value then
	else
		return 0;
	end

	-- �ж��Ƿ���10��ɱ��
	if pk_value < 10 then
		x800111_NotifyFail(sceneId, selfId, "���ɱ������10��",targetId)
--		Msg2Player(sceneId, selfId, "���ɱ������10��", MSG2PLAYER_PARA);
		return 0;
	end

	-- ����Ƿ����㹻���ƶ�ֵ�ͽ�Ǯ���۳�10��ɱ��
	if CallScriptFunction( x800111_g_ModScript, "CheckCost", sceneId, selfId, targetId ,10 ) ~= 1 then
		return 0
	end

	-- ����10��ɱ��ֵ���۳��ƶ�ֵ�ͽ��
	CallScriptFunction( x800111_g_ModScript, "PayForClean", sceneId, selfId, 10 )
	
	-- �۳�10��ɱ��ֵ
	LuaFnSetHumanPKValue(sceneId, selfId, pk_value - 10)
	LuaFnAuditGoodbadDecPKValue( sceneId, selfId, 10 ); --��¼���ƶ�ֵ����ɱ����ͳ����Ϣ....

	x800111_NotifyFail( sceneId, selfId,"��ɹ�������10��ɱ����" ,targetId)
--	x800111_NotifyFailTips(sceneId, selfId, "��ɹ�������10��ɱ����");

	-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
	local LogInfo	= format( "[ChangePKValue]:ClearPKValue sceneId=%d, GUID=%0X, PKValueBgn=%d, PKValueEnd=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),			
			pk_value,
			LuaFnGetHumanPKValue(sceneId, selfId) )
	WriteCheckLog( sceneId, selfId, LogInfo )

	return 1;

end


-- ************************
-- NPC�Ի������е��õĺ���
-- ************************
function x800111_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId, x800111_g_scriptId, "���10��ɱ��", 6, x800111_g_scriptId)

end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x800111_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--�Ի�����ʾ
function x800111_NotifyFail( sceneId, selfId, Tip, targetId)
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end
