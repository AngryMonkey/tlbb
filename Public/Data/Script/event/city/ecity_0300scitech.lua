-- ��������֮�Ƽ��������¼��ű�
-- �ű���
x600012_g_ScriptId = 600012

-- �����
x600012_g_MissionId = 1107

-- ����Ŀ��npc
x600012_g_Name = "ƈд"

-- �����ı�����
x600012_g_MissionName = "�Ƽ�����"
x600012_g_MissionInfo = "�����������Ƽ�����"			--��������
x600012_g_MissionTarget = "���ƈд������"				--����Ŀ��
x600012_g_ContinueInfo = "    �������û�����ô��"	--δ��������npc�Ի�
x600012_g_MissionComplete = "̫лл����"				--�������npc˵�Ļ�

x600012_g_MissionParam_SubId = 1

-- ͨ�ó�������ű�
x600012_g_CityMissionScript = 600001

-- �������
x600012_g_SubMissionScriptList = { 600013, 600014, 600015, 600016 }

-- ������
x600012_g_ItemAwardIndexOffset = 20						-- ��Ʒ�������ڱ���е���ƫ��

x600012_g_MissionRound = MD_CITY_SCITECH_ROUND			-- ����
x600012_g_MissionAbandonTime = MD_CITY_SCITECH_TIME		-- ����ʱ��

--**********************************
--������ں���
--**********************************
function x600012_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600012_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local rand = random( getn(x600012_g_SubMissionScriptList) )
	CallScriptFunction( x600012_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600012_g_MissionId, x600012_g_SubMissionScriptList[rand] )
end

--**********************************
--�о��¼�
--**********************************
function x600012_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600012_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x600012_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600012_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600012_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600012_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600012_g_ScriptId, x600012_g_MissionName,4,-1 )
	end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x600012_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600012_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600012_g_MissionId, x600012_g_MissionAbandonTime )
	return ret
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x600012_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600012_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x600012_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600012_g_MissionId, x600012_g_MissionRound )
end

--**********************************
--�������������������
--**********************************
function x600012_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600012_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600012_g_MissionId, x600012_g_MissionAbandonTime, x600012_g_MissionRound )
end

--**********************************
--����
--**********************************
function x600012_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600012_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600012_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600012_g_MissionId )
	return ret
end

--**********************************
--�ύ���������������
--**********************************
function x600012_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600012_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600012_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600012_g_MissionId, x600012_g_MissionRound )

		-- ���齱��
		local ExpBonus = CallScriptFunction( x600012_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600012_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- ��ṱ�׶Ƚ���
		local ContribBonus = CallScriptFunction( x600012_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600012_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, ContribBonus )
		end

		-- רҵ����
		local SpecBonus = CallScriptFunction( x600012_g_CityMissionScript, "CalcSpecBonus", sceneId, selfId, x600012_g_MissionRound )
		-- print(SpecBonus)
		if SpecBonus > 0 then
			CityChangeAttr( sceneId, selfId, GUILD_TECH_LEVEL, SpecBonus )
		end

		-- ��Ʒ����
		CallScriptFunction( x600012_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600012_g_MissionRound, x600012_g_ItemAwardIndexOffset )
		-- ͳ����Ϣ
		LuaFnAuditQuest(sceneId, selfId, x600012_g_MissionName)

		-- ��¼��������һ������
		CallScriptFunction( x600012_g_CityMissionScript, "MissionComplete", sceneId, selfId)
	end
end

--**********************************
-- �ж�ĳ���¼����Ƿ�����ڵ�ǰ�¼��б�
--**********************************
function x600012_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600012_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

