-- ��������֮�����������¼��ű�
-- �ű���
x600035_g_ScriptId = 600035

-- �����
x600035_g_MissionId = 1111

-- ����Ŀ��npc
x600035_g_Name = "֣����"

-- �����ı�����
x600035_g_MissionName = "��������"
x600035_g_MissionInfo = "������������������"			--��������
x600035_g_NoMissionInfo = "    �����ƺ�û�н���ʲô��"	--���ڽ���ʱ��ʾ
x600035_g_MissionTarget = "��ɰ����ܹܵ�����"		--����Ŀ��
x600035_g_ContinueInfo = "    �������û�����ô��"	--δ��������npc�Ի�
x600035_g_MissionComplete = "̫лл����"				--�������npc˵�Ļ�

x600035_g_MissionParam_SubId = 1

-- ͨ�ó�������ű�
x600035_g_CityMissionScript = 600001

-- �������
x600035_g_SubMissionScriptList = { 600036, 600038, 600039 }

-- ������
x600035_g_ItemAwardIndexOffset = 29						-- ��Ʒ�������ڱ���е���ƫ��
x600035_g_MissionRound = MD_CITY_CONSTRUCT_ROUND		-- ����������������
x600035_g_MissionAbandonTime = MD_CITY_CONSTRUCT_TIME	-- ������������������������ʱ��
x600035_g_ContribType = GUILD_CONTRIB_POINT				-- ��ṱ�׶�
x600035_g_CityProcess = 0								-- 0:���裬1:�о�

--**********************************
--������ں���
--**********************************
function x600035_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600035_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if CityInBuildingLevelUp( sceneId, selfId, sceneId ) ~= 1 then
		x600035_NotifyFailBox( sceneId, selfId, targetId, x600035_g_NoMissionInfo )
		return
	end

	local rand = random( getn(x600035_g_SubMissionScriptList) )
	CallScriptFunction( x600035_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600035_g_MissionId, x600035_g_SubMissionScriptList[rand] )
end

--**********************************
--�о��¼�
--**********************************
function x600035_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600035_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x600035_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600035_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600035_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600035_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600035_g_ScriptId, x600035_g_MissionName,4,-1 )
	end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x600035_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600035_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionAbandonTime )
	return ret
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x600035_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600035_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x600035_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600035_g_MissionId, x600035_g_MissionRound )
end

--**********************************
--�������������������
--**********************************
function x600035_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600035_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionAbandonTime, x600035_g_MissionRound )
end

--**********************************
--����
--**********************************
function x600035_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600035_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600035_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600035_g_MissionId )
	return ret
end

--**********************************
--�ύ���������������
--**********************************
function x600035_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600035_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600035_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600035_g_MissionId, x600035_g_MissionRound )

		-- ��������
		CityIncProgress( sceneId, selfId, sceneId, x600035_g_CityProcess )

		-- ���齱��
		local ExpBonus = CallScriptFunction( x600035_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600035_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- ��ṱ�׶Ƚ���
		local ContribBonus = CallScriptFunction( x600035_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600035_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600035_g_ContribType, ContribBonus )
		end

		-- ��Ʒ����
		CallScriptFunction( x600035_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600035_g_MissionRound, x600035_g_ItemAwardIndexOffset )

		-- ͳ����Ϣ
		LuaFnAuditQuest(sceneId, selfId, x600035_g_MissionName)
	end
end

--**********************************
-- �ж�ĳ���¼����Ƿ�����ڵ�ǰ�¼��б�
--**********************************
function x600035_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600035_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x600035_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
