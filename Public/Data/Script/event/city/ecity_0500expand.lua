-- ��������֮�����������¼��ű�
-- �ű���
x600023_g_ScriptId = 600023

-- �����
x600023_g_MissionId = 1110

-- ����Ŀ��npc
x600023_g_Name = "١ܽ��"

-- �����ı�����
x600023_g_MissionName = "��������"
x600023_g_MissionInfo = "������������������"			--��������
x600023_g_MissionTarget = "���١ܽ�ص�����"			--����Ŀ��
x600023_g_ContinueInfo = "    �������û�����ô��"	--δ��������npc�Ի�
x600023_g_MissionComplete = "̫лл����"				--�������npc˵�Ļ�

x600023_g_MissionParam_SubId = 1

-- ͨ�ó�������ű�
x600023_g_CityMissionScript = 600001

-- �������
x600023_g_SubMissionScriptList = { 600024, 600025, 600026, 600027 }

-- ������
x600023_g_ItemAwardIndexOffset = 28						-- ��Ʒ�������ڱ���е���ƫ��
x600023_g_MissionRound = MD_CITY_EXPAND_ROUND			-- ����������������
x600023_g_MissionAbandonTime = MD_CITY_EXPAND_TIME		-- ������������������������ʱ��
x600023_g_ContribType = GUILD_CONTRIB_POINT				-- ��ṱ�׶�
x600023_g_SpecType = GUILD_AMBI_LEVEL					-- רҵֵ����
x600023_g_SpecRate = GUILD_AMBI_RATE					-- רҵ��

--**********************************
--������ں���
--**********************************
function x600023_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600023_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local rand = random( getn(x600023_g_SubMissionScriptList) )
	CallScriptFunction( x600023_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600023_g_MissionId, x600023_g_SubMissionScriptList[rand] )
end

--**********************************
--�о��¼�
--**********************************
function x600023_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600023_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x600023_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600023_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600023_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600023_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600023_g_ScriptId, x600023_g_MissionName,4,-1 )
	end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x600023_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600023_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600023_g_MissionId, x600023_g_MissionAbandonTime )
	return ret
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x600023_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600023_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x600023_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600023_g_MissionId, x600023_g_MissionRound )
end

--**********************************
--�������������������
--**********************************
function x600023_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600023_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600023_g_MissionId, x600023_g_MissionAbandonTime, x600023_g_MissionRound )
end

--**********************************
--����
--**********************************
function x600023_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600023_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600023_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600023_g_MissionId )
	return ret
end

--**********************************
--�ύ���������������
--**********************************
function x600023_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600023_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600023_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600023_g_MissionId, x600023_g_MissionRound )

		-- ���齱��
		local ExpBonus = CallScriptFunction( x600023_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600023_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- ��ṱ�׶Ƚ���
		local ContribBonus = CallScriptFunction( x600023_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600023_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600023_g_ContribType, ContribBonus )
		end

		-- רҵ����
		local SpecBonus = CallScriptFunction( x600023_g_CityMissionScript, "CalcSpecBonus", sceneId, selfId, x600023_g_MissionRound )
		-- print(SpecBonus)
		if SpecBonus > 0 then
		--	CityGetAttr( sceneId, selfId, x600023_g_SpecRate )
			CityChangeAttr( sceneId, selfId, x600023_g_SpecType, SpecBonus )
		end

		-- ��Ʒ����
		CallScriptFunction( x600023_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600023_g_MissionRound, x600023_g_ItemAwardIndexOffset )

		-- ͳ����Ϣ
		LuaFnAuditQuest(sceneId, selfId, x600023_g_MissionName)

		-- ��¼��������һ������
		CallScriptFunction( x600023_g_CityMissionScript, "MissionComplete", sceneId, selfId)
	end
end

--**********************************
-- �ж�ĳ���¼����Ƿ�����ڵ�ǰ�¼��б�
--**********************************
function x600023_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600023_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

