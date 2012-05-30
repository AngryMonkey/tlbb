--ϴɱ��

--�ű���
x800110_g_scriptId = 800110

x800110_g_ModScript = 800112

function x800110_OnDefaultEvent( sceneId, selfId, targetId )

	-- �õ���ǰɱ��ֵ
	local pk_value = LuaFnGetHumanPKValue(sceneId, selfId);
	if pk_value then
	else
		return 0;
	end

	-- �ж��Ƿ���ɱ��
	if pk_value < 1 then
		x800110_NotifyFail(sceneId, selfId, "�㲢û��ɱ��",targetId)
--		Msg2Player(sceneId, selfId, "�㲢û��ɱ��", MSG2PLAYER_PARA);
		return 0;
	end

	-- ����Ƿ����㹻���ƶ�ֵ�ͽ�Ǯ���۳�1��ɱ��
	if CallScriptFunction( x800110_g_ModScript, "CheckCost", sceneId, selfId, targetId ,1 ) ~= 1 then
		return 0
	end

	-- ����1��ɱ��ֵ���۳��ƶ�ֵ�ͽ��
	CallScriptFunction( x800110_g_ModScript, "PayForClean", sceneId, selfId, 1 )
	
	-- �۳�1��ɱ��ֵ
	LuaFnSetHumanPKValue(sceneId, selfId, pk_value - 1)
	LuaFnAuditGoodbadDecPKValue( sceneId, selfId, 1 ); --��¼���ƶ�ֵ����ɱ����ͳ����Ϣ....
	
	x800110_NotifyFail( sceneId, selfId, "��ɹ�������1��ɱ����" ,targetId)
--	x800110_NotifyFailTips(sceneId, selfId, "��ɹ�������1��ɱ����");
	
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
function x800110_OnEnumerate( sceneId, selfId,targetId )

	AddNumText(sceneId, x800110_g_scriptId, "���1��ɱ��", 6, x800110_g_scriptId)

end


--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x800110_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--�Ի�����ʾ
function x800110_NotifyFail( sceneId, selfId, Tip ,targetId)
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)
end
