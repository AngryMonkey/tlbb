-- ��������֮�����������¼��ű�
-- �ű���
x600030_g_ScriptId = 600030

-- �����
x600030_g_MissionId = 1109

-- ����Ŀ��npc
x600030_g_Name = "�����"

-- �����ı�����
x600030_g_MissionName = "��������"
x600030_g_MissionInfo = "��������"			--��������
x600030_g_MissionTarget = "  ��������������"			--����Ŀ��
x600030_g_ContinueInfo = "  �������û�����ô��"	--δ��������npc�Ի�
x600030_g_MissionComplete = "  ���ĺܺ�,̫лл����."				--�������npc˵�Ļ�

x600030_g_MissionParam_SubId = 1

-- ͨ�ó�������ű�
x600030_g_CityMissionScript = 600001

-- �������
x600030_g_SubMissionScriptList = { 600031, 600032, 600033, 600034, 600044 }

-- ������
x600030_g_ItemAwardIndexOffset = 28						-- ��Ʒ�������ڱ���е���ƫ��, need to modify
x600030_g_MissionRound = MD_CITY_MILITARY_ROUND			-- ����������������
x600030_g_MissionAbandonTime = MD_CITY_MILITARY_TIME		-- ������������������������ʱ��

x600030_g_ContribType = GUILD_CONTRIB_POINT

x600030_g_SpecType = GUILD_DEF_LEVEL

--**********************************
--������ں���
--**********************************
function x600030_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�

	if GetName( sceneId, targetId ) ~= x600030_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local rand = random( getn(x600030_g_SubMissionScriptList) )
	CallScriptFunction( x600030_g_CityMissionScript, "DoDefaultEvent", sceneId, selfId, targetId, x600030_g_MissionId, x600030_g_SubMissionScriptList[rand] )
end

--**********************************
--�о��¼�
--**********************************
function x600030_OnEnumerate( sceneId, selfId, targetId )

	if GetLevel(sceneId, selfId) < 40  then
		return
	end

	if GetName( sceneId, targetId ) ~= x600030_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽ���������������������,���г�����
	if IsHaveMission( sceneId, selfId, x600030_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600030_g_MissionId )
		local subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600030_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnEnumerate", sceneId, selfId, targetId )
	elseif x600030_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x600030_g_ScriptId, x600030_g_MissionName, 1 )
	end
end

--**********************************
--������������Ҳ�����������
--**********************************
function x600030_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600030_g_CityMissionScript, "DoCheckAccept", sceneId, selfId, x600030_g_MissionId, x600030_g_MissionAbandonTime )

	if GetLevel(sceneId, selfId) < 40  then
		ret = 0
	end

	return ret
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x600030_OnAccept( sceneId, selfId, targetId, scriptId )
	if GetName( sceneId, targetId ) ~= x600030_g_Name then								--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	CallScriptFunction( x600030_g_CityMissionScript, "DoAccept", sceneId, selfId, scriptId, x600030_g_MissionId, x600030_g_MissionRound )
end

--**********************************
--�������������������
--**********************************
function x600030_OnAbandon( sceneId, selfId )
	CallScriptFunction( x600030_g_CityMissionScript, "DoAbandon", sceneId, selfId, x600030_g_MissionId, x600030_g_MissionAbandonTime, x600030_g_MissionRound )
end

--**********************************
--����
--**********************************
function x600030_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600030_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600030_g_CityMissionScript, "DoCheckSubmit", sceneId, selfId, x600030_g_MissionId )
	return ret
end

--**********************************
--�ύ���������������
--**********************************
function x600030_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x600030_CheckSubmit( sceneId, selfId ) == 1 then

		CallScriptFunction( x600030_g_CityMissionScript, "DoSubmit", sceneId, selfId, x600030_g_MissionId, x600030_g_MissionRound )

		-- ���齱��
		local ExpBonus = CallScriptFunction( x600030_g_CityMissionScript, "CalcExpBonus", sceneId, selfId, x600030_g_MissionRound )
		AddExp( sceneId, selfId, ExpBonus )

		-- ��ṱ�׶Ƚ���
		local ContribBonus = CallScriptFunction( x600030_g_CityMissionScript, "CalcContribBonus", sceneId, selfId, x600030_g_MissionRound )
		-- print(ContribBonus)
		if ContribBonus > 0 then
			CityChangeAttr( sceneId, selfId, x600030_g_ContribType, ContribBonus )
		end

		-- רҵ����
		local SpecBonus = CallScriptFunction( x600030_g_CityMissionScript, "CalcSpecBonus", sceneId, selfId, x600030_g_MissionRound )
		-- print(SpecBonus)
		if SpecBonus > 0 then
		--	CityGetAttr( sceneId, selfId, x600030_g_SpecRate )
			CityChangeAttr( sceneId, selfId, x600030_g_SpecType, SpecBonus )
		end

		-- ��Ʒ����
		CallScriptFunction( x600030_g_CityMissionScript, "RandomItemAward", sceneId, selfId,
			x600030_g_MissionRound, x600030_g_ItemAwardIndexOffset )

		-- ͳ����Ϣ
		LuaFnAuditQuest(sceneId, selfId, x600030_g_MissionName)

		-- ��¼��������һ������
		CallScriptFunction( x600030_g_CityMissionScript, "MissionComplete", sceneId, selfId )

	end

end

--**********************************
-- �ж�ĳ���¼����Ƿ�����ڵ�ǰ�¼��б�
--**********************************
function x600030_IsInEventList( sceneId, selfId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x600030_g_SubMissionScriptList do
		if eventId == findId then
			return 1
		end
	end

	return 0
end

